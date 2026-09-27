package com.dmoniak.patches.peak

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PEAK
import java.util.logging.Logger

@Suppress("unused")
val peakBlockAdsPatch = bytecodePatch(
    name = "Block Ads & Workout Interruptions - Peak (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips video commercials between brain games, training session banners, and Pro upsell modals in Peak.",
) {
    compatibleWith(COMPATIBILITY_PEAK)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePeakBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executePeakBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Workout Interruptions patch for Peak...")
    val hooked = executeComprehensiveAdBlock(logger, "Peak")
    logger.info("[Peak Ads] Total ad-blocking hooks applied: $hooked")
}
