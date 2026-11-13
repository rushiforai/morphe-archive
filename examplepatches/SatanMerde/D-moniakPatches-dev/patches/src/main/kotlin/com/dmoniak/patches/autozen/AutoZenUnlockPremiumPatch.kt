package com.dmoniak.patches.autozen

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_AUTOZEN
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val autoZenUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Lifetime Premium & Ad-Free - AutoZen (Experimental)",
    description = "⚠️ [Experimental / Untested] Removes in-car banner ads, unlocks lifetime premium car dashboard navigation, custom speed cameras alerts, and weather radar overlays in AutoZen.",
) {
    compatibleWith(COMPATIBILITY_AUTOZEN)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeAutoZenUnlockPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executeAutoZenUnlockPremiumLogic(logger: Logger) {
    logger.info("Executing Unlock Lifetime Premium patch for AutoZen...")
    var hooked = executeComprehensiveAdBlock(logger, "AutoZen")
    hooked += executeGooglePlayBillingBypass(logger, "AutoZen")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("premium") || tl.contains("pro") || tl.contains("license") || tl.contains("billing")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "ispremium" || mName == "ispro" || mName == "islifetime" || mName == "haslicense") && retType == "Z") {
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
                        logger.fine("[AutoZen Premium] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[AutoZen Premium] Total hooks applied: $hooked")
}
