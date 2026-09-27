package com.dmoniak.patches.crossyroad

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CROSSY_ROAD
import java.util.logging.Logger

@Suppress("unused")
val crossyRoadBlockAdsPatch = bytecodePatch(
    name = "Block Ads & Video Interruptions - Crossy Road (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips post-death video commercials, prize machine ads, and banner popups in Crossy Road.",
) {
    compatibleWith(COMPATIBILITY_CROSSY_ROAD)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCrossyRoadBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeCrossyRoadBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Video Interruptions patch for Crossy Road...")
    val hooked = executeComprehensiveAdBlock(logger, "CrossyRoad")
    logger.info("[CrossyRoad Ads] Total ad-blocking hooks applied: $hooked")
}
