package com.dmoniak.patches.hungryshark

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.hungryshark.util.replaceMethod
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HUNGRY_SHARK_WORLD
import java.util.logging.Logger

@Suppress("unused")
val freeShoppingPatch = bytecodePatch(
    name = "Free Shopping",
    description = "Unlocks shop items and in-app purchases in Hungry Shark World by cleanly replacing GoogleBillingService purchase methods and receipt validation.",
) {
    compatibleWith(COMPATIBILITY_HUNGRY_SHARK_WORLD)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Free Shopping patch for Hungry Shark World...")

        var isReadyCount = 0
        var responseCodeCount = 0
        var gbsPurchaseCount = 0
        var gbsValidationCount = 0
        var gbsCompletionCount = 0
        var verifyCount = 0

        classDefForEach { classDef ->
            val tl = classDef.type.lowercase()
            if (tl.contains("androidx") || tl.contains("android/support")) return@classDefForEach

            val mutableClass by lazy { mutableClassDefBy(classDef) }

            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name
                val pTypes = method.parameterTypes

                // =========================================================================
                // 1. Google Play Billing Client Core Methods (Safe: no try blocks)
                // =========================================================================
                if (classDef.type.contains("billingclient")) {

                    // 1a. BillingClient.isReady() -> boolean (always ready)
                    if (!isStatic &&
                        mName == "isReady" &&
                        method.returnType == "Z" &&
                        pTypes.isEmpty()
                    ) {
                        try {
                            val mutableMethod = mutableClass.findMutableMethodOf(method)
                            mutableMethod.addInstructions(
                                0,
                                """
                                const/4 v0, 0x1
                                return v0
                                """.trimIndent(),
                            )
                            isReadyCount++
                            logger.info("Patched isReady in ${classDef.type}")
                        } catch (e: Exception) {
                            logger.warning("Failed to patch isReady in ${classDef.type}: ${e.message}")
                        }
                    }

                    // 1b. BillingResult.getResponseCode() -> int (always OK / 0)
                    if (classDef.type.endsWith("/BillingResult;") &&
                        !isStatic &&
                        mName == "getResponseCode" &&
                        method.returnType == "I" &&
                        pTypes.isEmpty()
                    ) {
                        try {
                            val mutableMethod = mutableClass.findMutableMethodOf(method)
                            mutableMethod.addInstructions(
                                0,
                                """
                                const/4 v0, 0x0
                                return v0
                                """.trimIndent(),
                            )
                            responseCodeCount++
                            logger.info("Patched BillingResult.getResponseCode")
                        } catch (e: Exception) {
                            logger.warning("Failed to patch getResponseCode: ${e.message}")
                        }
                    }
                }

                // =========================================================================
                // 2. Ubisoft Orion Monetisation Core (GoogleBillingService)
                // Complete clean method replacement: 0 dead code, 0 try corruption, 16 registers
                // =========================================================================
                if (classDef.type == "Lcom/ubisoft/orion/monetisationcore/billing/GoogleBillingService;") {

                    // 2a. Replace purchaseProduct(String) - direct callback with dynamic UUID
                    if (!isStatic && mName == "purchaseProduct" && pTypes.size == 1 && pTypes[0] == "Ljava/lang/String;") {
                        try {
                            replaceMethod(
                                method,
                                16,
                                """
                                move-object v0, p1
                                if-nez v0, :morphe_sku_ok
                                const-string v0, "com.ubisoft.hungrysharkworld.gems_pack_1"

                                :morphe_sku_ok
                                invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;
                                move-result-object v1
                                invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;
                                move-result-object v1

                                new-instance v2, Ljava/lang/StringBuilder;
                                invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
                                const-string v3, "GPA."
                                invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                                move-result-object v2
                                invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                                move-result-object v2
                                invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                                move-result-object v2

                                invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;
                                move-result-object v3
                                const-string v4, "morphe_last_sku"
                                invoke-virtual {v3, v4, v0}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                                const-string v4, "morphe_last_orderid"
                                invoke-virtual {v3, v4, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                                const-string v4, "morphe_last_token"
                                invoke-virtual {v3, v4, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                                const-string v3, "[{\"sku\":\"REPLACE_SKU\",\"productId\":\"REPLACE_SKU\",\"productIds\":[\"REPLACE_SKU\"],\"orderId\":\"REPLACE_ORDERID\",\"packageName\":\"com.ubisoft.hungrysharkworld\",\"purchaseTime\":1700000000000,\"purchaseState\":1,\"purchaseToken\":\"REPLACE_TOKEN\",\"quantity\":1,\"acknowledged\":false,\"signature\":\"morphe_sig\",\"originalJson\":\"{\\\"orderId\\\":\\\"REPLACE_ORDERID\\\",\\\"packageName\\\":\\\"com.ubisoft.hungrysharkworld\\\",\\\"productId\\\":\\\"REPLACE_SKU\\\",\\\"productIds\\\":[\\\"REPLACE_SKU\\\"],\\\"purchaseTime\\\":1700000000000,\\\"purchaseState\\\":1,\\\"purchaseToken\\\":\\\"REPLACE_TOKEN\\\",\\\"quantity\\\":1,\\\"acknowledged\\\":false}\",\"developerPayload\":\"\",\"autoRenewing\":false,\"obfuscatedProfileId\":\"\",\"obfuscatedAccountId\":\"\"}]"
                                const-string v4, "REPLACE_SKU"
                                invoke-virtual {v3, v4, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                move-result-object v3
                                const-string v4, "REPLACE_ORDERID"
                                invoke-virtual {v3, v4, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                move-result-object v3
                                const-string v4, "REPLACE_TOKEN"
                                invoke-virtual {v3, v4, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                move-result-object v3

                                iget-object v4, p0, Lcom/ubisoft/orion/monetisationcore/billing/GoogleBillingService;->monetisationEvents:Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;
                                if-eqz v4, :morphe_done
                                const/4 v5, 0x0
                                const-string v6, "OK"
                                invoke-interface {v4, v5, v6, v3}, Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;->OnProductPurchasedListener(ILjava/lang/String;Ljava/lang/String;)V

                                :morphe_done
                                return-void
                                """.trimIndent(),
                            )
                            gbsPurchaseCount++
                            logger.info("Cleanly replaced GoogleBillingService.purchaseProduct(String)")
                        } catch (e: Exception) {
                            logger.warning("Failed to replace GoogleBillingService.purchaseProduct: ${e.message}")
                        }
                    }

                    // 2b. Replace purchaseProductWithOffer(String, String) - direct callback with dynamic UUID
                    if (!isStatic && mName == "purchaseProductWithOffer" && pTypes.size == 2 && pTypes[0] == "Ljava/lang/String;") {
                        try {
                            replaceMethod(
                                method,
                                16,
                                """
                                move-object v0, p1
                                if-nez v0, :morphe_sku_ok2
                                const-string v0, "com.ubisoft.hungrysharkworld.gems_pack_1"

                                :morphe_sku_ok2
                                invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;
                                move-result-object v1
                                invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;
                                move-result-object v1

                                new-instance v2, Ljava/lang/StringBuilder;
                                invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
                                const-string v3, "GPA."
                                invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                                move-result-object v2
                                invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                                move-result-object v2
                                invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                                move-result-object v2

                                invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;
                                move-result-object v3
                                const-string v4, "morphe_last_sku"
                                invoke-virtual {v3, v4, v0}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                                const-string v4, "morphe_last_orderid"
                                invoke-virtual {v3, v4, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                                const-string v4, "morphe_last_token"
                                invoke-virtual {v3, v4, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                                const-string v3, "[{\"sku\":\"REPLACE_SKU\",\"productId\":\"REPLACE_SKU\",\"productIds\":[\"REPLACE_SKU\"],\"orderId\":\"REPLACE_ORDERID\",\"packageName\":\"com.ubisoft.hungrysharkworld\",\"purchaseTime\":1700000000000,\"purchaseState\":1,\"purchaseToken\":\"REPLACE_TOKEN\",\"quantity\":1,\"acknowledged\":false,\"signature\":\"morphe_sig\",\"originalJson\":\"{\\\"orderId\\\":\\\"REPLACE_ORDERID\\\",\\\"packageName\\\":\\\"com.ubisoft.hungrysharkworld\\\",\\\"productId\\\":\\\"REPLACE_SKU\\\",\\\"productIds\\\":[\\\"REPLACE_SKU\\\"],\\\"purchaseTime\\\":1700000000000,\\\"purchaseState\\\":1,\\\"purchaseToken\\\":\\\"REPLACE_TOKEN\\\",\\\"quantity\\\":1,\\\"acknowledged\\\":false}\",\"developerPayload\":\"\",\"autoRenewing\":false,\"obfuscatedProfileId\":\"\",\"obfuscatedAccountId\":\"\"}]"
                                const-string v4, "REPLACE_SKU"
                                invoke-virtual {v3, v4, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                move-result-object v3
                                const-string v4, "REPLACE_ORDERID"
                                invoke-virtual {v3, v4, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                move-result-object v3
                                const-string v4, "REPLACE_TOKEN"
                                invoke-virtual {v3, v4, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                move-result-object v3

                                iget-object v4, p0, Lcom/ubisoft/orion/monetisationcore/billing/GoogleBillingService;->monetisationEvents:Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;
                                if-eqz v4, :morphe_done2
                                const/4 v5, 0x0
                                const-string v6, "OK"
                                invoke-interface {v4, v5, v6, v3}, Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;->OnProductPurchasedListener(ILjava/lang/String;Ljava/lang/String;)V

                                :morphe_done2
                                return-void
                                """.trimIndent(),
                            )
                            gbsPurchaseCount++
                            logger.info("Cleanly replaced GoogleBillingService.purchaseProductWithOffer")
                        } catch (e: Exception) {
                            logger.warning("Failed to replace GoogleBillingService.purchaseProductWithOffer: ${e.message}")
                        }
                    }

                    // 2c. Bypass validatePurchase in GoogleBillingService
                    if (!isStatic && mName == "validatePurchase" && method.returnType == "V" && pTypes.size == 4) {
                        try {
                            replaceMethod(
                                method,
                                16,
                                """
                                iget-object v0, p0, Lcom/ubisoft/orion/monetisationcore/billing/GoogleBillingService;->monetisationEvents:Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;
                                if-eqz v0, :morphe_gbs_val_skip

                                move-object v1, p1
                                if-nez v1, :morphe_val_sku_ok
                                invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;
                                move-result-object v2
                                const-string v3, "morphe_last_sku"
                                invoke-virtual {v2, v3}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;
                                move-result-object v1
                                check-cast v1, Ljava/lang/String;
                                if-nez v1, :morphe_val_sku_ok
                                const-string v1, "com.ubisoft.hungrysharkworld.gems_pack_1"

                                :morphe_val_sku_ok
                                move-object v4, p2
                                if-nez v4, :morphe_val_txid_ok
                                invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;
                                move-result-object v2
                                const-string v3, "morphe_last_orderid"
                                invoke-virtual {v2, v3}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;
                                move-result-object v4
                                check-cast v4, Ljava/lang/String;
                                if-nez v4, :morphe_val_txid_ok
                                const-string v4, "GPA.1234-5678-9012-34567"

                                :morphe_val_txid_ok
                                const-string v2, "REPLACE_SKU"
                                const-string v3, "{\"houstonTransactionId\":\"REPLACE_ORDERID\",\"HoustonTransactionId\":\"REPLACE_ORDERID\",\"ubisoftTransactionId\":\"REPLACE_ORDERID\",\"UbisoftTransactionId\":\"REPLACE_ORDERID\",\"entitlementId\":\"REPLACE_ORDERID\",\"EntitlementId\":\"REPLACE_ORDERID\",\"itemId\":\"REPLACE_SKU\",\"ItemId\":\"REPLACE_SKU\",\"productId\":\"REPLACE_SKU\",\"catalogItemId\":\"REPLACE_SKU\",\"redeemed\":true,\"Redeemed\":true,\"trialPeriod\":false,\"TrialPeriod\":false,\"status\":\"SUCCESS\",\"paymentState\":\"PURCHASED\",\"expiresDate\":\"\",\"expired\":false,\"autoRenewing\":false,\"renewalStatus\":\"\"}"
                                invoke-virtual {v3, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                move-result-object v3
                                const-string v2, "REPLACE_ORDERID"
                                invoke-virtual {v3, v2, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                move-result-object v3

                                const/4 v1, 0x0
                                const-string v2, "OK"
                                invoke-interface {v0, v1, v2, v3}, Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;->OnValidatePurchaseListener(ILjava/lang/String;Ljava/lang/String;)V

                                :morphe_gbs_val_skip
                                return-void
                                """.trimIndent(),
                            )
                            gbsValidationCount++
                            logger.info("Cleanly replaced GoogleBillingService.validatePurchase")
                        } catch (e: Exception) {
                            logger.warning("Failed to replace GoogleBillingService.validatePurchase: ${e.message}")
                        }
                    }

                    // 2d. Bypass validatePurchaseV2 in GoogleBillingService
                    if (!isStatic && mName == "validatePurchaseV2" && method.returnType == "V" && pTypes.size == 6) {
                        try {
                            replaceMethod(
                                method,
                                16,
                                """
                                iget-object v0, p0, Lcom/ubisoft/orion/monetisationcore/billing/GoogleBillingService;->monetisationEvents:Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;
                                if-eqz v0, :morphe_gbs_val2_skip

                                move-object v1, p1
                                if-nez v1, :morphe_val2_sku_ok
                                invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;
                                move-result-object v2
                                const-string v3, "morphe_last_sku"
                                invoke-virtual {v2, v3}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;
                                move-result-object v1
                                check-cast v1, Ljava/lang/String;
                                if-nez v1, :morphe_val2_sku_ok
                                const-string v1, "com.ubisoft.hungrysharkworld.gems_pack_1"

                                :morphe_val2_sku_ok
                                move-object v4, p2
                                if-nez v4, :morphe_val2_txid_ok
                                invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;
                                move-result-object v2
                                const-string v3, "morphe_last_orderid"
                                invoke-virtual {v2, v3}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;
                                move-result-object v4
                                check-cast v4, Ljava/lang/String;
                                if-nez v4, :morphe_val2_txid_ok
                                const-string v4, "GPA.1234-5678-9012-34567"

                                :morphe_val2_txid_ok
                                const-string v2, "REPLACE_SKU"
                                const-string v3, "{\"transactionId\":\"REPLACE_ORDERID\",\"TransactionId\":\"REPLACE_ORDERID\",\"ubisoftTransactionId\":\"REPLACE_ORDERID\",\"UbisoftTransactionId\":\"REPLACE_ORDERID\",\"orderId\":\"REPLACE_ORDERID\",\"bundleId\":\"com.ubisoft.hungrysharkworld\",\"paymentState\":\"PURCHASED\",\"isSandbox\":false,\"isExpired\":false,\"wasPreviouslyValidated\":true,\"entitlementId\":\"REPLACE_ORDERID\",\"EntitlementId\":\"REPLACE_ORDERID\",\"itemId\":\"REPLACE_SKU\",\"ItemId\":\"REPLACE_SKU\",\"productId\":\"REPLACE_SKU\",\"redeemed\":true,\"Redeemed\":true}"
                                invoke-virtual {v3, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                move-result-object v3
                                const-string v2, "REPLACE_ORDERID"
                                invoke-virtual {v3, v2, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                move-result-object v3

                                const/4 v1, 0x0
                                const-string v2, "OK"
                                invoke-interface {v0, v1, v2, v3}, Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;->OnValidatePurchaseV2Listener(ILjava/lang/String;Ljava/lang/String;)V

                                :morphe_gbs_val2_skip
                                return-void
                                """.trimIndent(),
                            )
                            gbsValidationCount++
                            logger.info("Cleanly replaced GoogleBillingService.validatePurchaseV2")
                        } catch (e: Exception) {
                            logger.warning("Failed to replace GoogleBillingService.validatePurchaseV2: ${e.message}")
                        }
                    }

                    // 2e. Bypass completePurchase in GoogleBillingService
                    if (!isStatic && mName == "completePurchase" && method.returnType == "V" && pTypes.size == 2) {
                        try {
                            replaceMethod(
                                method,
                                16,
                                """
                                iget-object v0, p0, Lcom/ubisoft/orion/monetisationcore/billing/GoogleBillingService;->monetisationEvents:Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;
                                if-eqz v0, :morphe_gbs_comp_skip

                                move-object v1, p1
                                if-nez v1, :morphe_gbs_comp_sku_ok
                                invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;
                                move-result-object v2
                                const-string v3, "morphe_last_sku"
                                invoke-virtual {v2, v3}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;
                                move-result-object v1
                                check-cast v1, Ljava/lang/String;
                                if-nez v1, :morphe_gbs_comp_sku_ok
                                const-string v1, "com.ubisoft.hungrysharkworld.gems_pack_1"

                                :morphe_gbs_comp_sku_ok
                                invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;
                                move-result-object v2
                                const-string v3, "morphe_last_orderid"
                                invoke-virtual {v2, v3}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;
                                move-result-object v4
                                check-cast v4, Ljava/lang/String;
                                if-nez v4, :morphe_gbs_comp_order_ok
                                const-string v4, "GPA.1234-5678-9012-34567"

                                :morphe_gbs_comp_order_ok
                                invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;
                                move-result-object v2
                                const-string v3, "morphe_last_token"
                                invoke-virtual {v2, v3}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;
                                move-result-object v5
                                check-cast v5, Ljava/lang/String;
                                if-nez v5, :morphe_gbs_comp_tok_ok
                                const-string v5, "morphe_token"

                                :morphe_gbs_comp_tok_ok
                                const-string v2, "REPLACE_SKU"
                                const-string v3, "{\"sku\":\"REPLACE_SKU\",\"productId\":\"REPLACE_SKU\",\"productIds\":[\"REPLACE_SKU\"],\"orderId\":\"REPLACE_ORDERID\",\"packageName\":\"com.ubisoft.hungrysharkworld\",\"purchaseTime\":1700000000000,\"purchaseState\":1,\"purchaseToken\":\"REPLACE_TOKEN\",\"quantity\":1,\"acknowledged\":true,\"signature\":\"morphe_sig\",\"originalJson\":\"{\\\"orderId\\\":\\\"REPLACE_ORDERID\\\",\\\"packageName\\\":\\\"com.ubisoft.hungrysharkworld\\\",\\\"productId\\\":\\\"REPLACE_SKU\\\",\\\"productIds\\\":[\\\"REPLACE_SKU\\\"],\\\"purchaseTime\\\":1700000000000,\\\"purchaseState\\\":1,\\\"purchaseToken\\\":\\\"REPLACE_TOKEN\\\",\\\"quantity\\\":1,\\\"acknowledged\\\":true}\",\"developerPayload\":\"\",\"autoRenewing\":false,\"obfuscatedProfileId\":\"\",\"obfuscatedAccountId\":\"\"}"
                                invoke-virtual {v3, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                move-result-object v3
                                const-string v2, "REPLACE_ORDERID"
                                invoke-virtual {v3, v2, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                move-result-object v3
                                const-string v2, "REPLACE_TOKEN"
                                invoke-virtual {v3, v2, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                move-result-object v3

                                const/4 v1, 0x0
                                const-string v2, "OK"

                                invoke-interface {v0, v1, v2, v3}, Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;->OnPurchaseCompletedListener(ILjava/lang/String;Ljava/lang/String;)V
                                invoke-interface {v0, v1, v2, v3}, Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;->OnTransactionFinishedListener(ILjava/lang/String;Ljava/lang/String;)V

                                if-eqz p2, :morphe_gbs_comp_skip
                                invoke-interface {v0, v1, v2, v5, v3}, Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;->OnProductConsumedListener(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

                                :morphe_gbs_comp_skip
                                return-void
                                """.trimIndent(),
                            )
                            gbsCompletionCount++
                            logger.info("Cleanly replaced GoogleBillingService.completePurchase")
                        } catch (e: Exception) {
                            logger.warning("Failed to replace GoogleBillingService.completePurchase: ${e.message}")
                        }
                    }

                    // 2f. Bypass acknowledgePurchase(String) in GoogleBillingService (for non-consumables / sharks)
                    if (!isStatic && mName == "acknowledgePurchase" && pTypes.size == 1 && pTypes[0] == "Ljava/lang/String;") {
                        try {
                            replaceMethod(
                                method,
                                16,
                                """
                                iget-object v0, p0, Lcom/ubisoft/orion/monetisationcore/billing/GoogleBillingService;->monetisationEvents:Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;
                                if-eqz v0, :morphe_gbs_ack_skip

                                invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;
                                move-result-object v1
                                const-string v2, "morphe_last_sku"
                                invoke-virtual {v1, v2}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;
                                move-result-object v3
                                check-cast v3, Ljava/lang/String;
                                if-nez v3, :morphe_gbs_ack_sku_ok
                                const-string v3, "com.ubisoft.hungrysharkworld.gems_pack_1"

                                :morphe_gbs_ack_sku_ok
                                move-object v4, p1
                                if-nez v4, :morphe_gbs_ack_order_ok
                                invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;
                                move-result-object v1
                                const-string v2, "morphe_last_orderid"
                                invoke-virtual {v1, v2}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;
                                move-result-object v4
                                check-cast v4, Ljava/lang/String;
                                if-nez v4, :morphe_gbs_ack_order_ok
                                const-string v4, "GPA.1234-5678-9012-34567"

                                :morphe_gbs_ack_order_ok
                                const-string v2, "REPLACE_SKU"
                                const-string v5, "{\"sku\":\"REPLACE_SKU\",\"productId\":\"REPLACE_SKU\",\"productIds\":[\"REPLACE_SKU\"],\"orderId\":\"REPLACE_ORDERID\",\"packageName\":\"com.ubisoft.hungrysharkworld\",\"purchaseTime\":1700000000000,\"purchaseState\":1,\"purchaseToken\":\"morphe_token\",\"quantity\":1,\"acknowledged\":true,\"signature\":\"morphe_sig\",\"originalJson\":\"{\\\"orderId\\\":\\\"REPLACE_ORDERID\\\",\\\"packageName\\\":\\\"com.ubisoft.hungrysharkworld\\\",\\\"productId\\\":\\\"REPLACE_SKU\\\",\\\"productIds\\\":[\\\"REPLACE_SKU\\\"],\\\"purchaseTime\\\":1700000000000,\\\"purchaseState\\\":1,\\\"purchaseToken\\\":\\\"morphe_token\\\",\\\"quantity\\\":1,\\\"acknowledged\\\":true}\",\"developerPayload\":\"\",\"autoRenewing\":false,\"obfuscatedProfileId\":\"\",\"obfuscatedAccountId\":\"\"}"
                                invoke-virtual {v5, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                move-result-object v5
                                const-string v2, "REPLACE_ORDERID"
                                invoke-virtual {v5, v2, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                move-result-object v5

                                const/4 v1, 0x0
                                const-string v2, "OK"
                                invoke-interface {v0, v1, v2, v5}, Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;->OnPurchaseCompletedListener(ILjava/lang/String;Ljava/lang/String;)V
                                invoke-interface {v0, v1, v2, v5}, Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;->OnTransactionFinishedListener(ILjava/lang/String;Ljava/lang/String;)V

                                :morphe_gbs_ack_skip
                                return-void
                                """.trimIndent(),
                            )
                            gbsCompletionCount++
                            logger.info("Cleanly replaced GoogleBillingService.acknowledgePurchase(String)")
                        } catch (e: Exception) {
                            logger.warning("Failed to replace GoogleBillingService.acknowledgePurchase: ${e.message}")
                        }
                    }

                    // 2g. Bypass consumePurchase(String) in GoogleBillingService (for consumables / gems & coins)
                    if (!isStatic && mName == "consumePurchase" && pTypes.size == 1 && pTypes[0] == "Ljava/lang/String;") {
                        try {
                            replaceMethod(
                                method,
                                16,
                                """
                                iget-object v0, p0, Lcom/ubisoft/orion/monetisationcore/billing/GoogleBillingService;->monetisationEvents:Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;
                                if-eqz v0, :morphe_gbs_cons_skip

                                invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;
                                move-result-object v1
                                const-string v2, "morphe_last_sku"
                                invoke-virtual {v1, v2}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;
                                move-result-object v3
                                check-cast v3, Ljava/lang/String;
                                if-nez v3, :morphe_gbs_cons_sku_ok
                                const-string v3, "com.ubisoft.hungrysharkworld.gems_pack_1"

                                :morphe_gbs_cons_sku_ok
                                move-object v4, p1
                                if-nez v4, :morphe_gbs_cons_order_ok
                                invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;
                                move-result-object v1
                                const-string v2, "morphe_last_orderid"
                                invoke-virtual {v1, v2}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;
                                move-result-object v4
                                check-cast v4, Ljava/lang/String;
                                if-nez v4, :morphe_gbs_cons_order_ok
                                const-string v4, "GPA.1234-5678-9012-34567"

                                :morphe_gbs_cons_order_ok
                                invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;
                                move-result-object v1
                                const-string v2, "morphe_last_token"
                                invoke-virtual {v1, v2}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;
                                move-result-object v5
                                check-cast v5, Ljava/lang/String;
                                if-nez v5, :morphe_gbs_cons_tok_ok
                                const-string v5, "morphe_token"

                                :morphe_gbs_cons_tok_ok
                                const-string v2, "REPLACE_SKU"
                                const-string v6, "{\"sku\":\"REPLACE_SKU\",\"productId\":\"REPLACE_SKU\",\"productIds\":[\"REPLACE_SKU\"],\"orderId\":\"REPLACE_ORDERID\",\"packageName\":\"com.ubisoft.hungrysharkworld\",\"purchaseTime\":1700000000000,\"purchaseState\":1,\"purchaseToken\":\"REPLACE_TOKEN\",\"quantity\":1,\"acknowledged\":true,\"signature\":\"morphe_sig\",\"originalJson\":\"{\\\"orderId\\\":\\\"REPLACE_ORDERID\\\",\\\"packageName\\\":\\\"com.ubisoft.hungrysharkworld\\\",\\\"productId\\\":\\\"REPLACE_SKU\\\",\\\"productIds\\\":[\\\"REPLACE_SKU\\\"],\\\"purchaseTime\\\":1700000000000,\\\"purchaseState\\\":1,\\\"purchaseToken\\\":\\\"REPLACE_TOKEN\\\",\\\"quantity\\\":1,\\\"acknowledged\\\":true}\",\"developerPayload\":\"\",\"autoRenewing\":false,\"obfuscatedProfileId\":\"\",\"obfuscatedAccountId\":\"\"}"
                                invoke-virtual {v6, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                move-result-object v6
                                const-string v2, "REPLACE_ORDERID"
                                invoke-virtual {v6, v2, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                move-result-object v6
                                const-string v2, "REPLACE_TOKEN"
                                invoke-virtual {v6, v2, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                                move-result-object v6

                                const/4 v1, 0x0
                                const-string v2, "OK"
                                invoke-interface {v0, v1, v2, v6}, Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;->OnPurchaseCompletedListener(ILjava/lang/String;Ljava/lang/String;)V
                                invoke-interface {v0, v1, v2, v6}, Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;->OnTransactionFinishedListener(ILjava/lang/String;Ljava/lang/String;)V
                                invoke-interface {v0, v1, v2, v5, v6}, Lcom/ubisoft/orion/monetisationcore/MonetisationEvents;->OnProductConsumedListener(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

                                :morphe_gbs_cons_skip
                                return-void
                                """.trimIndent(),
                            )
                            gbsCompletionCount++
                            logger.info("Cleanly replaced GoogleBillingService.consumePurchase(String)")
                        } catch (e: Exception) {
                            logger.warning("Failed to replace GoogleBillingService.consumePurchase: ${e.message}")
                        }
                    }
                }

                // =========================================================================
                // 3. Receipt Verification Bypass (Safe: no try blocks)
                // =========================================================================
                if (mName == "verifyPurchase" &&
                    method.returnType == "Z" &&
                    pTypes.size == 3 &&
                    pTypes.all { it == "Ljava/lang/String;" }
                ) {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent(),
                        )
                        verifyCount++
                        logger.info("Patched verifyPurchase in ${classDef.type}")
                    } catch (e: Exception) {
                        logger.warning("Failed to patch verifyPurchase in ${classDef.type}: ${e.message}")
                    }
                }
            }
        }

        logger.info(
            "Free Shopping results: isReady=$isReadyCount, getResponseCode=$responseCodeCount, " +
            "gbsPurchase=$gbsPurchaseCount, gbsValidation=$gbsValidationCount, " +
            "gbsCompletion=$gbsCompletionCount, verifyPurchase=$verifyCount."
        )
        logger.info("Free Shopping patch execution finished.")
    }
}
