package com.dmoniak.patches.claude

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CLAUDE
import java.util.logging.Logger

@Suppress("unused")
val claudeExportChatMarkdownPatch = bytecodePatch(
    name = "Export Full Chat & Copy Markdown - Claude AI (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Enables full conversation history export to Markdown, copying entire discussion threads with intact code blocks directly to clipboard in Claude AI.",
) {
    compatibleWith(COMPATIBILITY_CLAUDE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeClaudeExportChatMarkdownLogic(logger)
    }
}

fun BytecodePatchContext.executeClaudeExportChatMarkdownLogic(logger: Logger) {
    logger.info("Executing Export Full Chat & Copy Markdown patch for Claude AI...")
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

            // Export conversation / copy full thread permission flags
            if (!isStatic && (
                mName == "canexportconversation" ||
                mName == "isexportenabled" ||
                mName == "cancopyfullthread" ||
                mName == "iscopyformattedmarkdownenabled" ||
                mName == "canexportasmarkdown"
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
                    logger.info("[Claude Export] Enabled export/copy feature in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Claude Export] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Claude Export] Total export hooks applied: $hookedPoints")
}
