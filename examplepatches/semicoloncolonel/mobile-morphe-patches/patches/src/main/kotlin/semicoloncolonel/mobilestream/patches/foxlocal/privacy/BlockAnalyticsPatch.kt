package semicoloncolonel.mobilestream.patches.foxlocal.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.foxlocal.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// FOX LOCAL 7.22.0. Most trackers send through URL.openConnection, which the
// shared layer covers: AppsFlyer, comScore, Conviva, Mux, LiveRamp, Firebase
// Analytics, and Fox's ad telemetry. The app's OkHttp build lacks the API the
// shared OkHttp layer needs, so the trackers that use it are stopped at their
// source: the player's Datadog logging, FoxKit's analytics upload, Nielsen
// DAR tags, and the Pyxis ad events.
//
// Not touched: Braze, which also delivers breaking-news alerts, station and
// location lookup, sign-in, and playback.

internal object DatadogLogFingerprint : Fingerprint(
    definingClass = "Lcom/fox/android/video/player/listener/logging/DataDogLogger;",
    name = "logEvent",
    returnType = "V",
)

internal object NielsenDarFingerprint : Fingerprint(
    definingClass = "Lcom/fox/android/video/player/api/services/DefaultNielsenDarLoader;",
    name = "loadNielsenDarTag",
    returnType = "V",
)

internal object PyxisAddEventFingerprint : Fingerprint(
    definingClass = "Lcom/fox/sdk/pyxis/Pyxis;",
    name = "addEvent",
    returnType = "V",
)

internal object PyxisCommitFingerprint : Fingerprint(
    definingClass = "Lcom/fox/sdk/pyxis/Pyxis;",
    name = "commitEvents",
    returnType = "V",
)

// The shared blocker's switch for Braze, which this app keeps for alerts.
internal object KeepBrazeFingerprint : Fingerprint(
    definingClass = "Lsemicoloncolonel/mobilestream/extension/shared/privacy/TrackerBlocker;",
    name = "keepBraze",
    returnType = "Z",
)

internal object FoxKitAnalyticsUploadFingerprint : Fingerprint(
    definingClass = "Lcom/fox/android/foxkit/common/analytics/database/AnalyticsPostWorker;",
    name = "doWork",
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
        listOf(DatadogLogFingerprint, NielsenDarFingerprint, PyxisAddEventFingerprint, PyxisCommitFingerprint)
            .forEach { it.method.returnEarly("return-void") }
        // The upload job reports success, so WorkManager does not retry it.
        FoxKitAnalyticsUploadFingerprint.method.returnEarly(
            """
                invoke-static { }, Landroidx/work/ListenableWorker${"$"}Result;->success()Landroidx/work/ListenableWorker${"$"}Result${"$"}Success;
                move-result-object v0
                return-object v0
            """,
        )
        blockTrackers()
        KeepBrazeFingerprint.method.returnEarly("const/4 v0, 0x1\nreturn v0")
    }
}
