package com.dmoniak.patches.hungryshark

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HUNGRY_SHARK_WORLD
import java.util.logging.Logger

@Suppress("unused")
val freeShoppingPatch = bytecodePatch(
    name = "Free Shopping",
    description = "Unlocks shop items and in-app purchases in Hungry Shark World by intercepting Google Play Billing transactions for free.",
) {
    compatibleWith(COMPATIBILITY_HUNGRY_SHARK_WORLD)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Free Shopping / In-App Billing patch for Hungry Shark World...")

        var launchCount = 0
        var consumeCount = 0
        var acknowledgeCount = 0
        var setListenerCount = 0
        var verifyCount = 0

        classDefForEach { classDef ->
            val tl = classDef.type.lowercase()
            // Skip non-game and framework libraries
            if (tl.contains("androidx") || tl.contains("android/support")) return@classDefForEach

            val mutableClass by lazy { mutableClassDefBy(classDef) }

            for (method in classDef.methods) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name
                val pTypes = method.parameterTypes

                // Target Google Play Billing classes strictly
                if (classDef.type.contains("billingclient")) {
                    // 1. launchBillingFlow(Activity, BillingFlowParams) -> BillingResult
                    // Injects our helper call at index 0. The check-cast ensures the returned
                    // Object satisfies the Dalvik bytecode verifier for BillingResult return type.
                    if (!isStatic &&
                        mName == "launchBillingFlow" &&
                        method.returnType == "Lcom/android/billingclient/api/BillingResult;" &&
                        pTypes.size == 2
                    ) {
                        try {
                            val mutableMethod = mutableClass.findMutableMethodOf(method)
                            mutableMethod.addInstructions(
                                0,
                                """
                                invoke-static/range {p0 .. p2}, Lcom/dmoniak/patches/extension/HungrySharkBillingHelper;->handleLaunchBillingFlow(Ljava/lang/Object;Landroid/app/Activity;Ljava/lang/Object;)Ljava/lang/Object;
                                move-result-object p0
                                check-cast p0, Lcom/android/billingclient/api/BillingResult;
                                return-object p0
                                """.trimIndent(),
                            )
                            launchCount++
                            logger.info("Patched launchBillingFlow in ${classDef.type}")
                        } catch (e: Exception) {
                            logger.warning("Failed to patch launchBillingFlow in ${classDef.type}: ${e.message}")
                        }
                    }

                    // 2. consumeAsync(ConsumeParams, ConsumeResponseListener) -> void
                    // Immediately marks consumable items as consumed so they can be repurchased.
                    if (!isStatic &&
                        mName == "consumeAsync" &&
                        method.returnType == "V" &&
                        pTypes.size == 2
                    ) {
                        try {
                            val mutableMethod = mutableClass.findMutableMethodOf(method)
                            mutableMethod.addInstructions(
                                0,
                                """
                                invoke-static/range {p0 .. p2}, Lcom/dmoniak/patches/extension/HungrySharkBillingHelper;->handleConsumeAsync(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
                                return-void
                                """.trimIndent(),
                            )
                            consumeCount++
                            logger.info("Patched consumeAsync in ${classDef.type}")
                        } catch (e: Exception) {
                            logger.warning("Failed to patch consumeAsync in ${classDef.type}: ${e.message}")
                        }
                    }

                    // 3. acknowledgePurchase(AcknowledgePurchaseParams, AcknowledgePurchaseResponseListener) -> void
                    // Immediately marks non-consumable items as acknowledged.
                    if (!isStatic &&
                        mName == "acknowledgePurchase" &&
                        method.returnType == "V" &&
                        pTypes.size == 2
                    ) {
                        try {
                            val mutableMethod = mutableClass.findMutableMethodOf(method)
                            mutableMethod.addInstructions(
                                0,
                                """
                                invoke-static/range {p0 .. p2}, Lcom/dmoniak/patches/extension/HungrySharkBillingHelper;->handleAcknowledgePurchase(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
                                return-void
                                """.trimIndent(),
                            )
                            acknowledgeCount++
                            logger.info("Patched acknowledgePurchase in ${classDef.type}")
                        } catch (e: Exception) {
                            logger.warning("Failed to patch acknowledgePurchase in ${classDef.type}: ${e.message}")
                        }
                    }

                    // 4. setListener(PurchasesUpdatedListener) -> Builder
                    // Passively registers the PurchasesUpdatedListener without altering control flow.
                    if (!isStatic &&
                        mName == "setListener" &&
                        pTypes.size == 1 &&
                        pTypes[0].contains("PurchasesUpdatedListener")
                    ) {
                        try {
                            val mutableMethod = mutableClass.findMutableMethodOf(method)
                            mutableMethod.addInstructions(
                                0,
                                """
                                invoke-static/range {p1 .. p1}, Lcom/dmoniak/patches/extension/HungrySharkBillingHelper;->registerPurchasesUpdatedListener(Ljava/lang/Object;)V
                                """.trimIndent(),
                            )
                            setListenerCount++
                            logger.info("Patched setListener in ${classDef.type}")
                        } catch (e: Exception) {
                            logger.warning("Failed to patch setListener in ${classDef.type}: ${e.message}")
                        }
                    }
                }

                // 5. verifyPurchase(String, String, String) -> boolean
                // Bypasses receipt signature validation if present in the game code
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

        logger.info("Free Shopping results: launchBillingFlow=$launchCount, consumeAsync=$consumeCount, acknowledgePurchase=$acknowledgeCount, setListener=$setListenerCount, verifyPurchase=$verifyCount.")
        logger.info("Free Shopping patch execution finished.")
    }
}
