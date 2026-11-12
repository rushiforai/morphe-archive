package com.dmoniak.patches.deepl

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_DEEPL
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val deepLUnlockGlossaryStylesPatch = bytecodePatch(
    name = "Unlock Unlimited Glossaries and Writing Styles - DeepL (Experimental)",
    description = "Unlocks unlimited custom glossary terminology pairs and enables advanced professional writing styles (Academic, Technical, Casual, Business) in DeepL.",
) {
    compatibleWith(COMPATIBILITY_DEEPL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeDeepLUnlockGlossaryStylesLogic(logger)
    }
}

fun BytecodePatchContext.executeDeepLUnlockGlossaryStylesLogic(logger: Logger) {
    logger.info("Executing Unlock Unlimited Glossaries and Writing Styles patch for DeepL...")
    var hookedPoints = 0

    // Key DEX evidence:
    //   - Lcom/deepl/mobiletranslator/translator/service/TranslatorGlossaryDataProvider;
    //   - Lcom/deepl/mobiletranslator/termbase/service/ActiveTermbasesProvider;
    //   - Lcom/deepl/mobiletranslator/termbase/service/SelectedTermbasesInfoProvider;
    //   - UserFeatureSet$StyleProfiles#ADAPTER in string table
    //   - UserFeatureSet$Glossary / UserFeatureSet$TranslationMemory

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (!tl.contains("androidx") && !tl.contains("android/support") && !tl.contains("com/google")) {

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val params = method.parameterTypes

            // 1. Glossary and writing-style feature flags -> true
            if (!isStatic && retType == "Z" && params.isEmpty() && (
                mName == "canuseunlimitedglossary" ||
                mName == "isglossaryenabled" ||
                mName == "isglossaryavailable" ||
                mName == "canusealltones" ||
                mName == "canusewritingstyles" ||
                mName == "isacademicstyleunlocked" ||
                mName == "isbusinessstyleunlocked" ||
                mName == "istechnicalstyleunlocked" ||
                mName == "iscasualstyleunlocked" ||
                mName == "canexportglossary" ||
                mName == "canusetermbase" ||
                mName == "istermbaseenabled" ||
                mName == "hasstylesprofile" ||
                mName == "canusetranslationmemory"
            )) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 3,
                        smaliCode = """
                            const/4 v0, 0x1
                            return v0
                        """.trimIndent(),
                    )
                    hookedPoints++
                    logger.info("[DeepL Styles] Forced glossary/style feature -> true: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[DeepL Styles] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Glossary max entry count -> 100000
            if (!isStatic && params.isEmpty() && (
                mName == "getmaxglossaryentries" ||
                mName == "getglossarylimit" ||
                mName == "getmaxterms" ||
                mName == "gettermlimit" ||
                mName == "getmaxentries"
            ) && retType == "I") {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 3,
                        smaliCode = """
                            const v0, 0x000186A0
                            return v0
                        """.trimIndent(),
                    )
                    hookedPoints++
                    logger.info("[DeepL Styles] Expanded glossary entry limit -> 100000: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[DeepL Styles] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 3. Max glossary count -> 50
            if (!isStatic && params.isEmpty() && (
                mName == "getmaxglossaries" ||
                mName == "getglossarycount" ||
                mName == "getmaxnumberofglossaries"
            ) && retType == "I") {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 3,
                        smaliCode = """
                            const/16 v0, 0x32
                            return v0
                        """.trimIndent(),
                    )
                    hookedPoints++
                    logger.info("[DeepL Styles] Expanded max glossary count -> 50: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[DeepL Styles] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
        }
    }

    logger.info("[DeepL Styles] Total glossary/style hooks applied: $hookedPoints")
}
