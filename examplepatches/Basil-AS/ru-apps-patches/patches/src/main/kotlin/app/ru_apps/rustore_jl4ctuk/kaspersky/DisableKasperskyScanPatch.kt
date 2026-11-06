// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/rustore/kaspersky/DisableKasperskyScanPatch.kt.
package app.ru_apps.rustore_jl4ctuk.kaspersky

import app.shared.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.ru_apps.rustore_jl4ctuk.shared.Constants.COMPATIBILITY_RUSTORE
import org.w3c.dom.Element
import java.util.logging.Logger

private val logger = Logger.getLogger("DisableKasperskyScan")

private val returnWorkerSuccess = """
    sget-object v0, Landroidx/work/b;->b:Landroidx/work/b;
    new-instance v1, Landroidx/work/c${'$'}a${'$'}c;
    invoke-direct {v1, v0}, Landroidx/work/c${'$'}a${'$'}c;-><init>(Landroidx/work/b;)V
    return-object v1
""".trimIndent()

private val disableKasperskyManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_RUSTORE)

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.documentElement
                .childrenNamed("application")
                .single() as Element
            val disabled = application.disableComponentsByPrefix(
                "com.kavsdk.",
                "kavsdk.",
            )
            if (disabled != 5) {
                throw PatchException(
                    "Expected five Kaspersky manifest components, found $disabled",
                )
            }
            logger.info("Kaspersky SDK: disabled $disabled manifest components")
        }
    }
}

@Suppress("unused")
val disableKasperskyScanPatch = bytecodePatch(
    name = "Disable background scan",
    description = "Disables the periodic Kaspersky background device scan.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)
    dependsOn(disableKasperskyManifestPatch)

    execute {
        KasperskyScannerDtoIsPeriodicScanEnabledFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // Scheduling moved off WorkManager onto an in-process coroutine scheduler
        // (see KasperskyScannerWorkerEnqueuePeriodicFingerprint) - there is nothing
        // left to cancel after the fact, so short-circuit the scheduling step itself
        // before it can call the scheduler, the same pattern used for AltCraft/Radar/
        // install-identifier/remote-analytics/usage-stats in DisableAnalyticsPatch.kt.
        KasperskyScannerWorkerEnqueuePeriodicFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                "sget-object v0, Lut0/e0;->a:Lut0/e0;\nreturn-object v0",
            )

        KasperskyScannerWorkerDoWorkFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, returnWorkerSuccess)

        KasperskySdkStartFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "return-void")
        KasperskyJobStartFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                """
                invoke-virtual {p1}, Landroid/app/job/JobParameters;->getJobId()I
                move-result v0
                const-string v1, "jobscheduler"
                invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
                move-result-object v1
                check-cast v1, Landroid/app/job/JobScheduler;
                if-eqz v1, :morphe_kaspersky_job_done
                invoke-virtual {v1, v0}, Landroid/app/job/JobScheduler;->cancel(I)V
                :morphe_kaspersky_job_done
                const/4 v0, 0x0
                return v0
                """,
            )
        KasperskyStartReceiverFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "return-void")
        KasperskyAlarmReceiverFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                "invoke-static {p1, p2}, " +
                    "Lcom/kavsdk/AlarmReceiver;->cancelSpecificAlarm(" +
                    "Landroid/content/Context;Landroid/content/Intent;)V\n" +
                    "return-void",
            )

        logger.info(
            "Disabled periodic Kaspersky scheduling, existing worker execution, " +
                "SDK startup, jobs, and alarm/boot receivers",
        )
    }
}
