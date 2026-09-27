package com.dmoniak.patches.gemini

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GEMINI
import java.util.logging.Logger

@Suppress("unused")
val geminiDisableHapticsPatch = bytecodePatch(
    name = "Disable Response Haptics - Google Gemini (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Silences excessive continuous vibration buzzing during token streaming and AI response generation in Google Gemini.",
) {
    compatibleWith(COMPATIBILITY_GEMINI)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGeminiDisableHapticsLogic(logger)
    }
}

fun BytecodePatchContext.executeGeminiDisableHapticsLogic(logger: Logger) {
    logger.info("Executing Disable Response Haptics patch for Google Gemini...")
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

            // Silence response streaming haptic buzzes
            if (!isStatic && (
                mName == "ishapticfeedbackenabled" ||
                mName == "shouldvibrateontokenstream" ||
                mName == "isstreamingvibrationallowed" ||
                mName == "canvibrateonresponse"
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
                    logger.info("[Gemini Haptics] Silenced streaming haptics in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Gemini Haptics] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Gemini Disable Haptics] Total hooks applied: $hookedPoints")
}
