package com.dmoniak.patches.vector2

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_VECTOR_2
import java.util.logging.Logger

@Suppress("unused")
val vector2UnlockGearPatch = bytecodePatch(
    name = "Unlock Gear Matrix - Vector 2 (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks experimental equipment slots, booster upgrades, and datacore matrices in Vector 2 without research token gating. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_VECTOR_2)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeVector2UnlockGearLogic(logger)
    }
}

fun BytecodePatchContext.executeVector2UnlockGearLogic(logger: Logger) {
    logger.info("Executing Unlock Gear Matrix patch for Vector 2...")
    var gearCount = 0

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

            // 1. Is gear slot / item locked -> always false (unlocked)
            if (!isStatic && (
                mName == "isslotlocked" ||
                mName == "isitemlocked" ||
                mName == "isgearlocked" ||
                mName == "isdatacorelocked"
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
                    gearCount++
                    logger.info("[Vector 2] Hooked gear lock check: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Vector 2] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Is gear item / slot unlocked / accessible -> always true
            if (!isStatic && (
                mName == "isitemunlocked" ||
                mName == "isslotunlocked" ||
                mName == "canequip" ||
                mName == "isgearavailable"
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
                    gearCount++
                    logger.info("[Vector 2] Hooked gear availability check: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Vector 2] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Vector 2] Unlock Gear Matrix: $gearCount method(s) hooked.")
}
