package app.template.patches.soundhound.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_SOUNDHOUND
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics

// SoundHound's app code is R8-obfuscated, but all ads run through the full public
// Google Mobile Ads API plus Meta Audience Network, whose class and method names are
// stable library API. The patch hooks those surfaces: the SDKs never initialize, GMA
// preloading never starts and every load path becomes a no-op. AdView only inherits
// loadAd from BaseAdView; AdLoader also exposes the multi-load loadAds.
private fun BytecodePatchContext.methods(owner: String): Set<MutableMethod> =
    mutableClassDefBy(owner).methods

private val LOAD_NAMES = setOf("load", "loadAd", "loadAds")

// Every concrete void load/loadAd/loadAds of these classes is neutered. The value is what each
// class is known to declare: the class and those methods must be there, so a drifted SDK fails
// the patch instead of leaving a format loading. AdView declares none (see above), so nothing is
// required there; an override would still be neutered.
private val AD_CLASSES = mapOf(
    "BaseAdView" to setOf("loadAd"),
    "AdView" to emptySet(),
    "AdLoader" to setOf("loadAd", "loadAds"),
    "interstitial/InterstitialAd" to setOf("load"),
    "rewarded/RewardedAd" to setOf("load"),
    "rewardedinterstitial/RewardedInterstitialAd" to setOf("load"),
    "appopen/AppOpenAd" to setOf("load"),
    "admanager/AdManagerAdView" to setOf("loadAd"),
    "admanager/AdManagerInterstitialAd" to setOf("load"),
)

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_SOUNDHOUND)

    execute {
        // Never initialize the ad SDKs. Required: Meta Audience Network is one of the two ad SDKs.
        val audienceNetworkInit = methods("Lcom/facebook/ads/AudienceNetworkAds;")
            .filter { it.implementation != null }
            .filter { it.name == "initialize" }
        if (audienceNetworkInit.isEmpty()) throw PatchException("Disable ads: no concrete AudienceNetworkAds.initialize")
        audienceNetworkInit.forEach { it.returnEarly() }

        // GMA: every MobileAds static void returns at once. That covers initialize, startPreload
        // (the app's background prefetch) and the statics that throw without init (AGENTS.md
        // rule 9). Required: a missing MobileAds or either named method fails the patch.
        neutraliseMobileAdsStatics("initialize", "startPreload")

        // Direct loads become no-ops.
        for ((relative, required) in AD_CLASSES) {
            val owner = "Lcom/google/android/gms/ads/$relative;"
            val loads = methods(owner)
                .filter { it.implementation != null }
                .filter { it.name in LOAD_NAMES && it.returnType == "V" }
            val missing = required - loads.map { it.name }.toSet()
            if (missing.isNotEmpty()) throw PatchException("Disable ads: $owner has no concrete void $missing")
            loads.forEach { it.returnEarly() }
        }
    }
}
