package com.dmoniak.patches.teachmeanatomy

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TEACH_ME_ANATOMY
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val teachMeAnatomyUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium 3D Models & Quizzes - Teach Me Anatomy (Experimental)",
    description = "⚠️ [Experimental / Untested] Removes in-app banner ads, unlocks full 3D bio-digital anatomy cross-sections, clinical articles, and question bank quizzes in Teach Me Anatomy.",
) {
    compatibleWith(COMPATIBILITY_TEACH_ME_ANATOMY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTeachMeAnatomyUnlockPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executeTeachMeAnatomyUnlockPremiumLogic(logger: Logger) {
    logger.info("Executing Unlock Premium 3D Models patch for Teach Me Anatomy...")
    var hooked = executeComprehensiveAdBlock(logger, "Teach Me Anatomy")
    hooked += executeGooglePlayBillingBypass(logger, "Teach Me Anatomy")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("subscription") || tl.contains("premium") || tl.contains("member") || tl.contains("tier")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "ispremium" || mName == "hasactivesubscription" || mName == "canaccess3d") && retType == "Z") {
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
                        logger.fine("[TeachMeAnatomy] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[TeachMeAnatomy] Total hooks applied: $hooked")
}
