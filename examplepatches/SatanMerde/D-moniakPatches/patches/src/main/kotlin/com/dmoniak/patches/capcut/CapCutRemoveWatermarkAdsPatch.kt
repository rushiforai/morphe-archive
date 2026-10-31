package com.dmoniak.patches.capcut

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CAPCUT
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CAPCUT_ALT
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val capCutRemoveWatermarkAdsPatch = bytecodePatch(
    name = "Disable Ending Watermark & Ad Prompts - CapCut (Experimental)",
    description = "⚠️ [Experimental / Untested] Disables default ending clip watermark insertion, strips in-app advertisements, upgrade subscription banners, and paywall popups in CapCut.",
) {
    compatibleWith(COMPATIBILITY_CAPCUT, COMPATIBILITY_CAPCUT_ALT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCapCutRemoveWatermarkAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeCapCutRemoveWatermarkAdsLogic(logger: Logger) {
    logger.info("Executing Disable Ending Watermark & Ad Prompts patch for CapCut (verified on v20.0.0)...")
    var hookedPoints = executeComprehensiveAdBlock(logger, "CapCut")

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (tl.startsWith("lkotlin/") || tl.startsWith("landroidx/") || tl.startsWith("landroid/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // =========================================================================
        // 1. Target Epilogue & Watermark Controllers:
        //    - Lcom/vega/edit/video/view/MultiTrackLayout;
        //    - Lcom/vega/edit/video/view/ItemTrackLayout;
        //    - Lcom/ss/android/vesdk/VEVideoEncodeSettings;
        // =========================================================================
        val isTrackLayout = type.contains("MultiTrackLayout;") || type.contains("ItemTrackLayout;")
        val isEncodeSettings = type.contains("VEVideoEncodeSettings;")

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // Neutralize setNeedEpilogue and setEpilogueEnable on track layout
            if (isTrackLayout && retType == "V" && (mName == "setneedepilogue" || mName == "setepilogueenable")) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = if (isStatic) 1 else 2,
                        smaliCode = """
                        return-void
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.fine("[CapCut Epilogue] Neutralized epilogue setter: $type->${method.name}")
                    continue
                } catch (e: Exception) {
                    logger.warning("[CapCut Epilogue] Failed to hook $type->${method.name}: ${e.message}")
                }
            }

            // Disable invisible watermark on video encode settings
            if (isEncodeSettings && retType == "Z" && mName == "getenableinvisiblewatermark") {
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
                    logger.fine("[CapCut Watermark] Disabled invisible watermark in encode settings: $type->${method.name}")
                    continue
                } catch (e: Exception) {
                    logger.warning("[CapCut Watermark] Failed to hook $type->${method.name}: ${e.message}")
                }
            }

            // =========================================================================
            // 2. Ending watermark / Epilogue checkers -> false
            // =========================================================================
            if (retType == "Z" && (
                mName == "isdefaultendingenabled" || mName == "shouldaddendingwatermark" ||
                mName == "isendingwatermarkon" || mName == "hasendingwatermark" ||
                mName == "iswatermarkenabled" || mName == "getshowepilogue" ||
                mName == "haswatermark" || mName == "hasaigcwatermark" ||
                mName == "hasaigcwatermarkrespstruct_has_get"
            )) {
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
                    logger.fine("[CapCut Watermark] Neutralized watermark getter: $type->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[CapCut Watermark] Failed to hook $type->${method.name}: ${e.message}")
                }
            }

            // =========================================================================
            // 3. Paywall / Promo readiness and display checkers -> false
            // =========================================================================
            if (retType == "Z" && (
                mName == "shouldshowpaywall" || mName == "shouldshowupgradedialog" ||
                mName == "isadready" || mName == "isadloaded" || mName == "shouldshowad" ||
                mName == "needshowad"
            )) {
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
                    logger.fine("[CapCut Ads] Hooked promo/ad check: $type->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[CapCut Ads] Failed to hook $type->${method.name}: ${e.message}")
                }
            }

            // =========================================================================
            // 4. Paywall / Ad show methods returning void
            // =========================================================================
            if (retType == "V" && (
                mName == "showpaywall" || mName == "showupgradeprompt" ||
                mName == "showvipdialog" || mName == "showinterstitialad" ||
                mName == "showactivitydialog"
            )) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = if (isStatic) 1 else 2,
                        smaliCode = """
                        return-void
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.fine("[CapCut Ads] Neutralized paywall show method: $type->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[CapCut Ads] Failed to neutralize $type->${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[CapCut Ads/Watermark] Total hooks applied: $hookedPoints")
}
