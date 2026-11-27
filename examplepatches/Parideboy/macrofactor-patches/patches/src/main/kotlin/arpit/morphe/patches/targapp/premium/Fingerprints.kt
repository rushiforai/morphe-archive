package arpit.morphe.patches.targapp.premium

import app.morphe.patcher.Fingerprint

/**
 * Matches `EntitlementInfosMapperKt.map(EntitlementInfos)` of RevenueCat's
 * `hybridcommon` module — the one conversion step between the native
 * `CustomerInfo` object and the map handed to the Dart bridge.
 *
 * Targapp is Flutter: `PurchasesFlutterPlugin.getCustomerInfo()` calls
 * `CustomerInfoMapperKt.mapAsync()`, which builds the bridge payload and delegates
 * the entitlement subtree to this method. Flutter never touches the native
 * `EntitlementInfos` object, so replacing this method's result is enough for every
 * `customerInfo.entitlements.active[...]` check in the Dart code.
 *
 * RevenueCat ships its own class and method names unminified; the host app is R8'd,
 * not the SDK. Signature already pins the method, so no extra filters.
 */
object EntitlementsMapperFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/hybridcommon/mappers/EntitlementInfosMapperKt;",
    name = "map",
    parameters = listOf("Lcom/revenuecat/purchases/EntitlementInfos;"),
    returnType = "Ljava/util/Map;",
)
