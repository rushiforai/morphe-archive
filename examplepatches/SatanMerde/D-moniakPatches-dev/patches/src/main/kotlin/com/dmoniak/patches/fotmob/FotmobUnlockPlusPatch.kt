package com.dmoniak.patches.fotmob

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FOTMOB
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val fotmobUnlockPlusPatch = bytecodePatch(
    name = "Unlock FotMob+ & Ad-Free - FotMob (Experimental)",
    description = "Enables FotMob+ membership, removes banner and fullscreen advertisements, and unlocks live match notifications and priority updates in FotMob.",
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeFotMobUnlockPlusLogic(logger)
    }
}

fun BytecodePatchContext.executeFotMobUnlockPlusLogic(logger: Logger) {
    logger.info("Executing Unlock FotMob+ patch for FotMob (com.mobilefootie.wc2010)...")
    var hookedPoints = 0

    // 1. Google Play Billing Client SDK bypass
    hookedPoints += executeGooglePlayBillingBypass(logger, "FotMob")

    // 2. Comprehensive Ad-blocking engine
    hookedPoints += executeComprehensiveAdBlock(logger, "FotMob")

    // 3. FotMob+ Entitlement & Feature Hooks
    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // Check methods indicating FotMob+ or Supporter status
            val isPlusMethod = (
                mName == "isplus" ||
                mName == "hasplus" ||
                mName == "isfotmobplus" ||
                mName == "issupporter" ||
                mName == "issubscriber" ||
                mName == "hassubscription" ||
                mName == "isadfree" ||
                mName == "ispro" ||
                mName == "ispremium"
            ) && retType == "Z" && pTypes.isEmpty()

            if (isPlusMethod) {
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
                    logger.info("[FotMob+] Hooked membership status ${classDef.type}->${method.name} -> true")
                } catch (e: Exception) {
                    logger.fine("[FotMob+] Skip method hook: ${e.message}")
                }
            }

            // Methods asking whether ads should be displayed
            val isShowAdsCheck = (
                mName == "shouldshowads" ||
                mName == "showads" ||
                mName == "canloadads" ||
                mName == "hasads"
            ) && retType == "Z" && pTypes.isEmpty()

            if (isShowAdsCheck) {
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
                    logger.info("[FotMob+] Hooked ad display check ${classDef.type}->${method.name} -> false")
                } catch (e: Exception) {
                    logger.fine("[FotMob+] Skip ad display hook: ${e.message}")
                }
            }
        }
    }

    logger.info("[FotMob+] Total hooks applied: $hookedPoints")
}

