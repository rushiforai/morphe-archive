package com.dmoniak.patches.dantheman

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_DAN_THE_MAN
import java.util.logging.Logger

@Suppress("unused")
val danTheManUnlimitedCoinsUpgradesPatch = bytecodePatch(
    name = "Free Shopping & Billing Bypass - Dan The Man (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing SDK in Dan The Man to bypass in-app purchase verification, unlocking free shopping for coin packs, character bundles, and premium upgrades.",
) {
    compatibleWith(COMPATIBILITY_DAN_THE_MAN)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeDanTheManUnlimitedCoinsUpgradesLogic(logger)
    }
}

fun BytecodePatchContext.executeDanTheManUnlimitedCoinsUpgradesLogic(logger: Logger) {
    logger.info("Executing Free Shopping & Billing Bypass patch for Dan The Man...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "DanTheMan")
    logger.info("[DanTheMan Billing] Total billing hooks applied: $hookedPoints")
}
