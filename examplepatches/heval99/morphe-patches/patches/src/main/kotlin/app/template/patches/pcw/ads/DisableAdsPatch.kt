package app.template.patches.pcw.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_PCW

// The free app has no premium gate at all: no billing client, no license checks and no
// references to the separate Pro package. It monetizes purely through Google Mobile
// Ads, initialized directly from `ApplicationClass.onCreate`. The patch hooks the
// stable GMA surface: the SDK never initializes, direct loads become no-ops and the
// app-open preloader reports failure.
private const val GMA = "Lcom/google/android/gms/ads/"

private val AD_CLASSES = listOf(
    "BaseAdView",
    "AdView",
    "AdLoader",
    "interstitial/InterstitialAd",
    "rewarded/RewardedAd",
    "rewardedinterstitial/RewardedInterstitialAd",
    "appopen/AppOpenAd",
    "admanager/AdManagerAdView",
    "admanager/AdManagerInterstitialAd",
)

private fun BytecodePatchContext.methods(relative: String): Set<MutableMethod> =
    mutableClassDefByOrNull(GMA + relative + ";")?.methods.orEmpty()

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables banner, interstitial, native, app-open and rewarded ads."
) {
    compatibleWith(COMPATIBILITY_PCW)

    execute {
        // Never initialize the ads SDK.
        methods("MobileAds")
            .filter { it.implementation != null }
            .filter { it.name == "initialize" }
            .forEach { it.returnEarly() }

        // Direct loads become no-ops.
        for (relative in AD_CLASSES) {
            methods(relative)
                .filter { it.implementation != null }
                .filter { (it.name == "load" || it.name == "loadAd") && it.returnType == "V" }
                .forEach { it.returnEarly() }
        }

        // Nothing is preloaded for app-open ads.
        methods("appopen/AppOpenAdPreloader")
            .filter { it.implementation != null }
            .filter { it.name == "start" && it.returnType == "Z" }
            .forEach { it.returnEarly(false) }
    }
}
