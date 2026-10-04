package com.dmoniak.patches.undercover

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_UNDERCOVER
import java.util.logging.Logger

@Suppress("unused")
val undercoverBlockAdsPatch = bytecodePatch(
    name = "Block Ads & Commercials - Undercover (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips interstitial video ads between rounds, banner ads in lobby and voting screens, and rewarded video gates by neutralizing ad SDK calls.",
) {
    compatibleWith(COMPATIBILITY_UNDERCOVER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeUndercoverBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeUndercoverBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Ads & Commercials patch for Undercover...")
    var hookedCount = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. Hook Google AdMob SDK classes directly (only on concrete classes with implementation)
        if (
            type.contains("com/google/android/gms/ads/AdView") ||
            type.contains("com/google/android/gms/ads/BaseAdView") ||
            type.contains("com/google/android/gms/ads/interstitial/InterstitialAd")
        ) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name
                val retType = method.returnType

                if ((mName == "show" || mName == "loadAd" || mName == "resume" || mName == "showAd") && retType == "V") {
                    try {
                        val mm = mutableClass.findMutableMethodOf(method)
                        mm?.addInstructions(
                            0,
                            """
                            return-void
                            """.trimIndent()
                        )
                        hookedCount++
                    } catch (e: Exception) {
                        logger.fine("Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }

        // 2. Hook Undercover's own internal ad activity wrapper (Adtznhrcum)
        if (type.contains("com/yanstarstudio/joss/undercover/Adtznhrcum")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name
                val retType = method.returnType

                if ((mName == "start" || mName == "onShow" || mName == "show") && retType == "V") {
                    try {
                        val mm = mutableClass.findMutableMethodOf(method)
                        mm?.addInstructions(
                            0,
                            """
                            return-void
                            """.trimIndent()
                        )
                        hookedCount++
                    } catch (e: Exception) {
                        logger.fine("Failed to hook Adtznhrcum.$mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("Hooked $hookedCount ad call points in Undercover.")
}
