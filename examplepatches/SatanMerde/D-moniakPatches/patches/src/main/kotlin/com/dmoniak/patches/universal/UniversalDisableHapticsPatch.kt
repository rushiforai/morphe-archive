package com.dmoniak.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import java.util.logging.Logger

@Suppress("unused")
val universalDisableHapticsPatch = bytecodePatch(
    name = "Universal Disable Haptics & Vibration (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Silences haptic motor vibrations across any app, eliminating unnecessary vibration buzzes and conserving battery power.",
) {
    // Universal patch: No compatibleWith() call. Applies to any app.

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeUniversalDisableHapticsLogic(logger)
    }
}

fun BytecodePatchContext.executeUniversalDisableHapticsLogic(logger: Logger) {
    logger.info("Executing Universal Disable Haptics & Vibration patch...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/view/") || tl.startsWith("landroid/os/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Hook custom vibration triggers returning void (make them no-op)
            if (!isStatic && (
                mName == "vibrate" ||
                mName == "performhapticfeedback" ||
                mName == "triggerhaptic" ||
                mName == "playvibrationeffect" ||
                mName == "pulsevibrator"
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
                    logger.info("[Universal Haptics] Silenced vibration trigger in ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Universal Haptics] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Disable vibration preference / enabled checks
            if (!isStatic && (
                mName == "ishapticfeedbackenabled" ||
                mName == "isvibrationenabled" ||
                mName == "shouldvibrate" ||
                mName == "canvibrate"
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
                    logger.info("[Universal Haptics] Disabled haptic flag in ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Universal Haptics] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Universal Haptics] Total haptic silencing hooks applied: $hookedPoints")
}
