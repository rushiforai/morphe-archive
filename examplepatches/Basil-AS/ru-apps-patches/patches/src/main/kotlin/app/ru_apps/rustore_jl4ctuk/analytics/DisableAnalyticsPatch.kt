// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/rustore/analytics/DisableAnalyticsPatch.kt.
package app.ru_apps.rustore_jl4ctuk.analytics

import app.shared.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.privacy.patches.analytics.jl4ctuk.disableAnalyticsDependency
import app.ru_apps.rustore_jl4ctuk.shared.Constants.COMPATIBILITY_RUSTORE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Element
import java.util.logging.Logger

private val logger = Logger.getLogger("DisableRuStoreAnalytics")

private val returnWorkerSuccess = """
    sget-object v0, Landroidx/work/b;->b:Landroidx/work/b;
    new-instance v1, Landroidx/work/c${'$'}a${'$'}c;
    invoke-direct {v1, v0}, Landroidx/work/c${'$'}a${'$'}c;-><init>(Landroidx/work/b;)V
    return-object v1
""".trimIndent()

private fun Iterable<Instruction>.returnedSingletonFields() =
    zipWithNext().mapNotNull { (loadInstruction, returnInstruction) ->
        if (
            loadInstruction.opcode != Opcode.SGET_OBJECT ||
            returnInstruction.opcode != Opcode.RETURN_OBJECT
        ) {
            return@mapNotNull null
        }

        val loadRegister = (loadInstruction as? OneRegisterInstruction)?.registerA
        val returnRegister = (returnInstruction as? OneRegisterInstruction)?.registerA
        val field = (loadInstruction as? ReferenceInstruction)?.reference as? FieldReference
        field?.takeIf {
            loadRegister == returnRegister && it.definingClass == it.type
        }
    }.distinctBy { field ->
        "${field.definingClass}->${field.name}:${field.type}"
    }

private val disableRuStoreAnalyticsManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_RUSTORE)

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.documentElement
                .childrenNamed("application")
                .single() as Element
            val manifest = document.documentElement

            val removedPermissions = manifest.childrenNamed(
                "uses-permission",
                "uses-permission-sdk-23",
            ).filter { permission ->
                permission.getAttribute("android:name") in setOf(
                    "com.google.android.providers.gsf.permission.READ_GSERVICES",
                    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
                )
            }
            if (removedPermissions.size != 2) {
                throw PatchException(
                    "Expected two analytics permissions, found ${removedPermissions.size}",
                )
            }
            manifest.removeChildren(removedPermissions)
            logger.info("Analytics permissions: removed ${removedPermissions.size}")

            val altCraftDisabled = application.disableComponentsWhere { name ->
                name.startsWith("ru.vk.store.lib.analytics.")
            }
            logger.info("AltCraft: disabled $altCraftDisabled components")

            val metricsDisabled =
                application.disableComponentsByPrefix("ru.rustore.sdk.metrics.")
            if (metricsDisabled != 1) {
                throw PatchException(
                    "Expected one RuStore Metrics component, found $metricsDisabled",
                )
            }
            logger.info("RuStore Metrics: disabled $metricsDisabled components")

            val transportDisabled = application.disableComponentsByPrefix(
                "ru.vk.store.feature.storeapp.install.referrer.",
                "ru.ok.tracer.",
                "com.vk.superapp.logs.",
                "com.google.android.datatransport.",
            )
            if (transportDisabled != 9) {
                throw PatchException(
                    "Expected nine analytics transport components, found $transportDisabled",
                )
            }
            logger.info("Analytics transports: disabled $transportDisabled components")
        }
    }
}

