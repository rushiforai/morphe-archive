package com.dmoniak.patches.doodlejump

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_DOODLE_JUMP
import java.util.logging.Logger

@Suppress("unused")
val doodleJumpUnlockThemesOutfitsPatch = bytecodePatch(
    name = "Free Shopping & Billing Bypass - Doodle Jump (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing SDK in Doodle Jump to bypass in-app purchase verification, enabling free shopping for premium themes, outfits, and power-up packs.",
) {
    compatibleWith(COMPATIBILITY_DOODLE_JUMP)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeDoodleJumpUnlockThemesOutfitsLogic(logger)
    }
}

fun BytecodePatchContext.executeDoodleJumpUnlockThemesOutfitsLogic(logger: Logger) {
    logger.info("Executing Free Shopping & Billing Bypass patch for Doodle Jump...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "DoodleJump")
    logger.info("[DoodleJump Billing] Total billing hooks applied: $hookedPoints")
}
