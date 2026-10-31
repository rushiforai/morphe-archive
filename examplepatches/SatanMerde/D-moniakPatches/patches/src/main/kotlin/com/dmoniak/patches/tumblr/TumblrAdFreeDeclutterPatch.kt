package com.dmoniak.patches.tumblr

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TUMBLR
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val tumblrAdFreeDeclutterPatch = bytecodePatch(
    name = "Block Ads & Declutter Feed - Tumblr (Experimental)",
    description = "⚠️ [Experimental / Untested] Neutralizes sponsored blog posts, promoted radar items, interstitial video ads, and declutters recommendation carousels in Tumblr dashboard feeds.",
) {
    compatibleWith(COMPATIBILITY_TUMBLR)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTumblrAdFreeDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeTumblrAdFreeDeclutterLogic(logger: Logger) {
    logger.info("Executing Block Ads & Declutter Feed patch for Tumblr...")
    var hooked = executeComprehensiveAdBlock(logger, "Tumblr")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("timeline") || tl.contains("post") || tl.contains("sponsored") || tl.contains("advertisement")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "issponsored" || mName == "isadvertisement" || mName == "ispromoted") && retType == "Z") {
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
                        logger.fine("[Tumblr Feed] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Tumblr Ads] Total hooks applied: $hooked")
}

