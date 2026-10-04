package com.dmoniak.patches.youtube

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

@Suppress("unused")
val youtubeReturnDislikePatch = bytecodePatch(
    name = "Return YouTube Dislike - YouTube (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Restores public dislike counts and like/dislike ratio bars on YouTube videos and Shorts using the official Return YouTube Dislike (RYD) API.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeYouTubeReturnDislikeLogic(logger)
    }
}

fun BytecodePatchContext.executeYouTubeReturnDislikeLogic(logger: Logger) {
    logger.info("Executing dedicated Return YouTube Dislike patch for YouTube...")
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

            // 1. Force dislike counter display visibility
            if (!isStatic && (
                mName == "shouldshowdislikecount" ||
                mName == "isdislikecountervisible" ||
                mName == "isdislikebuttonvisible" ||
                mName == "shouldrenderdisliketext" ||
                mName == "isdislikeratiovisible"
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
                    logger.info("[YouTube RYD] Enabled dislike counter visibility in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[YouTube RYD] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[YouTube RYD] Finished: $hookedPoints Return YouTube Dislike hooks injected.")
}
