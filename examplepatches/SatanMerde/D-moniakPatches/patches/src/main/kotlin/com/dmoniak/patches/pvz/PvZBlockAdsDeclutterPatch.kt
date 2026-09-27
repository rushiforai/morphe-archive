package com.dmoniak.patches.pvz

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PLANTS_VS_ZOMBIES
import java.util.logging.Logger

@Suppress("unused")
val pvzBlockAdsDeclutterPatch = bytecodePatch(
    name = "Block Ads & Declutter Menus - Plants vs. Zombies (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips interstitial video ads, bottom banners, and promotional popups in Plants vs. Zombies.",
) {
    compatibleWith(COMPATIBILITY_PLANTS_VS_ZOMBIES)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePvZBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executePvZBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Declutter Menus patch for Plants vs. Zombies...")
    val hooked = executeComprehensiveAdBlock(logger, "PvZ")
    logger.info("[PvZ Ads] Total ad-blocking hooks applied: $hooked")
}
