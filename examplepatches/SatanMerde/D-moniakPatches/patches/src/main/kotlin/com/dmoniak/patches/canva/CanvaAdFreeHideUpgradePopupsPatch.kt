package com.dmoniak.patches.canva

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CANVA
import java.util.logging.Logger

@Suppress("unused")
val canvaAdFreeHideUpgradePopupsPatch = bytecodePatch(
    name = "Ad-Free & Hide Upgrade Popups - Canva (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips in-editor upgrade dialogs, Pro upsell cards in template galleries, subscription CTAs on element detail drawers, and interstitial purchase popups throughout Canva.",
) {
    compatibleWith(COMPATIBILITY_CANVA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCanvaAdFreeHideUpgradePopupsLogic(logger)
    }
}

fun BytecodePatchContext.executeCanvaAdFreeHideUpgradePopupsLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Hide Upgrade Popups patch for Canva...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            if (!isStatic && (
                mName == "shouldshowupgradedialog" ||
                mName == "shouldshowupgradeprompt" ||
                mName == "shouldshowproupselldrawer" ||
                mName == "isupgradeinterstitialshown" ||
                mName == "shouldpresentsubscriptionoffer" ||
                mName == "shouldshowpropaywall"
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
                    logger.info("[Canva AdFree] Suppressed upgrade popup in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Canva AdFree] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Canva Ad-Free & Upgrade Popups] Total hooks applied: $hookedPoints")
}
