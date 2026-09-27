package com.dmoniak.patches.jetpackjoyride

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_JETPACK_JOYRIDE
import java.util.logging.Logger

@Suppress("unused")
val jetpackJoyrideBlockAdsPatch = bytecodePatch(
    name = "Block Ads & Video Commercials - Jetpack Joyride (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Bloque les publicités vidéo plein écran (interstitiels après crash), les bannières publicitaires et les incitations promotionnelles dans Jetpack Joyride.",
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
