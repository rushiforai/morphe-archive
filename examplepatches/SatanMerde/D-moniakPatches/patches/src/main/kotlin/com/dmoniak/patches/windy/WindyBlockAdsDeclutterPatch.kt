package com.dmoniak.patches.windy

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_WINDY
import java.util.logging.Logger

@Suppress("unused")
val windyBlockAdsDeclutterPatch = bytecodePatch(
    name = "Block Ads & Promo Screens - Windy.com (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Disables intrusive promotional banners, interstitial offers, and upgrade screens in Windy.com.",
) {
    compatibleWith(COMPATIBILITY_WINDY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeWindyBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeWindyBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Promo Screens patch for Windy.com...")
    val hooked = executeComprehensiveAdBlock(logger, "Windy")
    logger.info("[Windy Ads] Total ad-blocking hooks applied: $hooked")
}
