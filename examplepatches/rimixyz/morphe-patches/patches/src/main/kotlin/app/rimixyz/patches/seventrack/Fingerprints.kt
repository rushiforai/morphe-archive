package app.rimixyz.patches.seventrack

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

private const val FLUTTER_GMA = "Lio/flutter/plugins/googlemobileads/"
private const val GMS_ADS = "Lcom/google/android/gms/ads/"

// --- Flutter SharedPreferences (Deals tab / campaign flags) ---

internal object LegacySharedPreferencesGetAllFingerprint : Fingerprint(
    definingClass = "Lio/flutter/plugins/sharedpreferences/LegacySharedPreferencesPlugin;",
    name = "getAll",
    returnType = "Ljava/util/Map;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/util/List;",
    ),
)

internal object SharedPreferencesGetBoolFingerprint : Fingerprint(
    definingClass = "Lio/flutter/plugins/sharedpreferences/SharedPreferencesBackend;",
    name = "getBool",
    returnType = "Ljava/lang/Boolean;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions;",
    ),
    filters = listOf(
        string("key"),
        string("options"),
        methodCall(
            definingClass = "Landroid/content/SharedPreferences;",
            name = "getBoolean",
        ),
    ),
)

internal object SharedPreferencesGetStringFingerprint : Fingerprint(
    definingClass = "Lio/flutter/plugins/sharedpreferences/SharedPreferencesBackend;",
    name = "getString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions;",
    ),
    filters = listOf(
        string("key"),
        string("options"),
    ),
)

// --- Flutter google_mobile_ads plugin wrappers ---

internal object FlutterBannerAdLoadFingerprint : Fingerprint(
    definingClass = "${FLUTTER_GMA}FlutterBannerAd;",
    name = "load",
    returnType = "V",
    parameters = emptyList(),
)

internal object FlutterAdManagerBannerAdLoadFingerprint : Fingerprint(
    definingClass = "${FLUTTER_GMA}FlutterAdManagerBannerAd;",
    name = "load",
    returnType = "V",
    parameters = emptyList(),
)

internal object FlutterNativeAdLoadFingerprint : Fingerprint(
    definingClass = "${FLUTTER_GMA}FlutterNativeAd;",
    name = "load",
    returnType = "V",
    parameters = emptyList(),
)

internal object FlutterInterstitialAdLoadFingerprint : Fingerprint(
    definingClass = "${FLUTTER_GMA}FlutterInterstitialAd;",
    name = "load",
    returnType = "V",
    parameters = emptyList(),
)

internal object FlutterAdManagerInterstitialAdLoadFingerprint : Fingerprint(
    definingClass = "${FLUTTER_GMA}FlutterAdManagerInterstitialAd;",
    name = "load",
    returnType = "V",
    parameters = emptyList(),
)

internal object FlutterAppOpenAdLoadFingerprint : Fingerprint(
    definingClass = "${FLUTTER_GMA}FlutterAppOpenAd;",
    name = "load",
    returnType = "V",
    parameters = emptyList(),
)

internal object FlutterRewardedAdLoadFingerprint : Fingerprint(
    definingClass = "${FLUTTER_GMA}FlutterRewardedAd;",
    name = "load",
    returnType = "V",
    parameters = emptyList(),
)

internal object FlutterRewardedInterstitialAdLoadFingerprint : Fingerprint(
    definingClass = "${FLUTTER_GMA}FlutterRewardedInterstitialAd;",
    name = "load",
    returnType = "V",
    parameters = emptyList(),
)

// --- Google Mobile Ads (AdMob) SDK loaders ---

internal object BaseAdViewLoadAdFingerprint : Fingerprint(
    definingClass = "${GMS_ADS}BaseAdView;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf("${GMS_ADS}AdRequest;"),
)

internal object AdLoaderLoadAdFingerprint : Fingerprint(
    definingClass = "${GMS_ADS}AdLoader;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf("${GMS_ADS}AdRequest;"),
)

internal object AdLoaderLoadAdManagerFingerprint : Fingerprint(
    definingClass = "${GMS_ADS}AdLoader;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf("${GMS_ADS}admanager/AdManagerAdRequest;"),
)

internal object AdLoaderLoadAdsFingerprint : Fingerprint(
    definingClass = "${GMS_ADS}AdLoader;",
    name = "loadAds",
    returnType = "V",
    parameters = listOf("${GMS_ADS}AdRequest;", "I"),
)

internal object InterstitialAdLoadFingerprint : Fingerprint(
    definingClass = "${GMS_ADS}interstitial/InterstitialAd;",
    name = "load",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "${GMS_ADS}AdRequest;",
        "${GMS_ADS}interstitial/InterstitialAdLoadCallback;",
    ),
)

internal object AdManagerInterstitialAdLoadFingerprint : Fingerprint(
    definingClass = "${GMS_ADS}admanager/AdManagerInterstitialAd;",
    name = "load",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "${GMS_ADS}admanager/AdManagerAdRequest;",
        "${GMS_ADS}admanager/AdManagerInterstitialAdLoadCallback;",
    ),
)

internal object AppOpenAdLoadFingerprint : Fingerprint(
    definingClass = "${GMS_ADS}appopen/AppOpenAd;",
    name = "load",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "${GMS_ADS}AdRequest;",
        "${GMS_ADS}appopen/AppOpenAd\$AppOpenAdLoadCallback;",
    ),
)

internal object AppOpenAdLoadWithOrientationFingerprint : Fingerprint(
    definingClass = "${GMS_ADS}appopen/AppOpenAd;",
    name = "load",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "${GMS_ADS}AdRequest;",
        "I",
        "${GMS_ADS}appopen/AppOpenAd\$AppOpenAdLoadCallback;",
    ),
)

internal object AppOpenAdLoadAdManagerFingerprint : Fingerprint(
    definingClass = "${GMS_ADS}appopen/AppOpenAd;",
    name = "load",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "${GMS_ADS}admanager/AdManagerAdRequest;",
        "I",
        "${GMS_ADS}appopen/AppOpenAd\$AppOpenAdLoadCallback;",
    ),
)

internal object RewardedAdLoadFingerprint : Fingerprint(
    definingClass = "${GMS_ADS}rewarded/RewardedAd;",
    name = "load",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "${GMS_ADS}AdRequest;",
        "${GMS_ADS}rewarded/RewardedAdLoadCallback;",
    ),
)

internal object RewardedAdLoadAdManagerFingerprint : Fingerprint(
    definingClass = "${GMS_ADS}rewarded/RewardedAd;",
    name = "load",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "${GMS_ADS}admanager/AdManagerAdRequest;",
        "${GMS_ADS}rewarded/RewardedAdLoadCallback;",
    ),
)

internal object RewardedInterstitialAdLoadFingerprint : Fingerprint(
    definingClass = "${GMS_ADS}rewardedinterstitial/RewardedInterstitialAd;",
    name = "load",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "${GMS_ADS}AdRequest;",
        "${GMS_ADS}rewardedinterstitial/RewardedInterstitialAdLoadCallback;",
    ),
)

internal object RewardedInterstitialAdLoadAdManagerFingerprint : Fingerprint(
    definingClass = "${GMS_ADS}rewardedinterstitial/RewardedInterstitialAd;",
    name = "load",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "${GMS_ADS}admanager/AdManagerAdRequest;",
        "${GMS_ADS}rewardedinterstitial/RewardedInterstitialAdLoadCallback;",
    ),
)
