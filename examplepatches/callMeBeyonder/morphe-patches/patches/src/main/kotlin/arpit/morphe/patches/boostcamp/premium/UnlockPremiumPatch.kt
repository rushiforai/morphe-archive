package arpit.morphe.patches.boostcamp.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import arpit.morphe.patches.boostcamp.shared.Constants.COMPATIBILITY_BOOSTCAMP

/** Entitlement identifier configured in the app's RevenueCat dashboard. */
private const val PREMIUM_ENTITLEMENT = "premium_entitlement"

/** Product identifier of a real Pro purchase, used only as metadata for the JS SDK. */
private const val PREMIUM_PRODUCT = "boostcamp.pro.annual.dec.2023"

/**
 * Unlocks Boostcamp Pro.
 *
 * Boostcamp is React Native and gates its paid surfaces on RevenueCat entitlements.
 * The bundle reads them from `customerInfo.entitlements`, which is produced by
 * RevenueCat's `hybridcommon` bridge — not by Boostcamp's own code. Replacing
 * `EntitlementInfosMapperKt.map()` with a synthetic result makes the JS layer see an
 * active `premium_entitlement`, so Strength Score, the per-muscle volume heatmap,
 * auto-progression and the analytics screens unlock.
 *
 * Everything happens on-device: RevenueCat caches entitlement data locally and the
 * bridge is fed from that cache, so no request to the RevenueCat API is involved.
 * Coach-authored programs that the backend only ships to paid accounts remain
 * server-gated — only the locally computed Pro surfaces are unlocked.
 *
 * Deliberately not patched: `CustomerInfo.getActiveSubscriptions()`. Boostcamp's
 * subscription *management* screen reads it; spoofing it would misreport the account
 * and can break the "restore purchases" flow without unlocking anything extra.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks the Pro surfaces that are computed on-device (Strength Score, " +
        "per-muscle volume heatmap, auto-progression and the analytics screens) by " +
        "reporting an active RevenueCat entitlement to the app's JavaScript layer. " +
        "Server-delivered coach programs still require a real subscription.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BOOSTCAMP)

    execute {
        val mapper = EntitlementsMapperFingerprint.method

        // The injected body reuses the parameter register (`p0`) as scratch space and
        // needs three locals (`v0`–`v2`), so four registers total. A one-parameter
        // mapper built by R8 always has at least that; fail loudly instead of emitting
        // invalid smali if a future build ever shrinks it.
        val registerCount = mapper.implementation?.registerCount ?: 0
        check(registerCount >= 4) {
            "EntitlementInfosMapperKt.map() has $registerCount registers; the patch " +
                "needs at least 4 to build the entitlement map."
        }

        mapper.addInstructions(
            0,
            """
                new-instance p0, Ljava/util/HashMap;
                invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

                const-string v0, "identifier"
                const-string v1, "$PREMIUM_ENTITLEMENT"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "isActive"
                const/4 v1, 0x1
                invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                move-result-object v1
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "willRenew"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "periodType"
                const-string v1, "NORMAL"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "latestPurchaseDate"
                const-string v1, "2026-07-09T00:00:00.000Z"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "originalPurchaseDate"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "store"
                const-string v1, "PLAY_STORE"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "productIdentifier"
                const-string v1, "$PREMIUM_PRODUCT"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "ownershipType"
                const-string v1, "PURCHASED"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "verification"
                const-string v1, "VERIFIED"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "expirationDate"
                const-string v1, "productPlanIdentifier"
                const/4 v2, 0x0
                invoke-interface {p0, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                invoke-interface {p0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "isSandbox"
                invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                move-result-object v1
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "unsubscribeDetectedAt"
                const-string v1, "billingIssueDetectedAt"
                invoke-interface {p0, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                invoke-interface {p0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                new-instance v1, Ljava/util/HashMap;
                invoke-direct {v1}, Ljava/util/HashMap;-><init>()V
                const-string v0, "$PREMIUM_ENTITLEMENT"
                invoke-interface {v1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                new-instance p0, Ljava/util/HashMap;
                invoke-direct {p0}, Ljava/util/HashMap;-><init>()V
                const-string v0, "active"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                const-string v0, "all"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                const-string v0, "verification"
                const-string v1, "VERIFIED"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                return-object p0
            """,
        )
    }
}
