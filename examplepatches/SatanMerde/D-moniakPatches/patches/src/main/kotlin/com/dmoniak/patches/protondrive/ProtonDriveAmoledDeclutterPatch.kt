package com.dmoniak.patches.protondrive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PROTON_DRIVE
import java.util.logging.Logger

@Suppress("unused")
val protonDriveAmoledDeclutterPatch = bytecodePatch(
    name = "AMOLED Black & Declutter - Proton Drive (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Injects pure OLED pitch black (#000000) into Proton Drive file vaults and hides storage quota warning banners and Proton Unlimited upgrade prompts.",
) {
    compatibleWith(COMPATIBILITY_PROTON_DRIVE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeProtonDriveAmoledDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeProtonDriveAmoledDeclutterLogic(logger: Logger) {
    logger.info("Executing AMOLED Black & Declutter patch for Proton Drive...")
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
                mName == "getdrivebackgroundcolor" ||
                mName == "getdarkmodebackground" ||
                mName == "getprotondrivesurfacecolor"
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
                    logger.info("[Proton Drive AMOLED] Injected pure black in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Proton Drive AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Suppress storage upgrade banners and Proton Unlimited promotion carousels
            if (!isStatic && (
                mName == "shouldshowupgradebanner" ||
                mName == "isunlimitedpromovisible" ||
                mName == "shouldpromptforstorageupgrade" ||
                mName == "isquotaalertshown"
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
                    logger.info("[Proton Drive Declutter] Suppressed upgrade banner in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Proton Drive Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Proton Drive AMOLED & Declutter] Total hooks applied: $hookedPoints")
}
