package com.dmoniak.patches.deepl

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_DEEPL
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val deepLPrivacyTelemetryPatch = bytecodePatch(
    name = "Disable Analytics and Telemetry - DeepL (Experimental)",
    description = "Suppresses DAP (Data Analytics Pipeline), Statsig experimentation client, Sentry crash reporting, and usage tracking in DeepL to reduce data sent to DeepL servers.",
) {
    compatibleWith(COMPATIBILITY_DEEPL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeDeepLPrivacyTelemetryLogic(logger)
    }
}

fun BytecodePatchContext.executeDeepLPrivacyTelemetryLogic(logger: Logger) {
    logger.info("Executing Disable Analytics and Telemetry patch for DeepL...")
    var hookedPoints = 0

    // Key DEX evidence:
    //   - Lcom/deepl/mobiletranslator/analytics/provider/StatsigClientProvider; (16x in DEX)
    //   - Lcom/deepl/mobiletranslator/analytics/proto/ExperimentationSettings;
    //   - Lcom/deepl/mobiletranslator/analytics/model/proto/StatisticsSettings;
    //   - DAP proto classes: ClickhouseTableSettings, EventAdditionalData, etc.
    //   - Sentry: SentryInitProvider, SentryPerformanceProvider in manifest

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (!tl.contains("androidx") && !tl.contains("android/support") && !tl.contains("com/google")) {

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val params = method.parameterTypes

            // 1. Analytics / telemetry enabled checks -> false
            if (!isStatic && retType == "Z" && params.isEmpty() && (
                mName == "isanalyticsenabled" ||
                mName == "istelemetryenabled" ||
                mName == "isstatisticsenabled" ||
                mName == "issentrienabled" ||
                mName == "issentryenabled" ||
                mName == "isdaptrackingactive" ||
                mName == "isexperimentationenabled" ||
                mName == "isstatsigenabled"
            )) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 3,
                        smaliCode = """
                            const/4 v0, 0x0
                            return v0
                        """.trimIndent(),
                    )
                    hookedPoints++
                    logger.info("[DeepL Privacy] Disabled analytics flag -> false: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[DeepL Privacy] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Analytics event dispatch methods -> no-op
            if (!isStatic && retType == "V" && (
                mName == "logevent" ||
                mName == "trackevent" ||
                mName == "sendevent" ||
                mName == "recordevent" ||
                mName == "loganalyticsevent" ||
                mName == "sendtelemetry" ||
                mName == "recordstatistic" ||
                mName == "trackdaprow" ||
                mName == "logdap" ||
                mName == "logcrash" ||
                mName == "captureexception" ||
                mName == "captureexceptionwithmessage"
            )) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 2,
                        smaliCode = "return-void",
                    )
                    hookedPoints++
                    logger.info("[DeepL Privacy] No-op analytics dispatch: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[DeepL Privacy] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
        }
    }

    logger.info("[DeepL Privacy] Total analytics/telemetry hooks applied: $hookedPoints")
}
