package com.dmoniak.patches.camscanner

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CAMSCANNER
import java.util.logging.Logger

@Suppress("unused")
val camScannerUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium & Remove Watermarks - CamScanner (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing and subscription verification to unlock Premium scan quality, PDF watermark removal, and OCR export in CamScanner.",
) {
    compatibleWith(COMPATIBILITY_CAMSCANNER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCamScannerUnlockPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executeCamScannerUnlockPremiumLogic(logger: Logger) {
    logger.info("Executing Unlock Premium patch for CamScanner...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "CamScanner")
    logger.info("[CamScanner Premium] Total billing hooks applied: $hookedPoints")
}
