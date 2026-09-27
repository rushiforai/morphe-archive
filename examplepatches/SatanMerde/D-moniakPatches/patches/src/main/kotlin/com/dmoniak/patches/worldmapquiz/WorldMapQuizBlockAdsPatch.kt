package com.dmoniak.patches.worldmapquiz

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_WORLD_MAP_QUIZ
import java.util.logging.Logger

@Suppress("unused")
val worldMapQuizBlockAdsPatch = bytecodePatch(
    name = "Block Ads & Video Interruptions - World Map Quiz (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Eliminates full-screen interstitial video ads between quiz rounds, bottom banners, and promotional reward prompts in World Map Quiz.",
) {
    compatibleWith(COMPATIBILITY_WORLD_MAP_QUIZ)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeWorldMapQuizBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeWorldMapQuizBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Video Interruptions patch for World Map Quiz...")
    val hooked = executeComprehensiveAdBlock(logger, "WorldMapQuiz")
    logger.info("[WorldMapQuiz Ads] Total ad-blocking hooks applied: $hooked")
}
