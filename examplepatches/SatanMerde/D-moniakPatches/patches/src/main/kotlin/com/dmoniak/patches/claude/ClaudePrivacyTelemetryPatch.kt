package com.dmoniak.patches.claude

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CLAUDE
import java.util.logging.Logger

@Suppress("unused")
val claudePrivacyTelemetryPatch = bytecodePatch(
    name = "Disable Telemetry & Tracking - Claude AI (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Disables client-side analytical telemetry, performance metrics reporting, and tracker SDK calls in Claude AI.",
) {
    compatibleWith(COMPATIBILITY_CLAUDE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeClaudePrivacyTelemetryLogic(logger)
    }
}

fun BytecodePatchContext.executeClaudePrivacyTelemetryLogic(logger: Logger) {
    logger.info("Executing Disable Telemetry patch for Claude AI...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // Disable telemetry enabled checks
            if (!isStatic && (
                mName == "istelemetryenabled" ||
                mName == "isanalyticstrackingenabled" ||
                mName == "cancollectmetrics" ||
                mName == "shouldtrackevent"
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
                    logger.info("[Claude Privacy] Disabled tracking flag in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Claude Privacy] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Neutralize analytics reporting calls
            if (!isStatic && (
                mName == "logevent" ||
                mName == "trackevent" ||
                mName == "sendtelemetry" ||
                mName == "recordmetric"
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
                    logger.info("[Claude Privacy] Neutralized telemetry dispatch in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Claude Privacy] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Claude Privacy] Total telemetry hooks applied: $hookedPoints")
}
