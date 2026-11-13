package com.dmoniak.patches.pocketcasts

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_POCKET_CASTS
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val pocketCastsAmoledThemePatch = bytecodePatch(
    name = "Pure AMOLED Dark Theme & Plus Perks - Pocket Casts (Experimental)",
    description = "⚠️ [Experimental / Untested] Enforces a true #000000 AMOLED Extra Dark theme across podcast player, episode filters, and discovery feed, and unlocks client-side Plus icon customization in Pocket Casts.",
) {
    compatibleWith(COMPATIBILITY_POCKET_CASTS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePocketCastsAmoledThemeLogic(logger)
    }
}

fun BytecodePatchContext.executePocketCastsAmoledThemeLogic(logger: Logger) {
    logger.info("Executing Pure AMOLED Dark Theme patch for Pocket Casts...")
    var hooked = executeGooglePlayBillingBypass(logger, "Pocket Casts")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("theme") || tl.contains("plus") || tl.contains("subscription") || tl.contains("patron")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "isplususer" || mName == "hasplus" || mName == "useextradarktheme") && retType == "Z") {
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
                        logger.fine("[Pocket Casts] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Pocket Casts] Total hooks applied: $hooked")
}
