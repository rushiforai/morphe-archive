package com.dmoniak.patches.tidal

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TIDAL
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val tidalDeclutterUIPatch = bytecodePatch(
    name = "Declutter Interface & Disable Upsells - Tidal (Experimental)",
    description = "⚠️ [Experimental / Untested] Strips recurring HiFi Plus subscription upgrade banners, trial extension dialogs, and declutters promotional artist spotlight carousels in Tidal.",
) {
    compatibleWith(COMPATIBILITY_TIDAL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTidalDeclutterUILogic(logger)
    }
}

fun BytecodePatchContext.executeTidalDeclutterUILogic(logger: Logger) {
    logger.info("Executing Declutter Interface & Disable Upsells patch for Tidal...")
    var hooked = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("upsell") || tl.contains("promo") || tl.contains("trial") || tl.contains("banner")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "shouldshowupsell" || mName == "isupselldisplayed" || mName == "haspromobanner") && retType == "Z") {
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
                        logger.fine("[Tidal UI] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Tidal UI] Total hooks applied: $hooked")
}
