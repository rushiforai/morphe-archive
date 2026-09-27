package com.dmoniak.patches.cuttherope

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CUT_THE_ROPE
import java.util.logging.Logger

@Suppress("unused")
val cutTheRopeUnlockSuperpowersLevelsPatch = bytecodePatch(
    name = "Free Shopping & Billing Bypass - Cut the Rope (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing SDK in Cut the Rope to bypass in-app purchase verification, unlocking free shopping for superpowers, hints, and season box passes.",
) {
    compatibleWith(COMPATIBILITY_CUT_THE_ROPE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCutTheRopeUnlockSuperpowersLevelsLogic(logger)
    }
}

fun BytecodePatchContext.executeCutTheRopeUnlockSuperpowersLevelsLogic(logger: Logger) {
    logger.info("Executing Free Shopping & Billing Bypass patch for Cut the Rope...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "CutTheRope")
    logger.info("[CutTheRope Billing] Total billing hooks applied: $hookedPoints")
}
