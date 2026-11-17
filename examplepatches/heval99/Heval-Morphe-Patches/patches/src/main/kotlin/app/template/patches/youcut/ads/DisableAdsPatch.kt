package app.template.patches.youcut.ads

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_YOUCUT
import app.template.patches.shared.misc.ads.GMA_LOAD_HOOKS
import app.template.patches.shared.misc.ads.MAX_LOAD_SHOW_HOOKS
import app.template.patches.shared.misc.ads.hideMaxAdView
import app.template.patches.shared.misc.ads.neuterAdHooks

/**
 * YouCut mediates through AppLovin MAX (banners, interstitials, rewarded) and also loads Google
 * Mobile Ads directly through three of its own wrappers (banner/interstitial/rewarded), so both
 * library surfaces are hooked. The app's own placement switch is forced false as well: that is
 * the path a Pro user takes, so banners reserve no space and rewarded entries are not offered
 * instead of leaving a spinner behind. MAX views are kept GONE as a backstop.
 *
 * The many mediation adapters (Unity, IronSource, Vungle, Mintegral, Pangle, InMobi) only run
 * inside MAX, so blocking MAX's load/show entry points covers them too.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables ads.",
) {
    compatibleWith(COMPATIBILITY_YOUCUT)

    execute {
        AdSupportedFingerprint.method.returnEarly(false)
        neuterAdHooks(GMA_LOAD_HOOKS + MAX_LOAD_SHOW_HOOKS)
        hideMaxAdView()
    }
}
