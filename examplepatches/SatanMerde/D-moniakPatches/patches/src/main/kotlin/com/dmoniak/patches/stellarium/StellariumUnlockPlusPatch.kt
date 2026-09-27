package com.dmoniak.patches.stellarium

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_STELLARIUM
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_STELLARIUM_ALT
import java.util.logging.Logger

@Suppress("unused")
val stellariumUnlockPlusPatch = bytecodePatch(
    name = "Unlock Plus & Gaia Star Catalog - Stellarium Mobile (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks Stellarium Plus subscription features (Gaia DR3 star catalog, full deep-sky objects, high-res planetary textures, satellite tracking) by hooking Google Play Billing and subscription verification.",
) {
    compatibleWith(COMPATIBILITY_STELLARIUM, COMPATIBILITY_STELLARIUM_ALT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeStellariumUnlockPlusLogic(logger)
    }
}

fun BytecodePatchContext.executeStellariumUnlockPlusLogic(logger: Logger) {
    logger.info("Executing Unlock Plus patch for Stellarium Mobile...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "Stellarium")
    logger.info("[Stellarium Plus] Total billing hooks applied: $hookedPoints")
}
