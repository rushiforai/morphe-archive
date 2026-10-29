package com.dmoniak.patches.jetpackjoyride

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_JETPACK_JOYRIDE
import java.util.logging.Logger

@Suppress("unused")
val jetpackJoyrideBlockAdsPatch = bytecodePatch(
    name = "Block Ads & Video Commercials - Jetpack Joyride (Experimental)",
    description = "⚠️ [Experimental / Untested] Strips full-screen video ads (crash interstitials), banner ads, and promotional popups in Jetpack Joyride.",
) {
    compatibleWith(COMPATIBILITY_JETPACK_JOYRIDE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeJetpackJoyrideBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeJetpackJoyrideBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Video Commercials patch for Jetpack Joyride...")
    val hooked = executeComprehensiveAdBlock(logger, "JetpackJoyride")
    logger.info("[JetpackJoyride Ads] Total ad-blocking hooks applied: $hooked")
}
