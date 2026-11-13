package com.dmoniak.patches.picturemushroom

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PICTURE_MUSHROOM
import java.util.logging.Logger

val pictureMushroomAdFreePatch = bytecodePatch(
    name = "Ad-Free & Clean Experience - Picture Mushroom (Experimental)",
    description = "Removes in-app banner ads, interstitials, rewarded ad popups, and sponsored cards in Picture Mushroom.",
) {
    compatibleWith(COMPATIBILITY_PICTURE_MUSHROOM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePictureMushroomAdFreeLogic(logger)
    }
}

fun BytecodePatchContext.executePictureMushroomAdFreeLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Clean Experience patch for Picture Mushroom (com.glority.picturemushroom)...")
    val adHooks = executeComprehensiveAdBlock(logger, "PictureMushroom")
    logger.info("[PictureMushroom AdBlock] Successfully applied $adHooks ad-blocking hooks.")
}
