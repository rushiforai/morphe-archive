package com.dmoniak.patches.flightradar24

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FLIGHTRADAR24
import java.util.logging.Logger

@Suppress("unused")
val flightradar24UnlockGoldPatch = bytecodePatch(
    name = "Unlock Silver & Gold Features - Flightradar24 (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing to bypass in-app purchase verification for Flightradar24 subscription tiers (Silver & Gold features, 3D views, and aeronautical charts).",
) {
    compatibleWith(COMPATIBILITY_FLIGHTRADAR24)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeFlightradar24UnlockGoldLogic(logger)
    }
}

fun BytecodePatchContext.executeFlightradar24UnlockGoldLogic(logger: Logger) {
    logger.info("Executing Unlock Gold features patch for Flightradar24...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "Flightradar24")
    logger.info("[Flightradar24 Gold] Total billing hooks applied: $hookedPoints")
}
