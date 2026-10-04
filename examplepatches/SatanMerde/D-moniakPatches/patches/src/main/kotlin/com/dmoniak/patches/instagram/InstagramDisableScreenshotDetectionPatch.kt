package com.dmoniak.patches.instagram

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import java.util.logging.Logger

@Suppress("unused")
val instagramDisableScreenshotDetectionPatch = bytecodePatch(
    name = "Disable Screenshot Detection & Vanish Alert - Instagram (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Silently disables screenshot notifications in disappearing messages, view-once media, and vanish mode, and unlocks screen recording across all Instagram DMs.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeInstagramDisableScreenshotDetectionLogic(logger)
    }
}

fun BytecodePatchContext.executeInstagramDisableScreenshotDetectionLogic(logger: Logger) {
    logger.info("Executing Disable Screenshot Detection patch for Instagram...")
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

            // Neutralize screenshot reporting
            if (!isStatic && (
                mName == "isscreenshotnotificationsupported" ||
                mName == "shouldbroadcastscreenshot" ||
                mName == "isscreenshotdetectedenabled" ||
                mName == "onmediarevealscreenshot"
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
                    logger.info("[Instagram Anti-Screenshot] Disabled screenshot trigger in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Instagram Anti-Screenshot] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Instagram Anti-Screenshot] Finished: $hookedPoints screenshot detection hooks injected.")
}
