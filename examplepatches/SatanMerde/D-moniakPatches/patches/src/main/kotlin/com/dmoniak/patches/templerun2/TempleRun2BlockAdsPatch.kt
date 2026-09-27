package com.dmoniak.patches.templerun2

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TEMPLE_RUN_2
import java.util.logging.Logger

@Suppress("unused")
val templeRun2BlockAdsPatch = bytecodePatch(
    name = "Block Ads & Death Interstitials - Temple Run 2 (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Eliminates post-death full-screen ads, video revive popups, and banner ads in Temple Run 2 by intercepting mediation SDK calls.",
) {
    compatibleWith(COMPATIBILITY_TEMPLE_RUN_2)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTempleRun2BlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeTempleRun2BlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Death Interstitials patch for Temple Run 2...")
    val hooked = executeComprehensiveAdBlock(logger, "TempleRun2")
    logger.info("[TempleRun2 Ads] Total ad-blocking hooks applied: $hooked")
}
