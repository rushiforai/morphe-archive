package com.dmoniak.patches.angrybirds

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_ANGRY_BIRDS_CLASSIC
import java.util.logging.Logger

@Suppress("unused")
val angryBirdsBlockAdsPatch = bytecodePatch(
    name = "Block Ads & Video Commercials - Angry Birds (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Eliminates full-screen video ads between levels, pause screen promos, and banner overlays in Angry Birds.",
) {
    compatibleWith(COMPATIBILITY_ANGRY_BIRDS_CLASSIC)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeAngryBirdsBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeAngryBirdsBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Video Commercials patch for Angry Birds...")
    val hooked = executeComprehensiveAdBlock(logger, "AngryBirds")
    logger.info("[AngryBirds Ads] Total ad-blocking hooks applied: $hooked")
}
