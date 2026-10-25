package app.template.patches.pcw.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_PCW
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics

// The free app has no premium gate at all: no billing client, no license checks and no
// references to the separate Pro package. It monetizes purely through Google Mobile
// Ads, initialized directly from `ApplicationClass.onCreate`. The patch hooks the
// stable GMA surface: the SDK never initializes, direct loads become no-ops and the
// app-open preloader reports failure.
private const val GMA = "Lcom/google/android/gms/ads/"

private val LOAD_NAMES = setOf("load", "loadAd", "loadAds")

// Every concrete void load/loadAd/loadAds of these classes is neutered. The value lists the
// loads each class is known to declare: the class and those methods must be there, so a
// drifted SDK fails the patch instead of leaving a format loading. AdLoader has the batch
// loadAds(AdRequest, int) next to loadAd. AdView declares no load of its own (it inherits
// BaseAdView's), so no method is required there; an override would still be neutered.
private val AD_CLASSES = mapOf(
    "BaseAdView" to listOf("loadAd"),
    "AdView" to emptyList(),
    "AdLoader" to listOf("loadAd", "loadAds"),
    "interstitial/InterstitialAd" to listOf("load"),
    "rewarded/RewardedAd" to listOf("load"),
    "rewardedinterstitial/RewardedInterstitialAd" to listOf("load"),
    "appopen/AppOpenAd" to listOf("load"),
    "admanager/AdManagerAdView" to listOf("loadAd"),
    "admanager/AdManagerInterstitialAd" to listOf("load"),
)

private fun BytecodePatchContext.methods(relative: String): Set<MutableMethod> =
    mutableClassDefBy(GMA + relative + ";").methods

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_PCW)

    execute {
        // Never initialize the ads SDK, and neuter the other MobileAds statics, which throw
        // without init (AGENTS.md rule 9). Required: a missing MobileAds fails the patch.
        neutraliseMobileAdsStatics("initialize")

        // Direct loads become no-ops.
        for ((relative, required) in AD_CLASSES) {
            val loads = methods(relative)
                .filter { it.implementation != null }
                .filter { it.name in LOAD_NAMES && it.returnType == "V" }
            for (name in required) {
                if (loads.none { it.name == name }) {
                    throw PatchException("Disable ads: no concrete void $GMA$relative;->$name")
                }
            }
            loads.forEach { it.returnEarly() }
        }

        // Nothing is preloaded for app-open ads.
        val preloads = methods("appopen/AppOpenAdPreloader")
            .filter { it.implementation != null }
            .filter { it.name == "start" && it.returnType == "Z" }
        if (preloads.isEmpty()) throw PatchException("Disable ads: no concrete ${GMA}appopen/AppOpenAdPreloader;->start(...)Z")
        preloads.forEach { it.returnEarly(false) }
    }
}
