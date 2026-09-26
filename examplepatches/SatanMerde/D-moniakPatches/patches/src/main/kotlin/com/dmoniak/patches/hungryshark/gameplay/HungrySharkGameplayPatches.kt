package com.dmoniak.patches.hungryshark.gameplay

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HUNGRY_SHARK_EVOLUTION
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HUNGRY_SHARK_WORLD
import java.util.logging.Logger

@Suppress("unused")
val hungrySharkInfiniteBoostPatch = bytecodePatch(
    name = "Infinite Boost - Hungry Shark (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Disables boost meter depletion in Hungry Shark World and Hungry Shark Evolution, granting unlimited turbo swimming and continuous dash attacks without waiting for recharge. (Experimental - Not yet tested on device).",
) {
    compatibleWith(
        COMPATIBILITY_HUNGRY_SHARK_WORLD,
        COMPATIBILITY_HUNGRY_SHARK_EVOLUTION,
    )

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeHungrySharkInfiniteBoostLogic(logger)
    }
}

@Suppress("unused")
val hungrySharkFastGoldRushPatch = bytecodePatch(
    name = "Fast Gold Rush - Hungry Shark (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Accelerates Gold Rush gauge filling in Hungry Shark World and Evolution, triggering frenzy coin multipliers and invulnerability much faster. (Experimental - Not yet tested on device).",
) {
    compatibleWith(
        COMPATIBILITY_HUNGRY_SHARK_WORLD,
        COMPATIBILITY_HUNGRY_SHARK_EVOLUTION,
    )

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeHungrySharkFastGoldRushLogic(logger)
    }
}

fun BytecodePatchContext.executeHungrySharkInfiniteBoostLogic(logger: Logger) {
    logger.info("Executing Infinite Boost patch for Hungry Shark...")
    var patchedMethods = 0

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

            // 1. Boost consumption / depletion methods -> return void immediately
            if (!isStatic && (
                mName.contains("consumeboost") ||
                mName.contains("depleteboost") ||
                mName.contains("drainboost") ||
                mName.contains("useboost") ||
                mName.contains("subtractboost")
            ) && retType == "V") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        return-void
                        """.trimIndent()
                    )
                    patchedMethods++
                    logger.info("Hooked boost drain method: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Can boost / is boost available -> always true
            if (!isStatic && (
                mName == "canboost" ||
                mName == "isboostavailable" ||
                mName == "hasboost" ||
                mName == "isboostready"
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
                    patchedMethods++
                    logger.info("Hooked boost check method: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 3. Boost ratio / amount -> return 1.0f (100% full)
            if (!isStatic && (
                mName == "getboostamount" ||
                mName == "getboostratio" ||
                mName == "getboostpercent" ||
                mName == "getboostpercentage" ||
                mName == "getcurrentboost"
            ) && retType == "F" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/high16 v0, 0x3f800000
                        return v0
                        """.trimIndent()
                    )
                    patchedMethods++
                    logger.info("Hooked boost value getter: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("Infinite Boost: $patchedMethods method(s) hooked.")
}

fun BytecodePatchContext.executeHungrySharkFastGoldRushLogic(logger: Logger) {
    logger.info("Executing Fast Gold Rush patch for Hungry Shark...")
    var patchedMethods = 0

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

            // Accelerate Gold Rush charge multiplier / points rate
            if (!isStatic && (
                mName.contains("goldrushmultiplier") ||
                mName.contains("goldrushchargerate") ||
                mName.contains("goldrushgainmultiplier")
            ) && retType == "F" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/high16 v0, 0x41200000
                        return v0
                        """.trimIndent() // 10.0f
                    )
                    patchedMethods++
                    logger.info("Hooked Gold Rush multiplier getter: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("Fast Gold Rush: $patchedMethods method(s) hooked.")
}
