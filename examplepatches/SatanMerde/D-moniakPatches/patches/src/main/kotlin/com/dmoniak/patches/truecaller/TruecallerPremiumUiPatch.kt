package com.dmoniak.patches.truecaller

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import java.util.logging.Logger

@Suppress("unused")
val truecallerPremiumUiPatch = bytecodePatch(
    name = "Unlock Premium & Gold Features - Truecaller (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing to bypass in-app purchase verification for Truecaller Premium and Gold caller ID themes and spam filtering features.",
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTruecallerPremiumUiLogic(logger)
    }
}

fun BytecodePatchContext.executeTruecallerPremiumUiLogic(logger: Logger) {
    logger.info("Executing Unlock Premium & Gold Features patch for Truecaller...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "Truecaller")
    logger.info("[Truecaller Premium] Total billing hooks applied: $hookedPoints")
}
