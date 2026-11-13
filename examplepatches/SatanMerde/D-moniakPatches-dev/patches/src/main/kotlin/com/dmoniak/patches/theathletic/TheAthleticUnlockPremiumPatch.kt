package com.dmoniak.patches.theathletic

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_THE_ATHLETIC
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val theAthleticUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium & Ad-Free - The Athletic (Experimental)",
    description = "Unlocks full access to all articles, exclusive sports stories, in-depth analytical reporting, and eliminates banner and sponsored ads in The Athletic.",
) {
    compatibleWith(COMPATIBILITY_THE_ATHLETIC)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTheAthleticUnlockPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executeTheAthleticUnlockPremiumLogic(logger: Logger) {
    logger.info("Executing Unlock Premium & Ad-Free patch for The Athletic (com.theathletic)...")
    var hookedPoints = 0

    // 1. Google Play Billing Client SDK bypass
    hookedPoints += executeGooglePlayBillingBypass(logger, "The Athletic")

    // 2. Comprehensive Ad-blocking engine
    hookedPoints += executeComprehensiveAdBlock(logger, "The Athletic")

    // 3. Subscription & Paywall state bypass
    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // Boolean getters indicating active subscription or full article entitlement
            val isEntitlementMethod = (
                mName == "issubscribed" ||
                mName == "hassubscription" ||
                mName == "isactivesubscriber" ||
                mName == "ispremium" ||
                mName == "isunlocked" ||
                mName == "canreadarticle" ||
                mName == "hasarticleaccess" ||
                mName == "isarticleunlocked" ||
                mName == "ispaywallbypassed"
            ) && retType == "Z" && pTypes.isEmpty()

            if (isEntitlementMethod) {
                try {
                    replaceMethod(
                        method = method,
                        registerCount = 2,
                        smaliCode = """
                            const/4 v0, 0x1
                            return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[The Athletic] Hooked entitlement ${classDef.type}->${method.name} -> true")
                } catch (e: Exception) {
                    logger.fine("[The Athletic] Skip entitlement hook: ${e.message}")
                }
            }

            // Paywall visibility/locking checks
            val isLockOrPaywallCheck = (
                mName == "shouldshowpaywall" ||
                mName == "islocked" ||
                mName == "isarticlelocked" ||
                mName == "isstorylocked" ||
                mName == "ispaywallvisible" ||
                mName == "requiresloginorpaywall"
            ) && retType == "Z" && pTypes.isEmpty()

            if (isLockOrPaywallCheck) {
                try {
                    replaceMethod(
                        method = method,
                        registerCount = 2,
                        smaliCode = """
                            const/4 v0, 0x0
                            return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[The Athletic] Hooked paywall check ${classDef.type}->${method.name} -> false")
                } catch (e: Exception) {
                    logger.fine("[The Athletic] Skip paywall hook: ${e.message}")
                }
            }
        }
    }

    logger.info("[The Athletic] Total hooks applied: $hookedPoints")
}

