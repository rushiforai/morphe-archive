package app.template.patches.way2news.ads

import app.morphe.patcher.Fingerprint

// Google Mobile Ads SDK (public API names are not obfuscated).

object GoogleAdLoaderLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/AdLoader;",
    name = "loadAd",
    returnType = "V",
)

object GoogleAdLoaderLoadAdsFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/AdLoader;",
    name = "loadAds",
    returnType = "V",
)

object GoogleBaseAdViewLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/BaseAdView;",
    name = "loadAd",
    returnType = "V",
)

object GoogleAdManagerAdViewLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/admanager/AdManagerAdView;",
    name = "loadAd",
    returnType = "V",
)

object GoogleMobileAdsInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/MobileAds;",
    name = "initialize",
    returnType = "V",
    isStatic = true,
    parameters = listOf("Landroid/content/Context;", "Lcom/google/android/gms/ads/initialization/OnInitializationCompleteListener;"),
)

// Facebook Audience Network (public API names are not obfuscated).

object FacebookAdViewLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/ads/AdView;",
    name = "loadAd",
    returnType = "V",
)

object FacebookNativeAdBaseLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/ads/NativeAdBase;",
    name = "loadAd",
    returnType = "V",
)
