package app.template.patches.findthefire.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Targets EntitlementInfo.isActive()Z — the RevenueCat entitlement activation gate.
 *
 * EntitlementInfo is a Kotlin data class in the RevenueCat Purchases SDK.
 * The `isActive` field is `private final boolean`, returned by `isActive()`.
 *
 * Smali (classes4.dex):
 *   .method public final isActive()Z
 *       .registers 2
 *       iget-boolean v0, p0, Lcom/revenuecat/purchases/EntitlementInfo;->isActive:Z
 *       return v0
 *   .end method
 */
object EntitlementInfoIsActiveFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
    name = "isActive",
)

/**
 * Targets EntitlementInfos.getActive() — returns the active entitlements map.
 *
 * The EntitlementInfos constructor builds two maps:
 *   - `all`  — all entitlements (from constructor parameter)
 *   - `active` — only those where isActive() is true
 *
 * For non-subscribers, RevenueCat may still include the "firepass" entitlement
 * in the `all` map with isActive=false. By patching getActive() to return
 * getAll() instead, combined with patching isActive() to always return true,
 * the FirePass entitlement appears active in JS.
 *
 * Smali (classes4.dex):
 *   .method public final getActive()Ljava/util/Map;
 *       .registers 2
 *       iget-object v0, p0, Lcom/revenuecat/purchases/EntitlementInfos;->active:Ljava/util/Map;
 *       return-object v0
 *   .end method
 */
object EntitlementInfosGetActiveFingerprint : Fingerprint(
    returnType = "Ljava/util/Map;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
    name = "getActive",
)

/**
 * Targets EntitlementInfosMapperKt.map() — converts EntitlementInfos to a
 * Map<String, Object> suitable for the React Native bridge.
 *
 * This is the SAFE injection point: it returns plain Map<String, Object>,
 * so we can inject HashMap-based fake entitlements without ClassCastException.
 *
 * Smali (classes4.dex):
 *   .method public static final map(Lcom/revenuecat/purchases/EntitlementInfos;)Ljava/util/Map;
 *
 * Returns: { "all": {...}, "active": {...}, "verification": "..." }
 *
 * We replace the entire body to return a fake map with an active "firepass" entry.
 */
object EntitlementInfosMapperKtMapFingerprint : Fingerprint(
    returnType = "Ljava/util/Map;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Lcom/revenuecat/purchases/EntitlementInfos;"),
    definingClass = "Lcom/revenuecat/purchases/hybridcommon/mappers/EntitlementInfosMapperKt;",
    name = "map",
)
