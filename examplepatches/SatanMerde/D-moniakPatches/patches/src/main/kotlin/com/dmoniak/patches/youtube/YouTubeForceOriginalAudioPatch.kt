package com.dmoniak.patches.youtube

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

@Suppress("unused")
val youtubeForceOriginalAudioPatch = bytecodePatch(
    name = "Force Original Audio Language (Bypass Auto-Dubbing) - YouTube (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Forces YouTube to automatically play the creator's original authentic audio track, bypassing unwanted AI/human auto-dubbed voiceovers and language translations.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeYouTubeForceOriginalAudioLogic(logger)
    }
}

fun BytecodePatchContext.executeYouTubeForceOriginalAudioLogic(logger: Logger) {
    logger.info("Executing Force Original Audio patch for YouTube...")
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

            if (!isStatic && (
                mName == "shouldpreferoriginalaudio" ||
                mName == "isautodubbingdisabled" ||
                mName == "shouldbypassvoiceovertranslation"
            ) && retType == "Z") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[YouTube Original Audio] Enabled original audio preference in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[YouTube Original Audio] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[YouTube Original Audio] Finished: $hookedPoints Original Audio hooks injected.")
}
