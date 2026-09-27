package com.dmoniak.patches.twitch

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TWITCH
import java.util.logging.Logger

@Suppress("unused")
val twitchBackgroundPlaybackPatch = bytecodePatch(
    name = "Background & Audio-Only Playback - Twitch (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks background audio playback and seamless Picture-in-Picture (PiP) mode without stream interruptions on Twitch.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTwitchBackgroundPlaybackLogic(logger)
    }
}

fun BytecodePatchContext.executeTwitchBackgroundPlaybackLogic(logger: Logger) {
    logger.info("Executing Background & Audio-Only Playback patch for Twitch...")
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

            // Allow background playback & audio mode
            if (!isStatic && (
                mName == "isbackgroundplaybackallowed" ||
                mName == "isaudioonlyenabled" ||
                mName == "canplayinbackground" ||
                mName == "ispipsupported" ||
                mName == "shouldkeepaudioalive"
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
                    logger.info("[Twitch Background] Unlocked background playback in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Twitch Background] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Suppress pause on background
            if (!isStatic && (
                mName == "pauseplayeronbackground" ||
                mName == "releaseresourcesonpause" ||
                mName == "stopstreamonhidden"
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
                    logger.info("[Twitch Background] Neutralized pause on background in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Twitch Background] Failed to hook pause method: ${e.message}")
                }
            }
        }
    }

    logger.info("Background & Audio-Only Playback for Twitch executed: $hookedPoints points hooked.")
}
