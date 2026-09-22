package com.dmoniak.patches.coinsnap

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.replaceMethod
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_COINSNAP
import java.util.logging.Logger

@Suppress("unused")
val coinSnapPremiumPatch = bytecodePatch(
    name = "Unlock VIP (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks CoinSnap VIP features including unlimited coin identifications, full grading and valuation, collection storage, and disables startup paywall prompts. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_COINSNAP)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Unlock VIP patch for CoinSnap...")

        var vipInfoCount = 0
        var appViewModelCount = 0
        var routerHandlerCount = 0
        var billingManagerCount = 0
        var billingAgentCount = 0

        classDefForEach { classDef ->
            val type = classDef.type
            val tl = type.lowercase()
            if (tl.contains("androidx") || tl.contains("android/support")) return@classDefForEach

            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name
                val pTypes = method.parameterTypes
                val returnType = method.returnType

                // =========================================================================
                // 1. VipInfo Data Models (VIP Status & Tier Level)
                // =========================================================================
                if (type.endsWith("/VipInfo;")) {
                    // isVip() -> Boolean (true)
                    if (!isStatic && mName == "isVip" && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            replaceMethod(
                                method,
                                4,
                                """
                                const/4 v0, 0x1
                                return v0
                                """.trimIndent(),
                            )
                            vipInfoCount++
                            logger.info("Hooked ${type}->isVip() -> true")
                        } catch (e: Exception) {
                            logger.warning("Failed to hook ${type}->isVip: ${e.message}")
                        }
                    }

                    // isTrial() -> Boolean (false, full VIP)
                    if (!isStatic && mName == "isTrial" && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            replaceMethod(
                                method,
                                4,
                                """
                                const/4 v0, 0x0
                                return v0
                                """.trimIndent(),
                            )
                            vipInfoCount++
                            logger.info("Hooked ${type}->isTrial() -> false")
                        } catch (e: Exception) {
                            logger.warning("Failed to hook ${type}->isTrial: ${e.message}")
                        }
                    }

                    // getVipLevel() -> VipLevel / String (PLATINUM)
                    if (!isStatic && mName == "getVipLevel" && pTypes.isEmpty()) {
                        try {
                            if (returnType == "Ljava/lang/String;") {
                                replaceMethod(
                                    method,
                                    4,
                                    """
                                    const-string v0, "PLATINUM"
                                    return-object v0
                                    """.trimIndent(),
                                )
                                vipInfoCount++
                                logger.info("Hooked ${type}->getVipLevel() -> PLATINUM (String)")
                            } else if (returnType.endsWith("/VipLevel;")) {
                                replaceMethod(
                                    method,
                                    4,
                                    """
                                    sget-object v0, $returnType->PLATINUM:$returnType
                                    return-object v0
                                    """.trimIndent(),
                                )
                                vipInfoCount++
                                logger.info("Hooked ${type}->getVipLevel() -> PLATINUM (Enum)")
                            }
                        } catch (e: Exception) {
                            logger.warning("Failed to hook ${type}->getVipLevel: ${e.message}")
                        }
                    }
                }

                // =========================================================================
                // 2. AppViewModel & AppViewModel$Companion (Global App VIP State)
                // =========================================================================
                if (type.contains("AppViewModel")) {
                    if (mName == "isVip" && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            replaceMethod(
                                method,
                                4,
                                """
                                const/4 v0, 0x1
                                return v0
                                """.trimIndent(),
                            )
                            appViewModelCount++
                            logger.info("Hooked ${type}->isVip() -> true")
                        } catch (e: Exception) {
                            logger.warning("Failed to hook ${type}->isVip: ${e.message}")
                        }
                    }

                    if (mName == "isTrial" && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            replaceMethod(
                                method,
                                4,
                                """
                                const/4 v0, 0x0
                                return v0
                                """.trimIndent(),
                            )
                            appViewModelCount++
                            logger.info("Hooked ${type}->isTrial() -> false")
                        } catch (e: Exception) {
                            logger.warning("Failed to hook ${type}->isTrial: ${e.message}")
                        }
                    }

                    if (mName == "isVipInHistory" && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            replaceMethod(
                                method,
                                4,
                                """
                                const/4 v0, 0x1
                                return v0
                                """.trimIndent(),
                            )
                            appViewModelCount++
                            logger.info("Hooked ${type}->isVipInHistory() -> true")
                        } catch (e: Exception) {
                            logger.warning("Failed to hook ${type}->isVipInHistory: ${e.message}")
                        }
                    }

                    if (mName == "isPowerUser" && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            replaceMethod(
                                method,
                                4,
                                """
                                const/4 v0, 0x1
                                return v0
                                """.trimIndent(),
                            )
                            appViewModelCount++
                            logger.info("Hooked ${type}->isPowerUser() -> true")
                        } catch (e: Exception) {
                            logger.warning("Failed to hook ${type}->isPowerUser: ${e.message}")
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
                    if (mName == "execute" && returnType == "Ljava/lang/Boolean;") {
                        try {
                            replaceMethod(
                                method,
                                4,
                                """
                                const/4 v0, 0x1
                                invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                                move-result-object v0
                                return-object v0
                                """.trimIndent(),
                            )
                            routerHandlerCount++
                            logger.info("Hooked ${type}->execute() -> Boolean.TRUE")
                        } catch (e: Exception) {
                            logger.warning("Failed to hook ${type}->execute: ${e.message}")
                        }
                    }

                    if (mName == "post" && returnType == "V" && pTypes.size == 1) {
                        try {
                            replaceMethod(
                                method,
                                6,
                                """
                                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                                invoke-virtual {p1}, Lcom/glority/android/core/route/RouteRequest;->getId()Ljava/lang/String;
                                move-result-object v1
                                invoke-static {v1, v0}, Lcom/glority/android/core/route/Router;->onResponse(Ljava/lang/String;Ljava/lang/Object;)V
                                return-void
                                """.trimIndent(),
                            )
                            routerHandlerCount++
                            logger.info("Hooked ${type}->post() -> Router.onResponse(true)")
                        } catch (e: Exception) {
                            logger.warning("Failed to hook ${type}->post: ${e.message}")
                        }
                    }
                }

                if (type.contains("GetVipTypeHandler")) {
                    if (mName == "execute" && returnType == "Ljava/lang/String;") {
                        try {
                            replaceMethod(
                                method,
                                4,
                                """
                                const-string v0, "vip"
                                return-object v0
                                """.trimIndent(),
                            )
                            routerHandlerCount++
                            logger.info("Hooked ${type}->execute() -> \"vip\"")
                        } catch (e: Exception) {
                            logger.warning("Failed to hook ${type}->execute: ${e.message}")
                        }
                    }
                }

                if (type.contains("HomePurchasePageShouldShowHandler")) {
                    if (mName == "execute" && returnType == "Ljava/lang/Boolean;") {
                        try {
                            replaceMethod(
                                method,
                                4,
                                """
                                const/4 v0, 0x0
                                invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                                move-result-object v0
                                return-object v0
                                """.trimIndent(),
                            )
                            routerHandlerCount++
                            logger.info("Hooked ${type}->execute() -> Boolean.FALSE (disable popup)")
                        } catch (e: Exception) {
                            logger.warning("Failed to hook ${type}->execute: ${e.message}")
                        }
                    }
                }

                // =========================================================================
                // 4. BillingManager (In-app billing state)
                // =========================================================================
                if (type.contains("BillingManager")) {
                    if (mName == "isPurchaseActive" && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            replaceMethod(
                                method,
                                4,
                                """
                                const/4 v0, 0x1
                                return v0
                                """.trimIndent(),
                            )
                            billingManagerCount++
                            logger.info("Hooked ${type}->isPurchaseActive() -> true")
                        } catch (e: Exception) {
                            logger.warning("Failed to hook ${type}->isPurchaseActive: ${e.message}")
                        }
                    }

                    if (mName == "areSubscriptionsSupported" && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            replaceMethod(
                                method,
                                4,
                                """
                                const/4 v0, 0x1
                                return v0
                                """.trimIndent(),
                            )
                            billingManagerCount++
                            logger.info("Hooked ${type}->areSubscriptionsSupported() -> true")
                        } catch (e: Exception) {
                            logger.warning("Failed to hook ${type}->areSubscriptionsSupported: ${e.message}")
                        }
                    }
                }

                // =========================================================================
                // 5. MyBillingAgent (Billing Agent status)
                // =========================================================================
                if (type.contains("MyBillingAgent")) {
                    if (mName == "isInAppBilling" && returnType == "Z" && pTypes.isEmpty()) {
                        try {
                            replaceMethod(
                                method,
                                4,
                                """
                                const/4 v0, 0x1
                                return v0
                                """.trimIndent(),
                            )
                            billingAgentCount++
                            logger.info("Hooked ${type}->isInAppBilling() -> true")
                        } catch (e: Exception) {
                            logger.warning("Failed to hook ${type}->isInAppBilling: ${e.message}")
                        }
                    }
                }

                // =========================================================================
                // 6. Generic BillingClient.isReady()
                // =========================================================================
                if (type.contains("billingclient") && !isStatic && mName == "isReady" && returnType == "Z" && pTypes.isEmpty()) {
                    try {
                        replaceMethod(
                            method,
                            4,
                            """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent(),
                        )
                        logger.info("Hooked ${type}->isReady() -> true")
                    } catch (e: Exception) {
                        logger.warning("Failed to hook ${type}->isReady: ${e.message}")
                    }
                }
            }
        }

        logger.info(
            "Unlock VIP patch finished: " +
                "vipInfoCount=$vipInfoCount, " +
                "appViewModelCount=$appViewModelCount, " +
                "routerHandlerCount=$routerHandlerCount, " +
                "billingManagerCount=$billingManagerCount, " +
                "billingAgentCount=$billingAgentCount",
        )
    }
}
