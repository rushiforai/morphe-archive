package semicoloncolonel.mobilestream.patches.espn.tv

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.disney.ads.skipDssAds
import semicoloncolonel.mobilestream.patches.espn.shared.Constants

// ESPN's Android TV app plays through Disney's streaming SDK, with the same
// ad-cue lists and pause-ad URL as Disney+ (checked in 6.13.2), so this reuses
// the Disney+ Skip ads code. The phone app's isAdDisabled hook does not apply:
// the TV app has no InterstitialManager.
@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes pre-roll, mid-roll, and pause ads.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    execute { skipDssAds() }
}
