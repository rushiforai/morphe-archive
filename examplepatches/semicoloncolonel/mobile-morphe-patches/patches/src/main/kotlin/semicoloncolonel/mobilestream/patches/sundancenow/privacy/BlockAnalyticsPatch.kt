package semicoloncolonel.mobilestream.patches.sundancenow.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.sundancenow.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Sundance Now 5.0.25.2 — Block analytics & tracking (OPT-IN, default OFF).
//
// The app's SDKs send through URL.openConnection(), which is checked against
// the shared blocklist. OkHttp is renamed in this build, so the shared OkHttp
// layer does not apply. The SDKs' manifest kill switches are also set.
//
// Covered: AppsFlyer, Braze, New Relic, Firebase Analytics, and Meta app
// events.
//
// Not touched: sign-in, the catalog, and Brightcove playback.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, attribution, and marketing services.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        blockTrackers()
    }
}
