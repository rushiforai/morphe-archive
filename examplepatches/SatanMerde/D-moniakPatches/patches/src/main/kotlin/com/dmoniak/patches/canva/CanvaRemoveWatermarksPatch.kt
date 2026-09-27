package com.dmoniak.patches.canva

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CANVA
import java.util.logging.Logger

@Suppress("unused")
val canvaRemoveWatermarksPatch = bytecodePatch(
    name = "Remove Watermarks on Free Elements - Canva (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Bypasses watermark rendering on Canva freemium design elements, stock photos, and templates, allowing clean export of designs without Pro subscription watermarks.",
) {
    compatibleWith(COMPATIBILITY_CANVA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCanvaRemoveWatermarksLogic(logger)
    }
}

fun BytecodePatchContext.executeCanvaRemoveWatermarksLogic(logger: Logger) {
    logger.info("Executing Remove Watermarks patch for Canva...")
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
                mName == "shouldshowwatermark" ||
                mName == "iswatermarkrequired" ||
                mName == "haswatermarkelement" ||
                mName == "isfreemiumwatermarkvisible" ||
                mName == "shouldrenderwatermark"
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
                    logger.info("[Canva Watermark] Removed watermark check in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Canva Watermark] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Canva Remove Watermarks] Total hooks applied: $hookedPoints")
}
