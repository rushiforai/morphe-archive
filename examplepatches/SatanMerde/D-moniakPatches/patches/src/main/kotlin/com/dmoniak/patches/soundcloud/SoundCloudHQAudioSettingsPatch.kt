package com.dmoniak.patches.soundcloud

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SOUNDCLOUD
import java.util.logging.Logger

@Suppress("unused")
val soundCloudHQAudioSettingsPatch = bytecodePatch(
    name = "Unlock HQ Audio & Premium Controls - SoundCloud (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks High Quality (HQ) audio streaming selector in playback settings, enables variable playback speed, and unlocks premium player controls.",
) {
    compatibleWith(COMPATIBILITY_SOUNDCLOUD)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSoundCloudHQAudioLogic(logger)
    }
}

fun BytecodePatchContext.executeSoundCloudHQAudioLogic(logger: Logger) {
    logger.info("Executing Unlock HQ Audio & Premium Controls patch for SoundCloud...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. High Quality audio toggle and player speed capabilities
            if (!isStatic && (
                mName == "ishqaudioavailable" ||
                mName == "canstreamhqaudio" ||
                mName == "ishighqualitystreamingallowed" ||
                mName == "isplaybackspeedcontrolenabled" ||
                mName == "hasgoplusentitlement" ||
                mName == "ispremiumplayingenabled"
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
                    logger.info("[SoundCloud HQ] Unlocked HQ/Premium player flag: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[SoundCloud HQ] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[SoundCloud HQ] Total HQ/Premium player hooks applied: $hookedPoints")
}
