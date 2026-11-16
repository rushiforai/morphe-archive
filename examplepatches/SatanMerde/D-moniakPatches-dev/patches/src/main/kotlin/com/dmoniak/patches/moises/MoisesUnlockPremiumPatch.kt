package com.dmoniak.patches.moises

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MOISES
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val moisesUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium and Pro Features - Moises",
    description = "Bypasses Google Play PairIP anti-tamper signature checks, hooks RevenueCat EntitlementInfo, Google Play BillingClient, and Moises v2.72.0 User/Subscription models to unlock client-side Pro features, bypass startup crash, and eliminate paywalls.",
) {
    compatibleWith(COMPATIBILITY_MOISES)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMoisesUnlockPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executeMoisesUnlockPremiumLogic(logger: Logger) {
    logger.info("Executing battle-tested Unlock Premium and Pro patch for Moises...")
    val billingHooks = executeGooglePlayBillingBypass(logger, "Moises")
    var hookedMethods = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()

        // Skip standard framework internals while preserving pairip and application classes
        val isFramework = tl.startsWith("landroid/") ||
            tl.startsWith("lkotlin/") ||
            tl.startsWith("ljava/") ||
            tl.startsWith("lcom/google/android/gms/") ||
            tl.startsWith("lcom/google/firebase/")

        if (!isFramework) {
            val mutableClass by lazy { mutableClassDefBy(classDef) }

            // 0. Neutralize Google Play PairIP anti-tamper integrity verification (resolves v2.72.0 startup crash)
            if (type == "Lcom/pairip/SignatureCheck;") {
                for (method in classDef.methods.toList()) {
                    val mName = method.name
                    val retType = method.returnType

                    if (mName == "verifyIntegrity" && retType == "V") {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = "return-void",
                            )
                            hookedMethods++
                            logger.info("[Moises Pro] Neutralized PairIP SignatureCheck.verifyIntegrity -> void")
                        } catch (e: Exception) {
                            logger.fine("[Moises Pro] Failed verifyIntegrity hook: ${e.message}")
                        }
                    }

                    if (mName == "verifySignatureMatches" && retType == "Z") {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = """
                                    const/4 v0, 0x1
                                    return v0
                                """.trimIndent(),
                            )
                            hookedMethods++
                            logger.info("[Moises Pro] Neutralized PairIP SignatureCheck.verifySignatureMatches -> true")
                        } catch (e: Exception) {
                            logger.fine("[Moises Pro] Failed verifySignatureMatches hook: ${e.message}")
                        }
                    }
                }
            }

            if (type == "Lcom/pairip/VMRunner;") {
                for (method in classDef.methods.toList()) {
                    if (method.name == "isDebuggingEnabled" && method.returnType == "Z") {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = """
                                    const/4 v0, 0x0
                                    return v0
                                """.trimIndent(),
                            )
                            hookedMethods++
                            logger.info("[Moises Pro] Neutralized PairIP VMRunner.isDebuggingEnabled -> false")
                        } catch (e: Exception) {
                            logger.fine("[Moises Pro] Failed isDebuggingEnabled hook: ${e.message}")
                        }
                    }
                }
            }

            // 1. Hook Moises User data models (v2.72.0: ai.moises.data.user.model.User, legacy: ai.moises.data.model.User)
            if (type == "Lai/moises/data/user/model/User;" || type == "Lai/moises/data/model/User;") {
                for (method in classDef.methods.toList()) {
                    val mName = method.name
                    val retType = method.returnType

                    if (mName == "isPro" && retType == "Z") {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = """
                                    const/4 v0, 0x1
                                    return v0
                                """.trimIndent(),
                            )
                            hookedMethods++
                            logger.info("[Moises Pro] Hooked User.isPro() -> true")
                        } catch (e: Exception) {
                            logger.fine("[Moises Pro] Failed User.isPro: ${e.message}")
                        }
                    }

                    if ((mName == "isSubscriptionActive" || mName == "q") && retType == "Ljava/lang/Boolean;") {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = """
                                    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                                    return-object v0
                                """.trimIndent(),
                            )
                            hookedMethods++
                            logger.info("[Moises Pro] Hooked User.${mName}() -> Boolean.TRUE")
                        } catch (e: Exception) {
                            logger.fine("[Moises Pro] Failed User.${mName}: ${e.message}")
                        }
                    }

                    if (mName == "getMonthlyUsage" && retType == "Ljava/lang/Integer;") {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = """
                                    const/4 v0, 0x0
                                    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                                    move-result-object v0
                                    return-object v0
                                """.trimIndent(),
                            )
                            hookedMethods++
                            logger.info("[Moises Pro] Hooked User.getMonthlyUsage() -> 0")
                        } catch (e: Exception) {
                            logger.fine("[Moises Pro] Failed User.getMonthlyUsage: ${e.message}")
                        }
                    }
                }
            }

            // 2. Hook UserSubscriptionStatus (v2.72.0)
            if (type == "Lai/moises/data/user/model/UserSubscriptionStatus;") {
                for (method in classDef.methods.toList()) {
                    val mName = method.name
                    val retType = method.returnType

                    if ((mName == "isPro" || mName == "isPremium") && retType == "Ljava/lang/Boolean;") {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = """
                                    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                                    return-object v0
                                """.trimIndent(),
                            )
                            hookedMethods++
                            logger.info("[Moises Pro] Hooked UserSubscriptionStatus.${mName}() -> Boolean.TRUE")
                        } catch (e: Exception) {
                            logger.fine("[Moises Pro] Failed UserSubscriptionStatus.${mName}: ${e.message}")
                        }
                    }
                }
            }

            // 3. Hook UserFeatureFlags (v2.72.0 and legacy)
            if (type == "Lai/moises/data/user/model/UserFeatureFlags;" || type == "Lai/moises/data/model/UserFeatureFlags;") {
                for (method in classDef.methods.toList()) {
                    val mName = method.name
                    val retType = method.returnType

                    if (retType == "Z" && (
                        mName == "getSlowerProcessingTime" ||
                        mName == "getTrialOnMobile" ||
                        mName == "getUploadsTemporarilyUnavailable" ||
                        mName == "a" ||
                        mName == "b"
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
                            hookedMethods++
                            logger.info("[Moises Pro] Hooked UserFeatureFlags.${mName} -> false")
                        } catch (e: Exception) {
                            logger.fine("[Moises Pro] Failed UserFeatureFlags.${mName}: ${e.message}")
                        }
                    }
                }
            }

            // 4. Hook RevenueCat EntitlementInfo and SignatureVerifier
            if (type == "Lcom/revenuecat/purchases/EntitlementInfo;") {
                for (method in classDef.methods.toList()) {
                    val mName = method.name
                    if ((mName == "isActive" || mName == "getWillRenew") && method.returnType == "Z") {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = """
                                    const/4 v0, 0x1
                                    return v0
                                """.trimIndent(),
                            )
                            hookedMethods++
                            logger.info("[Moises Pro] Hooked EntitlementInfo.${mName}() -> true")
                        } catch (e: Exception) {
                            logger.fine("[Moises Pro] Failed EntitlementInfo.${mName}: ${e.message}")
                        }
                    }
                }
            }

            if (type == "Lcom/revenuecat/purchases/common/verification/DefaultSignatureVerifier;") {
                for (method in classDef.methods.toList()) {
                    if (method.name == "verify" && method.returnType == "Z") {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = """
                                    const/4 v0, 0x1
                                    return v0
                                """.trimIndent(),
                            )
                            hookedMethods++
                            logger.info("[Moises Pro] Hooked RevenueCat DefaultSignatureVerifier.verify -> true")
                        } catch (e: Exception) {
                            logger.fine("[Moises Pro] Failed DefaultSignatureVerifier.verify: ${e.message}")
                        }
                    }
                }
            }

            // 5. Generic targeted subscription and pro status getters across Moises domain
            if (tl.contains("ai/moises")) {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                    val mName = method.name.lowercase()
                    val retType = method.returnType
                    val pTypes = method.parameterTypes

                    if (!isStatic && pTypes.isEmpty() && retType == "Z") {
                        if (
                            mName == "ispro" ||
                            mName == "ispremium" ||
                            mName == "issubscribed" ||
                            mName == "hasproaccess" ||
                            mName == "haspremiumaccess" ||
                            mName == "canuseprofeature" ||
                            mName == "canaccesspro" ||
                            mName == "isproactive" ||
                            mName == "isvalidsubscription" ||
                            mName == "hasactivesubscription" ||
                            mName == "issubscriptionactive" ||
                            mName == "ispaid"
                        ) {
                            try {
                                mutableClass.replaceMethod(
                                    method,
                                    registerCount = 2,
                                    smaliCode = """
                                        const/4 v0, 0x1
                                        return v0
                                    """.trimIndent(),
                                )
                                hookedMethods++
                                logger.info("[Moises Pro] Hooked boolean ${classDef.type}->${method.name} -> true")
                            } catch (e: Exception) {
                                logger.fine("[Moises Pro] Failed ${method.name}: ${e.message}")
                            }
                        }
                    }

                    if (!isStatic && pTypes.isEmpty() && retType == "Ljava/lang/Boolean;") {
                        if (
                            mName == "ispro" ||
                            mName == "ispremium" ||
                            mName == "issubscribed" ||
                            mName == "hasproaccess" ||
                            mName == "haspremiumaccess" ||
                            mName == "issubscriptionactive"
                        ) {
                            try {
                                mutableClass.replaceMethod(
                                    method,
                                    registerCount = 2,
                                    smaliCode = """
                                        sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                                        return-object v0
                                    """.trimIndent(),
                                )
                                hookedMethods++
                                logger.info("[Moises Pro] Hooked Boolean ${classDef.type}->${method.name} -> Boolean.TRUE")
                            } catch (e: Exception) {
                                logger.fine("[Moises Pro] Failed ${method.name}: ${e.message}")
                            }
                        }
                    }
                }
            }
        }
    }

    logger.info("[Moises Pro] Finished: ${hookedMethods + billingHooks} total hooks applied.")
}
