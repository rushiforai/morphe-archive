package com.dmoniak.patches.hungryshark

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ============================================================================
// 0. Google Mobile Ads Unity Plugin (Primary for Hungry Shark World)
// ============================================================================

object GoogleUnityRewardedAdIsAvailableFingerprint : Fingerprint(
    definingClass = "Lcom/google/unity/ads/UnityRewardedAd;",
    name = "isAdAvailable",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
)

object GoogleUnityRewardedAdLoadFingerprint : Fingerprint(
    definingClass = "Lcom/google/unity/ads/UnityRewardedAd;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lcom/google/android/gms/ads/AdRequest;"),
)

object GoogleUnityRewardedAdPollFingerprint : Fingerprint(
    definingClass = "Lcom/google/unity/ads/UnityRewardedAd;",
    name = "pollAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

object GoogleUnityRewardedAdShowFingerprint : Fingerprint(
    definingClass = "Lcom/google/unity/ads/UnityRewardedAd;",
    name = "show",
    returnType = "V",
    parameters = emptyList(),
)

object GoogleUnityRewardedAdPreloaderIsAvailableFingerprint : Fingerprint(
    definingClass = "Lcom/google/unity/ads/UnityRewardedAdPreloader;",
    name = "isAdAvailable",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
)

object GoogleUnityRewardedAdPreloaderGetNumAdsFingerprint : Fingerprint(
    definingClass = "Lcom/google/unity/ads/UnityRewardedAdPreloader;",
    name = "getNumAdsAvailable",
    returnType = "I",
    parameters = listOf("Ljava/lang/String;"),
)

object GoogleUnityRewardedAdPreloaderPollFingerprint : Fingerprint(
    definingClass = "Lcom/google/unity/ads/UnityRewardedAdPreloader;",
    name = "pollAd",
    returnType = "Lcom/google/unity/ads/UnityRewardedAd;",
    parameters = listOf("Ljava/lang/String;", "Lcom/google/unity/ads/UnityRewardedAdCallback;"),
)

object GoogleUnityRewardedInterstitialAdLoadFingerprint : Fingerprint(
    definingClass = "Lcom/google/unity/ads/UnityRewardedInterstitialAd;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lcom/google/android/gms/ads/AdRequest;"),
)

object GoogleUnityRewardedInterstitialAdShowFingerprint : Fingerprint(
    definingClass = "Lcom/google/unity/ads/UnityRewardedInterstitialAd;",
    name = "show",
    returnType = "V",
    parameters = emptyList(),
)

// ============================================================================
// 1. AppLovin MAX Unity Bridge (Unbound, matching Nai64)
// ============================================================================

object ShowRewardedAdFingerprint : Fingerprint(
    name = "showRewardedAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
)

object LoadRewardedAdFingerprint : Fingerprint(
    name = "loadRewardedAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

object IsRewardedAdReadyFingerprint : Fingerprint(
    name = "isRewardedAdReady",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
)

// ============================================================================
// 2. AppLovin MAX Native SDK
// ============================================================================

object MaxRewardedAdIsReadyFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/mediation/ads/MaxRewardedAd;",
    name = "isReady",
    returnType = "Z",
    parameters = emptyList(),
)

object MaxRewardedAdShowAdFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/mediation/ads/MaxRewardedAd;",
    name = "showAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList(),
)

// ============================================================================
// 3. Unity Ads (Readiness & Show)
// ============================================================================

object UnityAdsAdvertisementIsReadyFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/ads/Advertisement;",
    name = "isReady",
    returnType = "Z",
    parameters = emptyList(),
)

object UnityAdsAdvertisementIsReadyPlacementFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/ads/Advertisement;",
    name = "isReady",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
)

object UnityAdsSdkIsReadyFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/ads/UnityAds;",
    name = "isReady",
    returnType = "Z",
    parameters = emptyList(),
)

object UnityRewardedAdShowFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/ads/RewardedAd;",
    name = "show",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Landroid/app/Activity;",
        "Lcom/unity3d/ads/ShowConfiguration;",
        "Lcom/unity3d/ads/RewardedShowListener;",
    ),
)

object UnityAdsV4Show3ArgFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/ads/UnityAds;",
    name = "show",
    returnType = "V",
    parameters = listOf(
        "Landroid/app/Activity;",
        "Ljava/lang/String;",
        "Lcom/unity3d/ads/IUnityAdsShowListener;",
    ),
)

object UnityAdsV4Show4ArgFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/ads/UnityAds;",
    name = "show",
    returnType = "V",
    parameters = listOf(
        "Landroid/app/Activity;",
        "Ljava/lang/String;",
        "Lcom/unity3d/ads/UnityAdsShowOptions;",
        "Lcom/unity3d/ads/IUnityAdsShowListener;",
    ),
)

// ============================================================================
// 4. IronSource & LevelPlay
// ============================================================================

object IronSourceIsRewardedVideoAvailableFingerprint : Fingerprint(
    definingClass = "Lcom/ironsource/mediationsdk/IronSource;",
    name = "isRewardedVideoAvailable",
    returnType = "Z",
    parameters = emptyList(),
)

object LevelPlayRewardedAdIsReadyFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/mediation/rewarded/LevelPlayRewardedAd;",
    name = "isAdReady",
    returnType = "Z",
    parameters = emptyList(),
)

object IronSourceAdsRewardedIsReadyPreciseFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/ironsourceads/rewarded/RewardedAd;",
    name = "isReadyToShow",
    returnType = "Z",
    parameters = emptyList(),
)

object IronSourceAdsRewardedShowPreciseFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/ironsourceads/rewarded/RewardedAd;",
    name = "show",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
)

object IronSourceAdsRewardedShowFingerprint : Fingerprint(
    strings = listOf("com.unity3d.ironsourceads", "IronSourceAds"),
)

object IronSourceUnityRewardedAdIsReadyFingerprint : Fingerprint(
    definingClass = "Lcom/ironsource/unity/androidbridge/RewardedAd;",
    name = "isAdReady",
    returnType = "Z",
    parameters = emptyList(),
)

object IronSourceLevelPlayFullScreenShowAdFingerprint : Fingerprint(
    definingClass = "Lcom/ironsource/Ya;",
)
