package semicoloncolonel.mobilestream.patches.yahoonews.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.filterJsRequests
import semicoloncolonel.mobilestream.patches.shared.privacy.TRACKER_BLOCKER
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns
import semicoloncolonel.mobilestream.patches.yahoonews.shared.Constants
import semicoloncolonel.mobilestream.patches.yahoonews.shared.videoOptOutPatch

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Yahoo News 100.1.1 ships Firebase Analytics, AppsFlyer, Datadog RUM,
// comScore, Yahoo's own analytics (i13n, AXID sync, and server-side GA
// forwarding), and Taboola and ad-verification beacons. The native SDKs send
// through URL.openConnection(); OkHttp is renamed in this build, so name
// lookups are also checked, which covers the renamed OkHttp. The JavaScript
// sends through Expo's expo/fetch and React Native's NetworkingModule, and
// those requests are checked against the same blocklist.
//
// Not touched: sign-in (Yahoo OAuth), the privacy and consent service,
// remote config, push, and the news feed and images.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch, videoOptOutPatch)

    extendWith("extensions/extension.mpe")

    execute {
        filterJsRequests(TRACKER_BLOCKER)

        blockTrackers()
        blockTrackersAtDns()
    }
}
