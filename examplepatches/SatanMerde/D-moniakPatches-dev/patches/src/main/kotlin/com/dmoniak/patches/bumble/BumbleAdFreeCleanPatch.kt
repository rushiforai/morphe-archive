package com.dmoniak.patches.bumble

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_BUMBLE
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val bumbleAdFreeCleanPatch = bytecodePatch(
    name = "Ad-Free & Clean Dating Interface - Bumble (Experimental)",
    description = "⚠️ [Experimental / Untested] Neutralizes sponsored swipe profiles, bottom banner ads, and suppresses repetitive Bumble Premium / Boost upgrade popups across swipe decks.",
) {
    compatibleWith(COMPATIBILITY_BUMBLE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBumbleAdFreeCleanLogic(logger)
    }
}

fun BytecodePatchContext.executeBumbleAdFreeCleanLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Clean Interface patch for Bumble...")
    var hooked = executeComprehensiveAdBlock(logger, "Bumble")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("ad") || tl.contains("sponsored") || tl.contains("promo") || tl.contains("upsell")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "issponsoredprofile" || mName == "shouldshowads" || mName == "isupsellactive") && retType == "Z") {
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
                        logger.fine("[Bumble Ad] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Bumble Ads] Total hooks applied: $hooked")
}
