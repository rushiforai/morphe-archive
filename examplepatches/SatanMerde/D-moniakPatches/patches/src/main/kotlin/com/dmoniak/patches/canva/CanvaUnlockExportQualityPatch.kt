package com.dmoniak.patches.canva

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CANVA
import java.util.logging.Logger

@Suppress("unused")
val canvaUnlockExportQualityPatch = bytecodePatch(
    name = "Unlock High Quality Export - Canva (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks maximum export resolution sliders, transparent background PNG option, and bypasses premium element watermark restrictions.",
) {
    compatibleWith(COMPATIBILITY_CANVA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCanvaUnlockExportQualityLogic(logger)
    }
}

fun BytecodePatchContext.executeCanvaUnlockExportQualityLogic(logger: Logger) {
    logger.info("Executing Unlock High Quality Export patch for Canva...")
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

            // Hook export options (transparent background, high-res slider, no watermarks)
            if (!isStatic && (
                mName == "canexportwithtransparentbackground" ||
                mName == "ismaximumresolutionunlocked" ||
                mName == "candownloadwithoutwatermark" ||
                mName == "canexportasvector" ||
                mName == "isproexportqualityallowed"
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
                    logger.info("[Canva Export Quality] Unlocked export capability in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Canva Export Quality] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Canva Unlock Export Quality] Total hooks applied: $hookedPoints")
}
