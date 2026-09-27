package com.dmoniak.patches.canva

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CANVA
import java.util.logging.Logger

@Suppress("unused")
val canvaAmoledDeclutterPatch = bytecodePatch(
    name = "AMOLED Dark Theme & Declutter - Canva (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Injects pure OLED pitch black (#000000) into Canva design workspace and dashboard, and hides Canva Pro trial banners and upgrade reminders.",
) {
    compatibleWith(COMPATIBILITY_CANVA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCanvaAmoledDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeCanvaAmoledDeclutterLogic(logger: Logger) {
    logger.info("Executing AMOLED Dark Theme & Declutter patch for Canva...")
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
                mName == "geteditorbackgroundcolor" ||
                mName == "getcanvasurfacecolor" ||
                mName == "getdarkmodebackground"
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
                    logger.info("[Canva AMOLED] Injected pure black in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Canva AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Suppress Canva Pro promotional banners and trial prompts
            if (!isStatic && (
                mName == "shouldshowcanvaprobanner" ||
                mName == "isprotrialpromovisible" ||
                mName == "shouldpromptforproupgrade" ||
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
                    logger.info("[Canva Declutter] Suppressed Pro banner in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Canva Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Canva AMOLED & Declutter] Total hooks applied: $hookedPoints")
}
