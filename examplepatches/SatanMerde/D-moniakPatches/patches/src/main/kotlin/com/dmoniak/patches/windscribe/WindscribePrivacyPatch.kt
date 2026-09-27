package com.dmoniak.patches.windscribe

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_WINDSCRIBE
import java.util.logging.Logger

@Suppress("unused")
val windscribePrivacyPatch = bytecodePatch(
    name = "Enhanced Privacy & Telemetry Blocker - Windscribe (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Neutralizes background diagnostic reporting, error analytics, and tracking telemetry endpoints for maximum anonymity.",
) {
    compatibleWith(COMPATIBILITY_WINDSCRIBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeWindscribePrivacyLogic(logger)
    }
}

fun BytecodePatchContext.executeWindscribePrivacyLogic(logger: Logger) {
    logger.info("Executing Enhanced Privacy patch for Windscribe...")
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

            // Force telemetry / tracking flags to false
            if (!isStatic && (
                mName == "istrackingallowed" ||
                mName == "isdiagnosticsenabled" ||
                mName == "isanalyticstrackingenabled" ||
                mName == "canreportcrash"
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
                    logger.info("[Windscribe Privacy] Disabled analytics in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Windscribe Privacy] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Neutralize event loggers
            if (isTelemetryClass && !isStatic && (
                mName == "logevent" ||
                mName == "recordexception" ||
                mName == "trackevent"
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
                    logger.info("[Windscribe Privacy] Neutralized logging in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Windscribe Privacy] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Windscribe Privacy] Total privacy hooks applied: $hookedPoints")
}
