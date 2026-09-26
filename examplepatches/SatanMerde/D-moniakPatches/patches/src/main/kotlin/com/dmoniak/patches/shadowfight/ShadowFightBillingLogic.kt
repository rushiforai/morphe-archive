package com.dmoniak.patches.shadowfight

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.hungryshark.util.replaceMethod
import java.util.logging.Logger

/**
 * Shared Google Play Billing and store receipt verification hooks tailored for games in the Shadow Fight series.
 */
fun BytecodePatchContext.executeShadowFightFreeShoppingLogic(logger: Logger, gameName: String) {
    logger.info("Executing Free Shopping patch specifically tailored for $gameName...")

    var isReadyCount = 0
    var responseCodeCount = 0
    var purchaseStateCount = 0
    var isAckCount = 0
    var verifyCount = 0
    var storeCount = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name
            val pTypes = method.parameterTypes
            val retType = method.returnType

            // =========================================================================
            // 1. Google Play Billing Client Core Methods (isReady, getResponseCode, etc.)
            // =========================================================================
            if (type.contains("billingclient")) {
                // 1a. BillingClient.isReady() -> boolean (always ready)
                if (!isStatic && mName == "isReady" && retType == "Z" && pTypes.isEmpty()) {
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
                        logger.info("[$gameName] Patched isReady in $type")
                    } catch (e: Exception) {
                        logger.warning("[$gameName] Failed to patch isReady in $type: ${e.message}")
                    }
                }

                // 1b. BillingResult.getResponseCode() -> int (always OK / 0)
                if (type.endsWith("/BillingResult;") && !isStatic && mName == "getResponseCode" && retType == "I" && pTypes.isEmpty()) {
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
                        logger.info("[$gameName] Patched BillingResult.getResponseCode in $type")
                    } catch (e: Exception) {
                        logger.warning("[$gameName] Failed to patch getResponseCode: ${e.message}")
                    }
                }

                // 1c. Purchase.getPurchaseState() -> int (always 1 = PURCHASED)
                if (type.endsWith("/Purchase;") && !isStatic && mName == "getPurchaseState" && retType == "I" && pTypes.isEmpty()) {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent(),
                        )
                        purchaseStateCount++
                        logger.info("[$gameName] Patched Purchase.getPurchaseState in $type")
                    } catch (e: Exception) {
                        logger.warning("[$gameName] Failed to patch getPurchaseState: ${e.message}")
                    }
                }

                // 1d. Purchase.isAcknowledged() -> boolean (always true)
                if (type.endsWith("/Purchase;") && !isStatic && mName == "isAcknowledged" && retType == "Z" && pTypes.isEmpty()) {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent(),
                        )
                        isAckCount++
                        logger.info("[$gameName] Patched Purchase.isAcknowledged in $type")
                    } catch (e: Exception) {
                        logger.warning("[$gameName] Failed to patch isAcknowledged: ${e.message}")
                    }
                }
            }

            // =========================================================================
            // 2. Receipt and Signature Verification Bypass
            // =========================================================================
            if (!isStatic && retType == "Z" && (
                (mName == "verifyPurchase" && pTypes.size in 2..3) ||
                (mName == "verifySignature" && pTypes.size in 2..3) ||
                (mName == "isSignatureValid" && pTypes.size in 1..3) ||
                (mName == "validateReceipt" && pTypes.size in 1..3) ||
                (mName == "verify" && pTypes.size in 2..3 && pTypes.all { it == "Ljava/lang/String;" })
            )) {
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
                    logger.info("[$gameName] Patched verification method ${type}->${mName}")
                } catch (e: Exception) {
                    logger.warning("[$gameName] Failed to patch ${type}->${mName}: ${e.message}")
                }
            }

            // =========================================================================
            // 3. Unity IAP, Banzai Games & Nekki Store Hooks
            // =========================================================================
            if (type.contains("purchasing") || type.contains("billing") || type.contains("banzai") || type.contains("nekki")) {
                // isPurchased() / hasPurchased() -> true
                if (!isStatic && (mName == "isPurchased" || mName == "hasPurchased") && retType == "Z" && pTypes.isEmpty()) {
                    try {
                        replaceMethod(
                            method,
                            4,
                            """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent(),
                        )
                        storeCount++
                        logger.info("[$gameName] Patched store method ${type}->${mName} -> true")
                    } catch (e: Exception) {
                        logger.warning("[$gameName] Failed to patch ${type}->${mName}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info(
        "[$gameName] Free Shopping results: isReady=$isReadyCount, getResponseCode=$responseCodeCount, " +
        "purchaseState=$purchaseStateCount, isAcknowledged=$isAckCount, verify=$verifyCount, store=$storeCount."
    )
}
