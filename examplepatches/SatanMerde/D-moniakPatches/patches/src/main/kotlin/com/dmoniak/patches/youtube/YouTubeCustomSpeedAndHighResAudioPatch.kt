package com.dmoniak.patches.youtube

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

@Suppress("unused")
val youtubeCustomSpeedAndHighResAudioPatch = bytecodePatch(
    name = "Custom Playback Speed & High-Res Audio - YouTube (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks speed slider up to 3.0x/5.0x and forces highest audio bitrate (Opus 160kbps / 256kbps) and default highest video resolution (1080p/1440p/4K) on Wi-Fi and Cellular.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeYouTubeSpeedAudioLogic(logger)
    }
}

fun BytecodePatchContext.executeYouTubeSpeedAudioLogic(logger: Logger) {
    logger.info("Executing Custom Playback Speed & High-Res Audio patch for YouTube...")
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

            // Hook max playback speed limit
            if (!isStatic && (
                mName == "getmaxplaybackspeed" ||
                mName == "getmaximumspeedallowed"
            ) && retType == "F") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/high16 v0, 0x40a00000
                        return v0
                        """.trimIndent() // 5.0f
                    )
                    hookedPoints++
                    logger.info("[YouTube Speed] Unlocked max playback speed to 5.0x in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[YouTube Speed] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Force high resolution video and audio quality preferences
            if (!isStatic && (
                mName == "shouldpreferhighestquality" ||
                mName == "isforcedhighestresolutionenabled" ||
                mName == "shouldforceopusaudio"
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
                    logger.info("[YouTube Audio/Video] Forced highest quality toggle in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[YouTube Audio/Video] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[YouTube Speed/Audio] Finished: $hookedPoints speed and audio quality hooks injected.")
}
