package com.dmoniak.patches.youtube

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

@Suppress("unused")
val youtubeOldQualityMenuPatch = bytecodePatch(
    name = "Old Video Quality Menu - YouTube (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Restores the classic direct video resolution menu (2160p, 1440p, 1080p, 720p, 480p), bypassing Google's simplified and confusing 'Higher picture quality / Data saver' sub-menus.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeYouTubeOldQualityMenuLogic(logger)
    }
}

fun BytecodePatchContext.executeYouTubeOldQualityMenuLogic(logger: Logger) {
    logger.info("Executing dedicated Old Video Quality Menu patch for YouTube...")
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
                mName == "shouldshowclassicqualitymenu" ||
                mName == "isdirectqualitypickerenabled" ||
                mName == "shouldbypasssimplifiedqualitymenu"
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
                    logger.info("[YouTube Quality Menu] Restored classic quality picker in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[YouTube Quality Menu] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[YouTube Quality Menu] Finished: $hookedPoints Old Quality Menu hooks injected.")
}
