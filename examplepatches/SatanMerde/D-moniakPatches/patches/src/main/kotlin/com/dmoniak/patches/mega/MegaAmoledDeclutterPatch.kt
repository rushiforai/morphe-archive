package com.dmoniak.patches.mega

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MEGA
import java.util.logging.Logger

@Suppress("unused")
val megaAmoledDeclutterPatch = bytecodePatch(
    name = "AMOLED Dark Theme & Declutter - MEGA (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Injects pure OLED pitch black (#000000) into MEGA cloud file browser, transfer queue, and settings, and hides Pro upgrade promotion banners.",
) {
    compatibleWith(COMPATIBILITY_MEGA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMegaAmoledDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeMegaAmoledDeclutterLogic(logger: Logger) {
    logger.info("Executing AMOLED Dark Theme & Declutter patch for MEGA...")
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
                mName == "getfilebrowserbackgroundcolor" ||
                mName == "getdarkmodebackground" ||
                mName == "getmegasurfacecolor"
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
                    logger.info("[MEGA AMOLED] Injected pure black in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[MEGA AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Suppress Pro upgrade banners and quota alerts
            if (!isStatic && (
                mName == "shouldshowproupgradebanner" ||
                mName == "isproupgradepromovisible" ||
                mName == "shouldpromptforprosubscription" ||
                mName == "isprocardshown"
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
                    logger.info("[MEGA Declutter] Suppressed Pro banner in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[MEGA Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[MEGA AMOLED & Declutter] Total hooks applied: $hookedPoints")
}
