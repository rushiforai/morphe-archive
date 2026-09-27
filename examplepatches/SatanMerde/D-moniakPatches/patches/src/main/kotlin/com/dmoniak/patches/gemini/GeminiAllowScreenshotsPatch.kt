package com.dmoniak.patches.gemini

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GEMINI
import java.util.logging.Logger

@Suppress("unused")
val geminiAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots & UI Tweaks - Google Gemini (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Removes FLAG_SECURE window flags in Google Gemini to allow capturing chat responses and enhances privacy in floating assistant overlays.",
) {
    compatibleWith(COMPATIBILITY_GEMINI)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGeminiAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executeGeminiAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots patch for Google Gemini...")
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

            // Neutralize FLAG_SECURE window protections
            if (!isStatic && (
                mName == "setflagsecure" ||
                mName == "enforcesecureoverlay" ||
                mName == "disablescreenshots" ||
                mName == "blockoverlaycapture"
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
                    logger.info("[Gemini Screenshots] Neutralized FLAG_SECURE in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Gemini Screenshots] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Gemini Screenshots] Total hooks applied: $hookedPoints")
}
