package semicoloncolonel.mobilestream.patches.shudder.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.filterJsRequests
import semicoloncolonel.mobilestream.patches.shared.privacy.TRACKER_BLOCKER
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shudder.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Shudder 10.1.1 — Block analytics & tracking (OPT-IN, default OFF).
//
// Shudder runs on IMG's DICE platform as a React Native app. Its JavaScript
// sends through React Native's NetworkingModule, whose request URLs are
// checked against the shared blocklist, and its native SDKs send through
// URL.openConnection(), which is checked too. OkHttp is renamed in this build,
// so the shared OkHttp layer does not apply. The SDKs' manifest kill switches
// are also set.
//
// Covered: mParticle, Amplitude, AppsFlyer, Braze, Conviva, Google Analytics and
// Firebase Analytics, and Meta app events.
//
// Not touched: sign-in, the DICE catalog and playback, and Sentry crash
// reporting.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, playback measurement, and marketing services.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        filterJsRequests(TRACKER_BLOCKER)

        blockTrackers()
    }
}
