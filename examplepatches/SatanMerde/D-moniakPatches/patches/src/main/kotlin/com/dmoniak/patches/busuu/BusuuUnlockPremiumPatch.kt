package com.dmoniak.patches.busuu

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_BUSUU
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val busuuUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium Vocabulary & Grammar - Busuu (Experimental)",
    description = "⚠️ [Experimental / Untested] Removes lesson banner ads, unlocks client-side Premium grammar units, Smart Review vocabulary practice, and offline lesson downloads in Busuu.",
) {
    compatibleWith(COMPATIBILITY_BUSUU)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBusuuUnlockPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executeBusuuUnlockPremiumLogic(logger: Logger) {
    logger.info("Executing Unlock Premium Vocabulary & Grammar patch for Busuu...")
    var hooked = executeComprehensiveAdBlock(logger, "Busuu")
    hooked += executeGooglePlayBillingBypass(logger, "Busuu")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("premium") || tl.contains("subscription") || tl.contains("user") || tl.contains("tier")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "ispremium" || mName == "haspremium" || mName == "ispremiumuser" || mName == "canaccesslesson") && retType == "Z") {
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
                        logger.fine("[Busuu Premium] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Busuu Premium] Total hooks applied: $hooked")
}
