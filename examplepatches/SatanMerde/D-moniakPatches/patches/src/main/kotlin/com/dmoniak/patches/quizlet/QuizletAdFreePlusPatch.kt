package com.dmoniak.patches.quizlet

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_QUIZLET
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val quizletAdFreePlusPatch = bytecodePatch(
    name = "Ad-Free & Plus Features - Quizlet (Experimental)",
    description = "⚠️ [Experimental / Untested] Removes in-app banner ads, study interruption interstitials, and hooks client-side membership verification for Quizlet Plus study features.",
) {
    compatibleWith(COMPATIBILITY_QUIZLET)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeQuizletAdFreePlusLogic(logger)
    }
}

fun BytecodePatchContext.executeQuizletAdFreePlusLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Plus Features patch for Quizlet...")
    var hooked = executeComprehensiveAdBlock(logger, "Quizlet")
    hooked += executeGooglePlayBillingBypass(logger, "Quizlet")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("user") || tl.contains("subscription") || tl.contains("tier") || tl.contains("membership")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "isplususer" || mName == "hasplussubscription" || mName == "ispremium") && retType == "Z") {
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
                        logger.fine("[Quizlet Tier] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Quizlet Plus] Total hooks applied: $hooked")
}

