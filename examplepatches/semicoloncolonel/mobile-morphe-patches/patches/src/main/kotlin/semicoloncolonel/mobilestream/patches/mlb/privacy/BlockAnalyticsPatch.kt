package semicoloncolonel.mobilestream.patches.mlb.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.mlb.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// MLB 26.21.0.49 — Block analytics & tracking (OPT-IN, default OFF).
//
// The app's SDKs send through URL.openConnection(), which is checked against
// the shared blocklist, plus the SDKs' manifest kill switches. OkHttp is
// renamed in this build, so the shared OkHttp layer does not apply.
//
// Covered: comScore, Conviva, Adobe Analytics, Branch, and Google/Firebase
// Analytics.
//
// Not touched: sign-in, scores, and video playback.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics and audience-measurement services.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        blockTrackers()
    }
}
