package com.dmoniak.patches.alltrails

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_ALLTRAILS
import java.util.logging.Logger

@Suppress("unused")
val allTrailsBlockAdsPatch = bytecodePatch(
    name = "Block Ads & Promo Screens - AllTrails (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips promotional trail banners, Plus upgrade nags, and interstitial ads in AllTrails.",
) {
    compatibleWith(COMPATIBILITY_ALLTRAILS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeAllTrailsBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeAllTrailsBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Promo Screens patch for AllTrails...")
    val hooked = executeComprehensiveAdBlock(logger, "AllTrails")
    logger.info("[AllTrails Ads] Total ad-blocking hooks applied: $hooked")
}
