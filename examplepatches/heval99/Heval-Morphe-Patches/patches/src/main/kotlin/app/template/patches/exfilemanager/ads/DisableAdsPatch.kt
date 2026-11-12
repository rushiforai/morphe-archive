package app.template.patches.exfilemanager.ads

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_EXFILEMANAGER
import app.template.patches.shared.misc.ads.MAX_LOAD_SHOW_HOOKS
import app.template.patches.shared.misc.ads.hideMaxAdView
import app.template.patches.shared.misc.ads.neuterAdHooks

private const val PANGLE = "Lcom/bytedance/sdk/openadsdk/api/"

/**
 * Pangle's public static loadAd(slot, request, listener) entry points (both overloads of each). The
 * app's own app-open and interstitial managers call Pangle directly, besides AppLovin MAX.
 */
private val PANGLE_LOAD_HOOKS: Map<String, Set<String>> = mapOf(
    PANGLE + "banner/PAGBannerAd;" to setOf("loadAd"),
    PANGLE + "interstitial/PAGInterstitialAd;" to setOf("loadAd"),
    PANGLE + "nativeAd/PAGNativeAd;" to setOf("loadAd"),
    PANGLE + "open/PAGAppOpenAd;" to setOf("loadAd"),
    PANGLE + "reward/PAGRewardedAd;" to setOf("loadAd"),
)

/**
 * EX File Manager mediates through AppLovin MAX (banners, interstitials, app-open, native ads and
 * the native ad placer, which loads through MaxNativeAdLoader) and loads Pangle app-open and
 * interstitial ads itself. Every MAX load/show and every Pangle load returns at once, like an
 * unfilled request, and MaxAdView stays GONE so no empty banner box is left. The bundled GMA is
 * only the Pangle mediation adapter (no load classes), so there is nothing to hook there.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads.",
) {
    compatibleWith(COMPATIBILITY_EXFILEMANAGER)

    execute {
        neuterAdHooks(MAX_LOAD_SHOW_HOOKS)
        neuterAdHooks(PANGLE_LOAD_HOOKS)
        hideMaxAdView()
    }
}
