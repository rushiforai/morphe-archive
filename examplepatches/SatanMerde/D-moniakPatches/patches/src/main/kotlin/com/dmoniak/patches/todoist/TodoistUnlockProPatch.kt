package com.dmoniak.patches.todoist

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TODOIST
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val todoistUnlockProPatch = bytecodePatch(
    name = "Unlock Pro Features & Layouts - Todoist (Experimental)",
    description = "⚠️ [Experimental / Untested] Hooks Google Play Billing and subscription status in Todoist to unlock client-side Pro features, custom theme palettes, unlimited task reminders, and full activity logs.",
) {
    compatibleWith(COMPATIBILITY_TODOIST)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTodoistUnlockProLogic(logger)
    }
}

fun BytecodePatchContext.executeTodoistUnlockProLogic(logger: Logger) {
    logger.info("Executing Unlock Pro Features patch for Todoist...")
    var hooked = executeGooglePlayBillingBypass(logger, "Todoist")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("pro") || tl.contains("premium") || tl.contains("user") || tl.contains("tier")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "ispremium" || mName == "ispro" || mName == "hasprosubscription") && retType == "Z") {
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
                        logger.fine("[Todoist Pro] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Todoist Pro] Total hooks applied: $hooked")
}
