package app.template.patches.rustore.analytics

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val ALTCRAFT_WORKER =
    "Lru/vk/store/lib/analytics/system/altcraft/presentation/AltCraftFlushEventsWorker;"
private const val RADAR_WORKER =
    "Lru/vk/store/lib/analytics/system/radar/presentation/RadarFlushSnapshotWorker;"
private const val START_PERMISSION_TYPE =
    "Lru/vk/store/feature/permission/start/api/domain/StartPermissionType;"

private fun Method.referencesClass(type: String) =
    implementation?.instructions?.any { instruction ->
        when (val reference = (instruction as? ReferenceInstruction)?.reference) {
            is FieldReference -> reference.definingClass == type
            is MethodReference -> reference.definingClass == type
            is TypeReference -> reference.type == type
            else -> false
        }
    } == true

private fun Method.referencesField(definingClass: String, name: String) =
    implementation?.instructions?.any { instruction ->
        val reference =
            (instruction as? ReferenceInstruction)?.reference as? FieldReference
        reference?.definingClass == definingClass && reference.name == name
    } == true

private fun Method.referencesFieldType(definingClass: String, type: String) =
    implementation?.instructions?.any { instruction ->
        val reference =
            (instruction as? ReferenceInstruction)?.reference as? FieldReference
        reference?.definingClass == definingClass && reference.type == type
    } == true

/**
 * Matches `AltCraftAnalyticsImpl.send(String, Map, String, boolean, li2.f)`,
 * the central entry point used for AltCraft events.
 */
object AltCraftSendFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/util/Map;",
        "Ljava/lang/String;",
        "Z",
        "L",
    ),
    custom = { method, classDef ->
        classDef.sourceFile == "AltCraftAnalyticsImpl.kt" &&
            method.implementation != null
    },
)

/** Matches RuStore's own MyTracker login event producer before it builds event metadata. */
object MyTrackerLoginFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    custom = { method, classDef ->
        classDef.sourceFile == "MyTrackerAnalyticsImpl.kt" &&
            method.referencesClass("Lcom/my/tracker/MyTracker;")
    },
)

/** Matches RuStore's own MyTracker event producer before it launches its reporting coroutine. */
object MyTrackerSendFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/util/Map;",
        "Ljava/lang/String;",
        "Z",
        "L",
    ),
    custom = { method, classDef ->
        classDef.sourceFile == "MyTrackerAnalyticsImpl.kt" &&
            method.implementation != null
    },
)

/** Matches RuStore's stable request identifier built from Android ID and device properties. */
object RequestDeviceIdFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("android_id"),
    custom = { method, classDef ->
        classDef.sourceFile == "DeviceInfoProvider.kt" &&
            method.implementation != null
    },
)

/** Matches the exported RuStore install-referrer service used for attribution. */
object InstallReferrerServiceBindFingerprint : Fingerprint(
    returnType = "Landroid/os/IBinder;",
    parameters = listOf("Landroid/content/Intent;"),
    custom = { method, classDef ->
        classDef.sourceFile == "RemoteInstallReferrerProvider.kt" &&
            method.implementation != null
    },
)

/** Matches the Google Play install-referrer client before it binds to Play Store. */
object GoogleInstallReferrerConnectFingerprint : Fingerprint(
    definingClass = "Lcom/android/installreferrer/api/InstallReferrerClientImpl;",
    name = "startConnection",
    returnType = "V",
    parameters = listOf(
        "Lcom/android/installreferrer/api/InstallReferrerStateListener;",
    ),
)

/** Matches OK Tracer's manifest-started content provider initialization entry point. */
object OkTracerInitializerFingerprint : Fingerprint(
    definingClass = "Lru/ok/tracer/startup/InitializationProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList(),
)

/** Matches Google Data Transport's JobScheduler upload entry point. */
object GoogleDataTransportJobFingerprint : Fingerprint(
    definingClass =
        "Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/" +
            "JobInfoSchedulerService;",
    name = "onStartJob",
    returnType = "Z",
    parameters = listOf("Landroid/app/job/JobParameters;"),
)

