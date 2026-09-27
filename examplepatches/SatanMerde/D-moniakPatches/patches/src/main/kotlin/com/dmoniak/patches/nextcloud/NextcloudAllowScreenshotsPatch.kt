package com.dmoniak.patches.nextcloud

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_NEXTCLOUD
import java.util.logging.Logger

@Suppress("unused")
val nextcloudAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots & Bypass Lockout - Nextcloud (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Removes FLAG_SECURE window protections in Nextcloud to enable screenshots and screen recording even when app passcode lock is configured.",
) {
    compatibleWith(COMPATIBILITY_NEXTCLOUD)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeNextcloudAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executeNextcloudAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots patch for Nextcloud...")
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

            // Neutralize FLAG_SECURE window flags in Nextcloud
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
                    logger.info("[Nextcloud Screenshots] Neutralized FLAG_SECURE in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Nextcloud Screenshots] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Nextcloud Allow Screenshots] Total hooks applied: $hookedPoints")
}
