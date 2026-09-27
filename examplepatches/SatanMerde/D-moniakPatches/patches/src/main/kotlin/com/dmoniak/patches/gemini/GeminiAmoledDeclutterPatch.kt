package com.dmoniak.patches.gemini

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GEMINI
import java.util.logging.Logger

@Suppress("unused")
val geminiAmoledDeclutterPatch = bytecodePatch(
    name = "AMOLED Dark Theme & Declutter - Google Gemini (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Injects true OLED pitch black (#000000) across Gemini chat surfaces and removes 'Try Gemini Advanced' upgrade suggestions.",
) {
    compatibleWith(COMPATIBILITY_GEMINI)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGeminiAmoledDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeGeminiAmoledDeclutterLogic(logger: Logger) {
    logger.info("Executing AMOLED Dark Theme & Declutter patch for Google Gemini...")
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

            // Hook dark theme background color getters -> pure OLED pitch black
            if (!isStatic && (
                mName == "getgeminichatbackgroundcolor" ||
                mName == "getdarkthemerootbackground" ||
                mName == "getconversationsurfacecolor"
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
                    logger.info("[Gemini AMOLED] Injected pure black in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Gemini AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Suppress Gemini Advanced promotional upsell banners
            if (!isStatic && (
                mName == "shouldshowgeminiadvancedupsell" ||
                mName == "isgeminiadvancedpromovisible" ||
                mName == "shouldpromptforadvancedplan" ||
                mName == "isadvancedupsellshown"
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
                    logger.info("[Gemini Declutter] Suppressed Advanced upsell in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Gemini Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Gemini AMOLED & Declutter] Total hooks applied: $hookedPoints")
}
