package com.dmoniak.patches.youtube

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

@Suppress("unused")
val youtubeRememberVideoQualityPatch = bytecodePatch(
    name = "Remember Video Quality - YouTube (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Forces and locks preferred default video resolution (such as 1080p, 1440p, or 4K) separately for Wi-Fi and mobile cellular networks, overriding YouTube's adaptive downscaling.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeYouTubeRememberVideoQualityLogic(logger)
    }
}

fun BytecodePatchContext.executeYouTubeRememberVideoQualityLogic(logger: Logger) {
    logger.info("Executing dedicated Remember Video Quality patch for YouTube...")
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
                mName == "shouldlockqualityselection" ||
                mName == "isdefaultqualityenforced" ||
                mName == "shouldbypassadaptivequality"
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
                    logger.info("[YouTube Video Quality] Enabled quality lock in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[YouTube Video Quality] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[YouTube Video Quality] Finished: $hookedPoints Remember Video Quality hooks injected.")
}
