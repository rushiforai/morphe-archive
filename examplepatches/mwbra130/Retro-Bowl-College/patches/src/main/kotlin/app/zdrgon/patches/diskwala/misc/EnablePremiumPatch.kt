package app.zdrgon.patches.diskwala.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.diskwala.shared.Constants.COMPATIBILITY_DISKWALA

/**
 * DiskWala — Enable Premium.
 *
 * Premium is sold as RevenueCat subscriptions ($rc_monthly $9.99,
 * $rc_three_month $25.99, $rc_annual $79.99). Whatever RevenueCat
 * reports, the app converts it to its own local state through exactly
 * one static mapper in its billing manager:
 *
 *   Lu5/f;->j(CustomerInfo) -> PremiumStatus(isPremium, expiresAtMs,
 *                                            activeEntitlementIds)
 *
 * Purchase, restore, the scheduled refresh, log-in and RevenueCat's
 * own updated-info listener all produce PremiumStatus exclusively
 * through that mapper (verified 2026-11-03: zero entitlement reads
 * anywhere else in the app's 9 dexes). The status then flows into the
 * session manager's local state — StateFlows plus a persisted
 * "premium_until" — which every premium gate reads: no ads, real file
 * names, HD downloads, faster streaming. No DiskWala server is asked
 * at decision time and no feature data is provisioned per-account;
 * the "tied to the device" line on the paywall is just the
 * RevenueCat app user ID.
 *
 * This patch pins the mapper to always return
 * PremiumStatus(true, Long.MAX_VALUE, []) — the local answer a paying
 * subscriber's sync produces, with no expiry. The session manager
 * treats a confirmed true as sticky (it refuses later downgrades), so
 * one refresh after install latches Premium on. It creates no
 * purchase, forges no receipt, and touches nothing in the billing or
 * RevenueCat libraries; it only changes the app's own translation of
 * store state into its own state.
 *
 * PairIP note: 27.3 ships full PairIP (application class, license
 * check and VM in classes2.dex, libpairipcore.so in the native
 * split). What blocks a re-signed build at launch is PairIP's
 * ONLINE license check: LicenseClient asks Play's licensing
 * service, gets NOT_LICENSED, and opens the "Get this app from
 * Play" block page (bundle v1.52.0 failed on-device exactly this
 * way; the local installer branch is dead code in this build —
 * localCheckEnabled is never enabled). The "Bypass PairIP
 * application checks", "Bypass PairIP license check" and "Disable
 * PairIP license activity" patches in this folder are therefore
 * REQUIRED companions for the patched app to open at all. All of
 * them ship default-on; keep them enabled.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Turns on Premium (no ads, real file names, HD downloads, faster streaming) as if subscribed. Keep the pre-selected PairIP bypass patches on — a re-signed build cannot pass PairIP's startup license check without them.",
    default = true
) {
    compatibleWith(COMPATIBILITY_DISKWALA)

    execute {
        PremiumStatusMapperFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Lu5/b;
                const/4 v1, 0x1
                const-wide v2, 0x7fffffffffffffff
                invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
                move-result-object v2
                sget-object v3, Ltb/w;->b:Ltb/w;
                invoke-direct {v0, v1, v2, v3}, Lu5/b;-><init>(ZLjava/lang/Long;Ljava/util/List;)V
                return-object v0
            """.trimIndent()
        )
    }
}
