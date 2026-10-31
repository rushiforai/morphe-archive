package com.dmoniak.patches.imdb

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_IMDB
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val imdbAdFreePatch = bytecodePatch(
    name = "Ad-Free & Clean Interface - IMDb (Experimental)",
    description = "⚠️ [Experimental / Untested] Strips banner ads, sponsored recommendation cards, interstitial popups, and video pre-roll advertisements before movie and TV show trailers in IMDb.",
) {
    compatibleWith(COMPATIBILITY_IMDB)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeIMDbAdFreeLogic(logger)
    }
}

fun BytecodePatchContext.executeIMDbAdFreeLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Clean Interface patch for IMDb...")
    var hooked = executeComprehensiveAdBlock(logger, "IMDb")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        // Target trailer ad pre-roll controllers & sponsored cards
        if (tl.contains("trailer") || tl.contains("videoplayer") || tl.contains("sponsored") || tl.contains("preroll")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "haspreroll" || mName == "isprerollad" || mName == "shouldshowads" || mName == "isadshowing") && retType == "Z") {
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
                        logger.fine("[IMDb Ad] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[IMDb Ads] Total hooks applied: $hooked")
}

