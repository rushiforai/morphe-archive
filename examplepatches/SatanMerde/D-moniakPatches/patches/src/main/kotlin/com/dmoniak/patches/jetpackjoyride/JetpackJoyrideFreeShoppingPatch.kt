package com.dmoniak.patches.jetpackjoyride

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_JETPACK_JOYRIDE
import java.util.logging.Logger

@Suppress("unused")
val jetpackJoyrideFreeShoppingPatch = bytecodePatch(
    name = "Free Shopping & Billing Bypass - Jetpack Joyride (Experimental)",
    description = "⚠️ [Experimental / Untested] Hooks Google Play Billing purchase verification in Jetpack Joyride to unlock coin packs, permanent coin doubler, jetpacks, costumes, and Stash upgrades for free.",
) {
    compatibleWith(COMPATIBILITY_JETPACK_JOYRIDE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeJetpackJoyrideFreeShoppingLogic(logger)
    }
}

fun BytecodePatchContext.executeJetpackJoyrideFreeShoppingLogic(logger: Logger) {
    logger.info("Executing Free Shopping & Billing Bypass patch for Jetpack Joyride...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "JetpackJoyride")
    logger.info("[JetpackJoyride Billing] Total billing hooks applied: $hookedPoints")
}
