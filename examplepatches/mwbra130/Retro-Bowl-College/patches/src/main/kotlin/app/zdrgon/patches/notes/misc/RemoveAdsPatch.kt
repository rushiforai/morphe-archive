package app.zdrgon.patches.notes.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.notes.shared.Constants.COMPATIBILITY_NOTES

/**
 * Notes (iNotes) — Remove ads.
 *
 * The app is a Flutter title; the ads it forces on free users
 * (interstitial "ad breaks" and native ad tiles inside the notes
 * list) are loaded through the google_mobile_ads plugin into the
 * Google Mobile Ads SDK, and mediation is AdMob-only — so the two
 * GMS load entry points are the whole interruptive ad surface:
 *
 *   InterstitialAd.load(...)  -> return-void  (static load)
 *   AdLoader.loadAd(AdRequest) -> return-void (native list tiles,
 *                                 built by the plugin's AdLoader
 *                                 builder and rendered by the app's
 *                                 own ListTileNativeAdFactory)
 *
 * With the loads no-oped, no ad is ever fetched: an interstitial
 * that never loads never becomes ready and is never shown, and the
 * notes-list ad slots stay empty. The SDK still initializes and the
 * plugin's other calls behave normally, avoiding error/retry paths.
 *
 * Deliberately NOT patched: RewardedAd / RewardedInterstitialAd.
 * Rewarded ads are this app's opt-in "ad gate" — the Dart strings
 * (ad_gate_watch_folder, ad_gate_watch_audio, ad_gate_watch_scan)
 * show free users watch one to temporarily use folders, voice notes
 * and scans. That free unlock path keeps working.
 *
 * Known cosmetic limit: the Flutter side may keep reserving the
 * notes-list row where a native ad tile sat; the ad itself never
 * loads or renders.
 *
 * Ads only, stated plainly: this patch does NOT unlock premium.
 * Premium (unlimited folders / voice notes / scans, Drive sync) is
 * gated by Dart code in libapp.so reading RevenueCat CustomerInfo —
 * there is no dex entitlement reader to pin, so no patch in this
 * bundle grants it. What this patch grants is an ad-free free tier,
 * with the rewarded ad-gate left intact as the way to sample the
 * premium features.
 */
@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Stops interstitial ad breaks and native ads in the notes list from loading (Google Mobile Ads). Rewarded ads that unlock features when watched are left working. Does not unlock premium.",
    default = true
) {
    compatibleWith(COMPATIBILITY_NOTES)

    execute {
        InterstitialLoadFingerprint.method.addInstructions(0, "return-void")
        NativeLoadFingerprint.method.addInstructions(0, "return-void")
    }
}
