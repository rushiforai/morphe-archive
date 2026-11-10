package app.zdrgon.patches.businessx.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.businessx.shared.Constants.COMPATIBILITY_BUSINESSX

/**
 * BusinessX — Enable Premium.
 *
 * Premium (Monthly $4.99 / 6 months $27.99 / Yearly $44.99, one Play
 * Billing subscription product "businessx_premium") is decided
 * on-device through a two-step funnel (full evidence in
 * Fingerprints.kt):
 *
 *   yc.y4.Z(context)  computes the verdict from the locally stored
 *                     Play purchase record and the locally cached
 *                     copy of the server-issued Firebase claim, and
 *                     persists it as SharedPreferences "demo"
 *                     isSubs/subsUid.
 *   MainActivity.p0(context)
 *                     is the single reader on top of that verdict —
 *                     39 call sites covering every premium decision:
 *                     full sales history, trends range, the export
 *                     flows (PDF/Excel/CSV), shop sharing and shop
 *                     limits, the per-shop backup state, settings,
 *                     and — via MainActivity.b1 — every AdMob load
 *                     (interstitial + native; AdMob is the only ad
 *                     network in the app).
 *
 * This patch pins BOTH methods to true at their entry — the exact
 * answer an active subscription produces — so the app runs its own
 * premium behaviour everywhere it asks. It creates no purchase,
 * forges no receipt, and touches nothing in the billing library.
 * Pinning the readers (rather than the stored prefs) also survives
 * the app's own re-checks, which can rewrite the stored state after
 * empty Play queries but cannot change what the readers return.
 *
 * Honest scope — what this does NOT do: cloud backup and
 * multi-device sync live in the developer's Firebase project and
 * are authorized on their server with a Google-signed account
 * claim that is only set after the server verifies a real Play
 * purchase (Cloud Function "confirm_purchase"). No local patch can
 * mint that claim, so BusinessX Cloud features may still be
 * refused or paused by their server. The Google Drive backup is
 * unaffected by that: it stores the shop database in your own
 * Drive account behind the same local gate, so it works with this
 * patch. Everything that lives on the device — export, full
 * history and trends, sharing, no ads — is fully granted.
 *
 * A companion patch is REQUIRED: 6.5.2 ships PairIP LIGHT
 * (application + licensecheck, no VM) with its local installer
 * check LIVE (localCheckEnabled = true), so "Change installer
 * source" must stay enabled or the re-signed build fails PairIP's
 * license check. Both patches ship default-on.
 *
 * Cosmetic note: the paywall can still be opened and will still
 * show its prices, and account surfaces that read the raw stored
 * purchase record may still show no subscription — every feature
 * and ad decision reads the pinned readers instead.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Grants Premium's on-device features: inventory & sales export (PDF/Excel/CSV), full sales history and trends, shop sharing, no ads, and Google Drive backup. BusinessX Cloud backup/sync are authorized on the developer's server and may still require a real subscription.",
    default = true
) {
    compatibleWith(COMPATIBILITY_BUSINESSX)

    execute {
        IsPremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )

        PremiumVerdictFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )
    }
}
