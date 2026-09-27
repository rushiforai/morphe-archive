package com.dmoniak.patches.angrybirds

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_ANGRY_BIRDS
import java.util.logging.Logger

@Suppress("unused")
val angryBirdsUnlockLevelsEpisodesPatch = bytecodePatch(
    name = "Unlock All Episodes & Golden Eggs - Angry Birds Classic (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks all legendary episodes, level packs, and Golden Egg secret stages in Angry Birds Classic.",
) {
    compatibleWith(COMPATIBILITY_ANGRY_BIRDS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeAngryBirdsUnlockLevelsEpisodesLogic(logger)
    }
}

fun BytecodePatchContext.executeAngryBirdsUnlockLevelsEpisodesLogic(logger: Logger) {
    logger.info("Executing Unlock All Episodes & Levels patch for Angry Birds Classic...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // Episode / Level / World unlock checks
            if (!isStatic && (
                mName == "islevelunlocked" ||
                mName == "isepisodeunlocked" ||
                mName == "isworldunlocked" ||
                mName == "isgoldeneggunlocked" ||
                mName == "canplaylevel" ||
                mName == "isitemunlocked"
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
                    logger.info("[AngryBirds Unlocks] Unlocked level/episode in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[AngryBirds Unlocks] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[AngryBirds Unlocks] Total episode unlock hooks applied: $hookedPoints")
}
