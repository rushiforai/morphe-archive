package com.dmoniak.patches.robberybob

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_ROBBERY_BOB
import java.util.logging.Logger

@Suppress("unused")
val robberyBobUnlockChaptersPatch = bytecodePatch(
    name = "Unlock All Chapters - Robbery Bob (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks all chapters and bonus heist levels in Robbery Bob (Suburbs, Secret Labs, Downtown, Felonious Felines) without requiring 3-star level progression. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_ROBBERY_BOB)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeRobberyBobUnlockChaptersLogic(logger)
    }
}

fun BytecodePatchContext.executeRobberyBobUnlockChaptersLogic(logger: Logger) {
    logger.info("Executing Unlock All Chapters patch for Robbery Bob...")
    var unlockCount = 0

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

            // 1. Is chapter / level locked -> always false (unlocked)
            if (!isStatic && (
                mName == "ischapterlocked" ||
                mName == "islevellocked" ||
                mName == "isstagelocked" ||
                mName == "isworldlocked"
            ) && retType == "Z") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    unlockCount++
                    logger.info("[Robbery Bob] Hooked lock status: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Robbery Bob] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Is chapter / level unlocked / accessible -> always true
            if (!isStatic && (
                mName == "ischapterunlocked" ||
                mName == "islevelunlocked" ||
                mName == "isstageunlocked" ||
                mName == "canplaylevel" ||
                mName == "canenterchapter"
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
                    unlockCount++
                    logger.info("[Robbery Bob] Hooked unlock status: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Robbery Bob] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Robbery Bob] Unlock All Chapters: $unlockCount method(s) hooked.")
}
