package com.dmoniak.patches.altosadventure

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_ALTOS_ADVENTURE
import java.util.logging.Logger

@Suppress("unused")
val altosAdventureBypassAdsPatch = bytecodePatch(
    name = "Bypass Rewarded Ads - Alto's Adventure (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips interstitial video ads, death commercials, and promotional popups in Alto's Adventure by neutralizing mediation SDKs.",
) {
    compatibleWith(COMPATIBILITY_ALTOS_ADVENTURE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeAltosAdventureBypassAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeAltosAdventureBypassAdsLogic(logger: Logger) {
    logger.info("Executing Bypass Rewarded Ads patch for Alto's Adventure...")
    val hooked = executeComprehensiveAdBlock(logger, "AltosAdventure")
    logger.info("[AltosAdventure Ads] Total ad-blocking hooks applied: $hooked")
}
