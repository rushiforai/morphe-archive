package com.dmoniak.patches.memrise

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MEMRISE
import java.util.logging.Logger

@Suppress("unused")
val memriseBlockAdsPatch = bytecodePatch(
    name = "Block Ads & Video Interruptions - Memrise (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips post-lesson video ads, bottom banner promotions, and upgrade modals in Memrise.",
) {
    compatibleWith(COMPATIBILITY_MEMRISE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMemriseBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeMemriseBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Video Interruptions patch for Memrise...")
    val hooked = executeComprehensiveAdBlock(logger, "Memrise")
    logger.info("[Memrise Ads] Total ad-blocking hooks applied: $hooked")
}
