package com.dmoniak.patches.deepl

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_DEEPL
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val deepLUnlockProPatch = bytecodePatch(
    name = "Unlock Pro - DeepL (Experimental)",
    description = "Hooks Google Play Billing to bypass in-app purchase verification for DeepL Pro. Unlocks tone and formality selection, extended translation limits, and advanced dictionary features.",
) {
    compatibleWith(COMPATIBILITY_DEEPL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeDeepLUnlockProLogic(logger)
    }
}

fun BytecodePatchContext.executeDeepLUnlockProLogic(logger: Logger) {
    logger.info("Executing Unlock Pro patch for DeepL...")
    var hookedPoints = 0

    // 1. Standard Google Play Billing SDK hooks (BillingResult, Purchase states)
    hookedPoints += executeGooglePlayBillingBypass(logger, "DeepL")

    // 2. DeepL local Pro/subscription state checks inside their own classes
    //    Key anchor strings: "ProStateChanged(isPro=", "HasProPlanChanged(hasProPlan=",
    //    "hasActiveSubscription", "HasProConversationsAccessChanged"
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

            // 2a. isPro / hasProPlan / hasProConversationsAccess / isProUser -> true
            if (!isStatic && retType == "Z" && params.isEmpty() && (
                mName == "ispro" ||
                mName == "isprouser" ||
                mName == "hasproplan" ||
                mName == "hasproconversationsaccess" ||
                mName == "hasvoiceproaccess" ||
                mName == "isdeeplpro" ||
                mName == "ispremium" ||
                mName == "issubscribed" ||
                mName == "haspremium"
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
                    logger.info("[DeepL Pro] Forced Pro entitlement flag -> true: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[DeepL Pro] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2b. isFreeUser / isFreePlan / hasTranslationLimitReached -> false
            if (!isStatic && retType == "Z" && params.isEmpty() && (
                mName == "isfreeuser" ||
                mName == "isfreeplan" ||
                mName == "isfreetier" ||
                mName == "hastranslationlimitreached" ||
                mName == "isfreetranslationlimitreached" ||
                mName == "isquotaexceeded"
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
                    logger.info("[DeepL Pro] Disabled free-tier check -> false: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[DeepL Pro] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
        }
    }

    logger.info("[DeepL Pro] Total Pro unlock hooks applied: $hookedPoints")
}
