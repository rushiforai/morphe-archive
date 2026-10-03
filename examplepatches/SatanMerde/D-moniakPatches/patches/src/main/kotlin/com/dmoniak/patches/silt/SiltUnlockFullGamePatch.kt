package com.dmoniak.patches.silt

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SILT
import java.util.logging.Logger

@Suppress("unused")
val siltUnlockFullGamePatch = bytecodePatch(
    name = "Unlock Full Game - Silt (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks the full game, all oceanic abyss chapters, and in-app purchase verification in Silt by hooking Google Play Billing and full game license verification checks.",
) {
    compatibleWith(COMPATIBILITY_SILT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSiltUnlockFullGameLogic(logger)
    }
}

fun BytecodePatchContext.executeSiltUnlockFullGameLogic(logger: Logger) {
    logger.info("Executing Unlock Full Game patch for Silt (com.snapbreak.silt)...")
    var hookedPoints = 0

    // 1. Hook Google Play Billing Client SDK and local purchase listeners
    hookedPoints += executeGooglePlayBillingBypass(logger, "Silt")

    // 2. Hook game unlock and chapter access checks
    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // Full game license checks
            if (!isStatic && (
                mName == "isfullgameunlocked" ||
                mName == "isgameunlocked" ||
                mName == "haspurchasedfullgame" ||
                mName == "isfullgamepurchased" ||
                mName == "isfullversion" ||
                mName == "canaccessfullgame" ||
                mName == "isunlocked" ||
                mName == "hasfullaccess"
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
                    hookedPoints++
                    logger.info("[Silt Full Game] Unlocked full game check in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Silt Full Game] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Chapter / level access checks (with int chapter index or no params)
            if (!isStatic && (
                mName == "ischapterunlocked" ||
                mName == "islevelunlocked" ||
                mName == "canplaychapter"
            ) && retType == "Z" && pTypes.size <= 1) {
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
                    logger.info("[Silt Full Game] Unlocked chapter check in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Silt Full Game] Failed chapter hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Silt Full Game] Total hooks applied: $hookedPoints")
}
