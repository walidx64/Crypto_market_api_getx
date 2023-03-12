import 'package:crypto_api_getx/controller/coin_controller.dart';
import 'package:flutter/material.dart';
import 'package:crypto_api_getx/utils.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final CoinController controller = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 35, 53),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 60,
        ),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cypto Market',
                style: textStyle(25, Colors.white, FontWeight.bold),
              ),
              Obx(
                () => controller.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 30,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[700],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey[700]!,
                                              offset: Offset(4, 4),
                                              blurRadius: 5,
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Image.network(controller
                                              .coinsList[index].image),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            controller.coinsList[index].name,
                                            style: textStyle(18, Colors.white,
                                                FontWeight.w600),
                                          ),
                                          Text(
                                            "${controller.coinsList[index].priceChangePercentage24H} %",
                                            style: textStyle(18, Colors.grey,
                                                FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '\$ ${controller.coinsList[index].currentPrice}',
                                        style: textStyle(
                                            18, Colors.white, FontWeight.w600),
                                      ),
                                      Text(
                                        controller.coinsList[index].symbol
                                            .toUpperCase(),
                                        style: textStyle(
                                            18, Colors.grey, FontWeight.w600),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
