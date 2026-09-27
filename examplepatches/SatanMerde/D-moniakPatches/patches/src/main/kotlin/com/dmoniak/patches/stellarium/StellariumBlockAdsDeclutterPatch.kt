package com.dmoniak.patches.stellarium

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_STELLARIUM
import java.util.logging.Logger

@Suppress("unused")
val stellariumBlockAdsDeclutterPatch = bytecodePatch(
    name = "Block Ads & Promo Banners - Stellarium (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips promotional upgrade popups, bottom banner ads, and observation survey prompts in Stellarium Mobile.",
) {
    compatibleWith(COMPATIBILITY_STELLARIUM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeStellariumBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeStellariumBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Promo Banners patch for Stellarium...")
    val hooked = executeComprehensiveAdBlock(logger, "Stellarium")
    logger.info("[Stellarium Ads] Total ad-blocking hooks applied: $hooked")
}
