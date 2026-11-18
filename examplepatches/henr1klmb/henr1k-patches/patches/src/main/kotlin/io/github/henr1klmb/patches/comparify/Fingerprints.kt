package io.github.henr1klmb.patches.comparify

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPARIFY_COMPATIBILITY = Compatibility(
    packageName = "com.akshat.comparify",
    name = "Comparify",
    targets = listOf(AppTarget("2.2.0")),
)

private const val PROMISE_CLASS = "Lcom/facebook/react/bridge/Promise;"
private const val READABLE_MAP_CLASS = "Lcom/facebook/react/bridge/ReadableMap;"
private const val FULL_SCREEN_AD_MODULE_CLASS = "Lio/invertase/googlemobileads/ReactNativeGoogleMobileAdsFullScreenAdModule;"

// Google Mobile Ads (AdMob) & Invertase Bridge Fingerprints

internal object MobileAdsInitProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/MobileAdsInitProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList(),
)

internal object ReactNativeGoogleMobileAdsModuleInitializeFingerprint : Fingerprint(
    definingClass = "Lio/invertase/googlemobileads/ReactNativeGoogleMobileAdsModule;",
    name = "initialize",
    returnType = "V",
    parameters = listOf(PROMISE_CLASS),
)

internal object ReactNativeGoogleMobileAdsFullScreenAdModuleLoadFingerprint : Fingerprint(
    definingClass = FULL_SCREEN_AD_MODULE_CLASS,
    name = "load",
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/String;", READABLE_MAP_CLASS),
)

internal object ReactNativeGoogleMobileAdsFullScreenAdModuleShowFingerprint : Fingerprint(
    definingClass = FULL_SCREEN_AD_MODULE_CLASS,
    name = "show",
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/String;", READABLE_MAP_CLASS, PROMISE_CLASS),
)

internal object ReactNativeGoogleMobileAdsConsentModuleLoadAndShowConsentFormFingerprint : Fingerprint(
    definingClass = "Lio/invertase/googlemobileads/ReactNativeGoogleMobileAdsConsentModule;",
    name = "loadAndShowConsentFormIfRequired",
    returnType = "V",
    parameters = listOf(PROMISE_CLASS),
)

internal object ReactNativeGoogleMobileAdsBannerAdViewManagerRequestAdFingerprint : Fingerprint(
    definingClass = "Lio/invertase/googlemobileads/ReactNativeGoogleMobileAdsBannerAdViewManager;",
    name = "requestAd",
    returnType = "V",
    parameters = listOf("Lad/c;"),
)

// Tracking, Analytics & Telemetry Fingerprints

internal object PosthogReactNativePluginModuleSetupFingerprint : Fingerprint(
    definingClass = "Lcom/posthogreactnativeplugin/PosthogReactNativePluginModule;",
    name = "setup",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", READABLE_MAP_CLASS, READABLE_MAP_CLASS, PROMISE_CLASS),
)

internal object PosthogReactNativePluginModuleIsEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/posthogreactnativeplugin/PosthogReactNativePluginModule;",
    name = "isEnabled",
    returnType = "V",
    parameters = listOf(PROMISE_CLASS),
)

internal object RNSentryModuleInitNativeSdkFingerprint : Fingerprint(
    definingClass = "Lio/sentry/react/RNSentryModule;",
    name = "initNativeSdk",
    returnType = "V",
    parameters = listOf(READABLE_MAP_CLASS, PROMISE_CLASS),
)

internal object SentryInitProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lio/sentry/android/core/SentryInitProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList(),
)

internal object SentryPerformanceProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lio/sentry/android/core/SentryPerformanceProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList(),
)

internal object FirebaseInitProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/provider/FirebaseInitProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList(),
)

internal object LicenseClientCheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)
