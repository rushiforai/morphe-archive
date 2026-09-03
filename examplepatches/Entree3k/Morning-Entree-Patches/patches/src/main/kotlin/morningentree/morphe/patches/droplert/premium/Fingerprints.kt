package morningentree.morphe.patches.droplert.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

internal object IsPremiumForCustomerInfoFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;"),
    strings = listOf("premium"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/revenuecat/purchases/CustomerInfo;",
            name = "getEntitlements",
        ),
        methodCall(
            definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
            name = "get",
        ),
        methodCall(
            definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
            name = "isActive",
        ),
    ),
)

internal object RevenueCatStateRefreshFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;", "L"),
    strings = listOf("premium", "TRIAL"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
            name = "get",
        ),
        methodCall(
            definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
            name = "isActive",
        ),
        methodCall(
            definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
            name = "getExpirationDate",
        ),
    ),
)
