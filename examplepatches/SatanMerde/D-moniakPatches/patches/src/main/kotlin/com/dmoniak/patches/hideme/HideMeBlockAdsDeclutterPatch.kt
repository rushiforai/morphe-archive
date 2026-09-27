package com.dmoniak.patches.hideme

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HIDE_ME
import java.util.logging.Logger

@Suppress("unused")
val hideMeBlockAdsDeclutterPatch = bytecodePatch(
    name = "Block Ads & Declutter UI - hide.me VPN (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Disables promotional banners, interstitial upgrade dialogs, and video interruptions in hide.me VPN.",
) {
    compatibleWith(COMPATIBILITY_HIDE_ME)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeHideMeBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeHideMeBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Declutter UI patch for hide.me VPN...")
    val hooked = executeComprehensiveAdBlock(logger, "HideMe")
    logger.info("[HideMe Ads] Total ad-blocking hooks applied: $hooked")
}
