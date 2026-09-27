package com.dmoniak.patches.alltrails

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_ALLTRAILS
import java.util.logging.Logger

@Suppress("unused")
val allTrailsUnlockPlusPatch = bytecodePatch(
    name = "Unlock AllTrails+ & Offline Maps - AllTrails (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing to bypass in-app purchase verification for AllTrails+ (offline topo map downloads, wrong-turn navigation alerts, and 3D trail previews).",
) {
    compatibleWith(COMPATIBILITY_ALLTRAILS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeAllTrailsUnlockPlusLogic(logger)
    }
}

fun BytecodePatchContext.executeAllTrailsUnlockPlusLogic(logger: Logger) {
    logger.info("Executing Unlock AllTrails+ patch for AllTrails...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "AllTrails")
    logger.info("[AllTrails Plus] Total billing hooks applied: $hookedPoints")
}
