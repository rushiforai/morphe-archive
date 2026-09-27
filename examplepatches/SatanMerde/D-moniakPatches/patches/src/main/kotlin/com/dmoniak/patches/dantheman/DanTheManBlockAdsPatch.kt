package com.dmoniak.patches.dantheman

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_DAN_THE_MAN
import java.util.logging.Logger

@Suppress("unused")
val danTheManBlockAdsPatch = bytecodePatch(
    name = "Block Ads & Interstitials - Dan The Man (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Eliminates checkpoint video ads, post-stage commercials, and banner ads in Dan The Man.",
) {
    compatibleWith(COMPATIBILITY_DAN_THE_MAN)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeDanTheManBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeDanTheManBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Interstitials patch for Dan The Man...")
    val hooked = executeComprehensiveAdBlock(logger, "DanTheMan")
    logger.info("[DanTheMan Ads] Total ad-blocking hooks applied: $hooked")
}
