package com.dmoniak.patches.shroomid

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SHROOMID
import java.util.logging.Logger

val shroomIDAdFreePatch = bytecodePatch(
    name = "Ad-Free & Clean Experience - ShroomID (Experimental)",
    description = "Removes in-app Google Mobile Ads (interstitial, rewarded, and banner ads) for an uninterrupted mushroom foraging experience.",
) {
    compatibleWith(COMPATIBILITY_SHROOMID)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShroomIDAdFreeLogic(logger)
    }
}

fun BytecodePatchContext.executeShroomIDAdFreeLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Clean Experience patch for ShroomID (com.shroomid)...")
    val adHooks = executeComprehensiveAdBlock(logger, "ShroomID")
    logger.info("[ShroomID AdBlock] Successfully applied $adHooks ad-blocking hooks.")
}
