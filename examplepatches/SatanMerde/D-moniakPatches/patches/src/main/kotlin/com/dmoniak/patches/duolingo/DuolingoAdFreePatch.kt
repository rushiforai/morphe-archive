package com.dmoniak.patches.duolingo

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_DUOLINGO
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val duolingoAdFreePatch = bytecodePatch(
    name = "Ad-Free & Declutter - Duolingo (Experimental)",
    description = "⚠️ [Experimental / Untested] Blocks interstitial video ads shown between lessons and disables intrusive Super Duolingo subscription promotional popups.",
) {
    compatibleWith(COMPATIBILITY_DUOLINGO)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeDuolingoAdFreeLogic(logger)
    }
}

fun BytecodePatchContext.executeDuolingoAdFreeLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Declutter patch for Duolingo...")
    var hookedPoints = 0

    // 1. Comprehensive ad mediation SDK blocker
    hookedPoints += executeComprehensiveAdBlock(logger, "Duolingo")

    // 2. Local Duolingo ad triggers & eligibility
    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // Disable ad triggers & eligibility -> return false
            if (!isStatic && (
                mName == "shouldshowad" ||
                mName == "isadsenabled" ||
                mName == "isadready" ||
                mName == "canplayad" ||
                mName == "issuperduolingopromovisible" ||
                mName == "ispluspromovisible" ||
                mName == "shouldshowupsell"
            ) && retType == "Z") {
                try {
                    replaceMethod(
                        method = method,
                        registerCount = 3,
                        smaliCode = """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Duolingo AdFree] Disabled ad/promo check: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Duolingo AdFree] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Bypass post-lesson ad launcher -> return-void
            if (!isStatic && (
                mName == "showpostlessonad" ||
                mName == "displayinterstitial" ||
                mName == "showad"
            ) && retType == "V") {
                try {
                    replaceMethod(
                        method = method,
                        registerCount = 2,
                        smaliCode = "return-void"
                    )
                    hookedPoints++
                    logger.info("[Duolingo AdFree] Neutralized ad display: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Duolingo AdFree] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Duolingo AdFree] Total ad-free hooks applied: $hookedPoints")
}
