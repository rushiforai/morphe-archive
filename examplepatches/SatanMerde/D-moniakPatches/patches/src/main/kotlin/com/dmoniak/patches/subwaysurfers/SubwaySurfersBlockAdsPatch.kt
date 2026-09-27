package com.dmoniak.patches.subwaysurfers

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SUBWAY_SURFERS
import java.util.logging.Logger

@Suppress("unused")
val subwaySurfersBlockAdsPatch = bytecodePatch(
    name = "Block Ads & Promotional Popups - Subway Surfers (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips interstitial video ads, post-run banners, forced video revives, and promotional popup screens in Subway Surfers by neutralizing Google Mobile Ads, Unity Ads, and AppLovin mediation.",
) {
    compatibleWith(COMPATIBILITY_SUBWAY_SURFERS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSubwaySurfersBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeSubwaySurfersBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Promotional Popups patch for Subway Surfers...")
    val hooked = executeComprehensiveAdBlock(logger, "SubwaySurfers")
    logger.info("[SubwaySurfers Ads] Total ad-blocking hooks applied: $hooked")
}
