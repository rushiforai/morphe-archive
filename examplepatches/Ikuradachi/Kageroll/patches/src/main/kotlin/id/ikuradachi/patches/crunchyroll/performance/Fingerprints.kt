package id.ikuradachi.patches.crunchyroll.performance

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// ============================================================================
// Category 1: Background Services & Receivers
// ============================================================================

/**
 * Matches GoogleEngageBroadcastReceiver.onReceive(Context, Intent).
 * Receives com.google.android.engage.action.PUBLISH_CONTINUATION to publish watch history.
 */
object GoogleEngageBroadcastReceiverFingerprint : Fingerprint(
    definingClass = "Lcom/crunchyroll/googleengage/data/entripoints/GoogleEngageBroadcastReceiver;",
    name = "onReceive",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;"),
    returnType = "V",
    filters = listOf(
        string("feature"),
        string("com.google.android.engage.action.PUBLISH_CONTINUATION"),
        string("publisher"),
        string("onReceive: Received unrecognized intent: "),
    ),
)

/**
 * Matches GoogleEngagePublisher.publishContinuation(Context) (obfuscated as os/d.a).
 * Central Google Engage WorkManager task scheduler invoked on app backgrounding and broadcast.
 */
object GoogleEngagePublisherFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/content/Context;"),
    returnType = "V",
    filters = listOf(
        string("PUBLISH_TYPE"),
        string("PUBLISH_CONTINUATION"),
        string("GoogleEngage"),
        string("Publishing continuation clusters"),
        string("Upload Continuation"),
    ),
)

/**
 * Matches ContinueWatchingWidgetReceiver.onEnabled(Context).
 * Glance app widget broadcast receiver that initiates install tracking and periodic polling.
 */
object ContinueWatchingWidgetReceiverOnEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/crunchyroll/appwidgets/continuewatching/ContinueWatchingWidgetReceiver;",
    name = "onEnabled",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/content/Context;"),
    returnType = "V",
    filters = listOf(
        fieldAccess(definingClass = "Lcom/crunchyroll/appwidgets/continuewatching/ContinueWatchingWorker;"),
        string("trackInstall"),
        string("continue_watching_enabled"),
    ),
)

/**
 * Matches ContinueWatchingWorker$a.a(Context, boolean).
 * Schedules a recurring 30-minute PeriodicWorkRequest for ContinueWatchingWorker.
 */
object ContinueWatchingPeriodicSchedulerFingerprint : Fingerprint(
    definingClass = "Lcom/crunchyroll/appwidgets/continuewatching/ContinueWatchingWorker\$a;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;", "Z"),
    returnType = "V",
    filters = listOf(
        fieldAccess(definingClass = "Ljava/util/concurrent/TimeUnit;", name = "MINUTES"),
        string("repeatIntervalTimeUnit"),
        literal(30L),
        fieldAccess(definingClass = "Lcom/crunchyroll/appwidgets/continuewatching/ContinueWatchingWorker;"),
    ),
)

/**
 * Matches SessionLifecycleServiceBinderImpl.bindToService(Messenger, ServiceConnection).
 * Binds foreground app to SessionLifecycleService for background session broadcasts.
 */
object FirebaseSessionServiceBinderFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/sessions/SessionLifecycleServiceBinderImpl;",
    name = "bindToService",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Landroid/os/Messenger;", "Landroid/content/ServiceConnection;"),
    returnType = "V",
    filters = listOf(
        string("callback"),
        string("serviceConnection"),
        newInstance("Landroid/content/Intent;"),
        methodCall(definingClass = "Landroid/content/Context;", name = "bindService"),
    ),
)

/**
 * Matches JobInfoScheduler.schedule(TransportContext, int, boolean).
 * Schedules background JobInfoSchedulerService jobs via JobScheduler for Firelog uploads.
 */
object DataTransportJobInfoSchedulerFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/JobInfoScheduler;",
    name = "schedule",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Lcom/google/android/datatransport/runtime/TransportContext;", "I", "Z"),
    returnType = "V",
    filters = listOf(
        string("jobscheduler"),
    ),
)

// ============================================================================
// Category 2: Scheduled WorkManager Tasks & Background Bloat Workers
// ============================================================================

/**
 * Matches GoogleEngageServiceWorker.doWork (obfuscated as a(Continuation)).
 * Coroutine worker executing continuation upload and Google TV sync.
 */
object GoogleEngageWorkerDoWorkFingerprint : Fingerprint(
    definingClass = "Lcom/crunchyroll/googleengage/data/GoogleEngageServiceWorker;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L"),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("GoogleEngage"),
        string("Google Engage Feature is disabled"),
    ),
)

/**
 * Matches ContinueWatchingWorker.doWork (obfuscated as a(Continuation)).
 * Recurring 30-minute widget worker performing API queries and Glide thumbnail prefetching.
 */
object ContinueWatchingWorkerDoWorkFingerprint : Fingerprint(
    definingClass = "Lcom/crunchyroll/appwidgets/continuewatching/ContinueWatchingWorker;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L"),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("call to 'resume' before 'invoke' with coroutine"),
        string("trackInstall"),
        string("dependencies"),
    ),
)

/**
 * Matches Datadog WorkManager scheduler (obfuscated as ha0/p.a).
 * Enqueues DatadogUploadWorker upon app backgrounding.
 */
object DatadogWorkManagerSchedulerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "L"),
    returnType = "V",
    filters = listOf(
        string("DatadogBackgroundUpload/"),
        string("instanceName"),
        string("internalLogger"),
        string("_dd.sdk.instanceName"),
        string("DatadogUploadWorker"),
    ),
)

/**
 * Matches Datadog UploadWorker.doWork() (obfuscated as a() in 3.129.1).
 * WorkManager worker executing disk-to-network telemetry batch uploads.
 */
object DatadogUploadWorkerDoWorkFingerprint : Fingerprint(
    definingClass = "Lcom/datadog/android/core/UploadWorker;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    returnType = "Landroidx/work/",
    filters = listOf(
        string("_dd.sdk.instanceName"),
    ),
)

/**
 * Matches OneTrust CMP OTCMPConsentLoggingWorker.doWork().
 * Background worker transmitting user consent receipts and telemetry logs to OneTrust.
 */
object OneTrustConsentLoggingWorkerFingerprint : Fingerprint(
    definingClass = "Lcom/onetrust/otpublishers/headless/cmp/api/OTCMPConsentLoggingWorker;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    returnType = "Landroidx/work/",
    filters = listOf(
        string("OT_CMP_SDK_LAST_WORKER_ID"),
        string("CPWorker"),
        string("Required data is null: loggingEndPoint="),
    ),
)

