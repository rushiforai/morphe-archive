package com.dmoniak.patches.vpnlat

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_VPN_LAT
import java.util.logging.Logger

@Suppress("unused")
val vpnLatBlockAdsPatch = bytecodePatch(
    name = "Block Ads & Video Interruptions - VPN.lat (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips full-screen video ads on server connection/disconnection, bottom banner ads, and nag popups in VPN.lat.",
) {
    compatibleWith(COMPATIBILITY_VPN_LAT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeVpnLatBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeVpnLatBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Video Interruptions patch for VPN.lat...")
    val hooked = executeComprehensiveAdBlock(logger, "VPN.lat")
    logger.info("[VPN.lat Ads] Total ad-blocking hooks applied: $hooked")
}
