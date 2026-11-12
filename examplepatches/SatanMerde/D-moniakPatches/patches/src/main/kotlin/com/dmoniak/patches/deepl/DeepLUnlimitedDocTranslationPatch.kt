package com.dmoniak.patches.deepl

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_DEEPL
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val deepLUnlimitedDocTranslationPatch = bytecodePatch(
    name = "Unlock Unlimited Document and PDF Translations - DeepL (Experimental)",
    description = "Removes the monthly document translation limit (PDF, DOCX, PPTX), unlocks higher file size thresholds, and enables full document layout preservation in DeepL.",
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

    // Key DEX evidence:
    //   - Lcom/deepl/documenttranslation/system/QuotaInfoSystem;
    //   - Lcom/deepl/documenttranslation/worker/WorkerQuotaExceededException;
    //   - String "DocumentTranslation_QuotaInfo" (2x in DEX)
    //   - String "DocumentTranslationQuota" (1x in DEX)
    //   - Lcom/deepl/documenttranslation/provider/DocumentTranslationCustomizationsProvider;

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

            // 1. Document quota / limit checks -> false (quota NOT exceeded)
            if (!isStatic && retType == "Z" && params.isEmpty() && (
                mName == "isdocumentquotalimitreached" ||
                mName == "hasexceededfreedoctranslations" ||
                mName == "isdocumenttranslationlocked" ||
                mName == "isquotaexceeded" ||
                mName == "isworkerquotaexceeded" ||
                mName == "isdocumentquotaexceeded" ||
                mName == "hasnodocumentquota"
            )) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 3,
                        smaliCode = """
                            const/4 v0, 0x0
                            return v0
                        """.trimIndent(),
                    )
                    hookedPoints++
                    logger.info("[DeepL Documents] Bypassed document quota check -> false: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[DeepL Documents] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Can translate document / has unlimited doc translations -> true
            if (!isStatic && retType == "Z" && params.isEmpty() && (
                mName == "cantranslatedocument" ||
                mName == "hasunlimiteddocumenttranslations" ||
                mName == "caneditdocumentlayout" ||
                mName == "canuploadlargefiles" ||
                mName == "canaccessdocumenttranslation" ||
                mName == "isprofordocuments" ||
                mName == "hassignedupfordocumenttranslation"
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
                    logger.info("[DeepL Documents] Forced document translation access -> true: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[DeepL Documents] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 3. Document remaining count / size limits -> large safe value (100000)
            if (!isStatic && params.isEmpty() && (
                mName == "getdocumentquotaremaining" ||
                mName == "getremaining" ||
                mName == "getdocumenttranslationsleft" ||
                mName == "getmaxfilesizebytes" ||
                mName == "getmaxdocumentsize"
            ) && (retType == "I" || retType == "J" || retType == "F" || retType == "D")) {
                try {
                    val smali = when (retType) {
                        "J" -> "const-wide v0, 0x186A0\n                            return-wide v0"
                        "F" -> "const v0, 0x47C35000\n                            return v0"
                        "D" -> "const-wide v0, 0x40F86A0000000000\n                            return-wide v0"
                        else -> "const v0, 0x186A0\n                            return v0"
                    }
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 4,
                        smaliCode = smali.trimIndent(),
                    )
                    hookedPoints++
                    logger.info("[DeepL Documents] Expanded document limit -> 100000: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[DeepL Documents] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
        }
    }

    logger.info("[DeepL Documents] Total document translation hooks applied: $hookedPoints")
}
