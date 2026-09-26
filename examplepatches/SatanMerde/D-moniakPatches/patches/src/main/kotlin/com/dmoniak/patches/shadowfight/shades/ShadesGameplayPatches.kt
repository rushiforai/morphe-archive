package com.dmoniak.patches.shadowfight.shades

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SHADOW_FIGHT_SHADES
import java.util.logging.Logger

@Suppress("unused")
val shadesInfiniteEnergyPatch = bytecodePatch(
    name = "Infinite Energy - Shades Roguelike (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Prevents energy consumption when entering shadow rifts and acts in Shades: Shadow Fight Roguelike. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_SHADOW_FIGHT_SHADES)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShadesInfiniteEnergyLogic(logger)
    }
}

fun BytecodePatchContext.executeShadesInfiniteEnergyLogic(logger: Logger) {
    logger.info("Executing Infinite Energy patch for Shades: Shadow Fight Roguelike...")
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

            // 1. Check if user has enough energy -> always true
            if (!isStatic && (
                mName == "hasenoughenergy" ||
                mName == "isenergyfull" ||
                mName == "canstartrun" ||
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
                    logger.info("[Shades] Hooked energy availability: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Shades] Failed to hook ${method.name}: ${e.message}")
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
                    logger.info("[Shades] Hooked energy consumption: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Shades] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Shades] Infinite Energy: $energyCount method(s) hooked.")
}
