package com.dmoniak.patches.euria

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_EURIA
import java.util.logging.Logger

@Suppress("unused")
val euriaExportChatMarkdownPatch = bytecodePatch(
    name = "Export Discussions to Markdown & PDF - Euria AI (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Enables complete discussion thread export to Markdown and plain text, allowing easy archiving and offline viewing in Euria AI.",
) {
    compatibleWith(COMPATIBILITY_EURIA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeEuriaExportChatMarkdownLogic(logger)
    }
}

fun BytecodePatchContext.executeEuriaExportChatMarkdownLogic(logger: Logger) {
    logger.info("Executing Export Discussions to Markdown patch for Euria AI...")
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

            // Export chat permission flags
            if (!isStatic && (
                mName == "canexportdiscussion" ||
                mName == "isexportenabled" ||
                mName == "canexportasmarkdown" ||
                mName == "canexportaspdf"
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
                    logger.info("[Euria Export] Enabled export feature in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Euria Export] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Euria Export] Total export hooks applied: $hookedPoints")
}
