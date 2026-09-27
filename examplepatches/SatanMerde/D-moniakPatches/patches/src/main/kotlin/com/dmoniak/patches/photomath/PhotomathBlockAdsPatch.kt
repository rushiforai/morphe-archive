package com.dmoniak.patches.photomath

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PHOTOMATH
import java.util.logging.Logger

@Suppress("unused")
val photomathBlockAdsPatch = bytecodePatch(
    name = "Block Ads & Video Interruptions - Photomath (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips post-solution video ads, bottom banner promotions, and upgrade popups in Photomath.",
) {
    compatibleWith(COMPATIBILITY_PHOTOMATH)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePhotomathBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executePhotomathBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Video Interruptions patch for Photomath...")
    val hooked = executeComprehensiveAdBlock(logger, "Photomath")
    logger.info("[Photomath Ads] Total ad-blocking hooks applied: $hooked")
}
