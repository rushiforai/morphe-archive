package com.dmoniak.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
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

            val mutableClass by lazy { mutableClassDefBy(classDef) }

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
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
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
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
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
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
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
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
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

                // 5. Local billing manager purchase checks (isPurchased, isSubscribed, hasPurchased)
                if (isLocalBilling && !isStatic && retType == "Z" && (
                    mNameLower == "ispurchased" ||
                    mNameLower == "issubscribed" ||
                    mNameLower == "haspurchased" ||
                    mNameLower == "isactive" ||
                    mNameLower == "isbillingconnected"
                )) {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
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
