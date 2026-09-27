package com.dmoniak.patches.cuttherope

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CUT_THE_ROPE
import java.util.logging.Logger

@Suppress("unused")
val cutTheRopeUnlockSeasonsSuperpowersPatch = bytecodePatch(
    name = "Unlock All Boxes & Superpowers - Cut the Rope (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks all level boxes, seasons, Om Nom candies, and unlocks unlimited superpowers (candy magnets & telekinesis) in Cut the Rope.",
) {
    compatibleWith(COMPATIBILITY_CUT_THE_ROPE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCutTheRopeUnlockSeasonsSuperpowersLogic(logger)
    }
}

fun BytecodePatchContext.executeCutTheRopeUnlockSeasonsSuperpowersLogic(logger: Logger) {
    logger.info("Executing Unlock All Boxes & Superpowers patch for Cut the Rope...")
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

            // 1. Box / Level / Season unlock checks
            if (!isStatic && (
                mName == "isboxunlocked" ||
                mName == "islevelunlocked" ||
                mName == "isseasonunlocked" ||
                mName == "ispackunlocked" ||
                mName == "haspurchasedseason" ||
                mName == "haspurchasedbox" ||
                mName == "isitemunlocked" ||
                mName == "issuperpowerunlocked" ||
                mName == "hasinfinitepowerups"
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
                    logger.info("[CutTheRope Unlocks] Forced unlock in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[CutTheRope Unlocks] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Superpowers quantity getter
            if (!isStatic && (
                mName == "getsuperpowerscount" ||
                mName == "getmagnetsremaining" ||
                mName == "getsuperpowercount"
            ) && retType == "I") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/16 v0, 0x3e7
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[CutTheRope Unlocks] Forced superpower count in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[CutTheRope Unlocks] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[CutTheRope Unlocks] Total unlock hooks applied: $hookedPoints")
}
