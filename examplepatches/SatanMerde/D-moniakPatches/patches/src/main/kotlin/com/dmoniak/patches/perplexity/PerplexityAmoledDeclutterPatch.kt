package com.dmoniak.patches.perplexity

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PERPLEXITY
import java.util.logging.Logger

@Suppress("unused")
val perplexityAmoledDeclutterPatch = bytecodePatch(
    name = "AMOLED Dark Theme & Declutter - Perplexity (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Replaces gray backgrounds with pure OLED black (#000000) in Perplexity search threads and removes 'Try Pro' upgrade banners.",
) {
    compatibleWith(COMPATIBILITY_PERPLEXITY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePerplexityAmoledDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executePerplexityAmoledDeclutterLogic(logger: Logger) {
    logger.info("Executing AMOLED Dark Theme & Declutter patch for Perplexity...")
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
                mName == "getqueryfeedbackgroundcolor" ||
                mName == "getdarkmodebackground" ||
                mName == "getperplexitysurfacecolor"
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
                    logger.info("[Perplexity AMOLED] Injected pure black in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Perplexity AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Suppress Perplexity Pro promotional and upsell banners
            if (!isStatic && (
                mName == "shouldshowproupgradebanner" ||
                mName == "isproupgradepromovisible" ||
                mName == "shouldshowcopilotsubscriptionupsell" ||
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
                    logger.info("[Perplexity Declutter] Suppressed Pro upgrade banner in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Perplexity Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Perplexity AMOLED & Declutter] Total hooks applied: $hookedPoints")
}
