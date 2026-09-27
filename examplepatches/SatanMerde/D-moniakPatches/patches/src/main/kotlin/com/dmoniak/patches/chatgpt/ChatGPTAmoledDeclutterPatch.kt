package com.dmoniak.patches.chatgpt

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CHATGPT
import java.util.logging.Logger

@Suppress("unused")
val chatGPTAmoledDeclutterPatch = bytecodePatch(
    name = "AMOLED Dark Theme & Declutter - ChatGPT (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Injects pure pitch black (#000000) for OLED screens in ChatGPT conversations and hides 'Upgrade to ChatGPT Plus' marketing banners.",
) {
    compatibleWith(COMPATIBILITY_CHATGPT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeChatGPTAmoledDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeChatGPTAmoledDeclutterLogic(logger: Logger) {
    logger.info("Executing AMOLED Dark Theme & Declutter patch for ChatGPT...")
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

            // Hook dark theme background color getters -> pure OLED black
            if (!isStatic && (
                mName == "getchatbackgroundcolor" ||
                mName == "getdarksurfacethemecolor" ||
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
                    logger.info("[ChatGPT AMOLED] Injected pitch black in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[ChatGPT AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Hook Plus upgrade / promotional banners -> suppress
            if (!isStatic && (
                mName == "shouldshowupgradebanner" ||
                mName == "isplusupgradepromovisible" ||
                mName == "shouldpromptforplus" ||
                mName == "isupgradecardshown"
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
                    logger.info("[ChatGPT Declutter] Suppressed upgrade banner in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[ChatGPT Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[ChatGPT AMOLED & Declutter] Total hooks applied: $hookedPoints")
}
