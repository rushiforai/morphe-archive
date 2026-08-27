package app.template.patches.rustore.kaspersky

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Matches `KasperskyScannerDto.isPeriodicScanEnabled()`, the persisted flag
 * used by the initializer and security settings to control automatic scans.
 */
object KasperskyScannerDtoIsPeriodicScanEnabledFingerprint : Fingerprint(
    definingClass = "Lru/vk/store/feature/kaspersky/impl/data/KasperskyScannerDto;",
    name = "isPeriodicScanEnabled",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Matches `KasperskyScannerWorker.Companion.enqueuePeriodic()`, which creates
 * the daily `PeriodicKasperskyScanner` WorkManager task.
 */
object KasperskyScannerWorkerEnqueuePeriodicFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L", "L"),
    custom = { method, classDef ->
        classDef.sourceFile == "KasperskyScannerWorker.kt" &&
            method.implementation?.instructions?.any { instruction ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference

                field?.definingClass == "Ljava/util/concurrent/TimeUnit;" &&
                    field.name == "DAYS"
            } == true
    },
)

/** Matches WorkManagerImpl's `cancelUniqueWork()` override after R8 renaming. */
object KasperskyWorkManagerCancelUniqueFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("CancelWorkByName_"),
    custom = { method, classDef ->
        classDef.sourceFile == "WorkManagerImpl.java" &&
            classDef.superclass != null &&
            method.implementation != null
    },
)

/** Matches the coroutine implementation of the already-enqueued Kaspersky scan worker. */
object KasperskyScannerWorkerDoWorkFingerprint : Fingerprint(
    definingClass =
        "Lru/vk/store/feature/kaspersky/impl/presentation/KasperskyScannerWorker;",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    custom = { method, _ -> method.implementation != null },
)

/** Matches Kaspersky SDK's process-level background service startup. */
object KasperskySdkStartFingerprint : Fingerprint(
    definingClass = "Lcom/kavsdk/SdkService;",
    name = "start",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/** Matches Kaspersky SDK's JobScheduler execution entry point. */
object KasperskyJobStartFingerprint : Fingerprint(
    definingClass = "Lcom/kavsdk/JobSchedulerService;",
    name = "onStartJob",
    returnType = "Z",
    parameters = listOf("Landroid/app/job/JobParameters;"),
)

/** Matches Kaspersky SDK's boot and explicit-start receiver. */
object KasperskyStartReceiverFingerprint : Fingerprint(
    definingClass = "Lcom/kavsdk/StartReceiver;",
    name = "onReceive",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Landroid/content/Intent;",
    ),
)

/** Matches Kaspersky SDK's recurring alarm receiver. */
object KasperskyAlarmReceiverFingerprint : Fingerprint(
    definingClass = "Lcom/kavsdk/AlarmReceiver;",
    name = "onReceive",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Landroid/content/Intent;",
    ),
)
