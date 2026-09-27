package com.dmoniak.patches.terabox

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TERABOX
import java.util.logging.Logger

@Suppress("unused")
val teraBoxAdBlockDeclutterPatch = bytecodePatch(
    name = "Block Ads & Hide VIP Nags - TeraBox (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips video startup ads, cloud storage interstitial banners, and persistent TeraBox Premium VIP subscription nag popups by neutralizing ad SDK calls.",
) {
    compatibleWith(COMPATIBILITY_TERABOX)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTeraBoxAdBlockDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeTeraBoxAdBlockDeclutterLogic(logger: Logger) {
    logger.info("Executing Block Ads & Hide VIP Nags patch for TeraBox...")
    val hooked = executeComprehensiveAdBlock(logger, "TeraBox")
    logger.info("[TeraBox Ads] Total ad-blocking hooks applied: $hooked")
}
