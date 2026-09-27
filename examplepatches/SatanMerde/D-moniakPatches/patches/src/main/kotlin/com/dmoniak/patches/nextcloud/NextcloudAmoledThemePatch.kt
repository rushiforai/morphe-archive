package com.dmoniak.patches.nextcloud

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_NEXTCLOUD
import java.util.logging.Logger

@Suppress("unused")
val nextcloudAmoledThemePatch = bytecodePatch(
    name = "AMOLED Dark Theme - Nextcloud (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Replaces dark gray theme with pure pitch black (#000000) for OLED screens in Nextcloud file explorer, uploads monitor, and media gallery.",
) {
    compatibleWith(COMPATIBILITY_NEXTCLOUD)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeNextcloudAmoledThemeLogic(logger)
    }
}

fun BytecodePatchContext.executeNextcloudAmoledThemeLogic(logger: Logger) {
    logger.info("Executing AMOLED Dark Theme patch for Nextcloud...")
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

            // Hook dark theme background color getters -> pure OLED pitch black (#000000)
            if (!isStatic && (
                mName == "getfilelistbackgroundcolor" ||
                mName == "getdarkmodebackground" ||
                mName == "getnextcloudsurfacecolor"
            ) && retType == "I") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/high16 v0, -0x1000000
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Nextcloud AMOLED] Injected pure black in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Nextcloud AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Nextcloud AMOLED] Total hooks applied: $hookedPoints")
}
