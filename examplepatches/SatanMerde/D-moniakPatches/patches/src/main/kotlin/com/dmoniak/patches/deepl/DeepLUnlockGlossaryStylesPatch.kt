package com.dmoniak.patches.deepl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_DEEPL
import java.util.logging.Logger

@Suppress("unused")
val deepLUnlockGlossaryStylesPatch = bytecodePatch(
    name = "Unlock Unlimited Glossaries & Writing Styles - DeepL (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks unlimited custom glossary terminology pairs and enables advanced professional writing styles (Academic, Technical, Casual, Business) in DeepL.",
) {
    compatibleWith(COMPATIBILITY_DEEPL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeDeepLUnlockGlossaryStylesLogic(logger)
    }
}

fun BytecodePatchContext.executeDeepLUnlockGlossaryStylesLogic(logger: Logger) {
    logger.info("Executing Unlock Unlimited Glossaries & Writing Styles patch for DeepL...")
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

            // Glossary & Tone style feature flags
            if (!isStatic && (
                mName == "canuseunlimitedglossary" ||
                mName == "isglossaryenabled" ||
                mName == "canusealltones" ||
                mName == "canusewritingstyles" ||
                mName == "isacademicstyleunlocked" ||
                mName == "isbusinessstyleunlocked" ||
                mName == "canexportglossary"
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
                    logger.info("[DeepL Styles] Forced glossary/style feature in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[DeepL Styles] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Glossary max entries count
            if (!isStatic && (
                mName == "getmaxglossaryentries" ||
                mName == "getglossarylimit"
            ) && retType == "I") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const v0, 0x0001869f
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[DeepL Styles] Expanded glossary limit in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[DeepL Styles] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[DeepL Styles] Total glossary/style hooks applied: $hookedPoints")
}
