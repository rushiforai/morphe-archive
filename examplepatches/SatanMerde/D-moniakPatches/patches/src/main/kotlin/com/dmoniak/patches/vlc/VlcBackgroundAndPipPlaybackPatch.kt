package com.dmoniak.patches.vlc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_VLC
import java.util.logging.Logger

@Suppress("unused")
val vlcBackgroundAndPipPlaybackPatch = bytecodePatch(
    name = "Background Playback & Universal PIP - VLC (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Forces background audio playback and automatic Picture-in-Picture (PIP) for all videos and audio streams when switching apps or minimizing VLC.",
) {
    compatibleWith(COMPATIBILITY_VLC)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeVlcBackgroundAndPipPlaybackLogic(logger)
    }
}

fun BytecodePatchContext.executeVlcBackgroundAndPipPlaybackLogic(logger: Logger) {
    logger.info("Executing Background Playback & Universal PIP patch for VLC...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // Hook background playback and PIP permission flags
            if (!isStatic && (
                mName == "isbackgroundplaybackallowed" ||
                mName == "canplayinbackground" ||
                mName == "shouldplayinbackground" ||
                mName == "isbackgroundaudioenabled" ||
                mName == "shouldautopiponminimize" ||
                mName == "ispipsupported" ||
                mName == "canenterpipmode" ||
                mName == "shouldenterpiponpause"
            ) && retType == "Z" && method.parameterTypes.isEmpty()) {
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
                    logger.fine("[VLC Background/PIP] Force-enabled playback capability: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[VLC Background/PIP] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[VLC Background/PIP] Total background/PIP hooks applied: $hookedPoints")
}
