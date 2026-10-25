package app.template.patches.podcastrepublic.misc.ads

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.castbox.misc.ads.disableCastboxStackAds
import app.template.patches.shared.Constants.COMPATIBILITY_PODCASTREPUBLIC

// Podcast Republic is built on Castbox's code base and ad stack (AppLovin MAX banners and
// interstitials, GMA, Meta Audience Network, InMobi, ...), so it shares Castbox's hooks. Its
// MAX banners live in the episode/podcast screens, Explorer and Downloads; its own GMA
// interstitial loader uses InterstitialAd.load.
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_PODCASTREPUBLIC)

    execute {
        disableCastboxStackAds()
    }
}
