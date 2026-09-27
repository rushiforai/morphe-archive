package com.dmoniak.patches.terabox

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TERABOX
import java.util.logging.Logger

@Suppress("unused")
val teraBoxUnlockVideoControlsPatch = bytecodePatch(
    name = "Unlock Video Player Speed & Controls - TeraBox (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks background video playback, 1080p/original video quality streaming selector, and variable playback speeds without TeraBox Premium.",
) {
    compatibleWith(COMPATIBILITY_TERABOX)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTeraBoxUnlockVideoControlsLogic(logger)
    }
}

fun BytecodePatchContext.executeTeraBoxUnlockVideoControlsLogic(logger: Logger) {
    logger.info("Executing Unlock Video Player Speed & Controls patch for TeraBox...")
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

            // Hook video player controls (HQ resolution, speed, background playback)
            if (!isStatic && (
                mName == "canusebackgroundplayback" ||
                mName == "ishighresolutionvideoallowed" ||
                mName == "isplaybackspeedunlocked" ||
                mName == "canstreamin1080p" ||
                mName == "isvideodownloadinorigunlocked"
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
                    logger.info("[TeraBox Video Controls] Unlocked player control in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[TeraBox Video Controls] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[TeraBox Unlock Video Controls] Total hooks applied: $hookedPoints")
}
