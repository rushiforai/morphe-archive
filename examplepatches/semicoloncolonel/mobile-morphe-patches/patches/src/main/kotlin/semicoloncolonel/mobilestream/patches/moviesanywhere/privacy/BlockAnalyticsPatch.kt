package semicoloncolonel.mobilestream.patches.moviesanywhere.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.moviesanywhere.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Third-party SDKs in the 1.54.0 phone build: Braze (marketing/push/in-app
// messages), Conviva (video analytics), and Sentry. Movies Anywhere is a
// native Kotlin app that keeps OkHttp's public names and also uses
// HttpURLConnection, so both shared layers apply: URLConnection and OkHttp
// (see BlockTrackers.kt). The shared host blocklist already covers braze.com,
// conviva.com, and the Sentry ingest hosts.
//
// Not touched: sign-in, the movie library, playback, or DRM.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(Constants.REQUIRE_NATIVE_LIBS)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
