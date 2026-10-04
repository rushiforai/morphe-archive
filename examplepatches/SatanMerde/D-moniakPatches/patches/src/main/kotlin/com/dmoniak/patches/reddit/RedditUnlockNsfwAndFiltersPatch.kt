package com.dmoniak.patches.reddit

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_REDDIT
import java.util.logging.Logger

@Suppress("unused")
val redditUnlockNsfwAndFiltersPatch = bytecodePatch(
    name = "Bypass NSFW Blur & Warning Dialogs - Reddit (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Automatically unblurs mature/NSFW media thumbnails and bypasses annoying confirmation dialogs for adult communities in Reddit.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeRedditUnlockNsfwLogic(logger)
    }
}

fun BytecodePatchContext.executeRedditUnlockNsfwLogic(logger: Logger) {
    logger.info("Executing Bypass NSFW Blur & Warning Dialogs patch for Reddit...")
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

            // 1. Force unblurred NSFW thumbnails
            if (!isStatic && (
                mName == "shouldblurnsfw" ||
                mName == "isnsfwblurred" ||
                mName == "shouldshowmaturewarning" ||
                mName == "isquarantinedwarningrequired"
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
                    logger.info("[Reddit NSFW] Disabled blur/warning dialog in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Reddit NSFW] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Reddit NSFW] Finished: $hookedPoints NSFW blur hooks injected.")
}
