package app.template.patches.flashscore.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE

// Flashscore uses Google's next-generation Mobile Ads SDK
// (com.google.android.libraries.ads.mobile.sdk). Its class and method names are stable
// library API, so the patch works on the SDK surface instead of the obfuscated app code:
//   - initialize/initializeAdapters stop the SDK from ever starting;
//   - every *AdPreloader.start(...) reports failure, so nothing gets preloaded;
//   - the ad classes' load()/loadAd() entry points become no-ops;
//   - pollAd() yields nothing for anything that still tries to fetch a preloaded ad.
private const val SDK = "Lcom/google/android/libraries/ads/mobile/sdk/"

private val PRELOADERS = listOf(
    "banner/BannerAdPreloader",
    "appopen/AppOpenAdPreloader",
    "interstitial/InterstitialAdPreloader",
    "nativead/NativeAdPreloader",
    "rewarded/RewardedAdPreloader",
    "rewardedinterstitial/RewardedInterstitialAdPreloader",
    "swipeableinterstitial/SwipeableInterstitialAdPreloader",
    "common/AdPreloader",
)

private val AD_CLASSES = listOf(
    "banner/AdView",
    "banner/BannerAd",
    "appopen/AppOpenAd",
    "interstitial/InterstitialAd",
    "nativead/NativeAdLoader",
    "rewarded/RewardedAd",
    "rewardedinterstitial/RewardedInterstitialAd",
    "swipeableinterstitial/SwipeableInterstitialAd",
    "iconad/IconAd",
)

private fun BytecodePatchContext.methods(relative: String): Set<MutableMethod> =
    mutableClassDefByOrNull(SDK + relative + ";")?.methods.orEmpty()

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables banner, interstitial, native, app-open and rewarded ads."
) {
    compatibleWith(COMPATIBILITY_FLASHSCORE)

    execute {
        // Never initialize the ads SDK.
        for (type in listOf("MobileAds", "MobileAds\$Companion")) {
            methods(type)
                .filter { it.implementation != null }
                .filter { it.name == "initialize" || it.name == "initializeAdapters" }
                .forEach { it.returnEarly() }
        }

        // Preloading never starts and never hands out an ad.
        for (relative in PRELOADERS) {
            for (type in listOf(relative, "$relative\$Companion")) {
                methods(type)
                    .filter { it.implementation != null }
                    .filter { it.name == "start" && it.returnType == "Z" }
                    .forEach { it.returnEarly(false) }
                // returnEarly() only supports void methods; return null explicitly.
                methods(type)
                    .filter { it.implementation != null }
                    .filter { it.name == "pollAd" }
                    .forEach {
                        it.addInstructions(
                            0,
                            """
                                const/4 v0, 0x0
                                return-object v0
                            """.trimIndent()
                        )
                    }
            }
        }

        // Direct loads (and the banner view's loadAd) become no-ops.
        for (relative in AD_CLASSES) {
            for (type in listOf(relative, "$relative\$Companion")) {
                methods(type)
                    .filter { it.implementation != null }
                    .filter { (it.name == "load" || it.name == "loadAd") && it.returnType == "V" }
                    .forEach { it.returnEarly() }
            }
        }
    }
}
