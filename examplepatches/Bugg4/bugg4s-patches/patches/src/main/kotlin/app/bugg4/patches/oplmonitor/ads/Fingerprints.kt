package app.bugg4.patches.oplmonitor.ads

import app.morphe.patcher.Fingerprint

/**
 * Google Mobile Ads SDK methods that load the various ad formats used by the app.
 *
 * Making the load methods no-ops prevents any ad from being requested or shown,
 * regardless of which ad format the app or its ad plugin tries to use.
 */

internal object BaseAdViewLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/BaseAdView;",
    name = "loadAd",
    parameters = listOf("Lcom/google/android/gms/ads/AdRequest;"),
    returnType = "V",
)

internal object InterstitialAdLoadFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/interstitial/InterstitialAd;",
    name = "load",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lcom/google/android/gms/ads/AdRequest;",
        "Lcom/google/android/gms/ads/interstitial/InterstitialAdLoadCallback;",
    ),
    returnType = "V",
)

internal object RewardedAdLoadFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/rewarded/RewardedAd;",
    name = "load",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lcom/google/android/gms/ads/AdRequest;",
        "Lcom/google/android/gms/ads/rewarded/RewardedAdLoadCallback;",
    ),
    returnType = "V",
)

internal object RewardedAdLoadAdManagerFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/rewarded/RewardedAd;",
    name = "load",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;",
        "Lcom/google/android/gms/ads/rewarded/RewardedAdLoadCallback;",
    ),
    returnType = "V",
)

internal object RewardedInterstitialAdLoadFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/rewardedinterstitial/RewardedInterstitialAd;",
    name = "load",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lcom/google/android/gms/ads/AdRequest;",
        "Lcom/google/android/gms/ads/rewardedinterstitial/RewardedInterstitialAdLoadCallback;",
    ),
    returnType = "V",
)

internal object RewardedInterstitialAdLoadAdManagerFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/rewardedinterstitial/RewardedInterstitialAd;",
    name = "load",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;",
        "Lcom/google/android/gms/ads/rewardedinterstitial/RewardedInterstitialAdLoadCallback;",
    ),
    returnType = "V",
)

internal object AppOpenAdLoadFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/appopen/AppOpenAd;",
    name = "load",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lcom/google/android/gms/ads/AdRequest;",
        "Lcom/google/android/gms/ads/appopen/AppOpenAd\$AppOpenAdLoadCallback;",
    ),
    returnType = "V",
)

internal object AdLoaderLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/AdLoader;",
    name = "loadAd",
    parameters = listOf("Lcom/google/android/gms/ads/AdRequest;"),
    returnType = "V",
)

internal object AdLoaderLoadAdsFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/AdLoader;",
    name = "loadAds",
    parameters = listOf("Lcom/google/android/gms/ads/AdRequest;", "I"),
    returnType = "V",
)

internal object AdLoaderLoadAdManagerFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/AdLoader;",
    name = "loadAd",
    parameters = listOf("Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;"),
    returnType = "V",
)
