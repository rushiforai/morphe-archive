package com.dmoniak.patches.shadowfight.sf2

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SHADOW_FIGHT_2
import java.util.logging.Logger

@Suppress("unused")
val sf2InfiniteEnergyPatch = bytecodePatch(
    name = "Infinite Energy - Shadow Fight 2 (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Removes the 5-point energy cap in Shadow Fight 2, preventing stamina depletion so you can play unlimited duels, tournaments, and boss fights without waiting. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_SHADOW_FIGHT_2)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShadowFight2InfiniteEnergyLogic(logger)
    }
}

@Suppress("unused")
val sf2InstantDeliveryPatch = bytecodePatch(
    name = "Instant Equipment Delivery - Shadow Fight 2 (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Removes the real-time delivery wait timers when upgrading weapons, armor, and helmets at the Forge/Blacksmith in Shadow Fight 2. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_SHADOW_FIGHT_2)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShadowFight2InstantDeliveryLogic(logger)
    }
}

fun BytecodePatchContext.executeShadowFight2InfiniteEnergyLogic(logger: Logger) {
    logger.info("Executing Infinite Energy patch for Shadow Fight 2...")
    var energyCount = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // 1. Check if user has enough energy / can start battle -> always true
            if (!isStatic && (
                mName == "hasenoughenergy" ||
                mName == "isenergyfull" ||
                mName == "canfight" ||
                mName == "hasenergy"
            ) && retType == "Z" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    energyCount++
                    logger.info("[SF2] Hooked energy availability: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[SF2] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Consume energy -> no-op return-void
            if (!isStatic && (
                mName == "consumeenergy" ||
                mName == "spendenergy" ||
                mName == "decreaseenergy" ||
                mName == "drainenergy"
            ) && retType == "V") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        return-void
                        """.trimIndent()
                    )
                    energyCount++
                    logger.info("[SF2] Hooked energy consumption: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[SF2] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 3. Current energy count -> always 5 (max)
            if (!isStatic && (
                mName == "getenergy" ||
                mName == "getcurrentenergy" ||
                mName == "getenergycount"
            ) && retType == "I" && pTypes.isEmpty() && classDef.type.contains("energy", ignoreCase = true)) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x5
                        return v0
                        """.trimIndent()
                    )
                    energyCount++
                    logger.info("[SF2] Hooked energy getter: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[SF2] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[SF2] Infinite Energy: $energyCount method(s) hooked.")
}

fun BytecodePatchContext.executeShadowFight2InstantDeliveryLogic(logger: Logger) {
    logger.info("Executing Instant Delivery patch for Shadow Fight 2...")
    var deliveryCount = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // 1. Remaining delivery time -> 0L
            if (!isStatic && (
                mName == "getremainingdeliverytime" ||
                mName == "getdeliverytimeremaining" ||
                mName == "gettimetodeliver" ||
                mName == "getdeliverytimeleft"
            ) && retType == "J" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const-wide/16 v0, 0x0
                        return-wide v0
                        """.trimIndent()
                    )
                    deliveryCount++
                    logger.info("[SF2] Hooked delivery time remaining: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[SF2] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Is delivery finished / delivered -> always true
            if (!isStatic && (
                mName == "isdelivered" ||
                mName == "isdeliverycomplete" ||
                mName == "isupgradedelivered"
            ) && retType == "Z" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    deliveryCount++
                    logger.info("[SF2] Hooked delivery completion check: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[SF2] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[SF2] Instant Delivery: $deliveryCount method(s) hooked.")
}
