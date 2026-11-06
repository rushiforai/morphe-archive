package app.template.patches.meowdoku

import app.morphe.patcher.Fingerprint

/**
 * The rewarded ad entry point of this app.
 *
 * Every rewarded ad is shown through AppLovin MAX, whichever network fills it: the app's own
 * `MaxAdapter.doShowRewardedAd` calls `MaxRewardedAd.showAd(Activity)`, and Unity Ads,
 * ironSource and AdMob are only present as MAX mediation adapters. Hooking that one call
 * therefore covers all of them, and the MAX listener is the callback the app itself waits on.
 *
 * `showAd(Activity)` is public, concrete and has a body (access flag 0x1). Do not confuse it
 * with `com.google.android.gms.ads.rewarded.RewardedAd.show`, which is abstract (0x401) with
 * no body — adding instructions to that one fails with a NullPointerException.
 */
internal object MaxRewardedShowFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/mediation/ads/MaxRewardedAd;",
    name = "showAd",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;")
)

/**
 * Full-screen ads shown between levels (interstitial) and when the app comes back
 * (app open). Both go through the same MAX entry point pattern as the rewarded ad:
 * `MaxAdapter.doShowInterstitialAd` calls `showAd(Activity)` and `doShowAppOpenAd`
 * calls the no-argument `showAd()`, both concrete with a body.
 */
internal object MaxInterstitialShowFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/mediation/ads/MaxInterstitialAd;",
    name = "showAd",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;")
)

internal object MaxAppOpenShowFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/mediation/ads/MaxAppOpenAd;",
    name = "showAd",
    isStatic = false,
    returnType = "V",
    parameters = listOf()
)

/**
 * The app SDK's remaining formats: banner and native. Neither has a user gesture to fake,
 * so they are simply not loaded and their container is collapsed.
 */
internal object MaxAdapterShowBannerFingerprint : Fingerprint(
    definingClass = "Lcom/meevii/adsdk/mediation/applovinmax/MaxAdapter;",
    name = "doShowBannerAd",
    isStatic = false,
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/meevii/adsdk/common/TrackingContext;",
        "Lcom/applovin/mediation/ads/MaxAdView;",
        "Landroid/view/ViewGroup;"
    )
)

internal object MaxAdapterShowNativeFingerprint : Fingerprint(
    definingClass = "Lcom/meevii/adsdk/mediation/applovinmax/MaxAdapter;",
    name = "doShowNativeAd",
    isStatic = false,
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/meevii/adsdk/common/TrackingContext;",
        "Lcom/applovin/mediation/nativeAds/MaxNativeAdLoader;",
        "Lcom/applovin/mediation/MaxAd;",
        "Landroid/view/ViewGroup;",
        "I"
    )
)

internal object MaxAdapterLoadBannerFingerprint : Fingerprint(
    definingClass = "Lcom/meevii/adsdk/mediation/applovinmax/MaxAdapter;",
    name = "doLoadBannerAd",
    isStatic = false,
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/meevii/adsdk/common/TrackingContext;",
        "Lcom/meevii/adsdk/common/BannerSize;",
        "Ljava/util/Map;"
    )
)

internal object MaxAdapterLoadNativeFingerprint : Fingerprint(
    definingClass = "Lcom/meevii/adsdk/mediation/applovinmax/MaxAdapter;",
    name = "doLoadNativeAd",
    isStatic = false,
    // Returns the loader it would have built, so skipping yields null.
    returnType = "Lcom/applovin/mediation/nativeAds/MaxNativeAdLoader;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/meevii/adsdk/common/TrackingContext;",
        "Ljava/util/Map;"
    )
)

internal object MaxAdapterIsValidFingerprint : Fingerprint(
    definingClass = "Lcom/meevii/adsdk/mediation/applovinmax/MaxAdapter;",
    name = "isValid",
    isStatic = false,
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;")
)

/**
 * The game asks the ad wrapper whether the rewarded ad is usable before it offers the
 * button; the wrapper forwards to `MaxRewardedAd.isReady()`. Forcing this true keeps the
 * button on screen when nothing could be loaded.
 */
internal object MaxRewardedValidFingerprint : Fingerprint(
    definingClass = "Lcom/meevii/adsdk/mediation/applovinmax/MaxAdWrapper;",
    name = "isValid",
    isStatic = false,
    returnType = "Z",
    parameters = listOf()
)

/**
 * The app SDK's rewarded show entry: `MaxMediationAdapter.showRewardedAd` resolves the cached
 * wrapper and calls this with the tracking context and the (possibly absent) ad.
 */
internal object MaxAdapterShowRewardedFingerprint : Fingerprint(
    definingClass = "Lcom/meevii/adsdk/mediation/applovinmax/MaxAdapter;",
    name = "doShowRewardedAd",
    isStatic = false,
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/meevii/adsdk/common/TrackingContext;",
        "Lcom/applovin/mediation/ads/MaxRewardedAd;"
    )
)
