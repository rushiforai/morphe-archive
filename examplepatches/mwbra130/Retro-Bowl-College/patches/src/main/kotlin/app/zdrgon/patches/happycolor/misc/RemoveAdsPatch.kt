package app.zdrgon.patches.happycolor.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.happycolor.shared.Constants.COMPATIBILITY_HAPPY_COLOR

/**
 * Happy Color — Remove ads.
 *
 * The game is a Flutter title; every ad it shows (banner, interstitial,
 * app-open) is loaded through AppLovin MAX (Dart strings in libapp.so:
 * "applovin_max_sdk", ShowBanner / ShowInterstitial entry points in the
 * MAX plugin's Dart class space). The MAX SDK classes keep their public
 * names in this build, so the patch goes straight at the loads:
 *
 *   MaxAdView.loadAd()          -> return-void
 *   MaxInterstitialAd.loadAd()  -> return-void
 *   MaxAppOpenAd.loadAd()       -> return-void
 *
 * With loadAd no-oped, no ad is ever fetched: the banner slot stays
 * empty, and an interstitial that never loads never becomes ready —
 * the game's own InterstitialReadyState gate means it is simply never
 * shown. The SDK still initializes and the plugin's other calls behave
 * normally, which avoids the error/retry paths a dead SDK init causes.
 *
 * Deliberately NOT patched: MaxRewardedAd. Rewarded ads are opt-in
 * (watch an ad, earn hints) rather than interruptions, so they keep
 * working.
 *
 * Known cosmetic limit: the Dart side reserves banner height from its
 * own layout config, so a blank strip can remain where the banner sat.
 * The ad itself never loads or renders.
 *
 * This patch removes ads directly. It does not touch the game's
 * separate paid "No Ads" product or its purchase state.
 */
@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Stops banner, interstitial and app-open ads from loading (AppLovin MAX). Rewarded ads for hints are left working.",
    default = true
) {
    compatibleWith(COMPATIBILITY_HAPPY_COLOR)

    execute {
        MaxAdViewLoadFingerprint.method.addInstructions(0, "return-void")
        MaxInterstitialLoadFingerprint.method.addInstructions(0, "return-void")
        MaxAppOpenLoadFingerprint.method.addInstructions(0, "return-void")
    }
}
