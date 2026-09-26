package com.dmoniak.patches.shadowfight.sf3

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SHADOW_FIGHT_3
import java.util.logging.Logger

@Suppress("unused")
val sf3InstantChestPatch = bytecodePatch(
    name = "Instant Chest Unlock - Shadow Fight 3 (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Eliminates the 3-hour, 8-hour, and 24-hour countdown timers on duel chests in Shadow Fight 3 for instant opening and card collection. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_SHADOW_FIGHT_3)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShadowFight3InstantChestLogic(logger)
    }
}

fun BytecodePatchContext.executeShadowFight3InstantChestLogic(logger: Logger) {
    logger.info("Executing Instant Chest Unlock patch for Shadow Fight 3...")
    var chestCount = 0

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

            // 1. Chest remaining unlock time -> 0L
            if (!isStatic && (
                mName == "getchestremainingtime" ||
                mName == "getunlocktimeremaining" ||
                mName == "getchestunlocktime" ||
                mName == "gettimeuntilunlock"
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
                    chestCount++
                    logger.info("[SF3] Hooked chest unlock timer: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[SF3] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Is chest ready to open / unlocked -> always true
            if (!isStatic && (
                mName == "ischestready" ||
                mName == "ischestunlocked" ||
                mName == "canopenchest" ||
                mName == "isreadytoopen"
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
                    chestCount++
                    logger.info("[SF3] Hooked chest ready status: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[SF3] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[SF3] Instant Chest Unlock: $chestCount method(s) hooked.")
}
