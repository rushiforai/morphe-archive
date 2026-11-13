package com.dmoniak.patches.deepl

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_DEEPL
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val deepLUnlockVoiceAndConversationsPatch = bytecodePatch(
    name = "Unlock Voice Conversations and Transcript Pro - DeepL (Experimental)",
    description = "Unlocks DeepL Voice (real-time speech translation), multi-party Conversation mode, group voice sessions, and Voice Pro transcript features normally gated behind a paid plan.",
) {
    compatibleWith(COMPATIBILITY_DEEPL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeDeepLUnlockVoiceAndConversationsLogic(logger)
    }
}

fun BytecodePatchContext.executeDeepLUnlockVoiceAndConversationsLogic(logger: Logger) {
    logger.info("Executing Unlock Voice Conversations and Transcript Pro patch for DeepL...")
    var hookedPoints = 0

    // Key DEX evidence:
    //   - Lcom/deepl/mobiletranslator/voicetrial/system/VoiceTrialSystem;
    //   - Lcom/deepl/mobiletranslator/voicetrial/system/CancelVoiceTrialFlowSystem;
    //   - Lcom/deepl/mobiletranslator/userfeature/provider/VoiceQuotaProvider;
    //   - Lcom/deepl/mobiletranslator/conversationcommon/system/VoiceQuotaBannerSystem;
    //   - Strings: "VoiceTrialPromoData", "CancelVoiceTrial", "State(hasVoiceProAccess="
    //   - Strings: "GetVoiceQuotaRequest", "GetVoiceQuotaResponse"

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

            // 1. Voice Pro access flags -> true
            if (!isStatic && retType == "Z" && params.isEmpty() && (
                mName == "hasvoiceproaccess" ||
                mName == "isvoiceproactive" ||
                mName == "isvoiceenabled" ||
                mName == "isvoicetranslatepro" ||
                mName == "canusegroupconversations" ||
                mName == "canuseconversations" ||
                mName == "isconversationsproenabled" ||
                mName == "canuseautospeech" ||
                mName == "isautospeechenabled" ||
                mName == "canusetranscript" ||
                mName == "istranscriptenabled" ||
                mName == "canuseaienhancement" ||
                mName == "canuseaiwrite"
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
                    logger.info("[DeepL Voice] Forced Voice Pro access -> true: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[DeepL Voice] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Voice quota exhausted / trial expired -> false (not exhausted)
            if (!isStatic && retType == "Z" && params.isEmpty() && (
                mName == "isvoicequotaexhausted" ||
                mName == "isvoicequotaexceeded" ||
                mName == "isvoicetrialexpired" ||
                mName == "isvoicetriallimitreached" ||
                mName == "hasexceededvoicequota"
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
                    logger.info("[DeepL Voice] Disabled voice quota exhausted flag -> false: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[DeepL Voice] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 3. Voice quota remaining (minutes) -> large number (99999)
            if (!isStatic && params.isEmpty() && (
                mName == "getvoicequotaremaining" ||
                mName == "getvoiceminutesremaining" ||
                mName == "getremainingvoiceminutes" ||
                mName == "getvoicetrialsremaining"
            ) && retType == "I") {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 3,
                        smaliCode = """
                            const v0, 0x0001869F
                            return v0
                        """.trimIndent(),
                    )
                    hookedPoints++
                    logger.info("[DeepL Voice] Set voice quota remaining -> 99999: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[DeepL Voice] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
        }
    }

    logger.info("[DeepL Voice] Total voice conversation hooks applied: $hookedPoints")
}
