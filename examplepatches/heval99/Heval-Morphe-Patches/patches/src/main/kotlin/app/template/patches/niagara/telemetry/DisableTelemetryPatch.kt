package app.template.patches.niagara.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_NIAGARA
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.misc.telemetry.forceAnalyticsDeactivated
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

// The app's telemetry WorkManager workers. R8 keeps their class names (WorkManager instantiates
// them by name) but renames the suspend doWork they implement. Consent sync, retention events,
// the three Singular reports and the app usage report upload.
private val TELEMETRY_WORKERS = listOf(
    "Lbitpit/launcher/analytics/consent/GdprConsentSyncWorker;",
    "Lbitpit/launcher/analytics/RetentionEventsWorker;",
    "Lbitpit/launcher/analytics/singular/SingularFirstSessionReportWorker;",
    "Lbitpit/launcher/analytics/singular/SingularSessionReportWorker;",
    "Lbitpit/launcher/analytics/singular/SingularEventReportWorker;",
    "Lbitpit/launcher/usage/report/UsageReportUploadWorker;",
)

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics, tracking and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_NIAGARA)

    execute {
        // 1. Every telemetry worker finishes with Result.success() before doing any work, so
        // WorkManager does not retry it. Result and Result.Success are R8-renamed: Success is the
        // class with the library's toString, and success() is Result's only static no-arg method
        // returning it.
        val success = WorkResultSuccessToStringFingerprint.classDef
        val result = classDefBy(
            success.superclass ?: throw PatchException("${success.type} has no superclass"),
        )
        val successFactory = result.methods.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.isEmpty() && it.returnType == success.type
        }.singleOrNull() ?: throw PatchException("${result.type} has no single static success() factory")

        for (worker in TELEMETRY_WORKERS) {
            // The renamed doWork(continuation): the worker's only instance method, other than the
            // constructor, taking one argument and returning Object.
            val doWorks = mutableClassDefBy(worker).methods.filter {
                !AccessFlags.STATIC.isSet(it.accessFlags) && it.name != "<init>" &&
                    it.parameterTypes.size == 1 && it.returnType == "Ljava/lang/Object;" &&
                    it.implementation != null
            }
            val doWork = doWorks.singleOrNull()
                ?: throw PatchException("Expected one doWork in $worker, found ${doWorks.map { it.name }}")
            doWork.addInstructionsChecked(
                0,
                """
                    invoke-static {}, ${result.type}->${successFactory.name}()${success.type}
                    move-result-object v0
                    return-object v0
                """,
            )
        }

        // 2. Singular: the request sender returns Unit before it builds or posts anything, as if
        // the request had gone through. Unit is R8-renamed, so its INSTANCE is read from the
        // sender's own success-path sget-object of the class whose toString is "kotlin.Unit".
        val unit = KotlinUnitToStringFingerprint.classDef.type
        SingularRequestFingerprint.method.apply {
            val unitFields = implementation!!.instructions
                .filter { it.opcode == Opcode.SGET_OBJECT }
                .mapNotNull { (it as ReferenceInstruction).reference as? FieldReference }
                .filter { it.definingClass == unit && it.type == unit }
                .map { "${it.definingClass}->${it.name}:${it.type}" }
                .distinct()
            val unitField = unitFields.singleOrNull()
                ?: throw PatchException("Expected one Unit field read in $definingClass->$name, found $unitFields")
            addInstructionsChecked(
                0,
                """
                    sget-object v0, $unitField
                    return-object v0
                """,
            )
        }

        // 3. Crashlytics: the app's enable method returns at once, so collection stays off and no
        // Crashlytics user id is created. The disable method is untouched.
        CrashlyticsEnableFingerprint.method.returnEarly()

        // 4. Firebase Analytics: the "firebase_analytics_collection_deactivated" manifest switch
        // reads as true (shared helper), which beats the app turning collection on after the terms
        // screen and stops the automatic events too. Done in bytecode, so the resource table is
        // not re-encoded.
        forceAnalyticsDeactivated()
    }
}
