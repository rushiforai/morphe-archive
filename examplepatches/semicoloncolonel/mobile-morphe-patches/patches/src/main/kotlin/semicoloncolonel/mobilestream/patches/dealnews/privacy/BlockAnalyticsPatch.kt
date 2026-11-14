package semicoloncolonel.mobilestream.patches.dealnews.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.dealnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.filterJsRequests
import semicoloncolonel.mobilestream.patches.shared.privacy.TRACKER_BLOCKER
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// DealNews 10.7.2 sends Firebase Analytics, which is turned off with its
// manifest kill switches, and Google ad measurement. Native SDKs send through
// URL.openConnection, which the shared layer covers, and the app's JavaScript
// requests go through React Native's networking module, where each URL is
// checked against the same blocklist.
//
// Not touched: deals, sign-in, push, and DealNews's own click and event log,
// which shares its host with the deals.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops Firebase Analytics and Google ad measurement.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        filterJsRequests(TRACKER_BLOCKER)

        blockTrackers()
    }
}
