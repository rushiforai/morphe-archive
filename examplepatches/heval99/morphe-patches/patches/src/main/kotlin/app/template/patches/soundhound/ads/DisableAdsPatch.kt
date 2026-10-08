package app.template.patches.soundhound.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_SOUNDHOUND

// SoundHound's app code is R8-obfuscated, but all ads run through the full public
// Google Mobile Ads API plus Meta Audience Network, whose class and method names are
// stable library API. The patch hooks those surfaces: the SDKs never initialize, GMA
// preloading never starts and every load path becomes a no-op. AdView only inherits
// loadAd from BaseAdView; AdLoader also exposes the multi-load loadAds.
private fun BytecodePatchContext.methods(owner: String): Set<MutableMethod> =
    mutableClassDefByOrNull(owner)?.methods.orEmpty()

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables banner, interstitial, native, app-open and rewarded ads."
) {
    compatibleWith(COMPATIBILITY_SOUNDHOUND)

    execute {
        // Never initialize the ad SDKs.
        for (owner in listOf(
            "Lcom/google/android/gms/ads/MobileAds;",
            "Lcom/facebook/ads/AudienceNetworkAds;",
        )) {
            methods(owner)
                .filter { it.implementation != null }
                .filter { it.name == "initialize" }
                .forEach { it.returnEarly() }
        }

        // GMA preloading never starts (the app uses MobileAds.startPreload for
        // background prefetch).
        methods("Lcom/google/android/gms/ads/MobileAds;")
            .filter { it.implementation != null }
            .filter { it.name == "startPreload" }
            .forEach { it.returnEarly() }

        // Direct loads become no-ops.
        for (relative in listOf(
            "BaseAdView",
            "AdView",
            "AdLoader",
            "interstitial/InterstitialAd",
            "rewarded/RewardedAd",
            "rewardedinterstitial/RewardedInterstitialAd",
            "appopen/AppOpenAd",
            "admanager/AdManagerAdView",
            "admanager/AdManagerInterstitialAd",
        )) {
            methods("Lcom/google/android/gms/ads/$relative;")
                .filter { it.implementation != null }
                .filter {
                    (it.name == "load" || it.name == "loadAd" || it.name == "loadAds") &&
                        it.returnType == "V"
                }
                .forEach { it.returnEarly() }
        }
    }
}
