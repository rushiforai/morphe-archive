package com.dmoniak.patches.blockerhero

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_BLOCKERHERO
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val blockerHeroUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium Custom Blocklists - BlockerHero (Experimental)",
    description = "⚠️ [Experimental / Untested] Hooks Google Play Billing to unlock client-side Premium features in BlockerHero, enabling custom URL keywords, strict uninstall protection, and unlimited app locks.",
) {
    compatibleWith(COMPATIBILITY_BLOCKERHERO)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBlockerHeroUnlockPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executeBlockerHeroUnlockPremiumLogic(logger: Logger) {
    logger.info("Executing Unlock Premium Custom Blocklists patch for BlockerHero...")
    var hooked = executeGooglePlayBillingBypass(logger, "BlockerHero")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("premium") || tl.contains("pro") || tl.contains("subscription") || tl.contains("vip")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "ispremium" || mName == "ispro" || mName == "ispremiumuser" || mName == "hasactiveplan") && retType == "Z") {
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
                        logger.fine("[BlockerHero] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[BlockerHero] Total hooks applied: $hooked")
}
