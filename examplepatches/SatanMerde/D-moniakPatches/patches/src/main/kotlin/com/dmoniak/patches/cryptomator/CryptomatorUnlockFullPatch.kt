package com.dmoniak.patches.cryptomator

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CRYPTOMATOR
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CRYPTOMATOR_FREEMIUM
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val cryptomatorUnlockFullPatch = bytecodePatch(
    name = "Unlock Full Version & Permanent License - Cryptomator (Experimental)",
    description = "⚠️ [Experimental / Untested] Unlocks full version capabilities, bypasses 30-day trial expiration, suppresses license check warnings, and unlocks full read/write vault management across all Cryptomator variants.",
) {
    compatibleWith(COMPATIBILITY_CRYPTOMATOR, COMPATIBILITY_CRYPTOMATOR_FREEMIUM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCryptomatorUnlockFullLogic(logger)
    }
}

fun BytecodePatchContext.executeCryptomatorUnlockFullLogic(logger: Logger) {
    logger.info("Executing Unlock Full Version & Permanent License patch for Cryptomator...")
    var hookedPoints = 0

    // 1. Google Play Billing bypass engine
    val billingHooks = executeGooglePlayBillingBypass(logger, "Cryptomator")
    hookedPoints += billingHooks

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()

        // Skip non-Cryptomator third-party libraries
        if (tl.contains("androidx") || tl.contains("com/google") || tl.contains("okhttp3") || tl.contains("retrofit")) {
            return@classDefForEach
        }

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 2. FlavorConfig: Force isPremiumFlavor -> true
        if (type.contains("FlavorConfig")) {
            for (method in classDef.methods.toList()) {
                val mName = method.name
                if ((mName == "isPremiumFlavor" || mName == "getIsPremiumFlavor") && method.returnType == "Z") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            smaliCode = """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Cryptomator License] Forced ${type}->${method.name} -> true")
                    } catch (e: Exception) {
                        logger.fine("[Cryptomator License] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 3. LicenseEnforcer: Force write access and paid license
        if (type.contains("LicenseEnforcer")) {
            for (method in classDef.methods.toList()) {
                val mName = method.name
                val retType = method.returnType

                if (retType == "Z" && (
                    mName == "hasWriteAccess" ||
                    mName == "hasPaidLicense" ||
                    mName == "hasActiveTrial" ||
                    mName == "hasWriteAccessForVault" ||
                    mName == "peekWriteAccessForVault" ||
                    mName == "ensureWriteAccess" ||
                    mName == "ensureWriteAccessForVault"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            smaliCode = """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Cryptomator License] Hooked ${type}->${method.name} -> true")
                    } catch (e: Exception) {
                        logger.fine("[Cryptomator License] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 4. SharedPreferencesHandler: Subscription and trial hooks
        if (type.contains("SharedPreferencesHandler")) {
            for (method in classDef.methods.toList()) {
                val mName = method.name
                val retType = method.returnType

                if (mName == "hasRunningSubscription" && retType == "Z") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            smaliCode = """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Cryptomator License] Hooked SharedPreferencesHandler.hasRunningSubscription -> true")
                    } catch (e: Exception) {
                        logger.fine("[Cryptomator License] Failed to hook ${method.name}: ${e.message}")
                    }
                } else if (mName == "isTrialExpired" && retType == "Z") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            smaliCode = """
                            const/4 v0, 0x0
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Cryptomator License] Hooked SharedPreferencesHandler.isTrialExpired -> false")
                    } catch (e: Exception) {
                        logger.fine("[Cryptomator License] Failed to hook ${method.name}: ${e.message}")
                    }
                } else if (mName == "purchaseRevokedPending" && retType == "Z") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            smaliCode = """
                            const/4 v0, 0x0
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Cryptomator License] Hooked SharedPreferencesHandler.purchaseRevokedPending -> false")
                    } catch (e: Exception) {
                        logger.fine("[Cryptomator License] Failed to hook ${method.name}: ${e.message}")
                    }
                } else if (mName == "licenseToken" && retType == "Ljava/lang/String;") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            smaliCode = """
                            const-string v0, "morphe_cryptomator_supporter_license"
                            return-object v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Cryptomator License] Hooked SharedPreferencesHandler.licenseToken -> supporter token")
                    } catch (e: Exception) {
                        logger.fine("[Cryptomator License] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 5. LicenseStateOrchestrator: Suppress subscription-only mode
        if (type.contains("LicenseStateOrchestrator")) {
            for (method in classDef.methods.toList()) {
                if (method.name == "isSubscriptionOnly" && method.returnType == "Z") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            smaliCode = """
                            const/4 v0, 0x0
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Cryptomator License] Hooked LicenseStateOrchestrator.isSubscriptionOnly -> false")
                    } catch (e: Exception) {
                        logger.fine("[Cryptomator License] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Cryptomator License] Total license & full version hooks applied: $hookedPoints")
}
