package com.dmoniak.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import java.util.logging.Logger

@Suppress("unused")
val universalWebViewDebuggingPatch = bytecodePatch(
    name = "Universal WebView Debugging (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Enables Chrome Developer Tools inspection (chrome://inspect) on all internal WebViews across any hybrid application or game.",
) {
    // Universal patch: No compatibleWith() call. Applies to any app.

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeUniversalWebViewDebuggingLogic(logger)
    }
}

fun BytecodePatchContext.executeUniversalWebViewDebuggingLogic(logger: Logger) {
    logger.info("Executing Universal WebView Debugging patch...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        // Focus on webview client or web initialization classes
        if (tl.startsWith("landroid/view/") || tl.startsWith("landroid/os/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Force webview debugging flag getters to true
            if (!isStatic && (
                mName == "iswebviewdebuggingenabled" ||
                mName == "iswebcontentsdebuggingenabled" ||
                mName == "isdebuggablewebview" ||
                mName == "shouldenabledevtools"
            ) && retType == "Z") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Universal WebView] Enabled debugging flag in ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Universal WebView] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Hook webview initialization methods to enable debugging
            if (!isStatic && (
                mName == "initwebview" ||
                mName == "setupwebview" ||
                mName == "configurewebview"
            ) && retType == "V") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x1
                        invoke-static {v0}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Universal WebView] Injected setWebContentsDebuggingEnabled in ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Universal WebView] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Universal WebView] Total webview debugging hooks applied: $hookedPoints")
}
