package app.template.patches.castbox.misc.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_CASTBOX

// Castbox mediates ads through AppLovin MAX plus a heavy waterfall (Google Mobile
// Ads, Meta Audience Network, InMobi, Vungle strings, Pangle, Huawei), whose class
// and method names are stable library API. The patch hooks those surfaces: the
// SDKs never initialize, direct loads become no-ops and the MAX terminal showAd
// overload is neutered.
private fun BytecodePatchContext.methods(owner: String): Set<MutableMethod> =
    mutableClassDefByOrNull(owner)?.methods.orEmpty()

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables banner, interstitial, native, app-open and rewarded ads."
) {
    compatibleWith(COMPATIBILITY_CASTBOX)

    execute {
        // Never initialize the ad SDKs (every init/initialize overload is an entry point).
        for (owner in listOf(
            "Lcom/google/android/gms/ads/MobileAds;",
            "Lcom/facebook/ads/AudienceNetworkAds;",
            "Lcom/inmobi/sdk/InMobiSdk;",
        )) {
            methods(owner)
                .filter { it.implementation != null }
                .filter { it.name == "initialize" || it.name == "init" }
                .forEach { it.returnEarly() }
        }

        // Direct loads become no-ops.
        for (relative in listOf(
            "AdView",
            "AdLoader",
            "interstitial/InterstitialAd",
            "rewarded/RewardedAd",
            "rewardedinterstitial/RewardedInterstitialAd",
            "appopen/AppOpenAd",
        )) {
            methods("Lcom/google/android/gms/ads/$relative;")
                .filter { it.implementation != null }
                .filter { (it.name == "load" || it.name == "loadAd") && it.returnType == "V" }
                .forEach { it.returnEarly() }
        }

        // AppLovin MAX interstitials never load or show (the terminal overload
        // is showAd(String, String, Activity) - patch every concrete match).
        methods("Lcom/applovin/mediation/ads/MaxInterstitialAd;")
            .filter { it.implementation != null }
            .filter { method ->
                (method.name == "loadAd" && method.parameterTypes.isEmpty()) ||
                    method.name == "showAd"
            }
            .forEach { it.returnEarly() }
    }
}
