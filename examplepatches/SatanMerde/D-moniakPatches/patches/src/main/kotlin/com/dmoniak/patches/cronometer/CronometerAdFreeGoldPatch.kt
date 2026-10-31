package com.dmoniak.patches.cronometer

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CRONOMETER
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val cronometerAdFreeGoldPatch = bytecodePatch(
    name = "Ad-Free & Gold Features - Cronometer (Experimental)",
    description = "⚠️ [Experimental / Untested] Removes in-app banner ads, diary promotional banners, and hooks client-side Gold membership status for target scheduler and nutrition charts in Cronometer.",
) {
    compatibleWith(COMPATIBILITY_CRONOMETER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCronometerAdFreeGoldLogic(logger)
    }
}

fun BytecodePatchContext.executeCronometerAdFreeGoldLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Gold Features patch for Cronometer...")
    var hooked = executeComprehensiveAdBlock(logger, "Cronometer")
    hooked += executeGooglePlayBillingBypass(logger, "Cronometer")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("gold") || tl.contains("subscription") || tl.contains("user") || tl.contains("ad")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "isgold" || mName == "isgoldsubscriber" || mName == "hasgoldsubscription" || mName == "isadfree") && retType == "Z") {
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
                        logger.fine("[Cronometer Gold] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Cronometer Gold] Total hooks applied: $hooked")
}

