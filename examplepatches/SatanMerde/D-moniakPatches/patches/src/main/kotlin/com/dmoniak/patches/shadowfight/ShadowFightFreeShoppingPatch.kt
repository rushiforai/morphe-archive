package com.dmoniak.patches.shadowfight

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.hungryshark.util.replaceMethod
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SHADOW_FIGHT_2
import java.util.logging.Logger

@Suppress("unused")
val shadowFightFreeShoppingPatch = bytecodePatch(
    name = "Free Shopping - Shadow Fight 2 (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks Google Play BillingClient and purchase verification in Shadow Fight 2 to simulate successful in-app purchases. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_SHADOW_FIGHT_2)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShadowFightFreeShoppingLogic(logger, "Shadow Fight 2")
    }
}

fun BytecodePatchContext.executeShadowFightFreeShoppingLogic(logger: Logger, gameName: String) {
    logger.info("Executing Free Shopping patch for $gameName...")

    var isReadyCount = 0
    var responseCodeCount = 0
    var purchaseStateCount = 0
    var isAckCount = 0
    var verifyCount = 0
    var unityIapCount = 0

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
            // 1. Google Play Billing Client Core Methods
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
                        logger.info("Patched isReady in $type")
                    } catch (e: Exception) {
                        logger.warning("Failed to patch isReady in $type: ${e.message}")
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
                        logger.info("Patched BillingResult.getResponseCode in $type")
                    } catch (e: Exception) {
                        logger.warning("Failed to patch getResponseCode: ${e.message}")
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
                        logger.info("Patched Purchase.getPurchaseState in $type")
                    } catch (e: Exception) {
                        logger.warning("Failed to patch getPurchaseState: ${e.message}")
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
                        logger.info("Patched Purchase.isAcknowledged in $type")
                    } catch (e: Exception) {
                        logger.warning("Failed to patch isAcknowledged: ${e.message}")
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
                    logger.info("Patched verification method ${type}->${mName}")
                } catch (e: Exception) {
                    logger.warning("Failed to patch ${type}->${mName}: ${e.message}")
                }
            }

            // =========================================================================
            // 3. Unity IAP / Nekki Store Helpers
            // =========================================================================
            if (type.contains("purchasing") || type.contains("billing") || type.contains("nekki")) {
                // isPurchased() -> true
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
                        unityIapCount++
                        logger.info("Patched store method ${type}->${mName} -> true")
                    } catch (e: Exception) {
                        logger.warning("Failed to patch ${type}->${mName}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info(
        "Shadow Fight 2 Free Shopping results: isReady=$isReadyCount, getResponseCode=$responseCodeCount, " +
        "purchaseState=$purchaseStateCount, isAcknowledged=$isAckCount, verify=$verifyCount, unityIap=$unityIapCount."
    )
    logger.info("Free Shopping patch execution for $gameName finished.")
}
