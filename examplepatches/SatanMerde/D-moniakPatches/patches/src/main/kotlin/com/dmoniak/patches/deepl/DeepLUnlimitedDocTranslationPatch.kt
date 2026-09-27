package com.dmoniak.patches.deepl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_DEEPL
import java.util.logging.Logger

@Suppress("unused")
val deepLUnlimitedDocTranslationPatch = bytecodePatch(
    name = "Unlock Unlimited Document & PDF Translations - DeepL (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Removes the monthly document translation limit (PDF, DOCX, PPTX), unlocks higher file size thresholds, and enables full document layout preservation in DeepL.",
) {
    compatibleWith(COMPATIBILITY_DEEPL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeDeepLUnlimitedDocTranslationLogic(logger)
    }
}

fun BytecodePatchContext.executeDeepLUnlimitedDocTranslationLogic(logger: Logger) {
    logger.info("Executing Unlock Unlimited Document Translations patch for DeepL...")
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

            // 1. Document quota exhausted check -> false
            if (!isStatic && (
                mName == "isdocumentquotalimitreached" ||
                mName == "hasexceededfreedoctranslations" ||
                mName == "isdocumenttranslationlocked"
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
                    logger.info("[DeepL Documents] Bypassed document quota check in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[DeepL Documents] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Can translate document / has unlimited doc translations -> true
            if (!isStatic && (
                mName == "cantranslatedocument" ||
                mName == "hasunlimiteddocumenttranslations" ||
                mName == "caneditdocumentlayout" ||
                mName == "canuploadlargefiles"
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
                    logger.info("[DeepL Documents] Forced document translation access in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[DeepL Documents] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[DeepL Documents] Total document translation hooks applied: $hookedPoints")
}
