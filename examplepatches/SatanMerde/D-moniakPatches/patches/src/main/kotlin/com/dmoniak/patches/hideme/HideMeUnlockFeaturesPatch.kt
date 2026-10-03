package com.dmoniak.patches.hideme

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HIDEME
import com.dmoniak.patches.universal.executeUniversalBypassPlayStoreInstallCheckLogic
import java.util.logging.Logger

@Suppress("unused")
val hideMeUnlockFeaturesPatch = bytecodePatch(
    name = "Unlock Client Features & In-App Purchases - hide.me VPN (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing and installer check in hide.me VPN. NOTE: Remote VPN server connections and bandwidth require server-side authentication.",
) {
    compatibleWith(COMPATIBILITY_HIDEME)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeHideMeUnlockFeaturesLogic(logger)
    }
}

fun BytecodePatchContext.executeHideMeUnlockFeaturesLogic(logger: Logger) {
    logger.info("Executing Unlock Client Features patch for hide.me VPN...")
    var hookedPoints = executeGooglePlayBillingBypass(logger, "HideMe")
    executeUniversalBypassPlayStoreInstallCheckLogic(logger)
    logger.info("[hide.me Features] Total hooks applied: $hookedPoints")
}
