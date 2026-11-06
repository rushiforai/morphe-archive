package semicoloncolonel.mobilestream.patches.plex.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.plex.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.filterJsRequests
import semicoloncolonel.mobilestream.patches.shared.privacy.TRACKER_BLOCKER
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Plex 2026.22.0 — Block analytics & tracking (OPT-IN, default OFF).
//
// Plex is a React Native app. Its trackers are Kochava (native SDK, driven
// from JavaScript), Plex's own event collector (analytics.plex.tv), Plex ad
// measurement (plex.adsmeasurement.com), and Statsig event logging.
//
// Native SDKs send through URL.openConnection(), which the shared layer
// covers. OkHttp is renamed in this build, so the shared OkHttp layer does not
// apply. The app's JavaScript sends through Nitro Fetch, and every Nitro
// Fetch request is built on the Java side by the NitroRequest constructor, so
// its URL is checked there against the same blocklist. React Native's own
// NetworkingModule (fetch and XMLHttpRequest) gets the same check.
//
// Not touched: sign-in, playback, Statsig feature flags (the app reads them),
// Sentry crash reporting, and Firebase push.
// ─────────────────────────────────────────────────────────────────────────────

internal object NitroRequestInitFingerprint : Fingerprint(
    definingClass = "Lcom/margelo/nitro/nitrofetch/NitroRequest;",
    name = "<init>",
    custom = { method, _ -> method.parameterTypes.firstOrNull()?.toString() == "Ljava/lang/String;" },
)

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        filterJsRequests(TRACKER_BLOCKER)

        NitroRequestInitFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $TRACKER_BLOCKER->filterJsRequestUrl(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p1
            """.trimIndent(),
        )

        blockTrackers()
    }
}
