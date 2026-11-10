package app.zdrgon.patches.vehico.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.vehico.shared.Constants.COMPATIBILITY_VEHICO

/**
 * Vehico — Remove ads.
 *
 * The app is a Flutter title; every ad it shows (banner, interstitial)
 * is loaded through the google_mobile_ads plugin into the Google
 * Mobile Ads SDK — its own privacy copy says Vehico Free "displays
 * banner and periodic interstitial advertisements via Google AdMob",
 * and exactly two AdMob ad-unit IDs ship in libapp.so. Mediation is
 * AdMob-only (no third-party adapters in dex), so the GMS load entry
 * points are the whole ad surface:
 *
 *   BaseAdView.loadAd(AdRequest)   -> return-void  (banner; AdView
 *                                     inherits this method, and the
 *                                     plugin invokes this exact ref)
 *   InterstitialAd.load(...)       -> return-void  (static load)
 *
 * With the loads no-oped, no ad is ever fetched: banner slots stay
 * empty, and an interstitial that never loads never becomes ready and
 * is never shown. The SDK still initializes and the plugin's other
 * calls behave normally, avoiding error/retry paths.
 *
 * Deliberately NOT patched: AppOpenAd and AdLoader/native (no
 * evidence this build uses them), and RewardedAd /
 * RewardedInterstitialAd (opt-in class — left functional, same call
 * as Happy Color's rewarded exemption; this build has no rewarded
 * ad unit or reward flow anyway).
 *
 * Known cosmetic limit: the Flutter side may reserve banner height
 * from its own layout config, so a blank strip can remain where the
 * banner sat. The ad itself never loads or renders.
 *
 * Ads only: this patch does not touch Vehico's subscription/premium
 * state in any way.
 */
@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Stops banner and interstitial ads from loading (Google Mobile Ads).",
    default = true
) {
    compatibleWith(COMPATIBILITY_VEHICO)

    execute {
        BannerLoadFingerprint.method.addInstructions(0, "return-void")
        InterstitialLoadFingerprint.method.addInstructions(0, "return-void")
    }
}
