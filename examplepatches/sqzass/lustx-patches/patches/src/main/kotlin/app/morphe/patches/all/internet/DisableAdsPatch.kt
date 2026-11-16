/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.all.internet

import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly

/**
 * Void/boolean-only sink kill.
 *
 * void -> early return.
 * boolean -> false, which makes readiness checks report "not ready".
 *
 * Object-returning ad APIs are left alone. Returning null from ad SDKs is a
 * common source of NPEs, and the goal is "most apps", not "break more apps".
 */
private fun noOpVoidBool(m: MutableMethod) {
    if (m.implementation == null) return

    when (m.returnType) {
        "V" -> m.returnEarly()
        "Z" -> m.returnEarly(false)
    }
}

private val ADS = mapOf(
    // AdMob
    "Lcom/google/android/gms/ads/AdView;" to setOf("loadAd"),
    "Lcom/google/android/gms/ads/BannerAdView;" to setOf("loadAd"),
    "Lcom/google/android/gms/ads/InterstitialAd;" to setOf("load", "show", "isLoaded"),
    "Lcom/google/android/gms/ads/RewardedAd;" to setOf("load", "show", "isLoaded"),
    "Lcom/google/android/gms/ads/RewardedInterstitialAd;" to setOf("load", "show", "isLoaded"),
    "Lcom/google/android/gms/ads/AppOpenAd;" to setOf("load", "show", "isLoaded"),
    "Lcom/google/android/gms/ads/MobileAds;" to setOf("initialize"),

    // Unity Ads
    "Lcom/unity3d/ads/UnityAds;" to setOf("show", "isReady", "isInitialized"),
    "Lcom/unity3d/services/banners/BannerView;" to setOf("load", "show"),

    // Meta Audience Network
    "Lcom/facebook/ads/AdView;" to setOf("loadAd"),
    "Lcom/facebook/ads/InterstitialAd;" to setOf("loadAd", "showAd", "isAdLoaded"),
    "Lcom/facebook/ads/RewardedVideoAd;" to setOf("loadAd", "showAd", "isAdLoaded"),
    "Lcom/facebook/ads/NativeAd;" to setOf("loadAd", "unregisterView"),

    // AppLovin MAX
    "Lcom/applovin/adview/AppLovinInterstitialAd;" to setOf("show", "isReady"),
    "Lcom/applovin/adview/AppLovinRewardedAd;" to setOf("show", "isReady"),
    "Lcom/applovin/adview/AppLovinMax;" to setOf("showAdIfAvailable", "isAdReady"),
)

@Suppress("unused")
val disableAdsPatch = patch(
    name = "Disable ads",
    description = "Neutralizes common ad SDKs (AdMob, Unity, Meta, AppLovin) by forcing their " +
        "void load/show sinks to no-op and their boolean readiness predicates to false. " +
        "Object-returning APIs are left intact to avoid null returns. Missing SDKs are " +
        "skipped, so this is safe as a universal patch. Tradeoff: rewarded-ad gates never " +
        "complete, so 'watch an ad to unlock' flows dead-end.",
    default = false,
) {
    execute {
        ADS.forEach { (className, methods) ->
            mutableClassDefByOrNull(className)
                ?.methods
                ?.filterIsInstance<MutableMethod>()
                ?.filter { it.name in methods }
                ?.forEach(::noOpVoidBool)
        }
    }
}
