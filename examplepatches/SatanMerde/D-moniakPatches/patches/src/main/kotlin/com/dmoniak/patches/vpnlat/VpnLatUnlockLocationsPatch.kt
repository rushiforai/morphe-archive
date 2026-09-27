package com.dmoniak.patches.vpnlat

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_VPN_LAT
import java.util.logging.Logger

@Suppress("unused")
val vpnLatUnlockLocationsPatch = bytecodePatch(
    name = "Unlock Premium Server Locations - VPN.lat (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing to bypass VIP subscription verification for premium server locations and ad-free connections in VPN.lat.",
) {
    compatibleWith(COMPATIBILITY_VPN_LAT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeVpnLatUnlockLocationsLogic(logger)
    }
}

fun BytecodePatchContext.executeVpnLatUnlockLocationsLogic(logger: Logger) {
    logger.info("Executing Unlock Premium Server Locations patch for VPN.lat...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "VPN.lat")
    logger.info("[VPN.lat VIP] Total billing hooks applied: $hookedPoints")
}
