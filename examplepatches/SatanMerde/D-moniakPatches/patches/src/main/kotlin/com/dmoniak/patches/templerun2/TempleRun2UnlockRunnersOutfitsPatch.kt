package com.dmoniak.patches.templerun2

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TEMPLE_RUN_2
import java.util.logging.Logger

@Suppress("unused")
val templeRun2UnlockRunnersOutfitsPatch = bytecodePatch(
    name = "Free Shopping & Billing Bypass - Temple Run 2 (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing SDK in Temple Run 2 to bypass in-app purchase verification, enabling free shopping for gem packs, coin vaults, and runner bundles.",
) {
    compatibleWith(COMPATIBILITY_TEMPLE_RUN_2)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTempleRun2UnlockRunnersOutfitsLogic(logger)
    }
}

fun BytecodePatchContext.executeTempleRun2UnlockRunnersOutfitsLogic(logger: Logger) {
    logger.info("Executing Free Shopping & Billing Bypass patch for Temple Run 2...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "TempleRun2")
    logger.info("[TempleRun2 Billing] Total billing hooks applied: $hookedPoints")
}
