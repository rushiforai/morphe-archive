package com.dmoniak.patches.speedtest

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SPEEDTEST
import java.util.logging.Logger

@Suppress("unused")
val speedtestAdFreePatch = bytecodePatch(
    name = "Ad-Free Speedtest by Ookla (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Removes post-test video ads, top and bottom banner ads, and sponsored server promotions by neutralizing ad SDK calls.",
) {
    compatibleWith(COMPATIBILITY_SPEEDTEST)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSpeedtestAdFreeLogic(logger)
    }
}

fun BytecodePatchContext.executeSpeedtestAdFreeLogic(logger: Logger) {
    logger.info("Executing Ad-Free patch for Speedtest by Ookla...")
    val hooked = executeComprehensiveAdBlock(logger, "Speedtest")
    logger.info("[Speedtest Ads] Total ad-blocking hooks applied: $hooked")
}
