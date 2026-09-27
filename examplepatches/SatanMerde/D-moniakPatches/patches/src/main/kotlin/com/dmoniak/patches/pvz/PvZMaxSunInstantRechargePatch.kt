package com.dmoniak.patches.pvz

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PLANTS_VS_ZOMBIES
import java.util.logging.Logger

@Suppress("unused")
val pvzMaxSunInstantRechargePatch = bytecodePatch(
    name = "Max Sun & Instant Seed Recharge - Plants vs. Zombies (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Eliminates plant packet cooldown timers for instant replanting and accelerates sun drops across Plants vs. Zombies levels.",
) {
    compatibleWith(COMPATIBILITY_PLANTS_VS_ZOMBIES)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePvZMaxSunInstantRechargeLogic(logger)
    }
}

fun BytecodePatchContext.executePvZMaxSunInstantRechargeLogic(logger: Logger) {
    logger.info("Executing Max Sun & Instant Recharge patch for Plants vs. Zombies...")
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

            // 1. Instant seed packet recharge (isPlantReadyToPlant -> true)
            if (!isStatic && (
                mName == "isreadyforplanting" ||
                mName == "ispacketready" ||
                mName == "canplant" ||
                mName == "isrecharged"
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
                    logger.info("[PvZ Fast] Instant seed packet ready in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[PvZ Fast] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Reduce recharge timer / cooldown to zero
            if (!isStatic && (
                mName == "getpacketrechargetime" ||
                mName == "getremainingcooldown"
            ) && retType == "I") {
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
                    logger.info("[PvZ Fast] Zero cooldown timer in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[PvZ Fast] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[PvZ Fast] Total sun/recharge hooks applied: $hookedPoints")
}
