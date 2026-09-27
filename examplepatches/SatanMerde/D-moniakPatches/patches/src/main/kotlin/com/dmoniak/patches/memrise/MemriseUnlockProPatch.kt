package com.dmoniak.patches.memrise

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MEMRISE
import java.util.logging.Logger

@Suppress("unused")
val memriseUnlockProPatch = bytecodePatch(
    name = "Unlock Memrise Pro - Memrise (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing to bypass in-app purchase verification for Memrise Pro (all language courses, Learn with Locals clips, and grammar bot).",
) {
    compatibleWith(COMPATIBILITY_MEMRISE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMemriseUnlockProLogic(logger)
    }
}

fun BytecodePatchContext.executeMemriseUnlockProLogic(logger: Logger) {
    logger.info("Executing Unlock Pro patch for Memrise...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "Memrise")
    logger.info("[Memrise Pro] Total billing hooks applied: $hookedPoints")
}
