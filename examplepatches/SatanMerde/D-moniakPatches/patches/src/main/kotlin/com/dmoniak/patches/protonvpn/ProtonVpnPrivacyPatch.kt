package com.dmoniak.patches.protonvpn

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PROTON_VPN
import java.util.logging.Logger

@Suppress("unused")
val protonVpnPrivacyPatch = bytecodePatch(
    name = "Enhanced Privacy & Telemetry Blocker - Proton VPN (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Blocks diagnostic telemetry, analytical event reporting (Firebase, Sentry, Mixpanel, Matomo), and crashlytics logging for zero metadata leakage.",
) {
    compatibleWith(COMPATIBILITY_PROTON_VPN)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeProtonVpnPrivacyLogic(logger)
    }
}

fun BytecodePatchContext.executeProtonVpnPrivacyLogic(logger: Logger) {
    logger.info("Executing Enhanced Privacy patch for Proton VPN...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        val isTelemetryClass = tl.contains("telemetry") || tl.contains("analytics") || tl.contains("sentry") || tl.contains("crashlytics")

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Force isTelemetryEnabled / isAnalyticsEnabled to false
            if (!isStatic && (
                mName == "istelemetryenabled" ||
                mName == "iscrashreportingactive" ||
                mName == "isanalyticsenabled" ||
                mName == "cansenddiagnostics"
            ) && retType == "Z") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Proton Privacy] Disabled telemetry flag in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Proton Privacy] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Neutralize event loggers and dispatchers
            if (isTelemetryClass && !isStatic && (
                mName == "logevent" ||
                mName == "sendtelemetry" ||
                mName == "track" ||
                mName == "captureexception"
            ) && retType == "V") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        return-void
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Proton Privacy] Silenced telemetry dispatch in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Proton Privacy] Failed to silence ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Proton Privacy] Total privacy hooks applied: $hookedPoints")
}
