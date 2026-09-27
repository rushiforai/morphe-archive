package com.dmoniak.patches.windy

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_WINDY
import java.util.logging.Logger

@Suppress("unused")
val windyUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Windy Premium - Windy.com (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing to bypass in-app purchase verification for Windy Premium (1-hour forecast resolution, extended forecasts, and high-res satellite radar archive).",
) {
    compatibleWith(COMPATIBILITY_WINDY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeWindyUnlockPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executeWindyUnlockPremiumLogic(logger: Logger) {
    logger.info("Executing Unlock Windy Premium patch for Windy.com...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "Windy")
    logger.info("[Windy Premium] Total billing hooks applied: $hookedPoints")
}
