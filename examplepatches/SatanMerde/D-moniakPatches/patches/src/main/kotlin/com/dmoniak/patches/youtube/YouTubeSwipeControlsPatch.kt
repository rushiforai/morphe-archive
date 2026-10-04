package com.dmoniak.patches.youtube

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

@Suppress("unused")
val youtubeSwipeControlsPatch = bytecodePatch(
    name = "Swipe Controls - YouTube (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Enables intuitive vertical swipe gestures during fullscreen video playback to adjust volume (right side) and brightness (left side).",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeYouTubeSwipeControlsLogic(logger)
    }
}

fun BytecodePatchContext.executeYouTubeSwipeControlsLogic(logger: Logger) {
    logger.info("Executing dedicated Swipe Controls patch for YouTube...")
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
                mName == "isswipevolumeenabled" ||
                mName == "isswipebrightnessenabled" ||
                mName == "shouldhandleswipecontrols" ||
                mName == "isswipegesturerecognized"
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
                    logger.info("[YouTube Swipe] Enabled swipe control feature in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[YouTube Swipe] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[YouTube Swipe] Finished: $hookedPoints Swipe Controls hooks injected.")
}
