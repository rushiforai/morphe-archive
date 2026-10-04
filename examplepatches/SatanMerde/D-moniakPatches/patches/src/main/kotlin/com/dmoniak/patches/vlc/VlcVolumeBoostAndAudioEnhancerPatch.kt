package com.dmoniak.patches.vlc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_VLC
import java.util.logging.Logger

@Suppress("unused")
val vlcVolumeBoostAndAudioEnhancerPatch = bytecodePatch(
    name = "200% Volume Boost & Audio Gain - VLC (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks 200% volume amplification (software preamp gain up to +12dB) for low-volume videos/audio and prevents volume ducking on notifications.",
) {
    compatibleWith(COMPATIBILITY_VLC)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeVlcVolumeBoostAndAudioEnhancerLogic(logger)
    }
}

fun BytecodePatchContext.executeVlcVolumeBoostAndAudioEnhancerLogic(logger: Logger) {
    logger.info("Executing 200% Volume Boost & Audio Gain patch for VLC...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Hook volume boost permission checks
            if (!isStatic && (
                mName == "isvolumeboostallowed" ||
                mName == "isvolumeboostenabled" ||
                mName == "canboostvolume" ||
                mName == "shouldallowvolumeboost"
            ) && retType == "Z" && method.parameterTypes.isEmpty()) {
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
                    logger.fine("[VLC Audio Boost] Enabled volume boost: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[VLC Audio Boost] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Hook volume max limit returning 200%
            if (!isStatic && (
                mName == "getvolumeboostlimit" ||
                mName == "getmaxvolumeboost"
            ) && retType == "I" && method.parameterTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/16 v0, 0xc8
                        return v0
                        """.trimIndent() // 200
                    )
                    hookedPoints++
                    logger.fine("[VLC Audio Boost] Set volume boost limit to 200: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[VLC Audio Boost] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 3. Disable audio ducking on notifications / transient focus loss
            if (!isStatic && (
                mName == "shouldduckonaudiofocusloss" ||
                mName == "isduckingenabled"
            ) && retType == "Z" && method.parameterTypes.isEmpty()) {
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
                    logger.fine("[VLC Audio Boost] Disabled audio ducking: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[VLC Audio Boost] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[VLC Audio Boost] Total audio boost hooks applied: $hookedPoints")
}
