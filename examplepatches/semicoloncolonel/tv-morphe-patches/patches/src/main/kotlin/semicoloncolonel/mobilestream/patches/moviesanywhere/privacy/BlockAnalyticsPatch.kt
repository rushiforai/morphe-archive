package semicoloncolonel.mobilestream.patches.moviesanywhere.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.moviesanywhere.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// Movies Anywhere for Android TV 1.33.0-tv ships Braze (marketing and push),
// Conviva (video analytics), and Sentry. It keeps OkHttp's public names and
// also uses HttpURLConnection, so both shared layers apply (see
// BlockTrackers.kt). The shared host blocklist covers braze.com, conviva.com,
// and Sentry's ingest hosts.
//
// Not touched: sign-in, the movie library, playback, and DRM.

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(Constants.REQUIRE_NATIVE_LIBS)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
