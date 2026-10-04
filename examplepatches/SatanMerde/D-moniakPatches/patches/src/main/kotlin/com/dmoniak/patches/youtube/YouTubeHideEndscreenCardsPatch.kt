package com.dmoniak.patches.youtube

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

@Suppress("unused")
val youtubeHideEndscreenCardsPatch = bytecodePatch(
    name = "Hide Endscreen Cards & Suggestions - YouTube (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hides floating endscreen cards, suggested video boxes, channel stickers, and overlay elements that clutter the end of videos.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeYouTubeHideEndscreenCardsLogic(logger)
    }
}

fun BytecodePatchContext.executeYouTubeHideEndscreenCardsLogic(logger: Logger) {
    logger.info("Executing dedicated Hide Endscreen Cards patch for YouTube...")
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
                mName == "shouldshowendscreencards" ||
                mName == "isendscreenvisible" ||
                mName == "shouldrenderinfocards" ||
                mName == "iswatermarkvisible"
            ) && retType == "Z") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[YouTube Endscreen] Disabled endscreen element in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[YouTube Endscreen] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[YouTube Endscreen] Finished: $hookedPoints Endscreen hooks injected.")
}
