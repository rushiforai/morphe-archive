package com.dmoniak.patches.letterboxd

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_LETTERBOXD
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val letterboxdAdFreePatch = bytecodePatch(
    name = "Ad-Free & Clean Interface - Letterboxd (Experimental)",
    description = "⚠️ [Experimental / Untested] Removes in-app banner ads, sponsored film promo carousels, and recurring Pro/Patron subscription prompts across the Letterboxd home feed and film detail screens.",
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeLetterboxdAdFreeLogic(logger)
    }
}

fun BytecodePatchContext.executeLetterboxdAdFreeLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Clean Interface patch for Letterboxd...")
    var hooked = executeComprehensiveAdBlock(logger, "Letterboxd")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        // Target ad container / promo card visibility checks
        if (tl.contains("ad") || tl.contains("promo") || tl.contains("patron") || tl.contains("upsell")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "isadvisible" || mName == "showads" || mName == "shouldshowpromo") && retType == "Z") {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = """
                                const/4 v0, 0x0
                                return v0
                            """.trimIndent()
                        )
                        hooked++
                    } catch (e: Exception) {
                        logger.fine("[Letterboxd Ad] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Letterboxd Ads] Total hooks applied: $hooked")
}

