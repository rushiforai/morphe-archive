package app.template.patches.droidcam.misc.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_DROIDCAM
import app.template.patches.shared.misc.ads.GMA_LOAD_HOOKS
import app.template.patches.shared.misc.ads.MAX_LOAD_SHOW_HOOKS
import app.template.patches.shared.misc.ads.hideMaxAdView
import app.template.patches.shared.misc.ads.neuterAdHooks
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics

/**
 * DroidCam mediates its ads through AppLovin MAX (banners, interstitials, rewarded) and Google
 * Mobile Ads, with the other networks (InMobi, Unity, Vungle, Pangle, ...) as MAX adapters.
 *
 * Disabling the two entry points is enough for the whole stack: the app's ad SDK initialisers are
 * neutered, every GMA/MAX load and show returns at once, and unfilled MAX banners stay GONE.
 * MAX itself is also initialised, so its adapters never load.
 */
private val SDK_INIT_HOOKS = mapOf(
    "Lcom/applovin/sdk/AppLovinSdk;" to setOf("initialize"),
    "Lcom/inmobi/sdk/InMobiSdk;" to setOf("init"),
)

internal fun BytecodePatchContext.disableDroidCamAds() {
    neuterAdHooks(SDK_INIT_HOOKS)
    neutraliseMobileAdsStatics("initialize")
    neuterAdHooks(GMA_LOAD_HOOKS + MAX_LOAD_SHOW_HOOKS)
    hideMaxAdView()
}

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads.",
) {
    compatibleWith(COMPATIBILITY_DROIDCAM)

    execute {
        disableDroidCamAds()
    }
}
