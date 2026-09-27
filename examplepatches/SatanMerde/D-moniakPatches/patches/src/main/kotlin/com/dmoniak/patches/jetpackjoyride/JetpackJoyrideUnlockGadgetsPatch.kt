package com.dmoniak.patches.jetpackjoyride

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_JETPACK_JOYRIDE
import java.util.logging.Logger

@Suppress("unused")
val jetpackJoyrideUnlockGadgetsPatch = bytecodePatch(
    name = "Unlock Gadgets & Upgrades - Jetpack Joyride (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks all Stash gadgets (Coin Magnet, Gravity Belt, Air Barrys, etc.) and maxes out vehicle coin magnets without spending coins.",
) {
    compatibleWith(COMPATIBILITY_JETPACK_JOYRIDE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeJetpackJoyrideUnlockGadgetsLogic(logger)
    }
}

fun BytecodePatchContext.executeJetpackJoyrideUnlockGadgetsLogic(logger: Logger) {
    logger.info("Executing Unlock Gadgets & Upgrades patch for Jetpack Joyride...")
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

            // 1. Hook gadget purchase/unlocked status verification
            if (!isStatic && (
                mName == "isgadgetunlocked" ||
                mName == "haspurchasedgadget" ||
                mName == "isunlocked" ||
                mName == "isvehicleupgraded" ||
                mName == "hasvehiclemagnet"
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
                    logger.info("[Jetpack Gadgets] Unlocked item in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Jetpack Gadgets] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Return max upgrade level (e.g. vehicle magnet level)
            if (!isStatic && (
                mName == "getgadgetlevel" ||
                mName == "getvehiclemagnetlevel" ||
                mName == "getupgradepower"
            ) && (retType == "I" || retType == "S")) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x5
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Jetpack Gadgets] Maxed upgrade level in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Jetpack Gadgets] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Jetpack Gadgets] Total gadget unlock hooks applied: $hookedPoints")
}
