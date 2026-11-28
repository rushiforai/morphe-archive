package semicoloncolonel.mobilestream.patches.viki.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns
import semicoloncolonel.mobilestream.patches.viki.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Third-party SDKs in the 26.23.0 phone build and the hosts they send to:
// Braze (marketing, braze.com / appboy.com), AppsFlyer (attribution,
// appsflyer.com), Kochava (attribution, kochava.com), Datadog (session
// monitoring, datadoghq.com), and Firebase / Google Analytics
// (app-measurement.com, google-analytics.com). Viki renames OkHttp (only
// okhttp3/internal survives), so the interceptor cannot attach. Hosts are
// blocked at the URLConnection layer and at DNS, where OkHttp's default
// resolver calls InetAddress.getAllByName (see BlockTrackers.kt). The
// manifest kill switches also turn off Firebase's own collection at source.
//
// Not touched: Crashlytics crash reporting (not analytics; left per the
// repo's convention), OneTrust consent, sign-in, Viki Pass billing, and
// ads/playback/DRM.
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
        blockTrackers()
        blockTrackersAtDns()
    }
}
