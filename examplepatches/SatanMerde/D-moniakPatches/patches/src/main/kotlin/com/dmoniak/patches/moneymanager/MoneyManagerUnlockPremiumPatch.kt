package com.dmoniak.patches.moneymanager

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MONEY_MANAGER
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val moneyManagerUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium Features & Passcode - Money Manager (Experimental)",
    description = "⚠️ [Experimental / Untested] Removes in-app banner ads, unlocks unlimited sub-accounts/categories, biometric passcode protection, and PC manager sync in Money Manager.",
) {
    compatibleWith(COMPATIBILITY_MONEY_MANAGER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMoneyManagerUnlockPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executeMoneyManagerUnlockPremiumLogic(logger: Logger) {
    logger.info("Executing Unlock Premium Features patch for Money Manager...")
    var hooked = executeComprehensiveAdBlock(logger, "Money Manager")
    hooked += executeGooglePlayBillingBypass(logger, "Money Manager")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("premium") || tl.contains("vip") || tl.contains("paid") || tl.contains("adfree")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "ispremium" || mName == "ispaid" || mName == "isadfree" || mName == "haslicense") && retType == "Z") {
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
                        logger.fine("[Money Manager] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Money Manager] Total hooks applied: $hooked")
}
