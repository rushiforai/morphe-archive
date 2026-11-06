package app.zdrgon.patches.videocutter.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.videocutter.shared.Constants.COMPATIBILITY_VIDEO_CUTTER

/**
 * Video Cutter — Remove ads.
 *
 * The app sells exactly one thing: a one-time "Remove Ads" purchase
 * (Play Billing SKU "remove_ads", $2.49). Its state lives in
 * PurchaseManager: a boolean persisted (HMAC-signed) in
 * SharedPreferences "purchase_prefs", refreshed by billing, and read
 * back by every feature through ONE public reader:
 *
 *   PurchaseManager.isProVersion()Z — 31 read sites outside the class
 *
 * Every ad decision consults that reader before doing anything:
 * AdManager gates every native-ad load/preload at entry; MainActivity
 * gates the interstitial load and the rewarded-interstitial load/show
 * path; StartActivity and CuttingActivity gate their ad flows; and
 * App.onCreate returns before MobileAds is even initialised when the
 * reader says pro. The overflow menu also reads it: pro hides the
 * "Remove Ads - $2.49" item and shows "No Ads verified" instead.
 *
 * This patch pins the reader to true at its entry — the exact answer
 * a completed $2.49 purchase produces — so no ad ever loads, and the
 * UI treats the app as bought, including the menu. It creates no
 * purchase, forges no receipt, and touches nothing in the billing
 * library; it only changes the app's own answer to its own question.
 * Pinning the reader (rather than the stored pref) also survives the
 * app's billing reconciliation, which can reset the stored state
 * after empty Play queries but cannot change what the reader returns.
 *
 * PairIP note: 4.4.6 is PairIP LIGHT (application + licensecheck in
 * classes2.dex, no VM, no native PairIP lib) and its local installer
 * check is LIVE (localCheckEnabled = true), so the companion
 * "Change installer source" patch in this folder is REQUIRED for a
 * re-signed build to get past the license check at all — exactly the
 * Gradient Weather situation. Both patches ship default-on.
 */
@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes all ads, as if the Remove Ads purchase were bought. Also enable the Change installer source patch (pre-selected).",
    default = true
) {
    compatibleWith(COMPATIBILITY_VIDEO_CUTTER)

    execute {
        IsProVersionFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )
    }
}
