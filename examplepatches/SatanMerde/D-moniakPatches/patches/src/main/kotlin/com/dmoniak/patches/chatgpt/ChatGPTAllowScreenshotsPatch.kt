package com.dmoniak.patches.chatgpt

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CHATGPT
import java.util.logging.Logger

@Suppress("unused")
val chatGPTAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots & Copy - ChatGPT (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Removes Android FLAG_SECURE window restrictions to allow screenshots and screen recording inside conversations and prevents copy restrictions.",
) {
    compatibleWith(COMPATIBILITY_CHATGPT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeChatGPTAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executeChatGPTAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots patch for ChatGPT...")
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

            // Neutralize FLAG_SECURE window restrictions
            if (!isStatic && (
                mName == "setflagsecure" ||
                mName == "enforcesecurescreen" ||
                mName == "disablescreenshots" ||
                mName == "blockscreenrecording"
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
                    logger.info("[ChatGPT Screenshots] Neutralized FLAG_SECURE in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[ChatGPT Screenshots] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Allow copy / export checks
            if (!isStatic && (
                mName == "iscopyingallowed" ||
                mName == "isexportallowed" ||
                mName == "cancopytext"
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
                    logger.info("[ChatGPT Copy] Unlocked text copy in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[ChatGPT Copy] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[ChatGPT Screenshots & Copy] Total hooks applied: $hookedPoints")
}
