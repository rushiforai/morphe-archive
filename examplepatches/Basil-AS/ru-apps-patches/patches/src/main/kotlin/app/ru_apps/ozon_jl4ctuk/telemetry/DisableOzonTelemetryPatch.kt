// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/ozon/telemetry/DisableOzonTelemetryPatch.kt.
package app.ru_apps.ozon_jl4ctuk.telemetry

import app.shared.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.privacy.patches.analytics.jl4ctuk.disableAnalyticsDependency
import app.ru_apps.ozon_jl4ctuk.shared.Constants.COMPATIBILITY_OZON_CURRENT
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Element
import java.util.logging.Logger

private const val NON_FATAL_LOGGER_CLASS =
    "Lru/ozon/app/android/logger/nonfatal/NonFatalLogger;"

private val logger = Logger.getLogger("DisableOzonTelemetry")

private data class MethodSignature(
    val name: String,
    val parameters: List<String>,
)

private val nonFatalLoggerNoOpSignatures = setOf(
    MethodSignature(
        "log",
        listOf("I", "Ljava/lang/String;", "Ljava/lang/String;"),
    ),
    MethodSignature(
        "logEvent",
        listOf(
            "Ljava/lang/String;",
            "Ljava/util/Map;",
            "Ljava/lang/String;",
            "I",
        ),
    ),
    MethodSignature("logException", listOf("Ljava/lang/Throwable;")),
    MethodSignature(
        "setTag",
        listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    ),
    MethodSignature("setUserId", listOf("Ljava/lang/String;")),
    MethodSignature(
        "putKey",
        listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    ),
)

private val returnWorkerSuccess = """
    new-instance v0, Landroidx/work/n${'$'}a${'$'}c;
    invoke-direct {v0}, Landroidx/work/n${'$'}a${'$'}c;-><init>()V
    return-object v0
""".trimIndent()

private val returnVkIdNoOpTracker = """
    sget-object v0, Lcom/vk/id/analytics/VKIDAnalytics;->Trackers:Lcom/vk/id/analytics/VKIDAnalytics${'$'}Trackers;
    return-object v0
""".trimIndent()

private val disableOzonTelemetryManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_OZON_CURRENT)

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.documentElement
                .childrenNamed("application")
                .single() as Element

            mapOf(
                "firebase_analytics_collection_enabled" to "false",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_performance_collection_enabled" to "false",
                "firebase_performance_logcat_enabled" to "false",
                "google_analytics_adid_collection_enabled" to "false",
                "google_analytics_deferred_deep_link_enabled" to "false",
                "google_analytics_automatic_screen_reporting_enabled" to "false",
                "google_analytics_default_allow_ad_personalization_signals" to "false",
                "io.sentry.auto-init" to "false",
                "io.sentry.enabled" to "false",
                "io.sentry.dsn" to "",
            ).forEach { (name, value) ->
                application.setApplicationMetaData(name, value)
            }

            val appsFlyerComponents =
                application.disableComponentsByPrefix("com.appsflyer.")
            val googleAnalyticsComponents = application.disableComponentsByPrefix(
                "com.google.android.gms.analytics.",
                "com.google.android.gms.tagmanager.",
                "com.google.android.gms.measurement.",
            )
            val sentryComponents =
                application.disableComponentsByPrefix("io.sentry.")
            val ruStoreMetricsComponents =
                application.disableComponentsByPrefix("ru.rustore.sdk.metrics.")

            logger.info(
                "Manifest: disabled $appsFlyerComponents AppsFlyer, " +
                    "$googleAnalyticsComponents Google Analytics, " +
                    "$sentryComponents Sentry, and " +
                    "$ruStoreMetricsComponents RuStore Metrics components",
            )
        }
    }
}

private fun MutableMethod.disable() {
    addInstructions(0, "return-void")
}

private fun MutableMethod.disableVkIdTracerInitialization() {
    val instructions = implementation!!.instructions
    val tracerFieldTypes = instructions.mapNotNull { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? FieldReference)
            ?.takeIf { field ->
                field.definingClass == definingClass && field.name == "tracer"
            }
            ?.type
    }.distinct()
    if (tracerFieldTypes.size != 1) {
        throw PatchException(
            "Expected one VK ID Tracer field type, found ${tracerFieldTypes.size}",
        )
    }

    val tracerType = tracerFieldTypes.single()
    val tracerConstructions = instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.NEW_INSTANCE &&
            ((instruction as? ReferenceInstruction)?.reference as? TypeReference)
                ?.type == tracerType
    }
    if (tracerConstructions.size != 1) {
        throw PatchException(
            "Expected one VK ID Tracer construction, found ${tracerConstructions.size}",
        )
    }

    val (constructionIndex, constructionInstruction) =
        tracerConstructions.single()
    val register = (constructionInstruction as OneRegisterInstruction).registerA
    replaceInstruction(
        constructionIndex,
        "new-instance v$register, Ljava/lang/IllegalStateException;",
    )
    addInstructions(
        constructionIndex + 1,
        """
            invoke-direct {v$register}, Ljava/lang/IllegalStateException;-><init>()V
            throw v$register
        """.trimIndent(),
    )
}

