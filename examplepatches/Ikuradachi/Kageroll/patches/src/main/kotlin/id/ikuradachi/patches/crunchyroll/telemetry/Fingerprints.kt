package id.ikuradachi.patches.crunchyroll.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object SegmentPayloadAdmissionFingerprint : Fingerprint(
    definingClass = "Lcom/segment/analytics/Analytics;",
    name = "enqueue",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Lcom/segment/analytics/integrations/BasePayload;"),
    returnType = "V",
    filters = listOf(
        methodCall(smali = "Lcom/segment/analytics/BooleanPreference;->get()Z"),
        string("Created payload %s."),
        newInstance("Lcom/segment/analytics/MiddlewareChainRunner;"),
    ),
)

object MuxEventAdmissionFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L"),
    returnType = "V",
    filters = listOf(
        string("viewstart"),
        string("viewend"),
        string("renditionchange"),
        string("Event not handled, ratelimited: "),
        string("MuxStatsEventQueue"),
    ),
)

object FirebaseAnalyticsCollectionObserverFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/Object;", "L"),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        methodCall(smali = "Ljava/lang/Boolean;->booleanValue()Z"),
        opcode(Opcode.MOVE_RESULT, InstructionLocation.MatchAfterImmediately()),
        string("Updating Firebase Analytics collection enabled = "),
        methodCall(smali = "Lcom/google/firebase/analytics/FirebaseAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/firebase/analytics/FirebaseAnalytics;"),
        methodCall(smali = "Lcom/google/firebase/analytics/FirebaseAnalytics;->setAnalyticsCollectionEnabled(Z)V"),
    ),
)

object CrashlyticsAutomaticPermissionFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;",
    name = "isAutomaticDataCollectionEnabled",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.DECLARED_SYNCHRONIZED),
    parameters = emptyList(),
    returnType = "Z",
    filters = listOf(
        methodCall(smali = "Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;->isFirebaseDataCollectionDefaultEnabled()Z"),
        methodCall(smali = "Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;->logDataCollectionState(Z)V"),
    ),
)

object DatadogSetupFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L"),
    returnType = "V",
    filters = listOf(
        string("environmentDomain"),
        anyInstruction(
            opcode(Opcode.IGET_BOOLEAN),
            opcode(Opcode.MOVE_RESULT),
        ),
        opcode(Opcode.IF_EQZ, InstructionLocation.MatchAfterWithin(1)),
        string("trackingConsent"),
        string("_dd.sdk_core.default"),
        string("rum-pipeline"),
        string("installation_source"),
        string("Locale Fallback"),
    ),
)

/**
 * Matches MuxStatsEventQueue.<init>(ClientSession) (obfuscated as uv0/f.<init>).
 * Initializes 1000ms fixed-delay periodic timer for QoE beacon flushes during playback.
 */
object MuxEventQueue1000msTimerFingerprint : Fingerprint(
    name = "<init>",
    parameters = listOf("L"),
    returnType = "V",
    filters = listOf(
        string("adbreakend"),
        methodCall(definingClass = "Ljava/util/concurrent/ScheduledExecutorService;", name = "scheduleWithFixedDelay"),
    ),
)

/**
 * Matches Segment SegmentIntegration.shouldFlush().
 * Gate evaluated every 30 seconds and on payload enqueue to initiate HTTP flushes.
 */
object SegmentShouldFlushFingerprint : Fingerprint(
    definingClass = "Lcom/segment/analytics/SegmentIntegration;",
    name = "shouldFlush",
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "Z",
    filters = listOf(
        methodCall(definingClass = "Lcom/segment/analytics/PayloadQueue;", name = "size"),
        methodCall(definingClass = "Lcom/segment/analytics/internal/Utils;", name = "isConnected"),
    ),
)

/**
 * Matches Braze BrazeFlushPushDeliveryReceiver.onReceive(Context, Intent).
 * AlarmManager-triggered receiver handling com.braze.FLUSH_PUSH_DELIVERY wakeups.
 */
object BrazeFlushReceiverFingerprint : Fingerprint(
    definingClass = "Lcom/braze/BrazeFlushPushDeliveryReceiver;",
    name = "onReceive",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;"),
    returnType = "V",
    filters = listOf(
        string("com.braze.FLUSH_PUSH_DELIVERY"),
    ),
)

/**
 * Matches Datadog DataUploadScheduler.start() (obfuscated as o90/e.b()).
 * Starts continuous in-memory upload loop thread in ScheduledThreadPoolExecutor.
 */
object DatadogUploadSchedulerStartFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        string(": data upload"),
    ),
    custom = { method, _ ->
        method.name != "run"
    },
)

