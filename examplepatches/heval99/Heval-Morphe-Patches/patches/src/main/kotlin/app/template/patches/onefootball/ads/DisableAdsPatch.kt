package app.template.patches.onefootball.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_ONEFOOTBALL

// OneFootball's app code is obfuscated, but every ad runs through Google Mobile Ads
// (com.google.android.gms.ads), whose class and method names are stable library API.
// The patch hooks that surface: the SDK never initializes, direct loads become no-ops
// and the app-open preloader reports failure.
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
    compatibleWith(COMPATIBILITY_ONEFOOTBALL)

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