/** Matches Google Data Transport's AlarmManager upload entry point. */
object GoogleDataTransportAlarmFingerprint : Fingerprint(
    definingClass =
        "Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/" +
            "AlarmManagerSchedulerBroadcastReceiver;",
    name = "onReceive",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Landroid/content/Intent;",
    ),
)

/** Matches WorkManagerImpl's `cancelUniqueWork()` override after R8 renaming. */
object WorkManagerCancelUniqueImplementationFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("CancelWorkByName_"),
    custom = { method, classDef ->
        classDef.sourceFile == "WorkManagerImpl.java" &&
            classDef.superclass != null &&
            method.implementation != null
    },
)

/** Matches VK SuperAppKit's central stat sender by its stable API method names. */
object SuperAppStatSenderFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "Z", "Z", "L", "Z"),
    strings = listOf(
        "statEvents.addSAKMobile",
        "statEvents.addSAKMobileAnonymously",
    ),
)

/** Matches the common SuperAppKit event commit path before filtering and serialization. */
object SuperAppStatEventCommitFingerprint : Fingerprint(
    returnType = "L",
    parameters = emptyList(),
    strings = listOf("Event validation error for "),
)

/** Matches the StatLog task scheduler before it posts recurring handler callbacks. */
object SuperAppStatDaemonScheduleFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("post task failure"),
)

/** Matches VK Push's crash-reporter factory, which contains a built-in no-op fallback. */
object PushCrashReporterFactoryFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "L",
        "L",
    ),
    strings = listOf(
        "Using real crash reporter",
        "Using stub crash reporter",
    ),
    custom = { method, classDef ->
        classDef.sourceFile == "CrashSenderRepositoryFactory.kt" &&
            method.implementation != null
    },
)

/** Matches the initializer that creates AltCraft's periodic flush work. */
object AltCraftFlushInitializerFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    custom = { method, classDef ->
        classDef.sourceFile == "AltCraftFlushInitializer.kt" &&
            method.referencesClass(ALTCRAFT_WORKER)
    },
)

/** Matches the coroutine implementation of `AltCraftFlushEventsWorker.doWork()`. */
object AltCraftDoWorkFingerprint : Fingerprint(
    definingClass = ALTCRAFT_WORKER,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    custom = { method, _ -> method.implementation != null },
)

/** Matches the initializer that creates Radar's periodic snapshot flush work. */
object RadarInitializerFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/content/Context;", "L"),
    custom = { method, classDef ->
        classDef.sourceFile == "RadarInitializer.kt" &&
            method.referencesClass(RADAR_WORKER)
    },
)

/** Matches the coroutine implementation of `RadarFlushSnapshotWorker.doWork()`. */
object RadarDoWorkFingerprint : Fingerprint(
    definingClass = RADAR_WORKER,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    custom = { method, _ ->
        method.implementation != null
    },
)

/**
 * Matches the startup decision for the Usage Stats analytics permission sheet.
 * The aggregate permission builder also references `USAGE_STATS`, so the remote-feature field
 * requirement keeps this fingerprint pinned to the boolean producer.
 */
object UsageStatsPromptEligibilityFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    custom = { method, classDef ->
        classDef.sourceFile == "GetStartPermissionsUseCaseImpl.kt" &&
            method.referencesField(START_PERMISSION_TYPE, "USAGE_STATS") &&
            method.referencesFieldType(
                "Lru/vk/store/lib/featuretoggle/b;",
                "Lru/vk/store/lib/featuretoggle/Feature\$Remote\$a;",
            )
    },
)

val analyticsCoroutineWorkerClasses = listOf(
    "Lru/mail/omicron/MultiAccountWorkManagerExecutor${'$'}MultiAccountOmicronSyncWorker;",
    "Lru/vk/store/feature/install/identifier/impl/presentation/InstallIdentifierSyncWorker;",
    "Lru/vk/store/feature/storeapp/analytics/remote/impl/presentation/SendAnalyticsEventWorker;",
    "Lru/vk/store/feature/storeapp/recommendation/start/trackingUrl/impl/data/PublisherTrackingWorker;",
    "Lru/vk/store/feature/usagestats/impl/presentation/UsageStatsCollectorWorker;",
)

