package com.dmoniak.patches.youtube

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

@Suppress("unused")
val youtubeHidePlayerButtonsPatch = bytecodePatch(
    name = "Hide Player Overlay Buttons (Cast, Autoplay, Remix) - YouTube (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hides unwanted player overlay buttons including Chromecast icon (prevents accidental casting), Autoplay toggle, Remix button, and Thanks button.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeYouTubeHidePlayerButtonsLogic(logger)
    }
}

fun BytecodePatchContext.executeYouTubeHidePlayerButtonsLogic(logger: Logger) {
    logger.info("Executing dedicated Hide Player Overlay Buttons patch for YouTube...")
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
                mName == "iscastbuttonvisible" ||
                mName == "shouldshowcastbutton" ||
                mName == "isautoplayswitchvisible" ||
                mName == "isremixbuttonvisible" ||
                mName == "isthanksbuttonvisible" ||
                mName == "isclippingbuttonvisible"
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
                    logger.info("[YouTube Player Buttons] Hidden unwanted button in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[YouTube Player Buttons] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[YouTube Player Buttons] Finished: $hookedPoints Player Buttons hooks injected.")
}
