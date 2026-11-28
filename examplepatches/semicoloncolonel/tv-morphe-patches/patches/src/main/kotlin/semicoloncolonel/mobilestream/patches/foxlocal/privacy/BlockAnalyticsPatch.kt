package semicoloncolonel.mobilestream.patches.foxlocal.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.foxlocal.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.filterJsRequests
import semicoloncolonel.mobilestream.patches.shared.privacy.TRACKER_BLOCKER
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns

// FOX LOCAL for Android TV 2.18.1 is a React Native app. Its JavaScript
// sends Conviva, Mux, Datadog logs, Fox's Pyxis ad telemetry, ID graph,
// player telemetry, and log shipping; the native side has Adobe Experience
// Platform, Bitmovin Analytics, and Firebase.
//
// The JavaScript requests are checked against the host blocklist where React
// Native's networking module receives them. Adobe and Firebase send through
// URL.openConnection(), which the shared layer covers. OkHttp is renamed in
// this build, so the shared OkHttp layer does not apply; instead every host
// lookup is checked, which also covers Bitmovin Analytics and expo/fetch.
//
// Not touched: sign-in, station and location lookup, playback, DRM, ads,
// Ketch consent, and crash reporting.

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(Constants.REQUIRE_NATIVE_LIBS, analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        filterJsRequests(TRACKER_BLOCKER)
        blockTrackers()
        blockTrackersAtDns()
    }
}
