package com.dmoniak.patches.plagueinc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PLAGUE_INC
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PLAGUE_INC_ALT
import java.util.logging.Logger

@Suppress("unused")
val plagueIncFreeShoppingAndScenariosPatch = bytecodePatch(
    name = "Unlock Scenarios & Full Expansion - Plague Inc. (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks Official Scenarios, Custom Scenario Creator, Speed Runs, and Fast Forward (speed 3x) by hooking Google Play Billing and expansion license checks.",
) {
    compatibleWith(COMPATIBILITY_PLAGUE_INC, COMPATIBILITY_PLAGUE_INC_ALT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePlagueIncExpansionLogic(logger)
    }
}

fun BytecodePatchContext.executePlagueIncExpansionLogic(logger: Logger) {
    logger.info("Executing Unlock Scenarios & Full Expansion patch for Plague Inc...")
    var hookedPoints = executeGooglePlayBillingBypass(logger, "Plague Inc")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Hook expansion pack and scenario ownership
            if (!isStatic && (
                mName == "isscenariopackpurchased" ||
                mName == "isexpansionunlocked" ||
                mName == "isfullgameunlocked" ||
                mName == "isfastforwardunlocked" ||
                mName == "isspeedrununlocked" ||
                mName == "iscustomscenariocreatorunlocked" ||
                mName == "haspurchasedpremium"
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
                    logger.info("[Plague Inc.] Unlocked expansion feature in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Plague Inc.] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Google Play Billing purchase state hook (0 = PURCHASED)
            if (!isStatic && (
                mName == "getpurchasestate" ||
                mName == "getresponsecode"
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
                    logger.info("[Plague Inc.] Injected PURCHASED (0) billing state into: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Plague Inc.] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Plague Inc.] Finished: $hookedPoints expansion hooks injected.")
}
