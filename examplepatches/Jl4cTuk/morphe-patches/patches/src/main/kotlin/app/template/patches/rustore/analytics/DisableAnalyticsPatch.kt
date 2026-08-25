package app.template.patches.rustore.analytics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.all.analytics.childrenNamed
import app.template.patches.all.analytics.disableAnalyticsDependency
import app.template.patches.all.analytics.disableComponentsByPrefix
import app.template.patches.all.analytics.disableComponentsWhere
import app.template.patches.rustore.shared.Constants.COMPATIBILITY_RUSTORE
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

            val altCraftDisabled = application.disableComponentsWhere { name ->
                name.startsWith("ru.vk.store.lib.analytics.")
            }
            logger.info("AltCraft: disabled $altCraftDisabled components")

            val metricsDisabled =
                application.disableComponentsByPrefix("ru.rustore.sdk.metrics.")
            logger.info("RuStore Metrics: disabled $metricsDisabled components")
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

        val altCraftInitializer = AltCraftFlushInitializerFingerprint
            .matchAll(1..1)
            .single()
        val altCraftWorkManagerFields = altCraftInitializer.classDef.fields
            .filter { it.type == workManagerType }
        if (altCraftWorkManagerFields.size != 1) {
            throw PatchException(
                "Expected one AltCraft WorkManager field, " +
                    "found ${altCraftWorkManagerFields.size}",
            )
        }
        val altCraftWorkManagerField = altCraftWorkManagerFields.single()
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
                iget-object p0, p0, ${altCraftInitializer.classDef.type}->${altCraftWorkManagerField.name}:$workManagerType
                const-string p1, "AltCraftFlushEventsWorker"
                invoke-virtual {p0, p1}, $cancelUniqueDescriptor
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
        val radarWorkManagerFields = radarInitializer.classDef.fields
            .filter { it.type == workManagerType }
        if (radarWorkManagerFields.size != 1) {
            throw PatchException(
                "Expected one Radar WorkManager field, found ${radarWorkManagerFields.size}",
            )
        }
        val radarWorkManagerField = radarWorkManagerFields.single()
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
                iget-object p0, p0, ${radarInitializer.classDef.type}->${radarWorkManagerField.name}:$workManagerType
                const-string p1, "RadarFlushSnapshotsWorker"
                invoke-virtual {p0, p1}, $cancelUniqueDescriptor
                sget-object p0, ${radarResultSingleton.definingClass}->${radarResultSingleton.name}:${radarResultSingleton.type}
                return-object p0
            """,
        )
        RadarDoWorkFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, returnWorkerSuccess)

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
                "reporting, and the Usage Stats analytics prompt",
        )
    }
}
