package com.dmoniak.patches.pinterest

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PINTEREST
import java.util.logging.Logger

@Suppress("unused")
val pinterestAdBlockPatch = bytecodePatch(
    name = "Block Promoted Pins & Ads - Pinterest (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips sponsored / promoted pins from the home and search feeds, shopping recommendation popups, and interstitial ad banners by neutralizing ad SDK calls.",
) {
    compatibleWith(COMPATIBILITY_PINTEREST)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePinterestAdBlockLogic(logger)
    }
}

fun BytecodePatchContext.executePinterestAdBlockLogic(logger: Logger) {
    logger.info("Executing Block Promoted Pins & Ads patch for Pinterest...")
    val hooked = executeComprehensiveAdBlock(logger, "Pinterest")
    logger.info("[Pinterest Ads] Total ad-blocking hooks applied: $hooked")
}
