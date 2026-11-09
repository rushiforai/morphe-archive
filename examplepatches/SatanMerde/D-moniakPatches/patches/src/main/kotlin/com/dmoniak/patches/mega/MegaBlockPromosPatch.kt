package com.dmoniak.patches.mega

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MEGA
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val megaBlockPromosPatch = bytecodePatch(
    name = "Block Promos, Quota Popups & Declutter - MEGA",
    description = "Strips Pro upgrade prompts, cloud storage and transfer quota warning banners, sync upsell bottom sheets, and promotional marketing cards across file explorer, media player, transfer queue, and account settings in MEGA.",
) {
    compatibleWith(COMPATIBILITY_MEGA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMegaBlockPromosLogic(logger)
    }
}

fun BytecodePatchContext.executeMegaBlockPromosLogic(logger: Logger) {
    logger.info("Executing Block Promos & Declutter patch for MEGA (mega.privacy.android.app)...")
    var hookedPoints = executeComprehensiveAdBlock(logger, "MEGA")

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (tl.startsWith("landroidx/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) {
            return@classDefForEach
        }

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // Neutralize promo cards, upgrade banners, and upsell bottom sheets
        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // Boolean visibility checks for promo banners, quota alerts, and upsells -> return false
            val isPromoCheck = !isStatic && (
                mName == "shouldshowupgradebanner" ||
                mName == "shouldshowpromobanner" ||
                mName == "shouldshowpromo" ||
                mName == "ispromovisible" ||
                mName == "isupgradepromoted" ||
                mName == "shouldshowprocard" ||
                mName == "isoverdiskquotabannervisible" ||
                mName == "issyncpromotionvisible" ||
                mName == "shouldshowachievementsbanner" ||
                mName == "shouldshowstoragewarning" ||
                mName == "istransferoverquotawarningvisible" ||
                mName == "shouldshowreferralbanner"
            ) && retType == "Z" && pTypes.isEmpty()

            if (isPromoCheck) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 2,
                        smaliCode = """
                            const/4 v0, 0x0
                            return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.fine("[MEGA Promos] Hooked promo check: ${type}->${method.name} -> false")
                } catch (e: Exception) {
                    logger.fine("[MEGA Promos] Skip promo check hook: ${e.message}")
                }
            }

            // Quota interruption observers in AudioPlayerActivity / VideoPlayerActivity
            val isQuotaObserver = !isStatic && (
                mName.contains("observetransferoverquota") ||
                mName.contains("showquotaexpiredpopup") ||
                mName.contains("displaypaywalldialog")
            ) && retType == "V"

            if (isQuotaObserver) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 2,
                        smaliCode = "return-void"
                    )
                    hookedPoints++
                    logger.fine("[MEGA Promos] Neutralized quota interruption: ${type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[MEGA Promos] Skip observer hook: ${e.message}")
                }
            }
        }
    }

    logger.info("[MEGA Block Promos & Declutter] Total promo hooks applied: $hookedPoints")
}

