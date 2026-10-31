package com.dmoniak.patches.mathway

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MATHWAY
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val mathwayAdFreeSolverPatch = bytecodePatch(
    name = "Ad-Free & Step-by-Step Solver - Mathway (Experimental)",
    description = "⚠️ [Experimental / Untested] Removes interstitial ads after calculating solutions, strips bottom ad banners, and hooks client-side subscription verification for step-by-step problem explanations in Mathway.",
) {
    compatibleWith(COMPATIBILITY_MATHWAY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMathwayAdFreeSolverLogic(logger)
    }
}

fun BytecodePatchContext.executeMathwayAdFreeSolverLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Step-by-Step Solver patch for Mathway...")
    var hooked = executeComprehensiveAdBlock(logger, "Mathway")
    hooked += executeGooglePlayBillingBypass(logger, "Mathway")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("subscription") || tl.contains("premium") || tl.contains("solver") || tl.contains("step")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "ispremium" || mName == "hassubscription" || mName == "canviewsteps") && retType == "Z") {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = """
                                const/4 v0, 0x1
                                return v0
                            """.trimIndent()
                        )
                        hooked++
                    } catch (e: Exception) {
                        logger.fine("[Mathway Solver] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Mathway Solver] Total hooks applied: $hooked")
}
