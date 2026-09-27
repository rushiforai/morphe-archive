package com.dmoniak.patches.turbovpn

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TURBO_VPN
import java.util.logging.Logger

@Suppress("unused")
val turboVpnAdFreePatch = bytecodePatch(
    name = "Ad-Free Turbo VPN (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Removes full-screen video ads on connect and disconnect, banner ads at the bottom of the interface, and intrusive interstitial popups by intercepting ad SDK calls.",
) {
    compatibleWith(COMPATIBILITY_TURBO_VPN)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTurboVpnAdFreeLogic(logger)
    }
}

fun BytecodePatchContext.executeTurboVpnAdFreeLogic(logger: Logger) {
    logger.info("Executing Ad-Free patch for Turbo VPN...")
    val hooked = executeComprehensiveAdBlock(logger, "TurboVPN")
    logger.info("[Turbo VPN AdFree] Total ad-blocking hooks applied: $hooked")
}
