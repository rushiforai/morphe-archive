package com.dmoniak.patches.poweramp

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_POWERAMP
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val powerampUnlockFullPatch = bytecodePatch(
    name = "Unlock Full Version & Feature Pack - Poweramp (Experimental)",
    description = "⚠️ [Experimental / Untested] Neutralizes trial expiration timers, unlocks the full version license state, and enables Hi-Res audio output plugins in Poweramp.",
) {
    compatibleWith(COMPATIBILITY_POWERAMP)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePowerampUnlockFullLogic(logger)
    }
}

fun BytecodePatchContext.executePowerampUnlockFullLogic(logger: Logger) {
    logger.info("Executing Unlock Full Version patch for Poweramp...")
    var hooked = executeGooglePlayBillingBypass(logger, "Poweramp")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("license") || tl.contains("unlock") || tl.contains("trial") || tl.contains("purchase")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "isunlocked" || mName == "islicensed" || mName == "isfullversion") && retType == "Z") {
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
                        logger.fine("[Poweramp Unlock] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Poweramp Unlock] Total hooks applied: $hooked")
}
