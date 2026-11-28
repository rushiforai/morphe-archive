package semicoloncolonel.mobilestream.patches.bbcnews.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.bbcnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.filterJsRequests
import semicoloncolonel.mobilestream.patches.shared.privacy.TRACKER_BLOCKER
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// BBC: World News & Stories 2026.11.0 sends usage to Firebase Analytics,
// AppsFlyer, comScore, and Chartbeat. The native SDKs and React Native's
// networking go through OkHttp and URL.openConnection(), and the
// JavaScript's requests are checked against the same shared blocklist.
//
// Not touched: Piano, which handles subscriptions, and sign-in.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        filterJsRequests(TRACKER_BLOCKER)

        blockTrackers()
        blockTrackersAtDns()
    }
}
