package com.dmoniak.patches.chess

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CHESS
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val chessAdFreeUnlimitedBotsPatch = bytecodePatch(
    name = "Ad-Free & Unlimited Bot Games - Chess.com (Experimental)",
    description = "⚠️ [Experimental / Untested] Removes interstitial popups after chess matches, banner ads, and hooks client-side bot game limits and custom board themes.",
) {
    compatibleWith(COMPATIBILITY_CHESS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeChessAdFreeUnlimitedBotsLogic(logger)
    }
}

fun BytecodePatchContext.executeChessAdFreeUnlimitedBotsLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Unlimited Bot Games patch for Chess.com...")
    var hooked = executeComprehensiveAdBlock(logger, "Chess.com")
    hooked += executeGooglePlayBillingBypass(logger, "Chess.com")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("bot") || tl.contains("membership") || tl.contains("tier") || tl.contains("ad")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "isdiamondmember" || mName == "isunlimited" || mName == "canplaybot") && retType == "Z") {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = """
                                const/4 v0, 0x1
                                return v0
                            """.trimIndent()
                        )
                        hooked++
                    } catch (e: Exception) {
                        logger.fine("[Chess.com] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Chess.com] Total hooks applied: $hooked")
}

