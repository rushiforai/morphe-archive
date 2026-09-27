package com.dmoniak.patches.fruitninja

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FRUIT_NINJA
import java.util.logging.Logger

@Suppress("unused")
val fruitNinjaUnlockBladesDojosPatch = bytecodePatch(
    name = "Free Shopping & Billing Bypass - Fruit Ninja (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing SDK in Fruit Ninja to bypass in-app purchase verification, unlocking free store purchases for starfruit crates, blade packs, and dojo bundles.",
) {
    compatibleWith(COMPATIBILITY_FRUIT_NINJA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeFruitNinjaUnlockBladesDojosLogic(logger)
    }
}

fun BytecodePatchContext.executeFruitNinjaUnlockBladesDojosLogic(logger: Logger) {
    logger.info("Executing Free Shopping & Billing Bypass patch for Fruit Ninja...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "FruitNinja")
    logger.info("[FruitNinja Billing] Total billing hooks applied: $hookedPoints")
}
