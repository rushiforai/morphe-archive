package com.dmoniak.patches.myfitnesspal

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MYFITNESSPAL
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val myFitnessPalAdFreePremiumPatch = bytecodePatch(
    name = "Ad-Free & Premium Nutrition - MyFitnessPal (Experimental)",
    description = "⚠️ [Experimental / Untested] Removes sponsored food cards, bottom banner ads, and hooks client-side Premium subscription status for custom macronutrient goals in MyFitnessPal.",
) {
    compatibleWith(COMPATIBILITY_MYFITNESSPAL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMyFitnessPalAdFreePremiumLogic(logger)
    }
}

fun BytecodePatchContext.executeMyFitnessPalAdFreePremiumLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Premium Nutrition patch for MyFitnessPal...")
    var hooked = executeComprehensiveAdBlock(logger, "MyFitnessPal")
    hooked += executeGooglePlayBillingBypass(logger, "MyFitnessPal")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("premium") || tl.contains("subscription") || tl.contains("ad") || tl.contains("featureflag")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "ispremium" || mName == "haspremium" || mName == "ispremiumsubscriber" || mName == "isadfree") && retType == "Z") {
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
                        logger.fine("[MyFitnessPal] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[MyFitnessPal] Total hooks applied: $hooked")
}

