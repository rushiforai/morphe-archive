package com.dmoniak.patches.youtube

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

@Suppress("unused")
val youtubeCopyVideoUrlWithTimestampPatch = bytecodePatch(
    name = "Copy Video URL With Timestamp - YouTube (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Adds a convenient option to copy the current video URL with the exact playback timestamp (?t=...) directly to the clipboard.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeYouTubeCopyVideoUrlWithTimestampLogic(logger)
    }
}

fun BytecodePatchContext.executeYouTubeCopyVideoUrlWithTimestampLogic(logger: Logger) {
    logger.info("Executing dedicated Copy Video URL With Timestamp patch for YouTube...")
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
                mName == "iscopywithtimestampenabled" ||
                mName == "shouldshowtimestampcopybutton"
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
                    logger.info("[YouTube Copy URL] Enabled copy with timestamp in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[YouTube Copy URL] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[YouTube Copy URL] Finished: $hookedPoints Copy URL hooks injected.")
}
