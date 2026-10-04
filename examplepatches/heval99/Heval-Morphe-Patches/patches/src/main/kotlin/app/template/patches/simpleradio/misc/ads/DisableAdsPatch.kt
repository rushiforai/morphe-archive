package app.template.patches.simpleradio.misc.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_SIMPLERADIO

// Simple Radio mediates ads through AppLovin MAX (the AppLovin SDK key is inline
// in the ads manager's initialize()) plus Google Mobile Ads (AdMob native and
// interstitial demand). The patch hooks the stable library surfaces: the SDK
// never initializes, and the terminal interstitial load/show become no-ops.
private const val GMA = "Lcom/google/android/gms/ads/"
private const val MAX_INTERSTITIAL = "Lcom/applovin/mediation/ads/MaxInterstitialAd;"

private fun BytecodePatchContext.methods(owner: String): Set<MutableMethod> =
    mutableClassDefByOrNull(owner)?.methods.orEmpty()

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables banner, interstitial, native and rewarded ads."
) {
    compatibleWith(COMPATIBILITY_SIMPLERADIO)

    execute {
        // Never initialize the ads SDK (both overloads are entry points).
        methods(GMA + "MobileAds;")
            .filter { it.implementation != null }
            .filter { it.name == "initialize" }
            .forEach { it.returnEarly() }

        // Direct loads become no-ops.
        for (relative in listOf("AdView", "AdLoader", "interstitial/InterstitialAd")) {
            methods(GMA + relative + ";")
                .filter { it.implementation != null }
                .filter { (it.name == "load" || it.name == "loadAd") && it.returnType == "V" }
                .forEach { it.returnEarly() }
        }

        // AppLovin MAX interstitials never load or show (the terminal overload
        // is showAd(String, String, Activity) - patch every concrete match).
        methods(MAX_INTERSTITIAL)
            .filter { it.implementation != null }
            .filter { method ->
                (method.name == "loadAd" && method.parameterTypes.isEmpty()) ||
                    method.name == "showAd"
            }
            .forEach { it.returnEarly() }
    }
}
