package com.dmoniak.patches.angrybirds

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_ANGRY_BIRDS_CLASSIC
import java.util.logging.Logger

@Suppress("unused")
val angryBirdsUnlockPowerupsLevelsPatch = bytecodePatch(
    name = "Free Shopping & Billing Bypass - Angry Birds (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing SDK in Angry Birds to bypass in-app purchase verification, unlocking free shopping for Mighty Eagle, power-up bundles, and episode packs.",
) {
    compatibleWith(COMPATIBILITY_ANGRY_BIRDS_CLASSIC)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeAngryBirdsUnlockPowerupsLevelsLogic(logger)
    }
}

fun BytecodePatchContext.executeAngryBirdsUnlockPowerupsLevelsLogic(logger: Logger) {
    logger.info("Executing Free Shopping & Billing Bypass patch for Angry Birds...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "AngryBirds")
    logger.info("[AngryBirds Billing] Total billing hooks applied: $hookedPoints")
}
