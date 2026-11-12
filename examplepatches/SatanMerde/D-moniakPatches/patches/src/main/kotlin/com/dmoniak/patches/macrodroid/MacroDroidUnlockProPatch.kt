package com.dmoniak.patches.macrodroid

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MACRODROID
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val macroDroidUnlockProPatch = bytecodePatch(
    name = "Unlock Pro and Unlimited Features - MacroDroid (Experimental)",
    description = "Bypasses Google Play Billing verification for MacroDroid Pro, unlocks all Pro-exclusive actions, triggers, and constraints, and enables full automation features without restriction.",
) {
    compatibleWith(COMPATIBILITY_MACRODROID)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMacroDroidUnlockProLogic(logger)
    }
}

fun BytecodePatchContext.executeMacroDroidUnlockProLogic(logger: Logger) {
    logger.info("Executing Unlock Pro and Unlimited Features patch for MacroDroid...")
    var hookedPoints = 0

    // 1. Universal Google Play Billing SDK bypass
    hookedPoints += executeGooglePlayBillingBypass(logger, "MacroDroid")

    // 2. MacroDroid specific Pro checks, limits, and SelectableItem gates
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

                // 2a. SelectableItem isProOnly / isProOnlyOffer -> false (makes all actions/triggers available)
                if (!isStatic && retType == "Z" && params.isEmpty() && (
                    mName == "isproonly" ||
                    mName == "isproonlyoffer" ||
                    mName == "requiresproversion"
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
                        logger.info("[MacroDroid Pro] Unlocked Pro-only item requirement -> false: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MacroDroid Pro] Failed to hook ${method.name}: ${e.message}")
                    }
                }

                // 2b. isPro / isProUser / isPremium / isValidated -> true
                if (!isStatic && retType == "Z" && params.isEmpty() && (
                    mName == "ispro" ||
                    mName == "isprouser" ||
                    mName == "ispremium" ||
                    mName == "isproversion" ||
                    mName == "hasproversion" ||
                    mName == "hasprouser" ||
                    mName == "isvalidated" ||
                    mName == "ispurchasevalid" ||
                    mName == "isvalidpurchase"
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
                        logger.info("[MacroDroid Pro] Forced Pro user status -> true: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MacroDroid Pro] Failed to hook ${method.name}: ${e.message}")
                    }
                }

                // 2c. getMaxMacros -> return 999999 (lifts the 5-macro limit)
                if (!isStatic && retType == "I" && params.isEmpty() && (
                    mName == "getmaxmacros" ||
                    mName == "getmacrolimit" ||
                    mName == "getfreemacrolimit"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 3,
                            smaliCode = """
                                const v0, 0x000F423F
                                return v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[MacroDroid Pro] Expanded getMaxMacros -> 999999: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MacroDroid Pro] Failed to hook ${method.name}: ${e.message}")
                    }
                }

                // 2d. MagicTextReplacer replaceMacroDroidIsPro -> "true"
                if (!isStatic && retType == "Ljava/lang/String;" && params.isEmpty() && (
                    mName == "replacemacrodroidispro" ||
                    mName == "getprostatusstring"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 3,
                            smaliCode = """
                                const-string v0, "true"
                                return-object v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[MacroDroid Pro] Set magic text Pro string -> true: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MacroDroid Pro] Failed to hook ${method.name}: ${e.message}")
                    }
                }

                // 2e. ProUserStatus getStatusCode -> 0 (valid/OK)
                if (!isStatic && retType == "I" && params.isEmpty() && (
                    mName == "getstatuscode" && classDef.type.contains("ProUserStatus")
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                                const/4 v0, 0x0
                                return v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[MacroDroid Pro] Hooked ProUserStatus getStatusCode -> 0: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MacroDroid Pro] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[MacroDroid Pro] Total Pro unlock hooks applied: $hookedPoints")
}
