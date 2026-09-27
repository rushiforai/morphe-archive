package com.dmoniak.patches.hideme

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HIDEME
import java.util.logging.Logger

@Suppress("unused")
val hideMeUnlockFeaturesPatch = bytecodePatch(
    name = "Unlock Client Features & In-App Purchases - hide.me VPN (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing to bypass in-app purchase verification for client-side features and subscription state in hide.me VPN.",
) {
    compatibleWith(COMPATIBILITY_HIDEME)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeHideMeUnlockFeaturesLogic(logger)
    }
}

fun BytecodePatchContext.executeHideMeUnlockFeaturesLogic(logger: Logger) {
    logger.info("Executing Unlock Client Features patch for hide.me VPN...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "HideMe")
    logger.info("[hide.me Features] Total billing hooks applied: $hookedPoints")
}
