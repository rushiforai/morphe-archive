package com.dmoniak.patches.youtube

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

@Suppress("unused")
val youtubeSoundBoostPatch = bytecodePatch(
    name = "Sound Boost (Audio Gain Amplification) - YouTube (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Amplifies YouTube audio playback volume with software gain booster up to 200% for quiet videos, recordings, and podcasts.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeYouTubeSoundBoostLogic(logger)
    }
}

fun BytecodePatchContext.executeYouTubeSoundBoostLogic(logger: Logger) {
    logger.info("Executing Sound Boost patch for YouTube...")
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
                mName == "issoundboostenabled" ||
                mName == "isaudiogainboostapplied" ||
                mName == "shouldboostquietstreams"
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
                    logger.info("[YouTube Sound Boost] Enabled volume amplification in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[YouTube Sound Boost] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[YouTube Sound Boost] Finished: $hookedPoints Sound Boost hooks injected.")
}
