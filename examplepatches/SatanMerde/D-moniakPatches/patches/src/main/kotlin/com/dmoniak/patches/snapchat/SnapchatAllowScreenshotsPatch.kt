package com.dmoniak.patches.snapchat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SNAPCHAT
import java.util.logging.Logger

@Suppress("unused")
val snapchatAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots & Anti-Screen Security - Snapchat (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Removes FLAG_SECURE restrictions on Snapchat chat and media viewer activities, allowing screen capture without black screen restrictions.",
) {
    compatibleWith(COMPATIBILITY_SNAPCHAT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSnapchatAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executeSnapchatAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots patch for Snapchat...")
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

            // Neutralize FLAG_SECURE window flags in Snapchat
            if (!isStatic && (
                mName == "setflagsecure" ||
                mName == "protectwindowfromcapture" ||
                mName == "disablescreenshots" ||
                mName == "enforcesecurewindow"
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
                    logger.info("[Snapchat Screenshots] Neutralized FLAG_SECURE in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Snapchat Screenshots] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Snapchat Screenshots] Total hooks applied: $hookedPoints")
}
