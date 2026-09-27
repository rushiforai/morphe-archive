package com.dmoniak.patches.mega

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MEGA
import java.util.logging.Logger

@Suppress("unused")
val megaAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots & Export - MEGA (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Disables FLAG_SECURE window restrictions to allow taking screenshots of documents and media in MEGA, and bypasses local export restrictions.",
) {
    compatibleWith(COMPATIBILITY_MEGA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMegaAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executeMegaAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots & Export patch for MEGA...")
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

            // Neutralize FLAG_SECURE window flags in MEGA
            if (!isStatic && (
                mName == "setflagsecure" ||
                mName == "protectwindowfromcapture" ||
                mName == "disablescreenshots" ||
                mName == "enforcesecureviewer"
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
                    logger.info("[MEGA Screenshots] Neutralized FLAG_SECURE in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[MEGA Screenshots] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Hook export and file download allowances
            if (!isStatic && (
                mName == "isexportallowed" ||
                mName == "cancopylinkwithoutrestriction" ||
                mName == "isscreenshotallowed"
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
                    logger.info("[MEGA Export] Unlocked export permission in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[MEGA Export] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[MEGA Allow Screenshots & Export] Total hooks applied: $hookedPoints")
}
