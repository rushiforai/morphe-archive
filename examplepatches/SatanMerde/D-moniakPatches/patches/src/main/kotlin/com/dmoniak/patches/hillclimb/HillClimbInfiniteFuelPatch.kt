package com.dmoniak.patches.hillclimb

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HILL_CLIMB
import java.util.logging.Logger

@Suppress("unused")
val hillClimbInfiniteFuelPatch = bytecodePatch(
    name = "Infinite Fuel - Hill Climb Racing (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Prevents fuel gauge depletion in Hill Climb Racing, allowing endless hill climbing and stunt driving without engine stall.",
) {
    compatibleWith(COMPATIBILITY_HILL_CLIMB)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeHillClimbInfiniteFuelLogic(logger)
    }
}

fun BytecodePatchContext.executeHillClimbInfiniteFuelLogic(logger: Logger) {
    logger.info("Executing Infinite Fuel patch for Hill Climb Racing...")
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

            // 1. Hook fuel level getters returning float (return full tank 100.0f)
            if (!isStatic && (
                mName == "getfuel" ||
                mName == "getcurrentfuel" ||
                mName == "getfuellevel" ||
                mName == "getremainingfuel"
            ) && retType == "F") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/high16 v0, 0x42c80000
                        return v0
                        """.trimIndent() // 100.0f
                    )
                    hookedPoints++
                    logger.info("[Hill Climb Fuel] Fixed fuel to 100.0f in ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Hill Climb Fuel] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Disable out-of-fuel game over trigger
            if (!isStatic && (
                mName == "isoutoffuel" ||
                mName == "hasrunoutoffuel" ||
                mName == "isfuelempty"
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
                    hookedPoints++
                    logger.info("[Hill Climb Fuel] Disabled out of fuel check in ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Hill Climb Fuel] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Hill Climb Fuel] Total infinite fuel hooks applied: $hookedPoints")
}
