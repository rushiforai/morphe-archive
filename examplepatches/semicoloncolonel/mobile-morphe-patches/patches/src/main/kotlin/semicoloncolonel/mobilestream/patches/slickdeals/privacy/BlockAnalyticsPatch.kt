package semicoloncolonel.mobilestream.patches.slickdeals.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns
import semicoloncolonel.mobilestream.patches.slickdeals.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Slickdeals 6.36.0 sends to AppsFlyer, Blueshift (marketing), Firebase
// Analytics and Google Tag Manager, the Meta SDK, Amazon ad metrics, and its
// own event collectors (a server-side Tag Manager and an Amazon API Gateway).
// OkHttp is renamed in this build, so hosts are blocked at URL.openConnection
// and at DNS.
//
// Sentry crash reports are blocked too, as in every app. Not touched: deals,
// sign-in, giveaways, and deal-alert push (Slickdeals' own server and Firebase
// Messaging). Blocking Blueshift stops its in-app messages and marketing pushes.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops AppsFlyer, Blueshift, Firebase Analytics, the Meta SDK, and Slickdeals' own event collectors.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        blockTrackers()
        blockTrackersAtDns()
    }
}
