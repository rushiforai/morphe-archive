package com.dmoniak.patches.deepl

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_DEEPL
import java.util.logging.Logger

@Suppress("unused")
val deepLBlockAdsDeclutterPatch = bytecodePatch(
    name = "Block Ads & Declutter UI - DeepL (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips promotional banner cards, DeepL Pro upgrade banners, and survey dialogs in DeepL Translate.",
) {
    compatibleWith(COMPATIBILITY_DEEPL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeDeepLBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeDeepLBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Declutter UI patch for DeepL...")
    val hooked = executeComprehensiveAdBlock(logger, "DeepL")
    logger.info("[DeepL Ads] Total ad-blocking hooks applied: $hooked")
}
