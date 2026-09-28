package app.tkiethuynh.patches.proxman

import app.morphe.patcher.Fingerprint

internal val isActiveFingerprint = Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
    name = "isActive",
    returnType = "Z",
    parameters = listOf(),
)

internal val getWillRenewFingerprint = Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
    name = "getWillRenew",
    returnType = "Z",
    parameters = listOf(),
)

internal val licenseProviderOnCreateFingerprint = Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = listOf(),
)

internal val initializeLicenseCheckFingerprint = Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = listOf(),
)

// The RN-RevenueCat bridge that builds the JS-readable Map<String, Object> from
// EntitlementInfos. Rewriting this is what actually lifts the paywall — see Smali.kt and
// FakeProEntitlement.kt for the replacement body.
internal val entitlementInfosMapperFingerprint = Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/hybridcommon/mappers/EntitlementInfosMapperKt;",
    name = "map",
    returnType = "Ljava/util/Map;",
    parameters = listOf("Lcom/revenuecat/purchases/EntitlementInfos;"),
)
