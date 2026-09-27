package com.dmoniak.patches.peak

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PEAK
import java.util.logging.Logger

@Suppress("unused")
val peakUnlockProPatch = bytecodePatch(
    name = "Unlock Peak Pro - Peak Brain Training (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing to bypass in-app purchase verification for Peak Pro (cognitive brain games, daily workouts, and coach training modules).",
) {
    compatibleWith(COMPATIBILITY_PEAK)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePeakUnlockProLogic(logger)
    }
}

fun BytecodePatchContext.executePeakUnlockProLogic(logger: Logger) {
    logger.info("Executing Unlock Pro patch for Peak...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "Peak")
    logger.info("[Peak Pro] Total billing hooks applied: $hookedPoints")
}
