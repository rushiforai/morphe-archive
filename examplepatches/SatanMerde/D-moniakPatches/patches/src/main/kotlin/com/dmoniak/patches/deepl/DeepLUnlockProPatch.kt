package com.dmoniak.patches.deepl

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_DEEPL
import java.util.logging.Logger

@Suppress("unused")
val deepLUnlockProPatch = bytecodePatch(
    name = "Unlock Pro & Formality - DeepL (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing to bypass in-app purchase verification for DeepL Pro (tone and formality selection, extended translation limits, and dictionary features).",
) {
    compatibleWith(COMPATIBILITY_DEEPL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeDeepLUnlockProLogic(logger)
    }
}

fun BytecodePatchContext.executeDeepLUnlockProLogic(logger: Logger) {
    logger.info("Executing Unlock Pro patch for DeepL...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "DeepL")
    logger.info("[DeepL Pro] Total billing hooks applied: $hookedPoints")
}
