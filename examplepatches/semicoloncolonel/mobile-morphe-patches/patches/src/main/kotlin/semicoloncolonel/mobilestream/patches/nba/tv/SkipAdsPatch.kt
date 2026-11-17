package semicoloncolonel.mobilestream.patches.nba.tv

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.nba.ads.skipMkPlayerAds
import semicoloncolonel.mobilestream.patches.nba.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.tvName
import semicoloncolonel.mobilestream.patches.shared.misc.tvText

// The NBA Android TV app plays through MediaKind's MKPlayer and media3, as the
// phone app does, so this applies the client-side half of the phone Skip ads.
// The phone app's server-side ad map and its nba.com web-video hook have no
// counterpart in the TV app (checked in 1.1.0.20261026155843).
@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = tvName("Skip ads (Android TV)"),
    description = tvText("Removes the ads the app plays before and during videos in the Android TV app. " +
        "Ads that are part of a live broadcast still play."),
) {
    category("Ads")
    compatibleWith(Constants.TV_COMPATIBILITY)

    execute { skipMkPlayerAds() }
}
