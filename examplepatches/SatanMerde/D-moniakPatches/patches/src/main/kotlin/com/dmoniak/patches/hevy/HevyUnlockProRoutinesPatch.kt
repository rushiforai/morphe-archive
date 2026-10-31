package com.dmoniak.patches.hevy

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HEVY
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val hevyUnlockProRoutinesPatch = bytecodePatch(
    name = "Unlock Pro & Custom Routines - Hevy (Experimental)",
    description = "⚠️ [Experimental / Untested] Hooks Google Play Billing and subscription status in Hevy to unlock client-side Pro perks, unlimited custom workout routines, and advanced graph analytics.",
) {
    compatibleWith(COMPATIBILITY_HEVY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeHevyUnlockProRoutinesLogic(logger)
    }
}

fun BytecodePatchContext.executeHevyUnlockProRoutinesLogic(logger: Logger) {
    logger.info("Executing Unlock Pro & Custom Routines patch for Hevy...")
    var hooked = executeGooglePlayBillingBypass(logger, "Hevy")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("pro") || tl.contains("user") || tl.contains("subscription") || tl.contains("workout")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "ispro" || mName == "ishevypro" || mName == "hasprosubscription" || mName == "cancreateroutine") && retType == "Z") {
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
                        logger.fine("[Hevy Pro] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Hevy Pro] Total hooks applied: $hooked")
}

