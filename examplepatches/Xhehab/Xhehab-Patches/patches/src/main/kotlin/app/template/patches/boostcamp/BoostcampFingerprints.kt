package app.template.patches.boostcamp

import app.morphe.patcher.Fingerprint

internal object BoostcampEntitlementInfosActiveFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
    name = "getActive",
    parameters = emptyList(),
    returnType = "Ljava/util/Map;"
)

internal object BoostcampEntitlementInfosAllFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
    name = "getAll",
    parameters = emptyList(),
    returnType = "Ljava/util/Map;"
)

internal object BoostcampEntitlementInfosMapperFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/hybridcommon/mappers/EntitlementInfosMapperKt;",
    name = "map",
    parameters = listOf("Lcom/revenuecat/purchases/EntitlementInfos;"),
    returnType = "Ljava/util/Map;"
)

/** Public RN entry: presentPaywallIfNeeded(... Promise) */
internal object BoostcampPresentPaywallIfNeededFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/react/ui/RNPaywallsModule;",
    name = "presentPaywallIfNeeded",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Lcom/facebook/react/bridge/ReadableMap;",
        "Z",
        "Ljava/lang/String;",
        "Lcom/facebook/react/bridge/ReadableMap;",
        "Lcom/facebook/react/bridge/Promise;"
    ),
    returnType = "V"
)

/** Public RN entry: presentPaywall without required entitlement id */
internal object BoostcampPresentPaywallPublicFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/react/ui/RNPaywallsModule;",
    name = "presentPaywall",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/facebook/react/bridge/ReadableMap;",
        "Ljava/lang/Boolean;",
        "Ljava/lang/String;",
        "Lcom/facebook/react/bridge/ReadableMap;",
        "Lcom/facebook/react/bridge/Promise;"
    ),
    returnType = "V"
)

/** Private core presenter used by both public methods */
internal object BoostcampPresentPaywallPrivateFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/react/ui/RNPaywallsModule;",
    name = "presentPaywall",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Lcom/facebook/react/bridge/ReadableMap;",
        "Ljava/lang/Boolean;",
        "Ljava/lang/String;",
        "Lcom/facebook/react/bridge/ReadableMap;",
        "Lcom/facebook/react/bridge/Promise;"
    ),
    returnType = "V"
)

internal object BoostcampPresentPaywallFromFragmentFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/hybridcommon/ui/PaywallHelpersKt;",
    name = "presentPaywallFromFragment",
    returnType = "V"
)
