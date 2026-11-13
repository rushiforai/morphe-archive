package com.dmoniak.patches.genius

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GENIUS
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val geniusAdFreeReaderPatch = bytecodePatch(
    name = "Ad-Free Lyrics & Clean Reader - Genius (Experimental)",
    description = "⚠️ [Experimental / Untested] Strips persistent bottom banner ads, video player interstitials, and cleans up promotional merch cards across Genius song lyrics and annotation screens.",
) {
    compatibleWith(COMPATIBILITY_GENIUS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGeniusAdFreeReaderLogic(logger)
    }
}

fun BytecodePatchContext.executeGeniusAdFreeReaderLogic(logger: Logger) {
    logger.info("Executing Ad-Free Lyrics & Clean Reader patch for Genius...")
    var hooked = executeComprehensiveAdBlock(logger, "Genius")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("ad") || tl.contains("banner") || tl.contains("promo") || tl.contains("sponsor")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "shouldshowads" || mName == "isadshowing" || mName == "hasbanner") && retType == "Z") {
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
                        logger.fine("[Genius Ads] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Genius Ads] Total hooks applied: $hooked")
}
