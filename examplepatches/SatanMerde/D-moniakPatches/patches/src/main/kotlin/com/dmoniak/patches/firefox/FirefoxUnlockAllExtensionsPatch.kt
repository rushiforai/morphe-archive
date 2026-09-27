package com.dmoniak.patches.firefox

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FIREFOX
import java.util.logging.Logger

@Suppress("unused")
val firefoxUnlockAllExtensionsPatch = bytecodePatch(
    name = "Unlock Full Add-ons Catalog - Firefox (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks full Mozilla Add-ons (AMO) catalog installation on mobile Firefox without requiring Custom Add-on Collections.",
) {
    compatibleWith(COMPATIBILITY_FIREFOX)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeFirefoxUnlockAllExtensionsLogic(logger)
    }
}

fun BytecodePatchContext.executeFirefoxUnlockAllExtensionsLogic(logger: Logger) {
    logger.info("Executing Unlock Full Add-ons Catalog patch for Firefox...")
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

            // Unlock add-on installation restrictions
            if (!isStatic && (
                mName == "isextensionallowed" ||
                mName == "isaddoninstallsupported" ||
                mName == "isaddonwhitelisted" ||
                mName == "caninstallfromamo" ||
                mName == "isaddoncompatiblewithfenix"
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
                    logger.info("[Firefox Add-ons] Unlocked extension check in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Firefox Add-ons] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Suppress incompatible add-on warning blocks
            if (!isStatic && (
                mName == "blockincompatibleaddon" ||
                mName == "showaddonunsupporteddialog"
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
                    logger.info("[Firefox Add-ons] Neutralized block dialog in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Firefox Add-ons] Failed to hook block method: ${e.message}")
                }
            }
        }
    }

    logger.info("Unlock Full Add-ons Catalog for Firefox executed: $hookedPoints points hooked.")
}
