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
