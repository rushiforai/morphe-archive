package com.dmoniak.patches.movix

import com.dmoniak.patches.shared.replaceMethod
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MOVIX
import java.util.logging.Logger

@Suppress("unused")
val movixBlockAdsDeclutterPatch = bytecodePatch(
    name = "Block Video Ads & Interstitials - Movix",
    description = "Strips video pre-roll and mid-roll ads, banner ads, and redirect popups across Movix movie and series player screens.",
) {
    compatibleWith(COMPATIBILITY_MOVIX)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMovixBlockAdsDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeMovixBlockAdsDeclutterLogic(logger: Logger) {
    logger.info("Executing Block Video Ads & Interstitials patch for Movix...")
    var hookedPoints = 0

    MovixScriptHelper.isAdBlockEnabled = true
    MovixScriptHelper.apply(this, logger)
    hookedPoints++

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // Disable popup windows at WebSettings level
        if (classDef.type.contains("RNCWebViewManager")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name
                if ((mName == "setJavaScriptCanOpenWindowsAutomatically" || mName == "setSetSupportMultipleWindows") && method.returnType == "V") {
                    try {
                        mutableClass.replaceMethod(

                            method,

                            smaliCode = """
                            return-void
                            """.trimIndent()

                        )
                        hookedPoints++
                        logger.info("[Movix Ads] Disabled window opening capability in: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Movix Ads] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 4. Auxiliary ad/redirect flags across any other classes
        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            if (!isStatic && (
                mName == "shouldplayvideoad" ||
                mName == "isadvisible" ||
                mName == "shouldopenadredirect" ||
                mName == "isinterstitialadloaded" ||
                mName == "hasprerollad"
            ) && retType == "Z") {
                try {
                    mutableClass.replaceMethod(

                        method,

                        smaliCode = """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()

                    )
                    hookedPoints++
                    logger.info("[Movix Ads] Blocked ad/redirect flag in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Movix Ads] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Movix Block Ads] Total hooks applied: $hookedPoints")
}
