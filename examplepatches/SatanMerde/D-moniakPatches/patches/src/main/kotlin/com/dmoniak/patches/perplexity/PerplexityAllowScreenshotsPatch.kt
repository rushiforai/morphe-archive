package com.dmoniak.patches.perplexity

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PERPLEXITY
import java.util.logging.Logger

@Suppress("unused")
val perplexityAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots & Block Telemetry - Perplexity (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Removes FLAG_SECURE window protections and disables background analytics/telemetry tracking calls (Adjust, Datadog, Mixpanel) in Perplexity.",
) {
    compatibleWith(COMPATIBILITY_PERPLEXITY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePerplexityAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executePerplexityAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots & Block Telemetry patch for Perplexity...")
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

            // Neutralize FLAG_SECURE
            if (!isStatic && (
                mName == "setflagsecure" ||
                mName == "enforcesecurescreen" ||
                mName == "disablescreenshots" ||
                mName == "protectwindowfromcapture"
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
                    logger.info("[Perplexity Screenshots] Neutralized FLAG_SECURE in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Perplexity Screenshots] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Block telemetry and analytics dispatch methods
            if (!isStatic && (
                mName == "trackanalyticsevent" ||
                mName == "sendtelemetrydata" ||
                mName == "dispatchusermetrics" ||
                mName == "loguseraction"
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
                    logger.info("[Perplexity Telemetry] Neutralized telemetry dispatch in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Perplexity Telemetry] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Perplexity Screenshots & Telemetry] Total hooks applied: $hookedPoints")
}
