package semicoloncolonel.mobilestream.patches.plex.ads

import app.morphe.patcher.patch.rawResourcePatch
import semicoloncolonel.mobilestream.patches.plex.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// ─────────────────────────────────────────────────────────────────────────────
// Plex 2026.22.0 — Skip ads.
//
// Plex is a React Native app. Its logic is Hermes bytecode in
// assets/index.android.bundle, and there is no ad SDK on the Java side.
//
// For on-demand titles, makeDecision builds an ad tag URL from item.Ad.url and
// hands it to the native player as adTagUri, but only when
// shouldRequestPrerollAds(item, options) returns true. That function returns
// true for every on-demand title (and, for live channels, when the player is
// full screen and unmuted). It is made to return false, so the player is
// never given an ad tag and no ads are requested.
//
// Pause ads (an ad image shown while playback is paused) are fetched by
// fetchPauseAdTile, which starts the request and returns nothing. It is made
// to return at once, so no pause ad is requested.
//
// Ads on live channels are inserted by the server into the stream itself and
// are not removed by this patch.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val skipAdsPatch = rawResourcePatch(
    name = "Skip ads",
    description = "Stops on-demand titles from requesting video ads and pause ads.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.returnAtStart("shouldRequestPrerollAds", HermesBundle.Value.FALSE)
        bundle.returnAtStart("fetchPauseAdTile", HermesBundle.Value.UNDEFINED)
        file.writeBytes(bundle.toByteArray())
    }
}
