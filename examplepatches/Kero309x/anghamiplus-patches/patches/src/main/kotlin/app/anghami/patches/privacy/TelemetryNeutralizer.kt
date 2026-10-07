package app.anghami.patches.privacy

import app.anghami.patches.core.AnghamiTarget
import app.anghami.patches.core.forceVoid
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Turns the app's reporting surface into a set of no-ops.
 *
 * Every entry point that records what the user does is emptied out: the in-house
 * analytics facade and its event dispatch, the Silo activity reporter, the Braze
 * and Adjust and Firebase and Google Analytics SDK bridges, the listening statistics
 * writer, the background banner impression/click workers, and the share-event helpers
 * on the song and playlist models. Crash and error delivery through Bugsnag's native
 * bridge is cut off as well.
 *
 * Each targeted method is forced to return immediately, so the surrounding app-level
 * guard still runs and still calls into these APIs; only the reporting itself never
 * happens.
 */
@Suppress("unused")
val telemetryNeutralizerPatch = bytecodePatch(
    name = "Disable Analytics & Crash Logging",
    description = "Disables third-party trackers (Braze, Adjust, Firebase, Google, Bugsnag), in-house Silo tracking, and listening telemetry.",
    default = true,
) {
    compatibleWith(AnghamiTarget.COMPATIBILITY)

    execute {
        AnalyticsInitSignature.method.forceVoid()
        AnalyticsPostEventSignature.method.forceVoid()
        AnalyticsPostEventStringSignature.method.forceVoid()
        AnalyticsPostGoogleAnalyticsSignature.method.forceVoid()
        AnalyticsPostAdjustEventSignature.method.forceVoid()
        SiloSaveEventAsyncSignature.method.forceVoid()
        SiloSaveEventSyncSignature.method.forceVoid()
        BugsnagDeliverReportSignature.method.forceVoid()
        BrazeLogCustomEventSignature.method.forceVoid()
        BrazeLogCustomEventWithPropsSignature.method.forceVoid()
        BrazeCustomEventHelperLikeSignature.method.forceVoid()
        BrazeCustomEventHelperPlaylistSignature.method.forceVoid()
        StatsUtilsSendRegisterActionSignature.method.forceVoid()
        StatsUtilsStartActionSaveSignature.method.forceVoid()
        BannerDisplaysReportWorkerSignature.method.forceVoid()
        BannerClicksReportWorkerSignature.method.forceVoid()
        FirebaseAnalyticsLogEventSignature.method.forceVoid()
        SongSendShareAnalyticsSignature.method.forceVoid()
        PlaylistSendShareAnalyticsSignature.method.forceVoid()
    }
}

/** Analytics facade entry point that boots the tracking stack. */
object AnalyticsInitSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/analytics/Analytics;",
    name = "init",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Z",
        "Lcom/anghami/ghost/analytics/Analytics\$FacebookAppEventLogger;",
    ),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** Analytics facade entry point that accepts a structured event object. */
object AnalyticsPostEventSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/analytics/Analytics;",
    name = "postEvent",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Lcom/anghami/ghost/analytics/Events\$AnalyticsEvent;"),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** Analytics facade entry point that accepts a raw event name. */
object AnalyticsPostEventStringSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/analytics/Analytics;",
    name = "postEvent",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** Forwards events to Google Analytics. */
object AnalyticsPostGoogleAnalyticsSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/analytics/Analytics;",
    name = "postGoogleAnalyticsEvent",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;"),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** Forwards events to the Adjust attribution SDK. */
object AnalyticsPostAdjustEventSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/analytics/Analytics;",
    name = "postAdjustEvent",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** Queues a Silo activity record for asynchronous upload. */
object SiloSaveEventAsyncSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/reporting/SiloManager;",
    name = "saveSiloEventAsync",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lcom/anghami/ghost/proto/SiloEventsProto\$Event\$Builder;",
        "Ljava/lang/String;",
    ),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** Persists a Silo activity record on the calling thread. */
object SiloSaveEventSyncSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/reporting/SiloManager;",
    name = "saveSiloEventSync",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lcom/anghami/ghost/proto/SiloEventsProto\$Event\$Builder;",
        "Ljava/lang/String;",
    ),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** Native Bugsnag bridge that hands crash and error payloads to the SDK. */
object BugsnagDeliverReportSignature : Fingerprint(
    definingClass = "Lcom/bugsnag/android/NativeInterface;",
    name = "deliverReport",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("[B", "[B", "[B", "Ljava/lang/String;", "Z"),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** Braze entry point for a custom event without extra properties. */
object BrazeLogCustomEventSignature : Fingerprint(
    definingClass = "Lcom/braze/Braze;",
    name = "logCustomEvent",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** Braze entry point for a custom event carrying a property bag. */
object BrazeLogCustomEventWithPropsSignature : Fingerprint(
    definingClass = "Lcom/braze/Braze;",
    name = "logCustomEvent",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lcom/braze/models/outgoing/BrazeProperties;"),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** Braze helper that reports the first liked song. */
object BrazeCustomEventHelperLikeSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/braze/BrazeCustomEventHelper;",
    name = "possiblyLikedFirstSong",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** Braze helper that reports the creation of a first playlist. */
object BrazeCustomEventHelperPlaylistSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/braze/BrazeCustomEventHelper;",
    name = "possiblySendCreateFirstPlaylistEvent",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** Uploads a completed registration-action statistics record. */
object StatsUtilsSendRegisterActionSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/reporting/registeraction/StatsUtils;",
    name = "sendRegisterActionStats",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Lcom/anghami/ghost/objectbox/models/records/StatisticsRecord;"),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** Opens a listening-action statistics record for later completion. */
object StatsUtilsStartActionSaveSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/reporting/registeraction/StatsUtils;",
    name = "startActionSave",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** Background worker that reports banner impressions. */
object BannerDisplaysReportWorkerSignature : Fingerprint(
    definingClass = "Lcom/anghami/app/reporting/banner/BannerDisplaysReportWorker;",
    name = "start",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** Background worker that reports banner clicks. */
object BannerClicksReportWorkerSignature : Fingerprint(
    definingClass = "Lcom/anghami/app/reporting/banner/BannerClicksReportWorker;",
    name = "start",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** Firebase Analytics event sink. */
object FirebaseAnalyticsLogEventSignature : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "logEvent",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;"),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** Song model helper that emits the legacy share event. */
object SongSendShareAnalyticsSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/pojo/Song;",
    name = "sendShareAnalyticsEventLegacy",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** Playlist model helper that emits the legacy share event. */
object PlaylistSendShareAnalyticsSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/pojo/Playlist;",
    name = "sendShareAnalyticsEventLegacy",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)
