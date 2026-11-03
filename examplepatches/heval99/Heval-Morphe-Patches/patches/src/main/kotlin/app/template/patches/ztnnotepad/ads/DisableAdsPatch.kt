package app.template.patches.ztnnotepad.ads

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_ZTNNOTEPAD
import app.template.patches.shared.misc.ads.GMA_LOAD_HOOKS
import app.template.patches.shared.misc.ads.MAX_LOAD_SHOW_HOOKS
import app.template.patches.shared.misc.ads.hideMaxAdView
import app.template.patches.shared.misc.ads.neuterAdHooks

/**
 * #Notepad 5.4.4 dropped the Calldorado SDK and now mediates through AppLovin MAX, with Meta
 * Audience Network and Google Mobile Ads as networks. All three SDK surfaces are present, so the
 * patch neuters every load (and every MAX show) and keeps MAX banner views GONE.
 *
 * 5.4.3 and older used Calldorado (`Calldorado.start` / `startInAppAdManager`); that SDK is gone in
 * 5.4.4, so this patch only targets the current stack.
 *
 * Verified 2026-10-29 against 5.4.4.19080: smoke test and CLI without -f.
 */
private val META_HOOKS = mapOf(
    "Lcom/facebook/ads/InterstitialAd;" to setOf("loadAd"),
    "Lcom/facebook/ads/AdView;" to setOf("loadAd"),
    "Lcom/facebook/ads/RewardedVideoAd;" to setOf("loadAd"),
)

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_ZTNNOTEPAD)

    execute {
        neuterAdHooks(MAX_LOAD_SHOW_HOOKS)
        neuterAdHooks(GMA_LOAD_HOOKS)
        neuterAdHooks(META_HOOKS)
        hideMaxAdView()
    }
}
