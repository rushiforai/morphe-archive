package com.dmoniak.patches.truecaller

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import java.util.logging.Logger

@Suppress("unused")
val truecallerAdFreePatch = bytecodePatch(
    name = "Ad-Free & Clean Dialer - Truecaller (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Removes intrusive post-call ads, banner ads inside the call history and dialer tabs, and promotional Gold upsells by neutralizing ad SDK calls.",
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTruecallerAdFreeLogic(logger)
    }
}

fun BytecodePatchContext.executeTruecallerAdFreeLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Clean Dialer patch for Truecaller...")
    val hooked = executeComprehensiveAdBlock(logger, "Truecaller")
    logger.info("[Truecaller AdFree] Total ad-blocking hooks applied: $hooked")
}
