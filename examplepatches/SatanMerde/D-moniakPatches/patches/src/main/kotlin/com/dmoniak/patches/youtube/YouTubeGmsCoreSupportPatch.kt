package com.dmoniak.patches.youtube

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import com.dmoniak.patches.universal.executeUniversalGmsCoreSupportLogic
import java.util.logging.Logger

@Suppress("unused")
val youtubeGmsCoreSupportPatch = bytecodePatch(
    name = "GmsCore Support - YouTube (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Redirects Google Play Services and account authentication calls to GmsCore (MicroG / app.revanced.android.gms) to allow logging in to YouTube without root.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeYouTubeGmsCoreSupportLogic(logger)
    }
}

fun BytecodePatchContext.executeYouTubeGmsCoreSupportLogic(logger: Logger) {
    logger.info("Executing dedicated GmsCore Support patch for YouTube...")
    executeUniversalGmsCoreSupportLogic(logger)
}
