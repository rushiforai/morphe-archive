package com.dmoniak.patches.cuttherope

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CUT_THE_ROPE
import java.util.logging.Logger

@Suppress("unused")
val cutTheRopeBlockAdsPatch = bytecodePatch(
    name = "Block Ads & Video Interruptions - Cut the Rope (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips interstitial video ads between levels, bottom banners, and promotional nag screens in Cut the Rope.",
) {
    compatibleWith(COMPATIBILITY_CUT_THE_ROPE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCutTheRopeBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeCutTheRopeBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Video Interruptions patch for Cut the Rope...")
    val hooked = executeComprehensiveAdBlock(logger, "CutTheRope")
    logger.info("[CutTheRope Ads] Total ad-blocking hooks applied: $hooked")
}
