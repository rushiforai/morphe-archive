package semicoloncolonel.mobilestream.patches.aljazeera.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.aljazeera.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns

// Al Jazeera 12.2.0 sends usage to Amplitude, Chartbeat, Firebase Analytics,
// Meta app events, and the Conviva and Brightcove video analytics. React
// Native's requests and the SDKs go through OkHttp or URL.openConnection,
// which the shared blocklist covers.
//
// Not touched: stories, video, sign-in, push alerts (OneSignal), crash
// reporting (Bugsnag), and the OneTrust consent service.

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics and video measurement services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        blockTrackers()
        blockTrackersAtDns()
    }
}
