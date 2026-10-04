package com.dmoniak.patches.photomath

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PHOTOMATH
import java.util.logging.Logger

@Suppress("unused")
val photomathAdFreeAndOfflineSolverPatch = bytecodePatch(
    name = "Ad-Free & Unlock Animated Step Solutions - Photomath (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Blocks ads and unlocks deep step-by-step animated explanations, textbook geometry solutions, and calculation tips in Photomath.",
) {
    compatibleWith(COMPATIBILITY_PHOTOMATH)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePhotomathAdFreeAndOfflineSolverLogic(logger)
    }
}

fun BytecodePatchContext.executePhotomathAdFreeAndOfflineSolverLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Unlock Animated Step Solutions patch for Photomath...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Hook Plus step-by-step solution unlock flags
            if (!isStatic && (
                mName == "isplussubscriber" ||
                mName == "hasplusaccess" ||
                mName == "canviewanimatedtutorials" ||
                mName == "istextbooksolutionunlocked" ||
                mName == "canviewdeepsteps" ||
                mName == "isgeometrysolverunlocked"
            ) && retType == "Z" && method.parameterTypes.isEmpty()) {
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
                    logger.fine("[Photomath Solver] Unlocked solution feature: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Photomath Solver] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Block ads and solution paywalls
            if (!isStatic && (
                mName == "isadvisible" ||
                mName == "shouldshowad" ||
                mName == "hasactiveads" ||
                mName == "isstepbystepsolutiongated" ||
                mName == "ispluslocked"
            ) && retType == "Z" && method.parameterTypes.isEmpty()) {
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
                    logger.fine("[Photomath Solver] Bypassed lock/ad: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Photomath Solver] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Photomath Solver] Total solver and adblock hooks applied: $hookedPoints")
}
