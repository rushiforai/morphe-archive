package com.dmoniak.patches.angrybirds

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_ANGRY_BIRDS
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val angryBirdsUnlimitedMightyEaglePowerupsPatch = bytecodePatch(
    name = "Unlimited Mighty Eagle & Power-ups - Angry Birds Classic (Experimental)",
    description = "⚠️ [Experimental / Untested] Unlocks the Mighty Eagle permanently with zero cooldown timer, and provides unlimited power-ups (Sling Scope, King Sling, Super Seeds, Birdquake).",
) {
    compatibleWith(COMPATIBILITY_ANGRY_BIRDS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeAngryBirdsUnlimitedMightyEaglePowerupsLogic(logger)
    }
}

fun BytecodePatchContext.executeAngryBirdsUnlimitedMightyEaglePowerupsLogic(logger: Logger) {
    logger.info("Executing Unlimited Mighty Eagle & Power-ups patch for Angry Birds Classic...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Mighty Eagle ownership and availability checks -> return true
            if (!isStatic && (
                mName == "ismightyeagleunlocked" ||
                mName == "hasmightyeagle" ||
                mName == "canusemightyeagle" ||
                mName == "ismightyeagleready" ||
                mName == "haspowerups"
            ) && retType == "Z") {
                try {
                    replaceMethod(
                        method = method,
                        registerCount = 3,
                        smaliCode = """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[AngryBirds Powerups] Enabled Mighty Eagle/Powerup flag in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[AngryBirds Powerups] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Power-up counts -> return 999
            if (!isStatic && (
                mName == "getpowerupcount" ||
                mName == "getremainingpowerups"
            ) && retType == "I") {
                try {
                    replaceMethod(
                        method = method,
                        registerCount = 3,
                        smaliCode = """
                        const/16 v0, 0x3e7
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[AngryBirds Powerups] Maxed powerup count in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[AngryBirds Powerups] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[AngryBirds Powerups] Total power-up hooks applied: $hookedPoints")
}
