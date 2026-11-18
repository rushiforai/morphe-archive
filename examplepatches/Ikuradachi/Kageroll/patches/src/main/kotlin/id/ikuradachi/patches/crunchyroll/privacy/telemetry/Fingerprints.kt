package id.ikuradachi.patches.crunchyroll.privacy.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Matches Segment Analytics.Builder.build().
 * Returns null so Analytics, Stats, SegmentIntegration, and GetAdvertisingIdTask never start.
 */
object SegmentAnalyticsBuildFingerprint : Fingerprint(
    definingClass = "Lcom/segment/analytics/Analytics\$Builder;",
    name = "build",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = emptyList(),
    returnType = "Lcom/segment/analytics/Analytics;",
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
        opcode(Opcode.MOVE_RESULT),
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
 * Matches Braze SessionManager.<init> (obfuscated as bo/app/d3.<init>) via session seal action.
 */
object BrazeSessionManagerClassFingerprint : Fingerprint(
    name = "<init>",
    filters = listOf(
        string(".intent.BRAZE_SESSION_SHOULD_SEAL"),
    ),
)

/**
 * Matches Braze SessionManager.e()V (bo/app/d3.e()V), which schedules BRAZE_SESSION_SHOULD_SEAL via AlarmManager.
 */
object BrazeSessionSealAlarmFingerprint : Fingerprint(
    classFingerprint = BrazeSessionManagerClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        string("session_id"),
        methodCall(definingClass = "Landroid/app/AlarmManager;", name = "set"),
    ),
)

/**
 * Matches AppMeasurementContentProvider.onCreate(), which pre-initializes zzhd and MeasurementBrokerService.
 */
object AppMeasurementContentProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/measurement/AppMeasurementContentProvider;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = emptyList(),
    returnType = "Z",
)

/**
 * Matches GMS Measurement zzdf.<init>(Context, String, String, String, Bundle).
 * Locates the ArrayList store to short-circuit Dynamite loading and lifecycle registration.
 */
object ScionZzdfInitFingerprint : Fingerprint(
    name = "<init>",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.CONSTRUCTOR),
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Landroid/os/Bundle;",
    ),
    returnType = "V",
    filters = listOf(
        newInstance("Lcom/google/android/gms/measurement/api/AppMeasurementSdk;"),
        newInstance("Ljava/util/ArrayList;"),
        opcode(Opcode.IPUT_OBJECT, InstructionLocation.MatchAfterWithin(3)),
    ),
)

/**
 * Matches zzdf.zza(zzdf$zza), which enqueues Scion tasks onto the ScionFrontendApi executor.
 */
object ScionZzdfEnqueueFingerprint : Fingerprint(
    classFingerprint = ScionZzdfInitFingerprint,
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    parameters = listOf("L"),
    returnType = "V",
    filters = listOf(
        opcode(Opcode.IGET_OBJECT),
        methodCall(
            definingClass = "Ljava/util/concurrent/Executor;",
            name = "execute",
            location = InstructionLocation.MatchAfterImmediately(),
        ),
    ),
)

/**
 * Matches zzdf$zza.run() to resolve its cleanup callback method (zzb()V) without hardcoding its name.
 */
object ScionZzdfTaskRunFingerprint : Fingerprint(
    name = "run",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        opcode(Opcode.IF_EQZ),
        opcode(Opcode.INVOKE_VIRTUAL, InstructionLocation.MatchAfterImmediately()),
        opcode(Opcode.RETURN_VOID, InstructionLocation.MatchAfterImmediately()),
    ),
)

/**
 * Matches AdvertisingIdClient.getAdvertisingIdInfo(Context), which binds GMS AdvertisingIdService.
 */
object AdvertisingIdClientGetInfoFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;",
    name = "getAdvertisingIdInfo",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;"),
    returnType = "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;",
)

/**
 * Matches JniNativeApi.<clinit>(), which loads libcrashlytics.so via System.loadLibrary("crashlytics").
 */
object CrashlyticsJniNativeApiClinitFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/ndk/JniNativeApi;",
    name = "<clinit>",
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SPUT_OBJECT,
            definingClass = "Lcom/google/firebase/crashlytics/ndk/JniNativeApi;",
            name = "APK_FILTER",
        ),
        string("crashlytics"),
        methodCall(definingClass = "Ljava/lang/System;", name = "loadLibrary"),
        opcode(Opcode.CONST_4, InstructionLocation.MatchAfterImmediately()),
    ),
)

/**
 * Matches FirebaseCrashlyticsNdk.prepareNativeSession(...), which writes Crashpad JSON and calls nativeInit.
 */
object CrashlyticsNdkPrepareNativeSessionFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/ndk/FirebaseCrashlyticsNdk;",
    name = "prepareNativeSession",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.DECLARED_SYNCHRONIZED),
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "J",
        "Lcom/google/firebase/crashlytics/internal/model/StaticSessionData;",
    ),
    returnType = "V",
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

