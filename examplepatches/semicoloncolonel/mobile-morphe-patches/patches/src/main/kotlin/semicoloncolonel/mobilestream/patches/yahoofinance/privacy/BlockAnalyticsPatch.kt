package semicoloncolonel.mobilestream.patches.yahoofinance.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.Constants
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.offFlags

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Yahoo Finance 26.22.2 ships AppsFlyer, comScore, Chartbeat, Embrace, Google
// Analytics with Yahoo's server-side forwarding, and Yahoo's own beacons. The
// app's switches for them read as off (FinanceFlags.ANALYTICS), and their hosts
// are blocked where the app opens connections: URL.openConnection() and name
// lookups, since OkHttp is renamed in this build.
//
// Not touched: sign-in (Phoenix), Plaid and Yodlee brokerage linking, Google
// Play billing, push, and quotes.
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
        offFlags("analyticsOff")
        blockTrackers()
        blockTrackersAtDns()
    }
}
