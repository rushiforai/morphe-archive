package com.dmoniak.patches.canva

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CANVA
import java.util.logging.Logger

@Suppress("unused")
val canvaUnlockProFeaturesPatch = bytecodePatch(
    name = "Unlock Canva Pro Features (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks Canva Pro premium templates, exclusive fonts, advanced design elements, and premium content library without an active Pro subscription.",
) {
    compatibleWith(COMPATIBILITY_CANVA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCanvaUnlockProFeaturesLogic(logger)
    }
}

fun BytecodePatchContext.executeCanvaUnlockProFeaturesLogic(logger: Logger) {
    logger.info("Executing Unlock Canva Pro Features patch...")
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
                mName == "isprosubscriber" ||
                mName == "hascanaprosubscription" ||
                mName == "isprofeatureunlocked" ||
                mName == "ispremiumtemplateavailable" ||
                mName == "ispremiumfontavailable" ||
                mName == "haspremiumcontentaccess"
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
                    logger.info("[Canva Pro] Unlocked Pro feature in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Canva Pro] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Canva Pro Features] Total hooks applied: $hookedPoints")
}
