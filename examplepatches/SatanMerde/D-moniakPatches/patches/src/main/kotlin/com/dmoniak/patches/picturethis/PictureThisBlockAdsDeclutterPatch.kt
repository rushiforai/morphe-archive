package com.dmoniak.patches.picturethis

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PICTURE_THIS
import java.util.logging.Logger

@Suppress("unused")
val pictureThisBlockAdsDeclutterPatch = bytecodePatch(
    name = "Block Ads & Promo Popups - PictureThis (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Disables post-identification ads, continuous subscription reminder dialogs, and banner ads in PictureThis.",
) {
    compatibleWith(COMPATIBILITY_PICTURE_THIS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePictureThisBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executePictureThisBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Promo Popups patch for PictureThis...")
    val hooked = executeComprehensiveAdBlock(logger, "PictureThis")
    logger.info("[PictureThis Ads] Total ad-blocking hooks applied: $hooked")
}
