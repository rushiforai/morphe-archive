package com.dmoniak.patches.youtube

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

@Suppress("unused")
val youtubeDeclutterShortsPatch = bytecodePatch(
    name = "Declutter UI & Remove Shorts - YouTube (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hides Shorts tab from bottom navigation bar, hides Shorts shelf from Home and Subscriptions feeds, hides Create button (+), hides Playables, and removes End Screen suggestions.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeYouTubeDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeYouTubeDeclutterLogic(logger: Logger) {
    logger.info("Executing Declutter UI & Remove Shorts patch for YouTube...")
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

            // Suppress Shorts pivot, create button, playables, and end screens
            if (!isStatic && (
                mName == "isshortsenabled" ||
                mName == "shouldshowshortspivot" ||
                mName == "shouldshowshortsshelf" ||
                mName == "isshortstabvisible" ||
                mName == "shouldshowcreatebutton" ||
                mName == "isplayablesenabled" ||
                mName == "hasendscreens" ||
                mName == "shouldrenderendscreen"
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
                    logger.info("[YouTube Declutter] Disabled clutter element in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[YouTube Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[YouTube Declutter] Finished: $hookedPoints declutter hooks injected.")
}
