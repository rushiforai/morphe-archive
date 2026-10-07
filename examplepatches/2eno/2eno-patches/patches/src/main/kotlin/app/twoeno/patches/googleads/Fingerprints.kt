package app.twoeno.patches.googleads

import app.morphe.patcher.Fingerprint

private const val RNGMA = "Lio/invertase/googlemobileads"

internal object BannerAdRequestFingerprint : Fingerprint(
    definingClass = "$RNGMA/ReactNativeGoogleMobileAdsBannerAdViewManager;",
    name = "requestAd",
    returnType = "V",
    parameters = listOf("$RNGMA/common/ReactNativeAdView;"),
)

internal object FullScreenAdLoadFingerprint : Fingerprint(
    definingClass = "$RNGMA/ReactNativeGoogleMobileAdsFullScreenAdModule;",
    name = "load",
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/String;", "Lcom/facebook/react/bridge/ReadableMap;"),
)

internal object NativeAdLoadFingerprint : Fingerprint(
    definingClass = "$RNGMA/ReactNativeGoogleMobileAdsNativeModule;",
    name = "load",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/facebook/react/bridge/ReadableMap;",
        "Lcom/facebook/react/bridge/Promise;",
    ),
)

internal object BaseAdViewLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/BaseAdView;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf("Lcom/google/android/gms/ads/AdRequest;"),
)
