package com.dmoniak.patches.firefox

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FIREFOX
import java.util.logging.Logger

@Suppress("unused")
val firefoxDisableTelemetryPocketPatch = bytecodePatch(
    name = "Disable Telemetry & Pocket Stories - Firefox (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Completely disables Mozilla telemetry, Glean analytics, sponsored Pocket stories, and sponsored search shortcuts on Firefox mobile.",
) {
    compatibleWith(COMPATIBILITY_FIREFOX)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeFirefoxDisableTelemetryPocketLogic(logger)
    }
}

fun BytecodePatchContext.executeFirefoxDisableTelemetryPocketLogic(logger: Logger) {
    logger.info("Executing Disable Telemetry & Pocket Stories patch for Firefox...")
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

            // Disable Pocket recommendations & sponsored shortcuts
            if (!isStatic && (
                mName == "ispocketstoriesenabled" ||
                mName == "shouldshowpocket" ||
                mName == "issponsoredshortenabled" ||
                mName == "shouldshowsponsoredtiles" ||
                mName == "istelemetryenabled" ||
                mName == "isgleancollectionenabled"
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
                    logger.info("[Firefox Privacy] Disabled telemetry/pocket flag in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Firefox Privacy] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Suppress Glean / Telemetry upload calls
            if (!isStatic && (
                mName == "sendtelemetryping" ||
                mName == "uploadgleanmetrics" ||
                mName == "recordeventtelemetry"
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
                    logger.info("[Firefox Privacy] Neutralized ping sender in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Firefox Privacy] Failed to hook ping sender: ${e.message}")
                }
            }
        }
    }

    logger.info("Disable Telemetry & Pocket Stories for Firefox executed: $hookedPoints points hooked.")
}
