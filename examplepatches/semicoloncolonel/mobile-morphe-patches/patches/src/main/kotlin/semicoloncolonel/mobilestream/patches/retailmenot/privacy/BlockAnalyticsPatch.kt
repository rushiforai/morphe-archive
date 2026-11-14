package semicoloncolonel.mobilestream.patches.retailmenot.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.retailmenot.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.filterJsRequests
import semicoloncolonel.mobilestream.patches.shared.privacy.TRACKER_BLOCKER
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// RetailMeNot 10.0.6 sends AppsFlyer, Snowplow (Ziff Davis's collector),
// Datadog, and Firebase Analytics, which is turned off with its manifest kill
// switches. Native SDKs send through URL.openConnection and OkHttp, which the
// shared layer covers, and the app's JavaScript requests go through React
// Native's networking module, where each URL is checked against the same
// blocklist.
//
// Not touched: sign-in, deals, cash back activation, and push.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops AppsFlyer, Snowplow, Datadog, and Firebase Analytics.",
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
