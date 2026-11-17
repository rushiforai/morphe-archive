package semicoloncolonel.mobilestream.patches.espn.tv

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.disney.ads.skipDssAds
import semicoloncolonel.mobilestream.patches.espn.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.tvName
import semicoloncolonel.mobilestream.patches.shared.misc.tvText

// ESPN's Android TV app plays through Disney's streaming SDK, with the same
// ad-cue lists and pause-ad URL as Disney+ (checked in 6.13.2), so this reuses
// the Disney+ Skip ads code. The phone app's isAdDisabled hook does not apply:
// the TV app has no InterstitialManager.
@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = tvName("Skip ads (Android TV)"),
    description = tvText("Removes pre-roll, mid-roll, and pause ads in the Android TV app."),
) {
    category("Ads")
    compatibleWith(Constants.TV_COMPATIBILITY)

    execute { skipDssAds() }
}
