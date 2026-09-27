package com.dmoniak.patches.mxplayer

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MX_PLAYER
import java.util.logging.Logger

@Suppress("unused")
val mxPlayerAdFreePatch = bytecodePatch(
    name = "Ad-Free & Pure Player - MX Player (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips all banner ads on the main folder list, full-screen interstitial video ads upon pausing or exiting videos, and online OTT feed promotions by neutralizing ad SDK calls.",
) {
    compatibleWith(COMPATIBILITY_MX_PLAYER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMXPlayerAdFreeLogic(logger)
    }
}

fun BytecodePatchContext.executeMXPlayerAdFreeLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Pure Player patch for MX Player...")
    val hooked = executeComprehensiveAdBlock(logger, "MXPlayer")
    logger.info("[MX Player Ads] Total ad-blocking hooks applied: $hooked")
}
