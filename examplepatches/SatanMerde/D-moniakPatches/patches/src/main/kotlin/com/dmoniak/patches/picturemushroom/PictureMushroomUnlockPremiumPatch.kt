package com.dmoniak.patches.picturemushroom

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PICTURE_MUSHROOM
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val pictureMushroomUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium & VIP - Picture Mushroom (Experimental)",
    description = "Unlocks Gold and Platinum VIP features in Picture Mushroom, including unlimited mushroom identifications, advanced edibility and toxicity guidance, foraging maps, mushroom book encyclopedia, AI chatbot consultations, removes subscription paywall prompts, and eliminates the startup network connection error trap.",
) {
    compatibleWith(COMPATIBILITY_PICTURE_MUSHROOM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePictureMushroomUnlockPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executePictureMushroomUnlockPremiumLogic(logger: Logger) {
    logger.info("Executing Unlock Premium & VIP patch for Picture Mushroom (com.glority.picturemushroom)...")

    // 1. Universal Google Play Billing Client bypass
    executeGooglePlayBillingBypass(logger, "PictureMushroom")

    var vipInfoCount = 0
    var appViewModelCount = 0
    var routerHandlerCount = 0
    var billingManagerCount = 0
    var paywallSuppressedCount = 0
    var splashBypassCount = 0
    var networkEnforcerCount = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (!tl.contains("androidx") && !tl.contains("android/support")) {
            val mutableClass by lazy { mutableClassDefBy(classDef) }

            // =========================================================================
            // 1. VipInfo Data Models (VIP Status & Tier Level)
            // =========================================================================
            if (type.endsWith("/VipInfo;")) {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                    val mName = method.name
                    val pTypes = method.parameterTypes
                    val returnType = method.returnType

                    // isVip() -> Boolean (true)
                    if (!isStatic && mName == "isVip" && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 4,
                                smaliCode = """
                                    const/4 v0, 0x1
                                    return v0
                                """.trimIndent(),
                            )
                            vipInfoCount++
                            logger.info("[PictureMushroom VIP] Hooked ${type}->isVip() -> true")
                        } catch (e: Exception) {
                            logger.warning("[PictureMushroom VIP] Failed to hook ${type}->isVip: ${e.message}")
                        }
                    }

                    // isTrial() -> Boolean (false, full VIP)
                    if (!isStatic && mName == "isTrial" && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 4,
                                smaliCode = """
                                    const/4 v0, 0x0
                                    return v0
                                """.trimIndent(),
                            )
                            vipInfoCount++
                            logger.info("[PictureMushroom VIP] Hooked ${type}->isTrial() -> false")
                        } catch (e: Exception) {
                            logger.warning("[PictureMushroom VIP] Failed to hook ${type}->isTrial: ${e.message}")
                        }
                    }

                    // getVipLevel() -> VipLevel (Enum PLATINUM) or String ("PLATINUM")
                    if (!isStatic && mName == "getVipLevel" && pTypes.isEmpty()) {
                        try {
                            if (returnType == "Ljava/lang/String;") {
                                mutableClass.replaceMethod(
                                    method,
                                    registerCount = 4,
                                    smaliCode = """
                                        const-string v0, "PLATINUM"
                                        return-object v0
                                    """.trimIndent(),
                                )
                                vipInfoCount++
                                logger.info("[PictureMushroom VIP] Hooked ${type}->getVipLevel() -> PLATINUM (String)")
                            } else if (returnType.endsWith("/VipLevel;")) {
                                mutableClass.replaceMethod(
                                    method,
                                    registerCount = 4,
                                    smaliCode = """
                                        sget-object v0, $returnType->PLATINUM:$returnType
                                        return-object v0
                                    """.trimIndent(),
                                )
                                vipInfoCount++
                                logger.info("[PictureMushroom VIP] Hooked ${type}->getVipLevel() -> PLATINUM (Enum)")
                            }
                        } catch (e: Exception) {
                            logger.warning("[PictureMushroom VIP] Failed to hook ${type}->getVipLevel: ${e.message}")
                        }
                    }
                }
            }

            // =========================================================================
            // 2. AppViewModel, AppContext & User Entity (Global VIP State)
            // =========================================================================
            if (type.contains("AppViewModel") || type.endsWith("/AppContext;") || type.endsWith("/User;") || type.endsWith("/UserAdditionalData;")) {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    val mName = method.name
                    val pTypes = method.parameterTypes
                    val returnType = method.returnType

                    if (mName == "isVip" && pTypes.isEmpty()) {
                        try {
                            if (returnType == "Z") {
                                mutableClass.replaceMethod(
                                    method,
                                    registerCount = 4,
                                    smaliCode = """
                                        const/4 v0, 0x1
                                        return v0
                                    """.trimIndent(),
                                )
                                appViewModelCount++
                                logger.info("[PictureMushroom VIP] Hooked ${type}->isVip() -> true")
                            } else if (returnType == "Ljava/lang/Boolean;") {
                                mutableClass.replaceMethod(
                                    method,
                                    registerCount = 4,
                                    smaliCode = """
                                        sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                                        return-object v0
                                    """.trimIndent(),
                                )
                                appViewModelCount++
                                logger.info("[PictureMushroom VIP] Hooked ${type}->isVip() -> Boolean.TRUE")
                            }
                        } catch (e: Exception) {
                            logger.warning("[PictureMushroom VIP] Failed to hook ${type}->isVip: ${e.message}")
                        }
                    }

                    if (mName == "isTrial" && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 4,
                                smaliCode = """
                                    const/4 v0, 0x0
                                    return v0
                                """.trimIndent(),
                            )
                            appViewModelCount++
                            logger.info("[PictureMushroom VIP] Hooked ${type}->isTrial() -> false")
                        } catch (e: Exception) {
                            logger.warning("[PictureMushroom VIP] Failed to hook ${type}->isTrial: ${e.message}")
                        }
                    }

                    if ((mName == "isVipInHistory" || mName == "isPowerUser") && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 4,
                                smaliCode = """
                                    const/4 v0, 0x1
                                    return v0
                                """.trimIndent(),
                            )
                            appViewModelCount++
                            logger.info("[PictureMushroom VIP] Hooked ${type}->$mName() -> true")
                        } catch (e: Exception) {
                            logger.warning("[PictureMushroom VIP] Failed to hook ${type}->$mName: ${e.message}")
                        }
                    }
                }
            }

            // =========================================================================
            // 3. Glority Router Handlers (gl://billing, gl://vip, gl://splash)
            // =========================================================================
            if (type.contains("QueryHasActiveSubscribedHandler") ||
                type.contains("QueryHasSubscribedHandler") ||
                type.contains("IsVipInHistoryHandler")
            ) {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    val mName = method.name
                    val pTypes = method.parameterTypes
                    val returnType = method.returnType

                    if (mName == "execute" && (returnType == "Ljava/lang/Boolean;" || returnType == "Ljava/lang/Object;")) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 4,
                                smaliCode = """
                                    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                                    return-object v0
                                """.trimIndent(),
                            )
                            routerHandlerCount++
                            logger.info("[PictureMushroom VIP] Hooked ${type}->execute() -> Boolean.TRUE")
                        } catch (e: Exception) {
                            logger.warning("[PictureMushroom VIP] Failed to hook ${type}->execute: ${e.message}")
                        }
                    }

                    if (mName == "post" && returnType == "V" && pTypes.size == 1) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 6,
                                smaliCode = """
                                    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                                    invoke-virtual {p1}, Lcom/glority/android/core/route/RouteRequest;->getId()Ljava/lang/String;
                                    move-result-object v1
                                    invoke-static {v1, v0}, Lcom/glority/android/core/route/Router;->onResponse(Ljava/lang/String;Ljava/lang/Object;)V
                                    return-void
                                """.trimIndent(),
                            )
                            routerHandlerCount++
                            logger.info("[PictureMushroom VIP] Hooked ${type}->post() -> Router.onResponse(true)")
                        } catch (e: Exception) {
                            logger.warning("[PictureMushroom VIP] Failed to hook ${type}->post: ${e.message}")
                        }
                    }
                }
            }

            if (type.contains("GetVipTypeHandler") || type.contains("GetVipInfoHandler")) {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    val mName = method.name
                    val pTypes = method.parameterTypes
                    val returnType = method.returnType

                    if (mName == "execute" && (returnType == "Ljava/lang/String;" || returnType == "Ljava/lang/Object;")) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 4,
                                smaliCode = """
                                    const-string v0, "vip"
                                    return-object v0
                                """.trimIndent(),
                            )
                            routerHandlerCount++
                            logger.info("[PictureMushroom VIP] Hooked ${type}->execute() -> 'vip'")
                        } catch (e: Exception) {
                            logger.warning("[PictureMushroom VIP] Failed to hook ${type}->execute: ${e.message}")
                        }
                    }

                    if (mName == "post" && returnType == "V" && pTypes.size == 1) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 6,
                                smaliCode = """
                                    const-string v0, "vip"
                                    invoke-virtual {p1}, Lcom/glority/android/core/route/RouteRequest;->getId()Ljava/lang/String;
                                    move-result-object v1
                                    invoke-static {v1, v0}, Lcom/glority/android/core/route/Router;->onResponse(Ljava/lang/String;Ljava/lang/Object;)V
                                    return-void
                                """.trimIndent(),
                            )
                            routerHandlerCount++
                            logger.info("[PictureMushroom VIP] Hooked ${type}->post() -> Router.onResponse('vip')")
                        } catch (e: Exception) {
                            logger.warning("[PictureMushroom VIP] Failed to hook ${type}->post: ${e.message}")
                        }
                    }
                }
            }

            // =========================================================================
            // 4. BillingManager & MyBillingAgent (In-App Billing Status)
            // =========================================================================
            if (type.contains("BillingManager") || type.contains("MyBillingAgent")) {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    val mName = method.name
                    val pTypes = method.parameterTypes
                    val returnType = method.returnType

                    if ((mName == "isPurchaseActive" || mName == "areSubscriptionsSupported" || mName == "isInAppBilling") &&
                        returnType == "Z" && pTypes.isEmpty()
                    ) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 4,
                                smaliCode = """
                                    const/4 v0, 0x1
                                    return v0
                                """.trimIndent(),
                            )
                            billingManagerCount++
                            logger.info("[PictureMushroom VIP] Hooked ${type}->$mName() -> true")
                        } catch (e: Exception) {
                            logger.warning("[PictureMushroom VIP] Failed to hook ${type}->$mName: ${e.message}")
                        }
                    }
                }
            }

            // =========================================================================
            // 5. Paywall / Upsell Popup Suppression (ConvertPage, Retain, Detain)
            // =========================================================================
            if (type.contains("ConvertPageOpenHandler") ||
                type.contains("RetainOpenHandler") ||
                type.contains("DetainOpenHandler") ||
                type.contains("HomePurchasePageShouldShowHandler")
            ) {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    val mName = method.name
                    val returnType = method.returnType

                    if (mName == "openActivity" && returnType == "V") {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = "return-void",
                            )
                            paywallSuppressedCount++
                            logger.info("[PictureMushroom VIP] Suppressed paywall launcher in ${type}->openActivity()")
                        } catch (e: Exception) {
                            logger.warning("[PictureMushroom VIP] Failed to suppress ${type}->openActivity: ${e.message}")
                        }
                    }

                    if (mName == "execute" && returnType == "Ljava/lang/Boolean;") {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 4,
                                smaliCode = """
                                    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                                    return-object v0
                                """.trimIndent(),
                            )
                            paywallSuppressedCount++
                            logger.info("[PictureMushroom VIP] Hooked ${type}->execute() -> Boolean.FALSE")
                        } catch (e: Exception) {
                            logger.warning("[PictureMushroom VIP] Failed to hook ${type}->execute: ${e.message}")
                        }
                    }
                }
            }

            // =========================================================================
            // 6. Splash Screen Startup & Network Error Trap Bypass (SplashFragment & PolicyUtils)
            // =========================================================================
            if (type.endsWith("/SplashFragment;")) {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    val mName = method.name
                    val returnType = method.returnType

                    if ((mName == "handlerError" || mName == "setErrorView") && returnType == "V") {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 4,
                                smaliCode = """
                                    invoke-virtual {p0}, Lcom/glority/android/picturexx/splash/fragment/splash/SplashFragment;->jumpAccordingly()V
                                    return-void
                                """.trimIndent(),
                            )
                            splashBypassCount++
                            logger.info("[PictureMushroom VIP] Redirected ${type}->${mName} to jumpAccordingly() to bypass 'Pas de connexion' trap")
                        } catch (e: Exception) {
                            logger.warning("[PictureMushroom VIP] Failed to redirect ${type}->${mName}: ${e.message}")
                        }
                    }
                }
            }

            if (type.contains("SplashActivity") || type.contains("PolicyUtils")) {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    val mName = method.name
                    val returnType = method.returnType

                    if ((mName == "getHasAgreed" || mName == "isAgreed") && returnType == "Z") {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = """
                                    const/4 v0, 0x1
                                    return v0
                                """.trimIndent(),
                            )
                            splashBypassCount++
                            logger.info("[PictureMushroom VIP] Hooked ${type}->${mName}() -> true")
                        } catch (e: Exception) {
                            logger.warning("[PictureMushroom VIP] Failed to hook ${type}->${mName}: ${e.message}")
                        }
                    }
                }
            }

            // =========================================================================
            // 7. Universal Network Connectivity Enforcer (NetworkUtils & NetworkTracker)
            // =========================================================================
            if (type.contains("NetworkUtils") || type.contains("NetworkTracker")) {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    val mName = method.name
                    val returnType = method.returnType

                    val isNetworkCheck = (
                        mName == "isConnected" ||
                        mName == "isAvailableByPing" ||
                        mName == "isWifiConnected" ||
                        mName == "isWifiAvailable" ||
                        mName == "isMobileData" ||
                        mName == "isMobileDataEnabled" ||
                        mName == "isWifiEnabled" ||
                        mName == "is4G" ||
                        mName == "isNetworkAvailable" ||
                        mName == "isNetworkConnected" ||
                        mName == "isApiAvailable" ||
                        mName == "isServerAvailable" ||
                        mName == "isPingAvailable"
                    ) && returnType == "Z"

                    if (isNetworkCheck) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = """
                                    const/4 v0, 0x1
                                    return v0
                                """.trimIndent(),
                            )
                            networkEnforcerCount++
                            logger.info("[PictureMushroom VIP] Enforced online status: ${type}->${mName}() -> true")
                        } catch (e: Exception) {
                            logger.warning("[PictureMushroom VIP] Failed to hook ${type}->${mName}: ${e.message}")
                        }
                    }
                }
            }
        }
    }

    logger.info(
        "[PictureMushroom VIP] Patch completed: " +
            "vipInfoCount=$vipInfoCount, " +
            "appViewModelCount=$appViewModelCount, " +
            "routerHandlerCount=$routerHandlerCount, " +
            "billingManagerCount=$billingManagerCount, " +
            "paywallSuppressedCount=$paywallSuppressedCount, " +
            "splashBypassCount=$splashBypassCount, " +
            "networkEnforcerCount=$networkEnforcerCount",
    )
}
