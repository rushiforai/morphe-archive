package com.dmoniak.patches.shroomid

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SHROOMID
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val shroomIDUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium & Pro - ShroomID (Experimental)",
    description = "Unlocks full lifetime Premium & Pro subscription features in ShroomID, including AI mushroom identification, detailed edibility guides, spore prints, offline database access, and removes Adapty paywalls.",
) {
    compatibleWith(COMPATIBILITY_SHROOMID)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShroomIDUnlockPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executeShroomIDUnlockPremiumLogic(logger: Logger) {
    logger.info("Executing Unlock Premium & Pro patch for ShroomID (com.shroomid)...")

    var adaptyModelCount = 0
    var adaptyBridgeCount = 0
    var generalPremiumCount = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()

        if (!tl.contains("androidx") && !tl.contains("android/support")) {
            val mutableClass by lazy { mutableClassDefBy(classDef) }

            // =========================================================================
            // 1. Adapty AccessLevel and Subscription Models
            // =========================================================================
            val isAdaptyAccessLevel = type.endsWith("/AdaptyProfile${'$'}AccessLevel;")
            val isAdaptySubscription = type.endsWith("/AdaptyProfile${'$'}Subscription;")

            if (isAdaptyAccessLevel || isAdaptySubscription) {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                    val mName = method.name
                    val pTypes = method.parameterTypes
                    val returnType = method.returnType

                    // isActive() -> true
                    if (!isStatic && mName == "isActive" && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 3,
                                smaliCode = """
                                    const/4 v0, 0x1
                                    return v0
                                """.trimIndent(),
                            )
                            adaptyModelCount++
                            logger.info("[ShroomID Adapty] Hooked ${type}->isActive() -> true")
                        } catch (e: Exception) {
                            logger.warning("[ShroomID Adapty] Failed to hook ${type}->isActive: ${e.message}")
                        }
                    }

                    // isLifetime() -> true
                    if (!isStatic && mName == "isLifetime" && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 3,
                                smaliCode = """
                                    const/4 v0, 0x1
                                    return v0
                                """.trimIndent(),
                            )
                            adaptyModelCount++
                            logger.info("[ShroomID Adapty] Hooked ${type}->isLifetime() -> true")
                        } catch (e: Exception) {
                            logger.warning("[ShroomID Adapty] Failed to hook ${type}->isLifetime: ${e.message}")
                        }
                    }

                    // getWillRenew() -> true
                    if (!isStatic && mName == "getWillRenew" && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 3,
                                smaliCode = """
                                    const/4 v0, 0x1
                                    return v0
                                """.trimIndent(),
                            )
                            adaptyModelCount++
                            logger.info("[ShroomID Adapty] Hooked ${type}->getWillRenew() -> true")
                        } catch (e: Exception) {
                            logger.warning("[ShroomID Adapty] Failed to hook ${type}->getWillRenew: ${e.message}")
                        }
                    }

                    // isInGracePeriod() -> false
                    if (!isStatic && mName == "isInGracePeriod" && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 3,
                                smaliCode = """
                                    const/4 v0, 0x0
                                    return v0
                                """.trimIndent(),
                            )
                            adaptyModelCount++
                            logger.info("[ShroomID Adapty] Hooked ${type}->isInGracePeriod() -> false")
                        } catch (e: Exception) {
                            logger.warning("[ShroomID Adapty] Failed to hook ${type}->isInGracePeriod: ${e.message}")
                        }
                    }

                    // isRefund() -> false
                    if (!isStatic && mName == "isRefund" && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 3,
                                smaliCode = """
                                    const/4 v0, 0x0
                                    return v0
                                """.trimIndent(),
                            )
                            adaptyModelCount++
                            logger.info("[ShroomID Adapty] Hooked ${type}->isRefund() -> false")
                        } catch (e: Exception) {
                            logger.warning("[ShroomID Adapty] Failed to hook ${type}->isRefund: ${e.message}")
                        }
                    }

                    // isSandbox() -> false (Subscription only)
                    if (!isStatic && mName == "isSandbox" && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 3,
                                smaliCode = """
                                    const/4 v0, 0x0
                                    return v0
                                """.trimIndent(),
                            )
                            adaptyModelCount++
                            logger.info("[ShroomID Adapty] Hooked ${type}->isSandbox() -> false")
                        } catch (e: Exception) {
                            logger.warning("[ShroomID Adapty] Failed to hook ${type}->isSandbox: ${e.message}")
                        }
                    }
                }
            }

            // =========================================================================
            // 2. Adapty React Native Bridge Hook (AdaptyReactModule)
            // Intercepts all profile data passing from native Adapty SDK into JS Hermes runtime
            // =========================================================================
            if (type == "Lcom/adapty/react/AdaptyReactModule;") {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    val mName = method.name
                    val pTypes = method.parameterTypes
                    val returnType = method.returnType

                    // handle$lambda$4(Promise, String data)
                    if (mName == "handle${'$'}lambda${'$'}4" && returnType == "V" && pTypes.size == 2 &&
                        pTypes[1].toString() == "Ljava/lang/String;"
                    ) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 5,
                                smaliCode = """
                                    if-eqz p1, :cond_empty
                                    const-string v0, "\"access_levels\":{}"
                                    const-string v1, "\"access_levels\":{\"premium\":{\"id\":\"premium\",\"is_active\":true,\"is_lifetime\":true,\"vendor_product_id\":\"com.shroomid.premium.yearly\",\"store\":\"play_store\",\"activated_at\":\"2024-01-01T00:00:00.000Z\",\"renewed_at\":\"2024-01-01T00:00:00.000Z\",\"expires_at\":\"2099-01-01T00:00:00.000Z\",\"starts_at\":\"2024-01-01T00:00:00.000Z\",\"is_in_grace_period\":false,\"is_refund\":false,\"will_renew\":true},\"all_access\":{\"id\":\"all_access\",\"is_active\":true,\"is_lifetime\":true,\"vendor_product_id\":\"com.shroomid.premium.yearly\",\"store\":\"play_store\",\"activated_at\":\"2024-01-01T00:00:00.000Z\",\"renewed_at\":\"2024-01-01T00:00:00.000Z\",\"expires_at\":\"2099-01-01T00:00:00.000Z\",\"starts_at\":\"2024-01-01T00:00:00.000Z\",\"is_in_grace_period\":false,\"is_refund\":false,\"will_renew\":true}}"
                                    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                    move-result-object p1
                                    const-string v0, "\"paid_access_levels\":{}"
                                    const-string v1, "\"paid_access_levels\":{\"premium\":{\"id\":\"premium\",\"is_active\":true,\"is_lifetime\":true,\"vendor_product_id\":\"com.shroomid.premium.yearly\",\"store\":\"play_store\",\"activated_at\":\"2024-01-01T00:00:00.000Z\",\"renewed_at\":\"2024-01-01T00:00:00.000Z\",\"expires_at\":\"2099-01-01T00:00:00.000Z\",\"starts_at\":\"2024-01-01T00:00:00.000Z\",\"is_in_grace_period\":false,\"is_refund\":false,\"will_renew\":true},\"all_access\":{\"id\":\"all_access\",\"is_active\":true,\"is_lifetime\":true,\"vendor_product_id\":\"com.shroomid.premium.yearly\",\"store\":\"play_store\",\"activated_at\":\"2024-01-01T00:00:00.000Z\",\"renewed_at\":\"2024-01-01T00:00:00.000Z\",\"expires_at\":\"2099-01-01T00:00:00.000Z\",\"starts_at\":\"2024-01-01T00:00:00.000Z\",\"is_in_grace_period\":false,\"is_refund\":false,\"will_renew\":true}}"
                                    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                    move-result-object p1
                                    const-string v0, "\"subscriptions\":{}"
                                    const-string v1, "\"subscriptions\":{\"com.shroomid.premium.yearly\":{\"is_active\":true,\"is_lifetime\":true,\"vendor_product_id\":\"com.shroomid.premium.yearly\",\"store\":\"play_store\",\"activated_at\":\"2024-01-01T00:00:00.000Z\",\"renewed_at\":\"2024-01-01T00:00:00.000Z\",\"expires_at\":\"2099-01-01T00:00:00.000Z\",\"starts_at\":\"2024-01-01T00:00:00.000Z\",\"is_in_grace_period\":false,\"is_refund\":false,\"is_sandbox\":false,\"will_renew\":true}}"
                                    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                    move-result-object p1
                                    const-string v0, "\"is_active\":false"
                                    const-string v1, "\"is_active\":true"
                                    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                    move-result-object p1
                                    const-string v0, "\"is_lifetime\":false"
                                    const-string v1, "\"is_lifetime\":true"
                                    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                    move-result-object p1
                                    :cond_empty
                                    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                                    return-void
                                """.trimIndent(),
                            )
                            adaptyBridgeCount++
                            logger.info("[ShroomID Adapty] Hooked AdaptyReactModule->handle${'$'}lambda${'$'}4 to inject active subscription payload")
                        } catch (e: Exception) {
                            logger.warning("[ShroomID Adapty] Failed to hook AdaptyReactModule->handle${'$'}lambda${'$'}4: ${e.message}")
                        }
                    }

                    // initialize$lambda$1(AdaptyReactModule, String eventName, String eventData)
                    if (mName == "initialize${'$'}lambda${'$'}1" && returnType == "V" && pTypes.size == 3 &&
                        pTypes[2].toString() == "Ljava/lang/String;"
                    ) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 6,
                                smaliCode = """
                                    if-eqz p2, :cond_no_repl
                                    const-string v0, "\"access_levels\":{}"
                                    const-string v1, "\"access_levels\":{\"premium\":{\"id\":\"premium\",\"is_active\":true,\"is_lifetime\":true,\"vendor_product_id\":\"com.shroomid.premium.yearly\",\"store\":\"play_store\",\"activated_at\":\"2024-01-01T00:00:00.000Z\",\"renewed_at\":\"2024-01-01T00:00:00.000Z\",\"expires_at\":\"2099-01-01T00:00:00.000Z\",\"starts_at\":\"2024-01-01T00:00:00.000Z\",\"is_in_grace_period\":false,\"is_refund\":false,\"will_renew\":true},\"all_access\":{\"id\":\"all_access\",\"is_active\":true,\"is_lifetime\":true,\"vendor_product_id\":\"com.shroomid.premium.yearly\",\"store\":\"play_store\",\"activated_at\":\"2024-01-01T00:00:00.000Z\",\"renewed_at\":\"2024-01-01T00:00:00.000Z\",\"expires_at\":\"2099-01-01T00:00:00.000Z\",\"starts_at\":\"2024-01-01T00:00:00.000Z\",\"is_in_grace_period\":false,\"is_refund\":false,\"will_renew\":true}}"
                                    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                    move-result-object p2
                                    const-string v0, "\"paid_access_levels\":{}"
                                    const-string v1, "\"paid_access_levels\":{\"premium\":{\"id\":\"premium\",\"is_active\":true,\"is_lifetime\":true,\"vendor_product_id\":\"com.shroomid.premium.yearly\",\"store\":\"play_store\",\"activated_at\":\"2024-01-01T00:00:00.000Z\",\"renewed_at\":\"2024-01-01T00:00:00.000Z\",\"expires_at\":\"2099-01-01T00:00:00.000Z\",\"starts_at\":\"2024-01-01T00:00:00.000Z\",\"is_in_grace_period\":false,\"is_refund\":false,\"will_renew\":true},\"all_access\":{\"id\":\"all_access\",\"is_active\":true,\"is_lifetime\":true,\"vendor_product_id\":\"com.shroomid.premium.yearly\",\"store\":\"play_store\",\"activated_at\":\"2024-01-01T00:00:00.000Z\",\"renewed_at\":\"2024-01-01T00:00:00.000Z\",\"expires_at\":\"2099-01-01T00:00:00.000Z\",\"starts_at\":\"2024-01-01T00:00:00.000Z\",\"is_in_grace_period\":false,\"is_refund\":false,\"will_renew\":true}}"
                                    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                    move-result-object p2
                                    const-string v0, "\"subscriptions\":{}"
                                    const-string v1, "\"subscriptions\":{\"com.shroomid.premium.yearly\":{\"is_active\":true,\"is_lifetime\":true,\"vendor_product_id\":\"com.shroomid.premium.yearly\",\"store\":\"play_store\",\"activated_at\":\"2024-01-01T00:00:00.000Z\",\"renewed_at\":\"2024-01-01T00:00:00.000Z\",\"expires_at\":\"2099-01-01T00:00:00.000Z\",\"starts_at\":\"2024-01-01T00:00:00.000Z\",\"is_in_grace_period\":false,\"is_refund\":false,\"is_sandbox\":false,\"will_renew\":true}}"
                                    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                    move-result-object p2
                                    const-string v0, "\"is_active\":false"
                                    const-string v1, "\"is_active\":true"
                                    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                    move-result-object p2
                                    const-string v0, "\"is_lifetime\":false"
                                    const-string v1, "\"is_lifetime\":true"
                                    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                    move-result-object p2
                                    :cond_no_repl
                                    invoke-virtual {p0}, Lcom/adapty/react/AdaptyReactModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;
                                    move-result-object v0
                                    if-eqz v0, :cond_done
                                    const-class v1, Lcom/facebook/react/modules/core/DeviceEventManagerModule${'$'}RCTDeviceEventEmitter;
                                    invoke-virtual {v0, v1}, Lcom/facebook/react/bridge/ReactApplicationContext;->getJSModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/JavaScriptModule;
                                    move-result-object v0
                                    check-cast v0, Lcom/facebook/react/modules/core/DeviceEventManagerModule${'$'}RCTDeviceEventEmitter;
                                    invoke-interface {v0, p1, p2}, Lcom/facebook/react/modules/core/DeviceEventManagerModule${'$'}RCTDeviceEventEmitter;->emit(Ljava/lang/String;Ljava/lang/Object;)V
                                    :cond_done
                                    return-void
                                """.trimIndent(),
                            )
                            adaptyBridgeCount++
                            logger.info("[ShroomID Adapty] Hooked AdaptyReactModule->initialize${'$'}lambda${'$'}1 to inject active event payload")
                        } catch (e: Exception) {
                            logger.warning("[ShroomID Adapty] Failed to hook AdaptyReactModule->initialize${'$'}lambda${'$'}1: ${e.message}")
                        }
                    }
                }
            }

            // =========================================================================
            // 3. General ShroomID / React Native Premium checks
            // =========================================================================
            if (tl.contains("shroomid") || tl.contains("subscription") || tl.contains("premium")) {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                    val mName = method.name
                    val mNameLower = mName.lowercase()
                    val pTypes = method.parameterTypes
                    val returnType = method.returnType

                    val isPremiumMethod = (
                        mNameLower == "ispremium" ||
                        mNameLower == "ispro" ||
                        mNameLower == "issubscribed" ||
                        mNameLower == "hasactivepurchase" ||
                        mNameLower == "hasactivesubscription"
                    ) && !isStatic && pTypes.isEmpty()

                    if (isPremiumMethod) {
                        try {
                            if (returnType == "Z") {
                                mutableClass.replaceMethod(
                                    method,
                                    registerCount = 3,
                                    smaliCode = """
                                        const/4 v0, 0x1
                                        return v0
                                    """.trimIndent(),
                                )
                                generalPremiumCount++
                                logger.info("[ShroomID Premium] Hooked ${type}->${method.name}() -> true")
                            } else if (returnType == "Ljava/lang/Boolean;") {
                                mutableClass.replaceMethod(
                                    method,
                                    registerCount = 3,
                                    smaliCode = """
                                        sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                                        return-object v0
                                    """.trimIndent(),
                                )
                                generalPremiumCount++
                                logger.info("[ShroomID Premium] Hooked ${type}->${method.name}() -> Boolean.TRUE")
                            }
                        } catch (e: Exception) {
                            logger.fine("[ShroomID Premium] Failed to hook ${method.name}: ${e.message}")
                        }
                    }
                }
            }
        }
    }

    logger.info(
        "[ShroomID Premium] Patch completed: " +
            "adaptyModelCount=$adaptyModelCount, " +
            "adaptyBridgeCount=$adaptyBridgeCount, " +
            "generalPremiumCount=$generalPremiumCount",
    )
}
