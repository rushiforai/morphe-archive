package com.dmoniak.patches.soundcloud

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SOUNDCLOUD
import java.util.logging.Logger

@Suppress("unused")
val soundCloudAdBlockPatch = bytecodePatch(
    name = "Block Audio & Stream Ads - SoundCloud (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Bypasses interstitial audio ads between music tracks and removes sponsored promoted tracks from the SoundCloud audio stream by intercepting mediation SDK calls.",
) {
    compatibleWith(COMPATIBILITY_SOUNDCLOUD)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSoundCloudAdBlockLogic(logger)
    }
}

fun BytecodePatchContext.executeSoundCloudAdBlockLogic(logger: Logger) {
    logger.info("Executing Block Audio & Stream Ads patch for SoundCloud...")
    val hooked = executeComprehensiveAdBlock(logger, "SoundCloud")
    logger.info("[SoundCloud Ads] Total ad-blocking hooks applied: $hooked")
}
