package app.template.patches.zedge.misc.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_ZEDGE

// Zedge mediates ads through AppLovin MAX plus a heavy waterfall (Google Mobile Ads,
// Meta Audience Network, InMobi, Vungle, Pangle, ironSource, Fyber, BidMachine via
// Etermax XMedia). A circulating "(Premium)" mod of this version deletes ad SDK
// classes outright (Meta AN is gutted 3444 -> 171 classes); the bytecode equivalent
// is neutering the stable SDK entry points: nothing initializes and direct loads
// become no-ops. No premium patch: the subscription is server-validated and this
// build ships no local ad-free gate (see Constants).
private const val GMA = "Lcom/google/android/gms/ads/"
private const val MAX_INTERSTITIAL = "Lcom/applovin/mediation/ads/MaxInterstitialAd;"

private fun BytecodePatchContext.methods(owner: String): Set<MutableMethod> =
    mutableClassDefByOrNull(owner)?.methods.orEmpty()

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables banner, interstitial, native, app-open and rewarded ads."
) {
    compatibleWith(COMPATIBILITY_ZEDGE)

    execute {
        // Never initialize the ad SDKs (every overload is an entry point).
        for (owner in listOf(
            GMA + "MobileAds;",
            "Lcom/applovin/sdk/AppLovinSdk;",
            "Lcom/facebook/ads/AudienceNetworkAds;",
            "Lcom/inmobi/sdk/InMobiSdk;",
            "Lcom/vungle/ads/VungleAds;",
        )) {
            methods(owner)
                .filter { it.implementation != null }
                .filter { it.name == "initialize" || it.name == "init" }
                .forEach { it.returnEarly() }
        }

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
