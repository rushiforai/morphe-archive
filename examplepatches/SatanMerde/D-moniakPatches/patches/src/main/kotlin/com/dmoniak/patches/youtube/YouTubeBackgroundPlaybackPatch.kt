package com.dmoniak.patches.youtube

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

@Suppress("unused")
val youtubeBackgroundPlaybackPatch = bytecodePatch(
    name = "Background & PiP Playback - YouTube (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Enables background audio playback when the screen is locked or switching between apps, and unlocks Picture-in-Picture (PiP) mode without YouTube Premium.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeYouTubeBackgroundPlaybackLogic(logger)
    }
}

fun BytecodePatchContext.executeYouTubeBackgroundPlaybackLogic(logger: Logger) {
    logger.info("Executing Background & PiP Playback patch for YouTube...")
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

            // Force background audio / PiP eligibility getters to true
            if (!isStatic && (
                mName == "canplayinbackground" ||
                mName == "isbackgroundplaybackallowed" ||
                mName == "isbackgroundaudioenabled" ||
                mName == "ispipallowed" ||
                mName == "ispipeligible" ||
                mName == "isbackgroundtransitionallowed"
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
                    logger.info("[YouTube Background] Unlocked playback permission in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[YouTube Background] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[YouTube Background] Finished: $hookedPoints background playback hooks injected.")
}
