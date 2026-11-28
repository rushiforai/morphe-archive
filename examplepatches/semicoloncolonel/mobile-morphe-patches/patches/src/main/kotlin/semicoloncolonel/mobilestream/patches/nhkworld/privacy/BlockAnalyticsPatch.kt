package semicoloncolonel.mobilestream.patches.nhkworld.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.nhkworld.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// NHK WORLD-JAPAN 9.0.2 sends usage to Adobe Analytics and Firebase
// Analytics. Both go through OkHttp or URL.openConnection(), which the shared
// blocklist covers.
//
// Not touched: Firebase Cloud Messaging, for notifications.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics and measurement services.",
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
