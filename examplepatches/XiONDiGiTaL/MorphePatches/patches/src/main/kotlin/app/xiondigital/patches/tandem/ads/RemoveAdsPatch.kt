package app.xiondigital.patches.tandem.ads

import app.morphe.patcher.patch.bytecodePatch
import app.xiondigital.patches.tandem.shared.Constants.COMPATIBILITY_TANDEM_APK
import app.xiondigital.patches.tandem.shared.Constants.COMPATIBILITY_TANDEM_APKM
import app.xiondigital.patches.tandem.shared.replaceBodyWithReturnVoid

/**
 * Stops Tandem from requesting and rendering ads.
 *
 * There are two ad paths in 6.38.0 and both are covered.
 *
 * **Tandem's own community ad slot.** The view model emits a `CommunityAdConfig(adUnitId, adSize)`
 * built from the AdMob unit `ca-app-pub-4507927355231659/3667237836`, and a single composable
 * consumes it: it renders the ad, then a divider. Replacing that composable's body with
 * `return-void` makes the slot emit nothing, which is exactly the `config == null` branch the
 * screen already handles, so no ad view is created and no request is made. The `"communityAd"`
 * test tag it assigns pins the method.
 *
 * **The bundled ad SDKs.** Tandem's own ad code is R8-obfuscated, but the SDKs keep their public
 * class names (their consumer ProGuard rules preserve the API surface), so their load entry points
 * are stable anchors: AppLovin MAX serves the app-open ad (`MaxAppOpenAd.loadAd()` is called once
 * the SDK reports initialised, and `MaxAdView.startAutoRefresh()` arms banner refresh), while Meta
 * Audience Network serves banner, interstitial and native formats. Both the no-argument `loadAd()`
 * and the `…LoadAdConfig` overloads are replaced, because either call style reaches the SDK.
 *
 * With those bodies reduced to `return-void`, no request leaves the device, `isReady()` and
 * `isAdLoaded()` stay false, and the placement is never displayed. SDK initialisation is left
 * alone: nothing loads without one of these calls, and gutting `init` would break the mediation
 * callbacks Tandem has registered.
 *
 * Rewarded formats (`MaxRewardedAd`, `RewardedVideoAd`, `RewardedInterstitialAd`) are intentionally
 * untouched: those are only requested when the user asks for one, so blocking them would remove a
 * feature instead of an annoyance.
 */
@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes Tandem's community ad slot and blocks the bundled AppLovin MAX and " +
        "Meta Audience Network SDKs from requesting ads.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TANDEM_APK, COMPATIBILITY_TANDEM_APKM)

    execute {
        // Tandem's own community ad slot.
        CommunityAdComposableFingerprint.method.replaceBodyWithReturnVoid()

        // AppLovin MAX.
        MaxAppOpenAdLoadFingerprint.method.replaceBodyWithReturnVoid()
        MaxInterstitialAdLoadFingerprint.method.replaceBodyWithReturnVoid()
        MaxAdViewLoadFingerprint.method.replaceBodyWithReturnVoid()
        MaxAdViewStartAutoRefreshFingerprint.method.replaceBodyWithReturnVoid()

        // Meta Audience Network.
        FacebookInterstitialLoadFingerprint.method.replaceBodyWithReturnVoid()
        FacebookInterstitialLoadConfigFingerprint.method.replaceBodyWithReturnVoid()
        FacebookAdViewLoadFingerprint.method.replaceBodyWithReturnVoid()
        FacebookAdViewLoadConfigFingerprint.method.replaceBodyWithReturnVoid()
        FacebookNativeAdLoadFingerprint.method.replaceBodyWithReturnVoid()
        FacebookNativeAdLoadConfigFingerprint.method.replaceBodyWithReturnVoid()
    }
}
