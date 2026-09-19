package app.template.patches.boxbox.misc.ads

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_BOXBOX
import app.morphe.util.returnEarly

private const val INTERSTITIAL = "Lcom/applovin/mediation/ads/MaxInterstitialAd;"

/**
 * Patches every interstitial entry point. The previous fingerprints pinned one `showAd`
 * overload, so the terminal `showAd(String, String, Activity)` - the one that actually
 * displays the ad - stayed intact and interstitials still showed on 5.4.9.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables AppLovin interstitial ads."
) {
    compatibleWith(COMPATIBILITY_BOXBOX)

    execute {
        mutableClassDefByOrNull(INTERSTITIAL)?.methods.orEmpty()
            .filter { it.implementation != null }
            .filter { method ->
                (method.name == "loadAd" && method.parameterTypes.isEmpty()) ||
                    method.name == "showAd"
            }
            .forEach { it.returnEarly() }
    }
}
