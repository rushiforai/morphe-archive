package com.dmoniak.patches.photomath

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PHOTOMATH
import java.util.logging.Logger

@Suppress("unused")
val photomathUnlockPlusPatch = bytecodePatch(
    name = "Unlock Photomath Plus - Photomath (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing to bypass in-app subscription verification for Photomath Plus (detailed math explanations, animated tutorials, and textbook solutions).",
) {
    compatibleWith(COMPATIBILITY_PHOTOMATH)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePhotomathUnlockPlusLogic(logger)
    }
}

fun BytecodePatchContext.executePhotomathUnlockPlusLogic(logger: Logger) {
    logger.info("Executing Unlock Plus patch for Photomath...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "Photomath")
    logger.info("[Photomath Plus] Total billing hooks applied: $hookedPoints")
}
