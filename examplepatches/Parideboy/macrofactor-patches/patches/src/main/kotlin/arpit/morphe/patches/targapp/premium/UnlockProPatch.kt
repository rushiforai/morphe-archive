package arpit.morphe.patches.targapp.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import arpit.morphe.patches.targapp.shared.Constants.COMPATIBILITY_TARGAPP

/**
 * Entitlement identifiers the Dart side may look up in
 * `customerInfo.entitlements.active[...]`. The dashboard id is not visible from the
 * AOT snapshot (only the bare string `pro` appears), so the synthetic entitlement is
 * published under every plausible spelling. Extra keys are inert: Dart reads the map
 * by key, it never enumerates for validation.
 */
private val ENTITLEMENT_IDS = listOf("pro", "Pro", "PRO", "premium")

/**
 * Unlocks Targapp Pro.
 *
 * Targapp is Flutter; the Dart AOT snapshot in `libapp.so` cannot be patched by Morphe,
 * so the hook sits in the native layer instead: RevenueCat's `hybridcommon` bridge is
 * the only place where entitlement state crosses from Kotlin into Dart.
 * `PurchasesFlutterPlugin.getCustomerInfo()` -> `CustomerInfoMapperKt.mapAsync()` ->
 * `EntitlementInfosMapperKt.map(EntitlementInfos)`, whose result becomes
 * `customerInfo.entitlements` in Dart. Replacing that method with a synthetic active
 * entitlement makes every `entitlements.active` check in the app pass.
 *
 * Everything is local: RevenueCat serves the bridge from its on-device cache, no call
 * to the RevenueCat API is involved and Play Billing is untouched.
 *
 * Caveat: Targapp also mirrors its plan in a backend profile (`/api/v1`, plus promo
 * redemptions that grant "Pro 3 giorni"), and pro-only work such as AI report
 * compilation and revision lookups is executed server-side. Those keep returning the
 * free-tier answer — this patch unlocks the client-computed Pro surfaces (Pro badge,
 * paywall bypass, report customization, ad-free pacing), not the server payloads.
 *
 * Deliberately not patched: `CustomerInfo.getActiveSubscriptions()` and the
 * verification mode, so restore-purchases and the account screen stay truthful.
 */
@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Reports an active RevenueCat entitlement to the Flutter layer, unlocking " +
        "the Pro surfaces the app computes on-device (Pro badge, paywall bypass, report " +
        "customization). Pro work executed by Targapp's backend (AI report compilation, " +
        "revision requests) still requires a real subscription.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TARGAPP)

    execute {
        val mapper = EntitlementsMapperFingerprint.method

        // The injected body uses v0–v3 plus the parameter register p0.
        val registerCount = mapper.implementation?.registerCount ?: 0
        check(registerCount >= 5) {
            "EntitlementInfosMapperKt.map() has $registerCount registers; the patch " +
                "needs at least 5 to build the entitlement map."
        }

        val idEntries = ENTITLEMENT_IDS.joinToString("\n") { id ->
            """
                const-string v0, "$id"
                invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            """
        }

        mapper.addInstructions(
            0,
            """
                new-instance v1, Ljava/util/HashMap;
                invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

                const/4 v3, 0x1
                invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                move-result-object v2

                const-string v0, "identifier"
                const-string v3, "pro"
                invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "isActive"
                invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "willRenew"
                invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "periodType"
                const-string v3, "NORMAL"
                invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "latestPurchaseDate"
                const-string v3, "2026-01-01T00:00:00.000Z"
                invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "originalPurchaseDate"
                invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "store"
                const-string v3, "PLAY_STORE"
                invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "productIdentifier"
                const-string v3, "org.jbarrel.targapp.pro"
                invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "ownershipType"
                const-string v3, "PURCHASED"
                invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const/4 v3, 0x0
                invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                move-result-object v2
                const-string v0, "isSandbox"
                invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "expirationDate"
                const-string v3, "productPlanIdentifier"
                const/4 v2, 0x0
                invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "unsubscribeDetectedAt"
                const-string v3, "billingIssueDetectedAt"
                invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                new-instance v2, Ljava/util/HashMap;
                invoke-direct {v2}, Ljava/util/HashMap;-><init>()V
                $idEntries

                new-instance p0, Ljava/util/HashMap;
                invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

                const-string v0, "active"
                invoke-interface {p0, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "all"
                invoke-interface {p0, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "verification"
                const-string v1, "VERIFIED"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                return-object p0
            """,
        )
    }
}
