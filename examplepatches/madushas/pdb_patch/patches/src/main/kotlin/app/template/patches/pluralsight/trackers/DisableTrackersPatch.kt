package app.template.patches.pluralsight.trackers

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.PLURALSIGHT_COMPATIBILITY
import app.template.patches.shared.returnVoid

/**
 * Pluralsight's Firebase Analytics sink.
 *
 * `Lpa1;` is the app's own `oa1`-implementing wrapper around
 * `FirebaseAnalytics` (constructor: `FirebaseAnalytics.getInstance(context)`). Its single
 * public method is the event sink: it special-cases the "User Profile" event to
 * `setUserId`, then forwards every event/key-value to Firebase. No-op'ing it removes
 * both the user-id assignment and every analytics event the app sends.
 *
 * Anchored on the app-owned wrapper rather than on `FirebaseAnalytics` itself, because
 * in this build the SDK is also on the remote-config / push path — killing the SDK
 * wholesale would break more than telemetry.
 */
private val firebaseAnalyticsSink = Fingerprint(
    definingClass = "Lpa1;",
    name = "a",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/Map;"),
)

/**
 * Removes the telemetry Pluralsight sends through its own app-owned sinks.
 *
 * Scope note (important, and the reason this patch is narrow): the SDK-level entry points
 * are deliberately **not** touched. Mux video analytics in particular is reached only
 * through the R8-renamed wrapper `...datasourceImpl.b` (a.k.a.
 * `MuxAnalyticsRemoteDataSourceImpl`), all three of whose public methods are **suspend**
 * functions (`(…)Ljava/lang/Object;`) — exactly the case the repo's `MutableMethod`
 * notes forbid rewriting — and the SDK-level anchor (`CustomerPlayerData.setEnvironmentKey`)
 * is shared with Mux's own internal `MuxDataSdk` call path, so no-op'ing it is unsafe.
 * See `docs/phase2-analysis.md` for the full trace.
 */
@Suppress("unused")
val pluralsightDisableTrackersPatch = bytecodePatch(
    name = "Disable trackers",
    description = "No-ops Pluralsight's own Firebase Analytics event sink (pa1.a), so no " +
        "usage event and no analytics user-id is sent. SDK components are disabled by " +
        "'Disable tracker components'. Mux video analytics is deliberately left alone " +
        "(see the docs): it is reachable only through suspend wrappers.",
    default = true,
) {
    compatibleWith(PLURALSIGHT_COMPATIBILITY)

    execute {
        firebaseAnalyticsSink.method.returnVoid()
    }
}