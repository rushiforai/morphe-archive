package com.dmoniak.patches.pvz

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PLANTS_VS_ZOMBIES
import java.util.logging.Logger

@Suppress("unused")
val pvzUnlockMiniGamesSurvivalPatch = bytecodePatch(
    name = "Free Shopping & Billing Bypass - Plants vs. Zombies (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing SDK in Plants vs. Zombies to bypass in-app purchase verification, enabling free shopping for coin packs, Crazy Dave's shop upgrades, and game mode passes.",
) {
    compatibleWith(COMPATIBILITY_PLANTS_VS_ZOMBIES)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePvZUnlockMiniGamesSurvivalLogic(logger)
    }
}

fun BytecodePatchContext.executePvZUnlockMiniGamesSurvivalLogic(logger: Logger) {
    logger.info("Executing Free Shopping & Billing Bypass patch for Plants vs. Zombies...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "PvZ")
    logger.info("[PvZ Billing] Total billing hooks applied: $hookedPoints")
}
