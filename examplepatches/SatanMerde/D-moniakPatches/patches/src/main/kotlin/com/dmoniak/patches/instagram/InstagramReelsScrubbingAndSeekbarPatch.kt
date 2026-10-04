package com.dmoniak.patches.instagram

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import java.util.logging.Logger

@Suppress("unused")
val instagramReelsScrubbingAndSeekbarPatch = bytecodePatch(
    name = "Reels Seekbar & Fast-Forward Scrubbing - Instagram (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Forces the interactive seekbar / progress bar to always display on Reels, allowing users to freely scrub, fast-forward, and rewind any Instagram Reel without waiting for it to loop.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeInstagramReelsScrubbingLogic(logger)
    }
}

fun BytecodePatchContext.executeInstagramReelsScrubbingLogic(logger: Logger) {
    logger.info("Executing Reels Seekbar & Fast-Forward Scrubbing patch for Instagram...")
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
                mName == "isreelscrubbingallowed" ||
                mName == "shouldshowreelsseekbar" ||
                mName == "isprogressbareditablesforreels" ||
                mName == "isreelscrubbinggestureenabled"
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
                    logger.info("[Instagram Reels Seekbar] Enabled scrubbing in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Instagram Reels Seekbar] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Instagram Reels Seekbar] Finished: $hookedPoints Reels scrubbing hooks injected.")
}
