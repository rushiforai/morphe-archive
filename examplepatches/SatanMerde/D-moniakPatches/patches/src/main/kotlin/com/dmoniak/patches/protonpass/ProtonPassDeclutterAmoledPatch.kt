package com.dmoniak.patches.protonpass

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PROTON_PASS
import java.util.logging.Logger

@Suppress("unused")
val protonPassDeclutterAmoledPatch = bytecodePatch(
    name = "AMOLED Black & Declutter - Proton Pass (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Injects pure OLED pitch black (#000000) into Proton Pass vaults and hides Proton Pass Plus upgrade banners and promotional popups.",
) {
    compatibleWith(COMPATIBILITY_PROTON_PASS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeProtonPassDeclutterAmoledLogic(logger)
    }
}

fun BytecodePatchContext.executeProtonPassDeclutterAmoledLogic(logger: Logger) {
    logger.info("Executing AMOLED Black & Declutter patch for Proton Pass...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Hide Proton Pass Plus upgrade prompts & banner cards
            if (!isStatic && (
                mName == "isupgradebannervisible" ||
                mName == "shouldshowpluspromotion" ||
                mName == "isupsellcardvisible" ||
                mName == "haspromotionaloffer"
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
                    logger.info("[Proton Pass] Hidden banner in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Proton Pass] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Pure OLED black background for password vaults
            if (!isStatic && (
                mName == "getbackgroundcolor" ||
                mName == "getsurfacecolor" ||
                mName == "getdarkthemecolor"
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
                    logger.info("[Proton Pass] Injected OLED black in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Proton Pass] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Proton Pass] Total AMOLED & Declutter hooks applied: $hookedPoints")
}
