package com.dmoniak.patches.subwaysurfers

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SUBWAY_SURFERS
import java.util.logging.Logger

@Suppress("unused")
val subwaySurfersUnlockCharactersBoardsPatch = bytecodePatch(
    name = "Free Shopping & Billing Bypass - Subway Surfers (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing SDK in Subway Surfers to bypass in-app purchase verification, enabling free purchases of coin packs, key bundles, and store items.",
) {
    compatibleWith(COMPATIBILITY_SUBWAY_SURFERS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSubwaySurfersUnlockCharactersBoardsLogic(logger)
    }
}

fun BytecodePatchContext.executeSubwaySurfersUnlockCharactersBoardsLogic(logger: Logger) {
    logger.info("Executing Free Shopping & Billing Bypass patch for Subway Surfers...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "SubwaySurfers")
    logger.info("[SubwaySurfers Billing] Total billing hooks applied: $hookedPoints")
}
