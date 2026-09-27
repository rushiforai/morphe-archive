package com.dmoniak.patches.flightradar24

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FLIGHTRADAR24
import java.util.logging.Logger

@Suppress("unused")
val flightradar24BlockAdsPatch = bytecodePatch(
    name = "Block Ads & Map Banners - Flightradar24 (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips bottom map banner ads, interstitial aircraft viewing promos, and full-screen ads in Flightradar24.",
) {
    compatibleWith(COMPATIBILITY_FLIGHTRADAR24)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeFlightradar24BlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeFlightradar24BlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Map Banners patch for Flightradar24...")
    val hooked = executeComprehensiveAdBlock(logger, "Flightradar24")
    logger.info("[Flightradar24 Ads] Total ad-blocking hooks applied: $hooked")
}
