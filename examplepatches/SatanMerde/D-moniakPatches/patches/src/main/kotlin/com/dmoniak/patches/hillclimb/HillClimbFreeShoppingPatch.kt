package com.dmoniak.patches.hillclimb

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HILL_CLIMB
import java.util.logging.Logger

@Suppress("unused")
val hillClimbFreeShoppingPatch = bytecodePatch(
    name = "Free Shopping - Hill Climb Racing (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play BillingClient and in-app purchase verification in Hill Climb Racing to unlock vehicle bundles, gem packs, coin upgrades, and special garage paints for free.",
) {
    compatibleWith(COMPATIBILITY_HILL_CLIMB)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeHillClimbFreeShoppingLogic(logger)
    }
}

fun BytecodePatchContext.executeHillClimbFreeShoppingLogic(logger: Logger) {
    logger.info("Executing Free Shopping patch for Hill Climb Racing...")
    var hookedPoints = 0

    // 1. Hook Google Play BillingClient
    hookedPoints += executeGooglePlayBillingBypass(logger, "HillClimb")

    // 2. Hook internal vehicle / store purchase status
    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            if (!isStatic && retType == "Z" && (
                mName == "isvehicleunlocked" ||
                mName == "haspurchasedvehicle" ||
                mName == "isitempurchased" ||
                mName == "ispremiumunlocked" ||
                mName == "isstageunlocked"
            )) {
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
                    logger.info("[Hill Climb Store] Hooked ${classDef.type}->${method.name} -> true")
                } catch (e: Exception) {
                    logger.fine("[Hill Climb Store] Failed ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Hill Climb Store] Total store hooks applied: $hookedPoints")
}
