package com.dmoniak.patches.instagram

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import java.util.logging.Logger

@Suppress("unused")
val instagramCopyTextAndCommentsPatch = bytecodePatch(
    name = "Copy Captions & Comments - Instagram (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Enables text selection and direct clipboard copying on post captions, user biographies, and comments.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeInstagramCopyTextLogic(logger)
    }
}

fun BytecodePatchContext.executeInstagramCopyTextLogic(logger: Logger) {
    logger.info("Executing Copy Captions & Comments patch for Instagram...")
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

            if (!isStatic && (
                mName == "istextselectionallowed" ||
                mName == "iscommentselectable" ||
                mName == "iscaptionselectable"
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
                    logger.info("[Instagram CopyText] Enabled text selection in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Instagram CopyText] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Instagram CopyText] Finished: $hookedPoints text copying hooks injected.")
}
