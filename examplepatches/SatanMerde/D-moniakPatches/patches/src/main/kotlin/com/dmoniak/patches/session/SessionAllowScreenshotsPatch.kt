package com.dmoniak.patches.session

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SESSION
import java.util.logging.Logger

@Suppress("unused")
val sessionAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots & Screen Security Bypass - Session (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Removes Android FLAG_SECURE window flags in Session Private Messenger, enabling screenshots, receipts saving, and screen recording inside conversations.",
) {
    compatibleWith(COMPATIBILITY_SESSION)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSessionAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executeSessionAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots patch for Session Messenger...")
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

            // Neutralize Screen Security & FLAG_SECURE in Session
            if (!isStatic && (
                mName == "setflagsecure" ||
                mName == "enforcescreensecurity" ||
                mName == "disablescreenshots" ||
                mName == "protectwindowfromcapture"
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
                    logger.info("[Session Screenshots] Neutralized FLAG_SECURE in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Session Screenshots] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Return false for isScreenSecurityEnabled in Session preferences
            if (!isStatic && (
                mName == "isscreensecurityenabled" ||
                mName == "isflagsecureactive"
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
                    logger.info("[Session Screenshots] Forced screen security false in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Session Screenshots] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Session Screenshots] Total hooks applied: $hookedPoints")
}
