package arpit.morphe.patches.boostcamp.premium

import app.morphe.patcher.Fingerprint

/**
 * Matches `EntitlementInfosMapperKt.map(EntitlementInfos)` of RevenueCat's
 * `hybridcommon` module — the single conversion step between the native
 * `CustomerInfo` object and the map handed to the React Native bridge.
 *
 * Boostcamp is a React Native app, so the JavaScript bundle never touches the
 * native `EntitlementInfos` object directly: `CustomerInfoMapperKt.map(customerInfo)`
 * builds the bridge payload and delegates the entitlement subtree to this method,
 * whose result is exposed to JS as `customerInfo.entitlements`. Returning a
 * synthetic map here is therefore enough for every `entitlements.active[...]`
 * check performed by the bundle, and it avoids having to rewrite the paywall
 * presenters or the native `EntitlementInfos` getters.
 *
 * The RevenueCat SDK keeps its class and method names in release builds (only the
 * host app is minified), so this fingerprint is name-stable across app versions.
 * The `definition` filters are intentionally left empty: the class is small, and
 * the exact parameter/return types already pin the method.
 */
object EntitlementsMapperFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/hybridcommon/mappers/EntitlementInfosMapperKt;",
    name = "map",
    parameters = listOf("Lcom/revenuecat/purchases/EntitlementInfos;"),
    returnType = "Ljava/util/Map;",
)
