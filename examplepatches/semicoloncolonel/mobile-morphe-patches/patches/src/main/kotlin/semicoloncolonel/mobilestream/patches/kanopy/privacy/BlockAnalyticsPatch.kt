package semicoloncolonel.mobilestream.patches.kanopy.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.kanopy.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns

// Kanopy 6.32.0. Services and the hosts they send to: Firebase Analytics,
// which logs the library account and each video's title (manifest kill
// switches, and app-measurement.com); Mux Data, which reports every play
// with its title and stream URL (litix.io); Kanopy's Sentry server, which
// attaches screenshots and the screen layout to its reports
// (sentry-tmp.kanopy.com); and Mapbox map usage events from the library
// finder (events.mapbox.com). Hosts are blocked at OkHttp where the app
// keeps its public API, at URLConnection, and at DNS.
//
// Not touched: sign-in, the catalog, Widevine licenses, play counting for
// the library, the opt-in survey, and Crashlytics.
@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops Firebase Analytics, Mux Data, Sentry, and Mapbox telemetry.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        blockTrackers()
        blockTrackersAtDns()
    }
}
