package app.template.patches.myoadapt

import app.morphe.patcher.Fingerprint

internal object MyoAdaptEntitlementInfosActiveFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
    name = "getActive",
    parameters = emptyList(),
    returnType = "Ljava/util/Map;"
)

internal object MyoAdaptEntitlementInfosAllFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
    name = "getAll",
    parameters = emptyList(),
    returnType = "Ljava/util/Map;"
)

internal object MyoAdaptEntitlementInfosMapperFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/hybridcommon/mappers/EntitlementInfosMapperKt;",
    name = "map",
    parameters = listOf("Lcom/revenuecat/purchases/EntitlementInfos;"),
    returnType = "Ljava/util/Map;"
)

internal object MyoAdaptEntitlementInfoIsActiveFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
    name = "isActive",
    parameters = emptyList(),
    returnType = "Z"
)

internal object MyoAdaptSubscriptionInfoIsActiveFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/SubscriptionInfo;",
    name = "isActive",
    parameters = emptyList(),
    returnType = "Z"
)

internal object MyoAdaptCustomerInfoFactoryBuildFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/common/CustomerInfoFactory;",
    name = "buildCustomerInfo",
    returnType = "Lcom/revenuecat/purchases/CustomerInfo;"
)

internal object MyoAdaptMainApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/myoadapt/MainApplication;",
    name = "onCreate",
    parameters = emptyList(),
    returnType = "V"
)


