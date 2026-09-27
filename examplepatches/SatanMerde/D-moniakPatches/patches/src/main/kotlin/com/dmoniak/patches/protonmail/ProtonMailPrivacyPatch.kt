package com.dmoniak.patches.protonmail

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PROTON_MAIL
import java.util.logging.Logger

@Suppress("unused")
val protonMailPrivacyPatch = bytecodePatch(
    name = "Enhanced Privacy & Tracker Blocker - Proton Mail (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Neutralizes email tracking pixels, blocks diagnostic event reporting (Sentry, Firebase), and stops background usage telemetry in Proton Mail.",
) {
    compatibleWith(COMPATIBILITY_PROTON_MAIL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeProtonMailPrivacyLogic(logger)
    }
}

fun BytecodePatchContext.executeProtonMailPrivacyLogic(logger: Logger) {
    logger.info("Executing Enhanced Privacy patch for Proton Mail...")
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

            // 1. Force isTelemetryEnabled / isTrackingAllowed to false
            if (!isStatic && (
                mName == "istelemetryenabled" ||
                mName == "iscrashreportingallowed" ||
                mName == "isanalyticsenabled"
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
                    logger.info("[Proton Mail Privacy] Disabled telemetry flag in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Proton Mail Privacy] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Neutralize email tracking pixel / telemetry calls
            if (isTelemetryClass && !isStatic && (
                mName == "logevent" ||
                mName == "sendtelemetry" ||
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
                    logger.info("[Proton Mail Privacy] Silenced telemetry dispatch in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Proton Mail Privacy] Failed to silence ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Proton Mail Privacy] Total privacy hooks applied: $hookedPoints")
}
