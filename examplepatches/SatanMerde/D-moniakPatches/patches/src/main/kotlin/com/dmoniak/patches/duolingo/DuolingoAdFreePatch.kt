package com.dmoniak.patches.duolingo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_DUOLINGO
import java.util.logging.Logger

@Suppress("unused")
val duolingoAdFreePatch = bytecodePatch(
    name = "Ad-Free & Declutter - Duolingo (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Blocks interstitial video ads shown between lessons and disables intrusive Super Duolingo subscription promotional popups.",
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

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // 1. Disable ad triggers & eligibility
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
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
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

            // 2. Bypass post-lesson ad launcher
            if (!isStatic && (
                mName == "showpostlessonad" ||
                mName == "displayinterstitial" ||
                mName == "showad"
            ) && retType == "V") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        return-void
                        """.trimIndent()
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
