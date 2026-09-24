package com.dowjames.patches.poolmath

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

/**
 * CustomerInfoFactory.buildCustomerInfo(JSONObject, Date, VerificationResult)
 *
 * This is where RevenueCat parses the raw customer JSON into CustomerInfo.
 */
object PoolMathCustomerInfoFactoryFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/common/CustomerInfoFactory;",
    name = "buildCustomerInfo",
    returnType = "Lcom/revenuecat/purchases/CustomerInfo;",
    filters = listOf(
        methodCall(
            definingClass = "Lcom/revenuecat/purchases/common/EntitlementInfoFactoriesKt;",
            name = "buildEntitlementInfos",
        )
    )
)

/**
 * EntitlementInfos.get(String)
 */
object PoolMathEntitlementGetFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
    name = "get",
    returnType = "Lcom/revenuecat/purchases/EntitlementInfo;"
)

/**
 * EntitlementInfos.getActive()
 */
object PoolMathEntitlementActiveMapFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
    name = "getActive",
    returnType = "Ljava/util/Map;"
)

/**
 * EntitlementInfo.isActive()
 */
object PoolMathEntitlementActiveFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
    name = "isActive",
    returnType = "Z"
)
