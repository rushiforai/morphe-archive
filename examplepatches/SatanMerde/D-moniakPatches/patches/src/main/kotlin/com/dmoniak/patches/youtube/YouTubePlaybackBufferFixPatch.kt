package com.dmoniak.patches.youtube

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

@Suppress("unused")
val youtubePlaybackBufferFixPatch = bytecodePatch(
    name = "Fix Video Playback Buffer & Freeze - YouTube (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Bypasses Google's video stream throttling and 1:00 min playback buffering freezes by spoofing client payload parameters (iOS/Android VR/TV client identifiers).",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeYouTubeBufferFixLogic(logger)
    }
}

fun BytecodePatchContext.executeYouTubeBufferFixLogic(logger: Logger) {
    logger.info("Executing Fix Video Playback Buffer & Freeze patch for YouTube...")
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

            // Hook client parameter spoofing getters
            if (!isStatic && (
                mName == "shouldspoofclient" ||
                mName == "isclientbufferingfixenabled" ||
                mName == "canusealternateplaybackclient"
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
                    logger.info("[YouTube Buffer Fix] Enabled client spoofing in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[YouTube Buffer Fix] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Hook User-Agent client model identifier override (e.g. Android VR or iOS client to bypass throttling)
            if (!isStatic && (
                mName == "getclientnameforplayer" ||
                mName == "getoverrideclientmodel"
            ) && retType == "Ljava/lang/String;") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const-string v0, "ANDROID_VR"
                        return-object v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[YouTube Buffer Fix] Injected alternate client model in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[YouTube Buffer Fix] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[YouTube Buffer Fix] Finished: $hookedPoints buffer fix hooks injected.")
}
