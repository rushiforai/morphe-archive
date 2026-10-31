package com.dmoniak.patches.moovit

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MOOVIT
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val moovitAdFreeTransitPatch = bytecodePatch(
    name = "Ad-Free Transit & Clean Interface - Moovit (Experimental)",
    description = "⚠️ [Experimental / Untested] Neutralizes full-screen interstitial ads when viewing schedules, removes bottom banner ads, and declutters live transit map overlays in Moovit.",
) {
    compatibleWith(COMPATIBILITY_MOOVIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMoovitAdFreeTransitLogic(logger)
    }
}

fun BytecodePatchContext.executeMoovitAdFreeTransitLogic(logger: Logger) {
    logger.info("Executing Ad-Free Transit & Clean Interface patch for Moovit...")
    var hooked = executeComprehensiveAdBlock(logger, "Moovit")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("ad") || tl.contains("banner") || tl.contains("interstitial") || tl.contains("promo")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "shoulddisplayad" || mName == "isadactive" || mName == "canloadinterstitial") && retType == "Z") {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = """
                                const/4 v0, 0x0
                                return v0
                            """.trimIndent()
                        )
                        hooked++
                    } catch (e: Exception) {
                        logger.fine("[Moovit Ad] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Moovit Ads] Total hooks applied: $hooked")
}

