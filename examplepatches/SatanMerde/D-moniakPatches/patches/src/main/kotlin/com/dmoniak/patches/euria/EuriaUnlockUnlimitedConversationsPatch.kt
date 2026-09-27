package com.dmoniak.patches.euria

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_EURIA
import java.util.logging.Logger

@Suppress("unused")
val euriaUnlockUnlimitedConversationsPatch = bytecodePatch(
    name = "Unlock Unlimited Conversations & Memory - Euria AI (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing to bypass in-app subscription checks for Infomaniak Euria AI (enabling extended context and persistent conversation history).",
) {
    compatibleWith(COMPATIBILITY_EURIA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeEuriaUnlockUnlimitedConversationsLogic(logger)
    }
}

fun BytecodePatchContext.executeEuriaUnlockUnlimitedConversationsLogic(logger: Logger) {
    logger.info("Executing Unlock Unlimited Conversations patch for Euria AI...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "Euria")
    logger.info("[Euria AI] Total billing hooks applied: $hookedPoints")
}
