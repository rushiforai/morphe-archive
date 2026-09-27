package com.dmoniak.patches.hillclimb

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HILL_CLIMB
import java.util.logging.Logger

@Suppress("unused")
val hillClimbBypassAdsPatch = bytecodePatch(
    name = "Bypass Rewarded Ads - Hill Climb Racing (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips interstitial ads, banner ads, and intrusive commercial popups in Hill Climb Racing by neutralizing mediation SDK calls.",
) {
    compatibleWith(COMPATIBILITY_HILL_CLIMB)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeHillClimbBypassAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeHillClimbBypassAdsLogic(logger: Logger) {
    logger.info("Executing Bypass Rewarded Ads patch for Hill Climb Racing...")
    val hooked = executeComprehensiveAdBlock(logger, "HillClimb")
    logger.info("[Hill Climb Ads] Total ad-blocking hooks applied: $hooked")
}
