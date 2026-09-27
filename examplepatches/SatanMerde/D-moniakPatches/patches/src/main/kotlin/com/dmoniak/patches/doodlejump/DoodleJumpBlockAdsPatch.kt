package com.dmoniak.patches.doodlejump

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_DOODLE_JUMP
import java.util.logging.Logger

@Suppress("unused")
val doodleJumpBlockAdsPatch = bytecodePatch(
    name = "Block Ads & Video Interruptions - Doodle Jump (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips post-game-over interstitials, bottom banner ads, and popup promotions in Doodle Jump.",
) {
    compatibleWith(COMPATIBILITY_DOODLE_JUMP)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeDoodleJumpBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeDoodleJumpBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Video Interruptions patch for Doodle Jump...")
    val hooked = executeComprehensiveAdBlock(logger, "DoodleJump")
    logger.info("[DoodleJump Ads] Total ad-blocking hooks applied: $hooked")
}
