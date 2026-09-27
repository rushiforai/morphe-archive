package com.dmoniak.patches.claude

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CLAUDE
import java.util.logging.Logger

@Suppress("unused")
val claudeBypassInputLengthLimitPatch = bytecodePatch(
    name = "Bypass Input Length & Upload Limits - Claude AI (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Removes client-side message input text length truncation and allows pasting massive codebases or prompts without mobile UI lag in Claude AI.",
) {
    compatibleWith(COMPATIBILITY_CLAUDE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeClaudeBypassInputLengthLogic(logger)
    }
}

fun BytecodePatchContext.executeClaudeBypassInputLengthLogic(logger: Logger) {
    logger.info("Executing Bypass Input Length & Upload Limits patch for Claude AI...")
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

            // 1. Max input character length getter
            if (!isStatic && (
                mName == "getmaxpromptcharlength" ||
                mName == "getmaxinputlength" ||
                mName == "getcharlimit"
            ) && retType == "I") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const v0, 0x000fffff
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Claude Input] Expanded max character limit in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Claude Input] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Is text length exceeded check -> false
            if (!isStatic && (
                mName == "isinputlengthexceeded" ||
                mName == "istoolongtopaste" ||
                mName == "shouldtruncateclipboard"
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
                    logger.info("[Claude Input] Bypassed input truncation check in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Claude Input] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Claude Input] Total input limit hooks applied: $hookedPoints")
}
