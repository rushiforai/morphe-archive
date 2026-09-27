package com.dmoniak.patches.crossyroad

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CROSSY_ROAD
import java.util.logging.Logger

@Suppress("unused")
val crossyRoadUnlockCharactersPatch = bytecodePatch(
    name = "Free Shopping & Billing Bypass - Crossy Road (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing SDK in Crossy Road to bypass in-app purchase verification, enabling free shopping for character figurines and coin packs.",
) {
    compatibleWith(COMPATIBILITY_CROSSY_ROAD)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCrossyRoadUnlockCharactersLogic(logger)
    }
}

fun BytecodePatchContext.executeCrossyRoadUnlockCharactersLogic(logger: Logger) {
    logger.info("Executing Free Shopping & Billing Bypass patch for Crossy Road...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "CrossyRoad")
    logger.info("[CrossyRoad Billing] Total billing hooks applied: $hookedPoints")
}
