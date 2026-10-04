package app.template.patches.pimusicplayer.misc.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_PIMUSICPLAYER

// Pi Music Player mediates ads through AppLovin MAX plus Google Mobile Ads
// (AdMob and InMobi demand flow through them). The patch hooks the stable
// library surfaces: the SDK never initializes, direct loads become no-ops and
// the terminal MAX interstitial load/show become no-ops.
private const val GMA = "Lcom/google/android/gms/ads/"
private const val MAX_INTERSTITIAL = "Lcom/applovin/mediation/ads/MaxInterstitialAd;"

private fun BytecodePatchContext.methods(owner: String): Set<MutableMethod> =
    mutableClassDefByOrNull(owner)?.methods.orEmpty()

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables banner, interstitial, native and rewarded ads."
) {
    compatibleWith(COMPATIBILITY_PIMUSICPLAYER)

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
