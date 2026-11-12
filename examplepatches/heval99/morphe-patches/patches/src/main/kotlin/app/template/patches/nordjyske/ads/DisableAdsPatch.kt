package app.template.patches.nordjyske.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_NORDJYSKE
import app.template.patches.shared.Constants.COMPATIBILITY_FYENS
import app.template.patches.shared.Constants.COMPATIBILITY_STIFTEN
import app.template.patches.shared.Constants.COMPATIBILITY_JYDSKEVESTKYSTEN
import app.template.patches.shared.addInstructionsChecked

// PugPig Bolt's ad module. The class and its public methods keep their names (it is a framework
// module, not R8-renamed app code), so the anchors are stable across PugPig apps.
private const val ADS = "Lcom/kaldorgroup/pugpigbolt/modules/GoogleMobileAds;"

/**
 * Nordjyske's ads all go through PugPig's Google Mobile Ads module:
 * `adViewForId` builds an `AdManagerAdView` and loads it, `presentInterstitialAdViewForId` loads an
 * `AdManagerInterstitialAd`, and `registerWebAdView` wires the WebView bridge for in-article ads.
 *
 * The patch returns null from the banner builder (the module already returns null before the SDK is
 * ready, so callers handle it), and returns early from the interstitial, WebView bridge and the
 * destroy helper (the provider may pass the null view to `destroyAdView`, which would otherwise
 * cast it and NPE). The SDK itself is left initialized; with no load call it requests no ads.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables banner, interstitial and WebView ads.",
) {
    compatibleWith(COMPATIBILITY_NORDJYSKE, COMPATIBILITY_FYENS, COMPATIBILITY_STIFTEN, COMPATIBILITY_JYDSKEVESTKYSTEN)

    execute {
        val module = mutableClassDefBy(ADS)

        val adViewForId = module.methods.singleOrNull {
            it.name == "adViewForId" && it.returnType == "Landroid/view/View;" && it.implementation != null
        } ?: throw PatchException("$ADS.adViewForId not found")
        adViewForId.addInstructionsChecked(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        val interstitial = module.methods.singleOrNull {
            it.name == "presentInterstitialAdViewForId" && it.returnType == "V" && it.implementation != null
        } ?: throw PatchException("$ADS.presentInterstitialAdViewForId not found")
        interstitial.returnEarly()

        val webView = module.methods.singleOrNull {
            it.name == "registerWebAdView" && it.returnType == "V" && it.implementation != null
        } ?: throw PatchException("$ADS.registerWebAdView not found")
        webView.returnEarly()

        val destroy = module.methods.singleOrNull {
            it.name == "destroyAdView" && it.returnType == "V" && it.implementation != null
        } ?: throw PatchException("$ADS.destroyAdView not found")
        destroy.returnEarly()
    }
}
