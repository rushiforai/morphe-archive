package com.dmoniak.patches.nokoprint

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_NOKOPRINT
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val nokoPrintAdFreePatch = bytecodePatch(
    name = "Ad-Free & Unlimited Printing - NokoPrint (Experimental)",
    description = "⚠️ [Experimental / Untested] Removes interstitial ads shown when generating print spools, strips bottom ad banners, and unlocks unlimited multi-page document printing in NokoPrint.",
) {
    compatibleWith(COMPATIBILITY_NOKOPRINT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeNokoPrintAdFreeLogic(logger)
    }
}

fun BytecodePatchContext.executeNokoPrintAdFreeLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Unlimited Printing patch for NokoPrint...")
    var hooked = executeComprehensiveAdBlock(logger, "NokoPrint")
    hooked += executeGooglePlayBillingBypass(logger, "NokoPrint")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("ad") || tl.contains("premium") || tl.contains("license") || tl.contains("print")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "ispremium" || mName == "isadfree" || mName == "canprintunlimited") && retType == "Z") {
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
                        logger.fine("[NokoPrint] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[NokoPrint] Total hooks applied: $hooked")
}
