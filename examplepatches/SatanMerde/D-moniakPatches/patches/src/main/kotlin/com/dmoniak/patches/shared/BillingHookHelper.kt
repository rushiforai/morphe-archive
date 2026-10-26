package com.dmoniak.patches.shared

import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import java.util.logging.Logger


/**
 * Universal, production-grade Google Play Billing hook engine.
 * Directly targets the official Android BillingClient SDK:
 * - BillingResult.getResponseCode() -> 0 (OK)
 * - Purchase.getPurchaseState() -> 1 (PURCHASED)
 * - Purchase.isAcknowledged() -> true
 * - Purchase.isAutoRenewing() -> true
 * - BillingClient.isReady() -> true
 * - PurchasesUpdatedListener & local purchase verification methods
 */
object BillingHookHelper {

    fun BytecodePatchContext.executeGooglePlayBillingBypass(logger: Logger, targetName: String): Int {
        logger.info("[$targetName] Executing Google Play Billing bypass engine...")
        var hookedPoints = 0

        classDefForEach { classDef ->
            val type = classDef.type
            val tl = type.lowercase()

            val isBillingSdk = tl.contains("billingclient") || tl.contains("com/android/billing")
            val isLocalBilling = tl.contains("billing") || tl.contains("purchase") || tl.contains("inapp")

            if (!isBillingSdk && !isLocalBilling) return@classDefForEach

            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name
                val mNameLower = mName.lowercase()
                val retType = method.returnType
                val pTypes = method.parameterTypes

                // 1. Hook BillingResult.getResponseCode() -> 0 (BillingResponseCode.OK)
                if (isBillingSdk && !isStatic && mName == "getResponseCode" && retType == "I" && pTypes.isEmpty()) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 3,
                            smaliCode = """
                            const/4 v0, 0x0
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[$targetName Billing] Hooked BillingResult.getResponseCode -> OK (0)")
                    } catch (e: Exception) {
                        logger.fine("[$targetName Billing] Failed getResponseCode: ${e.message}")
                    }
                }

                // 2. Hook Purchase.getPurchaseState() -> 1 (PURCHASED)
                if (isBillingSdk && !isStatic && mName == "getPurchaseState" && retType == "I" && pTypes.isEmpty()) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 3,
                            smaliCode = """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[$targetName Billing] Hooked Purchase.getPurchaseState -> PURCHASED (1)")
                    } catch (e: Exception) {
                        logger.fine("[$targetName Billing] Failed getPurchaseState: ${e.message}")
                    }
                }

                // 3. Hook Purchase.isAcknowledged() -> true
                if (isBillingSdk && !isStatic && (mName == "isAcknowledged" || mName == "isAutoRenewing") && retType == "Z" && pTypes.isEmpty()) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 3,
                            smaliCode = """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[$targetName Billing] Hooked Purchase.${method.name} -> true")
                    } catch (e: Exception) {
                        logger.fine("[$targetName Billing] Failed ${method.name}: ${e.message}")
                    }
                }

                // 4. Hook BillingClient.isReady() -> true
                if (isBillingSdk && !isStatic && mName == "isReady" && retType == "Z" && pTypes.isEmpty()) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 3,
                            smaliCode = """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[$targetName Billing] Hooked BillingClient.isReady -> true")
                    } catch (e: Exception) {
                        logger.fine("[$targetName Billing] Failed isReady: ${e.message}")
                    }
                }

                // 4b. Hook BillingClient.startConnection(BillingClientStateListener) -> immediately fire onBillingSetupFinished(OK)
                if (isBillingSdk && !isStatic && mName == "startConnection" && retType == "V" && pTypes.size == 1 &&
                    pTypes[0].toString() == "Lcom/android/billingclient/api/BillingClientStateListener;"
                ) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 4,
                            smaliCode = """
                            if-eqz p1, :cond_null
                            :try_start
                            invoke-static {}, Lcom/android/billingclient/api/BillingResult;->newBuilder()Lcom/android/billingclient/api/BillingResult${'$'}Builder;
                            move-result-object v0
                            const/4 v1, 0x0
                            invoke-virtual {v0, v1}, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->setResponseCode(I)Lcom/android/billingclient/api/BillingResult${'$'}Builder;
                            move-result-object v0
                            invoke-virtual {v0}, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->build()Lcom/android/billingclient/api/BillingResult;
                            move-result-object v0
                            invoke-interface {p1, v0}, Lcom/android/billingclient/api/BillingClientStateListener;->onBillingSetupFinished(Lcom/android/billingclient/api/BillingResult;)V
                            :try_end
                            .catch Ljava/lang/Throwable; {:try_start .. :try_end} :cond_null
                            :cond_null
                            return-void
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[$targetName Billing] Hooked ${classDef.type}->startConnection -> onBillingSetupFinished(OK)")
                    } catch (e: Exception) {
                        logger.fine("[$targetName Billing] Failed startConnection hook: ${e.message}")
                    }
                }

                // 5. Local billing manager purchase checks (isPurchased, isSubscribed, hasPurchased)
                if (isLocalBilling && !isStatic && retType == "Z" && (
                    mNameLower == "ispurchased" ||
                    mNameLower == "issubscribed" ||
                    mNameLower == "haspurchased" ||
                    mNameLower == "isactive" ||
                    mNameLower == "isbillingconnected"
                )) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 3,
                            smaliCode = """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[$targetName Billing] Hooked local billing flag ${classDef.type}->${method.name} -> true")
                    } catch (e: Exception) {
                        logger.fine("[$targetName Billing] Failed local hook ${method.name}: ${e.message}")
                    }
                }
            }
        }

        logger.info("[$targetName Billing] Total billing hooks applied: $hookedPoints")
        return hookedPoints
    }
}
