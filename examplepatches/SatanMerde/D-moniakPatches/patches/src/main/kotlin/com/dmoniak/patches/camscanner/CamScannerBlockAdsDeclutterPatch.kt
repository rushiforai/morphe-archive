package com.dmoniak.patches.camscanner

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CAMSCANNER
import java.util.logging.Logger

@Suppress("unused")
val camScannerBlockAdsDeclutterPatch = bytecodePatch(
    name = "Block Ads & Declutter UI - CamScanner (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips post-export full-screen video ads, home feed banner promotions, and upgrade popups in CamScanner.",
) {
    compatibleWith(COMPATIBILITY_CAMSCANNER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCamScannerBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeCamScannerBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Declutter UI patch for CamScanner...")
    val hooked = executeComprehensiveAdBlock(logger, "CamScanner")
    logger.info("[CamScanner Ads] Total ad-blocking hooks applied: $hooked")
}
