package com.dmoniak.patches.shazam

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SHAZAM
import java.util.logging.Logger

@Suppress("unused")
val shazamAdFreePatch = bytecodePatch(
    name = "Ad-Free & Clean Interface - Shazam (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips post-recognition banner ads, sponsored track cards, and Apple Music / Spotify subscription nags by neutralizing ad SDK calls.",
) {
    compatibleWith(COMPATIBILITY_SHAZAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShazamAdFreeLogic(logger)
    }
}

fun BytecodePatchContext.executeShazamAdFreeLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Clean Interface patch for Shazam...")
    val hooked = executeComprehensiveAdBlock(logger, "Shazam")
    logger.info("[Shazam Ads] Total ad-blocking hooks applied: $hooked")
}
