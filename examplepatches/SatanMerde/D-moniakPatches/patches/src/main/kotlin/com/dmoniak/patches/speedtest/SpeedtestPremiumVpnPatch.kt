package com.dmoniak.patches.speedtest

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SPEEDTEST
import java.util.logging.Logger

@Suppress("unused")
val speedtestPremiumVpnPatch = bytecodePatch(
    name = "Premium VPN & Unlimited Data - Speedtest by Ookla (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing to bypass in-app purchase verification for Speedtest VPN Premium (unlimited bandwidth indicators and server location selection).",
) {
    compatibleWith(COMPATIBILITY_SPEEDTEST)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSpeedtestPremiumVpnLogic(logger)
    }
}

fun BytecodePatchContext.executeSpeedtestPremiumVpnLogic(logger: Logger) {
    logger.info("Executing Premium VPN patch for Speedtest by Ookla...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "Speedtest")
    logger.info("[Speedtest VPN] Total billing hooks applied: $hookedPoints")
}
