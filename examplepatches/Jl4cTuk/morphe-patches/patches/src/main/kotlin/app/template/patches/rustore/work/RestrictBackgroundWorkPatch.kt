package app.template.patches.rustore.work

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.rustore.analytics.disableRuStoreAnalyticsPatch
import app.template.patches.rustore.background.disableBackgroundHooksPatch
import app.template.patches.rustore.kaspersky.disableKasperskyScanPatch
import app.template.patches.rustore.push.disablePushServicesPatch
import app.template.patches.rustore.shared.Constants.COMPATIBILITY_RUSTORE
import java.util.logging.Logger

private val logger = Logger.getLogger("RestrictRuStoreBackgroundWork")

private val returnWorkerSuccess = """
    sget-object v0, Landroidx/work/b;->b:Landroidx/work/b;
    new-instance v1, Landroidx/work/c${'$'}a${'$'}c;
    invoke-direct {v1, v0}, Landroidx/work/c${'$'}a${'$'}c;-><init>(Landroidx/work/b;)V
    return-object v1
""".trimIndent()

private val preservedUpdateWorkerClasses = listOf(
    "ru.vk.store.feature.files.data.DownloadWorker",
    "ru.vk.store.feature.installedapp.update.mobile.impl.presentation.AutoUpdateAnyAppWorker",
    "ru.vk.store.feature.rustore.update.impl.data.ApplyPatchWorker",
    "ru.vk.store.feature.rustore.update.impl.presentation.AutoUpdateWorker",
    "ru.vk.store.lib.installer.samsung.SamsungInstallWorker",
    "ru.vk.store.lib.installer.session.SessionInstallWorker",
)

@Suppress("unused")
val restrictBackgroundWorkPatch = bytecodePatch(
    name = "Restrict background work to updates",
    description =
        "Keeps background workers required for update checks, downloads, patching, and installation.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)
    dependsOn(
        disableRuStoreAnalyticsPatch,
        disableBackgroundHooksPatch,
        disableKasperskyScanPatch,
        disablePushServicesPatch,
    )

    execute {
        val cancelImplementation = WorkManagerCancelUniqueImplementationFingerprint
            .matchAll(1..1)
            .single()
        val workManagerType = cancelImplementation.classDef.superclass
            ?: throw PatchException("WorkManagerImpl has no WorkManager superclass")
        val cancelUniqueDescriptor =
            "$workManagerType->${cancelImplementation.method.name}(" +
                "Ljava/lang/String;)${cancelImplementation.method.returnType}"

        restrictedWorkerFingerprints.forEachIndexed { index, fingerprint ->
            fingerprint
                .matchAll(1..1)
                .singleOrNull()
                ?.method
                ?.addInstructions(0, returnWorkerSuccess)
                ?: throw PatchException(
                    "Restricted worker changed: ${restrictedWorkerClasses[index]}",
                )
        }

        val launcherIconSchedule = LauncherIconScheduleFingerprint
            .matchAll(1..1)
            .single()
        val launcherWorkManagerFields =
            launcherIconSchedule.classDef.fields.filter { it.type == workManagerType }
        if (launcherWorkManagerFields.size != 1) {
            throw PatchException(
                "Expected one launcher-icon WorkManager field, found " +
                    launcherWorkManagerFields.size,
            )
        }
        val launcherWorkManagerField = launcherWorkManagerFields.single()
        launcherIconSchedule.method.addInstructions(
            0,
            "move-object/from16 v0, p0\n" +
                "iget-object v0, v0, ${launcherIconSchedule.classDef.type}->" +
                "${launcherWorkManagerField.name}:$workManagerType\n" +
                "const-string v1, \"LauncherIconUpdate\"\n" +
                "invoke-virtual {v0, v1}, $cancelUniqueDescriptor\n" +
                "return-void",
        )

        val startDestinationSchedule = StartDestinationScheduleFingerprint
            .matchAll(1..1)
            .single()
        val startDestinationWorkManagerFields =
            startDestinationSchedule.classDef.fields.filter { it.type == workManagerType }
        if (startDestinationWorkManagerFields.size != 1) {
            throw PatchException(
                "Expected one start-destination WorkManager field, found " +
                    startDestinationWorkManagerFields.size,
            )
        }
        val startDestinationWorkManagerField =
            startDestinationWorkManagerFields.single()
        startDestinationSchedule.method.addInstructions(
            0,
            "move-object/from16 v0, p0\n" +
                "iget-object v0, v0, ${startDestinationSchedule.classDef.type}->" +
                "${startDestinationWorkManagerField.name}:$workManagerType\n" +
                "const-string v1, \"PeriodicUpdateStartDestination\"\n" +
                "invoke-virtual {v0, v1}, $cancelUniqueDescriptor\n" +
                "return-void",
        )

        val tabsOrderSchedule = TabsOrderScheduleFingerprint
            .matchAll(1..1)
            .single()
        val tabsOrderWorkManagerFields =
            tabsOrderSchedule.classDef.fields.filter { it.type == workManagerType }
        if (tabsOrderWorkManagerFields.size != 1) {
            throw PatchException(
                "Expected one tab-order WorkManager field, found " +
                    tabsOrderWorkManagerFields.size,
            )
        }
        val tabsOrderWorkManagerField = tabsOrderWorkManagerFields.single()
        tabsOrderSchedule.method.addInstructions(
            0,
            "move-object/from16 v0, p0\n" +
                "iget-object v0, v0, ${tabsOrderSchedule.classDef.type}->" +
                "${tabsOrderWorkManagerField.name}:$workManagerType\n" +
                "const-string v1, \"NavigationTabsOrderUpdate\"\n" +
                "invoke-virtual {v0, v1}, $cancelUniqueDescriptor\n" +
                "return-void",
        )

        val cancelSubscriptionInitializer = CancelSubscriptionInitializerFingerprint
            .matchAll(1..1)
            .single()
        val subscriptionWorkManagerFields =
            cancelSubscriptionInitializer.classDef.fields.filter {
                it.type == workManagerType
            }
        if (subscriptionWorkManagerFields.size != 1) {
            throw PatchException(
                "Expected one subscription WorkManager field, found " +
                    subscriptionWorkManagerFields.size,
            )
        }
        val subscriptionWorkManagerField = subscriptionWorkManagerFields.single()
        cancelSubscriptionInitializer.method.addInstructions(
            0,
            "move-object/from16 v0, p0\n" +
                "iget-object v0, v0, ${cancelSubscriptionInitializer.classDef.type}->" +
                "${subscriptionWorkManagerField.name}:$workManagerType\n" +
                "const-string v1, \"CancelSubscriptionSyncWorker\"\n" +
                "invoke-virtual {v0, v1}, $cancelUniqueDescriptor\n" +
                "sget-object v0, Lut0/e0;->a:Lut0/e0;\n" +
                "return-object v0",
        )

        logger.info(
            "Disabled ${restrictedWorkerClasses.size} non-update workers and " +
                "their recurring schedulers; preserved " +
                "${preservedUpdateWorkerClasses.size} update/download/install workers",
        )
    }
}
