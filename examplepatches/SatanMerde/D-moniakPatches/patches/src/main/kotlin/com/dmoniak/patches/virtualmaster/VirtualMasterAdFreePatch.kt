package com.dmoniak.patches.virtualmaster

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_VIRTUAL_MASTER
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_VIRTUAL_MASTER_ALT
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val virtualMasterAdFreePatch = bytecodePatch(
    name = "Ad-Free & Clean Environment - Virtual Master (Experimental)",
    description = "⚠️ [Experimental / Untested] Strips all boot interstitials, launcher advertisements, app clone promotion banners, and telemetry popups from Virtual Master by hooking internal AdMob wrappers and ad containers.",
) {
    compatibleWith(COMPATIBILITY_VIRTUAL_MASTER, COMPATIBILITY_VIRTUAL_MASTER_ALT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeVirtualMasterAdFreeLogic(logger)
    }
}

fun BytecodePatchContext.executeVirtualMasterAdFreeLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Clean Environment patch for Virtual Master...")
    var hookedPoints = executeComprehensiveAdBlock(logger, "VirtualMaster")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("lkotlin/") || tl.startsWith("landroidx/") || tl.startsWith("landroid/support/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name
            val retType = method.returnType

            // 1. Hook internal AdMob BaseAdView display handler (e.g. Lg7/WWWȏWWWoನ̑;->WWWWӈWWWWीӈ)
            if (mName != "<init>" && retType == "V" && method.parameterTypes.any { it.contains("BaseAdView") }) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = if (isStatic) 1 else 2,
                        smaliCode = """
                        return-void
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.fine("[Virtual Master Ads] Neutralized BaseAdView handler: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Virtual Master Ads] Failed to hook ${classDef.type}->${method.name}: ${e.message}")
                }
            }

            // 2. Ad readiness / status checkers -> false
            val mLower = mName.lowercase()
            if (retType == "Z" && (
                mLower == "isadready" || mLower == "isadloaded" || mLower == "hasinterstitialad" ||
                mLower == "hassplashad" || mLower == "shouldshowad"
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
                    logger.fine("[Virtual Master Ads] Hooked ad readiness: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Virtual Master Ads] Failed to hook ${classDef.type}->${method.name}: ${e.message}")
                }
            }

            // 3. Ad show methods returning void
            if (retType == "V" && (
                mLower == "showinterstitial" || mLower == "showinterstitialad" ||
                mLower == "showsplashad" || mLower == "loadandshowad"
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
                    logger.fine("[Virtual Master Ads] Hooked ad show method: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Virtual Master Ads] Failed to hook ${classDef.type}->${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Virtual Master Ads] Total ad hooks applied: $hookedPoints")
}
