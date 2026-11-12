package app.template.patches.tv2nyheder.ads

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TV2NYHEDER
import app.template.patches.shared.misc.ads.GMA_LOAD_HOOKS
import app.template.patches.shared.misc.ads.neuterAdHooks

// TV 2 Nyheder serves every ad through Google Ad Manager: banners through AdManagerAdView.loadAd
// (Le fa; helper), native slots through AdLoader.loadAd and full-screen slots through
// InterstitialAd.load. Prebid Mobile only supplies bids; the bundled Gemius AdOcean SDK is never
// instantiated (no BillboardAd/FullScreenAd callers). MobileAds.initialize is left alone on
// purpose: the app calls it in NyhedscenterApplication.onCreate and the SDK statics keep working,
// while no load below ever requests an ad.
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes every Google Ad Manager ad.",
) {
    compatibleWith(COMPATIBILITY_TV2NYHEDER)

    execute {
        neuterAdHooks(GMA_LOAD_HOOKS)
    }
}
