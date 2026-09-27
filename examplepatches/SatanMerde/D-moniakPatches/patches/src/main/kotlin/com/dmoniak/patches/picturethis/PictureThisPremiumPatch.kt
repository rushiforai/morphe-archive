package com.dmoniak.patches.picturethis

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PICTURETHIS
import java.util.logging.Logger

@Suppress("unused")
val pictureThisPremiumPatch = bytecodePatch(
    name = "Unlock Premium & Plant Disease Diagnosis - PictureThis (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play Billing to bypass in-app purchase verification for PictureThis Premium (unlimited plant identifications, disease diagnosis, and care guides).",
) {
    compatibleWith(COMPATIBILITY_PICTURETHIS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePictureThisPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executePictureThisPremiumLogic(logger: Logger) {
    logger.info("Executing Unlock Premium patch for PictureThis...")
    val hookedPoints = executeGooglePlayBillingBypass(logger, "PictureThis")
    logger.info("[PictureThis Premium] Total billing hooks applied: $hookedPoints")
}