val analyticsCoroutineWorkerFingerprints = analyticsCoroutineWorkerClasses.map { type ->
    Fingerprint(
        definingClass = type,
        name = "b",
        returnType = "Ljava/lang/Object;",
        parameters = listOf("Lyt0/e;"),
    )
}

val analyticsWorkerClasses = listOf(
    "Lru/mail/omicron/DefaultWorkManagerExecutor${'$'}PeriodicWorker;",
    "Lru/ok/tracer/disk/usage/DiskUsageWorker;",
    "Lru/ok/tracer/heap/dumps/exceptions/ShrinkDumpWorker;",
    "Lru/ok/tracer/upload/SampleUploadWorker;",
)

val analyticsWorkerFingerprints = analyticsWorkerClasses.map { type ->
    Fingerprint(
        definingClass = type,
        name = "doWork",
        returnType = "Landroidx/work/c${'$'}a;",
        parameters = emptyList(),
    )
}

object TracerDiskUsageInitializerFingerprint : Fingerprint(
    definingClass = "Lru/ok/tracer/disk/usage/DiskUsage;",
    name = "initialize${'$'}tracer_disk_usage_release",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

object TracerSampleUploadFingerprint : Fingerprint(
    definingClass = "Lru/ok/tracer/upload/SampleUploader;",
    name = "upload",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lru/ok/tracer/TracerFeature;",
        "Ljava/io/File;",
        "J",
        "Ljava/lang/String;",
        "Z",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/Long;",
        "Ljava/lang/Long;",
        "Ljava/util/Map;",
        "Lru/ok/tracer/opentelemetry/util/TraceParent;",
    ),
)

object OmicronNetworkRequestFingerprint : Fingerprint(
    definingClass = "Lt31/b;",
    name = "a",
    returnType = "Lt31/e;",
    parameters = listOf(
        "Lj31/d;",
        "Lt31/a;",
        "Ll31/d;",
    ),
)

object OmicronDefaultScheduleFingerprint : Fingerprint(
    definingClass = "Lru/mail/omicron/DefaultWorkManagerExecutor;",
    name = "b",
    returnType = "V",
    parameters = listOf("J", "Z"),
)

object OmicronMultiAccountScheduleFingerprint : Fingerprint(
    definingClass = "Lru/mail/omicron/MultiAccountWorkManagerExecutor;",
    name = "a",
    returnType = "V",
    parameters = listOf("J", "J", "Z"),
)

object InstallIdentifierInitializerFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lau0/d;"),
    strings = listOf("InstallIdentifierSyncWorker"),
    custom = { method, classDef ->
        classDef.sourceFile == "InstallIdentifierInitializer.kt" &&
            method.implementation != null
    },
)

object RemoteAnalyticsInitializerFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lau0/d;"),
    strings = listOf("SendAnalyticsEventPeriodicWorker"),
    custom = { method, classDef ->
        classDef.sourceFile == "RemoteAnalyticsInitializer.kt" &&
            method.implementation != null
    },
)

object RemoteAnalyticsSchedulerFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lau0/d;"),
    strings = listOf("SendAnalyticsEventWorker"),
    custom = { method, classDef ->
        classDef.sourceFile == "SendAnalyticsEventWorkerScheduler.kt" &&
            method.implementation != null
    },
)

object UsageStatsInitializerFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lau0/d;"),
    strings = listOf("UsageStatsCollectorWorker"),
    custom = { method, classDef ->
        classDef.sourceFile == "UsageStatsInitializer.kt" &&
            method.implementation != null
    },
)

object PublisherTrackingScheduleFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
    strings = listOf("TRACKING_URL", "PACKAGE_NAME_KEY"),
    custom = { method, classDef ->
        classDef.sourceFile == "TrackingUrlRepositoryImpl.kt" &&
            method.implementation != null
    },
)

object AnalyticsDispatchFingerprint : Fingerprint(
    definingClass = "Lso2/e;",
    name = "d",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/util/Map;",
        "Z",
    ),
)

object AnalyticsUserIdFingerprint : Fingerprint(
    definingClass = "Lso2/e;",
    name = "b",
    returnType = "V",
    parameters = listOf("J"),
)