@Suppress("unused")
val disableRuStoreAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Disables analytics and tracking in RuStore.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)

    dependsOn(disableRuStoreAnalyticsManifestPatch)
    dependsOn(disableAnalyticsDependency)

    execute {
        val cancelImplementation = WorkManagerCancelUniqueImplementationFingerprint
            .matchAll(1..1)
            .single()
        val workManagerType = cancelImplementation.classDef.superclass
            ?: throw PatchException("WorkManagerImpl has no WorkManager superclass")
        val cancelUniqueDescriptor =
            "$workManagerType->${cancelImplementation.method.name}(" +
                "Ljava/lang/String;)${cancelImplementation.method.returnType}"

        AltCraftSendFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "return-void")
        MyTrackerLoginFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "return-void")
        MyTrackerSendFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "return-void")

        RequestDeviceIdFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                "const-string v0, \"00000000-0000-0000-0000-000000000000\"\n" +
                    "return-object v0",
            )

        InstallReferrerServiceBindFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        GoogleInstallReferrerConnectFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                "const/4 v0, 0x2\n" +
                    "invoke-interface {p1, v0}, " +
                    "Lcom/android/installreferrer/api/InstallReferrerStateListener;->" +
                    "onInstallReferrerSetupFinished(I)V\n" +
                    "return-void",
            )

        OkTracerInitializerFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        GoogleDataTransportJobFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        GoogleDataTransportAlarmFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "return-void")

        val altCraftInitializer = AltCraftFlushInitializerFingerprint
            .matchAll(1..1)
            .single()
        // A 2026-10 RuStore build confirmed (via live decompile) that AltCraft's flush
        // initializer no longer holds a WorkManager field at all - the periodic flush is
        // now armed through a plain coroutine call
        // (`AltCraftFlushEventsWorker$Companion.<schedule>(scope, intervalMs)`) instead of
        // `WorkManager.enqueueUniquePeriodicWork`. There is nothing left to cancel after
        // the fact, so short-circuit the initializer itself before it can make that call -
        // a strictly stronger guarantee (never scheduled, vs. scheduled-then-canceled) that
        // also still works on older builds where a WorkManager field happened to exist.
        val altCraftReturnedSingletons =
            altCraftInitializer.method.implementation!!.instructions.returnedSingletonFields()
        if (altCraftReturnedSingletons.size != 1) {
            throw PatchException(
                "Expected one AltCraft initializer result singleton, " +
                    "found ${altCraftReturnedSingletons.size}",
            )
        }
        val altCraftResultSingleton = altCraftReturnedSingletons.single()
        altCraftInitializer.method.addInstructions(
            0,
            """
                sget-object p0, ${altCraftResultSingleton.definingClass}->${altCraftResultSingleton.name}:${altCraftResultSingleton.type}
                return-object p0
            """,
        )
        AltCraftDoWorkFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, returnWorkerSuccess)

        val radarInitializer = RadarInitializerFingerprint
            .matchAll(1..1)
            .single()
        // Same WorkManager-field removal confirmed for Radar's initializer as AltCraft's
        // above - short-circuit before the (now coroutine-based) scheduling call instead.
        val radarReturnedSingletons =
            radarInitializer.method.implementation!!.instructions.returnedSingletonFields()
        if (radarReturnedSingletons.size != 1) {
            throw PatchException(
                "Expected one Radar initializer result singleton, " +
                    "found ${radarReturnedSingletons.size}",
            )
        }
        val radarResultSingleton = radarReturnedSingletons.single()
        radarInitializer.method.addInstructions(
            0,
            """
                sget-object p0, ${radarResultSingleton.definingClass}->${radarResultSingleton.name}:${radarResultSingleton.type}
                return-object p0
            """,
        )
        RadarDoWorkFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, returnWorkerSuccess)

        analyticsCoroutineWorkerFingerprints.forEachIndexed { index, fingerprint ->
            fingerprint
                .matchAll(1..1)
                .singleOrNull()
                ?.method
                ?.addInstructions(0, returnWorkerSuccess)
                ?: throw PatchException(
                    "Analytics coroutine worker changed: " +
                        analyticsCoroutineWorkerClasses[index],
                )
        }
        analyticsWorkerFingerprints.forEachIndexed { index, fingerprint ->
            fingerprint
                .matchAll(1..1)
                .singleOrNull()
                ?.method
                ?.addInstructions(0, returnWorkerSuccess)
                ?: throw PatchException(
                    "Analytics worker changed: ${analyticsWorkerClasses[index]}",
                )
        }

        TracerDiskUsageInitializerFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                "move-object/from16 v0, p1\n" +
                    "invoke-static {v0}, " +
                    "Lub/t0;->l(Landroid/content/Context;)Lub/t0;\n" +
                    "move-result-object v0\n" +
                    "const-string v1, \"tracer.disk.usage.worker\"\n" +
                    "invoke-virtual {v0, v1}, $cancelUniqueDescriptor\n" +
                    "return-void",
            )
        TracerSampleUploadFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "return-void")

        OmicronNetworkRequestFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                "sget-object p0, Lt31/e;->ERROR:Lt31/e;\nreturn-object p0",
            )
        OmicronDefaultScheduleFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                "move-object/from16 v0, p0\n" +
                    "invoke-virtual {v0}, " +
                    "Lru/mail/omicron/DefaultWorkManagerExecutor;->cancel()V\n" +
                    "return-void",
            )
        OmicronMultiAccountScheduleFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                "move-object/from16 v0, p0\n" +
                    "invoke-virtual {v0}, " +
                    "Lru/mail/omicron/MultiAccountWorkManagerExecutor;->cancel()V\n" +
                    "return-void",
            )

        // Install-identifier sync, remote-analytics event upload (one-shot + periodic),
        // and usage-stats collection all moved off WorkManager the same way AltCraft/Radar
        // did above (confirmed via live decompile: none of their classes has a WorkManager
        // field anymore) - short-circuit each initializer/scheduler method directly rather
        // than finding-and-canceling a job that's no longer created through WorkManager.
        InstallIdentifierInitializerFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "sget-object v0, Lut0/e0;->a:Lut0/e0;\nreturn-object v0")

        RemoteAnalyticsSchedulerFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "sget-object v0, Lut0/e0;->a:Lut0/e0;\nreturn-object v0")

        RemoteAnalyticsInitializerFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "sget-object v0, Lut0/e0;->a:Lut0/e0;\nreturn-object v0")

        UsageStatsInitializerFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "sget-object v0, Lut0/e0;->a:Lut0/e0;\nreturn-object v0")

        PublisherTrackingScheduleFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "return-void")
        listOf(
            AnalyticsDispatchFingerprint,
            AnalyticsUserIdFingerprint,
        ).forEach { fingerprint ->
            fingerprint
                .matchAll(1..1)
                .single()
                .method
                .addInstructions(0, "return-void")
        }

        UsageStatsPromptEligibilityFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                "sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\nreturn-object p0",
            )

        val superAppStatSender = SuperAppStatSenderFingerprint
            .matchAll(1..1)
            .single()
        val statClass = superAppStatSender.classDef
        val statMethods = mutableClassDefBy(statClass).methods
        val statStoreMethods = statMethods.filter { method ->
            method.returnType == "V" &&
                method.parameterTypes.size == 5 &&
                method.parameterTypes.take(3).all { it.toString() == "Z" } &&
                method.implementation != null
        }
        if (statStoreMethods.size != 1) {
            throw PatchException(
                "Expected one SuperApp StatLog store method, found ${statStoreMethods.size}",
            )
        }
        val statDispatchMethods = statMethods.filter { method ->
            method.returnType == "V" &&
                method.parameterTypes.map(CharSequence::toString) == listOf(
                    "Z",
                    "Z",
                    "Z",
                    "Lkotlin/jvm/functions/Function0;",
                ) &&
                method.implementation != null
        }
        if (statDispatchMethods.size != 1) {
            throw PatchException(
                "Expected one SuperApp StatLog dispatch method, " +
                    "found ${statDispatchMethods.size}",
            )
        }
        listOf(
            superAppStatSender.method,
            statStoreMethods.single(),
            statDispatchMethods.single(),
        ).forEach { method -> method.addInstructions(0, "return-void") }

        val statEventCommit = SuperAppStatEventCommitFingerprint
            .matchAll(1..1)
            .single()
        val statEventFactories = statEventCommit.classDef.methods.filter { method ->
            method.name != statEventCommit.method.name &&
                method.returnType == statEventCommit.method.returnType &&
                method.parameterTypes.isEmpty() &&
                method.implementation == null
        }
        if (statEventFactories.size != 1) {
            throw PatchException(
                "Expected one SuperApp stat event factory, found ${statEventFactories.size}",
            )
        }
        val statEventFactory = statEventFactories.single()
        statEventCommit.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, ${statEventCommit.classDef.type}->${statEventFactory.name}()${statEventFactory.returnType}
                move-result-object p0
                return-object p0
            """,
        )
        SuperAppStatDaemonScheduleFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "return-void")

        val crashReporterFactory = PushCrashReporterFactoryFingerprint
            .matchAll(1..1)
            .single()
        val crashFactoryInstructions =
            crashReporterFactory.method.implementation!!.instructions.toList()
        val stubLogIndex = crashFactoryInstructions.indexOfFirst { instruction ->
            val reference =
                (instruction as? ReferenceInstruction)?.reference as? StringReference
            reference?.string == "Using stub crash reporter"
        }
        if (stubLogIndex < 0) {
            throw PatchException("VK Push stub crash-reporter branch was not found")
        }
        val stubNewInstance = crashFactoryInstructions
            .withIndex()
            .drop(stubLogIndex + 1)
            .firstOrNull { (_, instruction) ->
                instruction.opcode == Opcode.NEW_INSTANCE &&
                    (instruction as? ReferenceInstruction)?.reference is TypeReference
            }
            ?: throw PatchException("VK Push stub crash-reporter type was not found")
        val stubType =
            ((stubNewInstance.value as ReferenceInstruction).reference as TypeReference).type
        val stubConstructor = crashFactoryInstructions
            .drop(stubNewInstance.index + 1)
            .mapNotNull { instruction ->
                (instruction as? ReferenceInstruction)?.reference as? MethodReference
            }
            .firstOrNull { reference ->
                reference.name == "<init>" && reference.parameterTypes.isEmpty()
            }
            ?: throw PatchException("VK Push stub crash-reporter constructor was not found")
        val stubConstructorDescriptor =
            "${stubConstructor.definingClass}->${stubConstructor.name}()" +
                stubConstructor.returnType
        crashReporterFactory.method.addInstructions(
            0,
            """
                new-instance p0, $stubType
                invoke-direct {p0}, $stubConstructorDescriptor
                return-object p0
            """,
        )

        logger.info(
            "Disabled AltCraft, Radar, MyTracker, SuperApp StatLog, VK Push crash " +
                "reporting, stable device ID, install referrer, OK Tracer, Google Data " +
                "Transport, Omicron, remote analytics, publisher tracking, install " +
                "identifiers, usage collection, ${analyticsCoroutineWorkerClasses.size} " +
                "coroutine workers, ${analyticsWorkerClasses.size} direct workers, and " +
                "the Usage Stats analytics prompt",
        )
    }
}