@Suppress("unused")
val disableOzonTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description =
        "Disables Ozon analytics, attribution, crash reporting, and telemetry uploads.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_OZON_CURRENT)

    dependsOn(disableOzonTelemetryManifestPatch)
    dependsOn(disableAnalyticsDependency)

    execute {
        OzonTrackerEnabledFingerprint.method.addInstructions(
            0,
            "const/4 v0, 0x0\nreturn v0",
        )
        OzonTrackerWorkerFingerprint.method.addInstructions(0, returnWorkerSuccess)

        AppsFlyerInitializerFingerprint.method.disable()
        CrashReporterInitializerFingerprint.method.disable()
        SentryPostInitializerFingerprint.method.disable()
        OzonLoggerInitializerFingerprint.method.disable()

        val uploaderClass = OzonLoggerUploaderConstructorFingerprint.classDef
        val uploaderMethods = uploaderClass.methods.filter { method ->
            method.returnType == "V" &&
                method.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/util/List;") &&
                method.implementation != null
        }
        if (uploaderMethods.size != 1) {
            throw PatchException(
                "Expected one Ozon Logger upload method, found ${uploaderMethods.size}",
            )
        }
        uploaderMethods.single().disable()

        val nonFatalLoggerClass = mutableClassDefBy(NON_FATAL_LOGGER_CLASS)
        val nonFatalLoggerMethods = nonFatalLoggerClass.methods.filter { method ->
            MethodSignature(
                method.name,
                method.parameterTypes.map(CharSequence::toString),
            ) in nonFatalLoggerNoOpSignatures &&
                method.returnType == "V" &&
                method.implementation != null
        }
        val foundNonFatalSignatures = nonFatalLoggerMethods.mapTo(mutableSetOf()) { method ->
            MethodSignature(
                method.name,
                method.parameterTypes.map(CharSequence::toString),
            )
        }
        val missingNonFatalSignatures =
            nonFatalLoggerNoOpSignatures - foundNonFatalSignatures
        if (foundNonFatalSignatures.isEmpty()) {
            throw PatchException(
                "Missing all ${nonFatalLoggerNoOpSignatures.size} NonFatalLogger methods",
            )
        }
        if (missingNonFatalSignatures.isNotEmpty()) {
            // A signature going missing while its siblings keep their original (un-obfuscated)
            // names, as confirmed live against Ozon 19.38.0, means Ozon dropped that method from
            // NonFatalLogger/OzonLogger entirely (no more call sites anywhere) rather than R8
            // renaming it — there is nothing left to disable for it. Requiring every signature to
            // still exist made this patch fail outright on apps that simply shrank their logger
            // API surface, even though every method that DOES still exist gets disabled below.
            logger.warning(
                "NonFatalLogger no longer declares: " +
                    missingNonFatalSignatures.joinToString { "${it.name}(${it.parameters})" },
            )
        }
        nonFatalLoggerMethods.forEach(MutableMethod::disable)

        // FintechGraylogEnqueueFingerprint (matched by exact parameter-list shape) used to target
        // the ru.ozon.fintech.analytic.models.GraylogData data class constructor here, but that
        // class gains/loses fields across Ozon releases, making an exact-arity match brittle (it
        // broke after a field was added — confirmed via live decompile of a 2026-10 build).
        // Disabling a data class constructor is also unsafe in general: unlike a regular method,
        // short-circuiting it to return early skips the superclass constructor call and leaves
        // final fields uninitialized, which can fail bytecode verification or hand back a
        // corrupt instance to whatever reads its fields next.
        // It is also unnecessary: live decompile confirms GraylogData's constructor has exactly
        // one call site (an inner lambda, compiled from GraylogSendWorker's own suspend body),
        // reached only by executing GraylogSendWorker's coroutine logic end-to-end (reading
        // pending entries from the local queue, building GraylogData per entry, then uploading).
        // FintechGraylogWorkerFingerprint below patches that coroutine's real entry point to
        // return success immediately, so this entire call chain — including the GraylogData
        // construction — never executes; there is nothing left for a second patch step to add.
        FintechGraylogWorkerFingerprint.method.addInstructions(0, returnWorkerSuccess)

        VkIdAnalyticsAddTrackerFingerprint.method.disable()
        VkIdAnalyticsTrackEventFingerprint.method.disable()
        VkIdStatTrackerProviderFingerprint.method.addInstructions(
            0,
            returnVkIdNoOpTracker,
        )
        VkIdTrackingTrackerProviderFingerprint.method.addInstructions(
            0,
            returnVkIdNoOpTracker,
        )
        VkIdTrackingDepsConstructorFingerprint.method
            .disableVkIdTracerInitialization()

        logger.info(
            "Disabled Ozon Tracker, Ozon Logger, AppsFlyer, Firebase Analytics, " +
                "Sentry, RuStore Metrics, Fintech Graylog, and VK ID telemetry",
        )
    }
}
