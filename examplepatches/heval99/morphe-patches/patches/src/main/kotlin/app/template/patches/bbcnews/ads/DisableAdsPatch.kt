package app.template.patches.bbcnews.ads

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_BBCNEWS
import app.template.patches.shared.misc.ads.GMA_LOAD_HOOKS
import app.template.patches.shared.misc.ads.neuterAdHooks

/**
 * BBC News is a React Native app; the ad slots are chosen in JS but every impression goes
 * through the Google Mobile Ads SDK, which the app ships unmodified. All eight GMA load entry
 * points are present (BaseAdView, AdManagerAdView, AdLoader, InterstitialAd,
 * AdManagerInterstitialAd, RewardedAd, RewardedInterstitialAd, AppOpenAd) and there is no
 * AppLovin MAX.
 *
 * Every load returns at once, like an unfilled request: the React Native module reports the
 * failure to JS, which the app already handles for no-fill. MobileAds.initialize is left alone:
 * the next-gen statics throw without it, and the RN module awaits it.
 *
 * Verified 2026-10-28 against 2026.9.1 (versionCode 10007111): smoke test, CLI without -f and a
 * decompiled check of every hooked method. See COMPATIBILITY_BBCNEWS.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Stops every Google Mobile Ads banner, native, interstitial, rewarded and app-open load.",
) {
    compatibleWith(COMPATIBILITY_BBCNEWS)

    execute {
        neuterAdHooks(GMA_LOAD_HOOKS)
    }
}
