package com.dmoniak.patches.waze

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_WAZE
import java.util.logging.Logger

@Suppress("unused")
val wazeZeroSpeedAdsPatch = bytecodePatch(
    name = "Block Zero-Speed Ads & Sponsored Pins - Waze (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Prevents full-screen commercial banner popups from appearing when the vehicle is stopped at traffic lights or in congestion, and hides sponsored venue pins by neutralizing ad mediation SDKs.",
) {
    compatibleWith(COMPATIBILITY_WAZE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeWazeZeroSpeedAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeWazeZeroSpeedAdsLogic(logger: Logger) {
    logger.info("Executing Block Zero-Speed Ads patch for Waze...")
    val hooked = executeComprehensiveAdBlock(logger, "Waze")
    logger.info("[Waze Ads] Total ad-blocking hooks applied: $hooked")
}
