package com.dmoniak.patches.moises

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MOISES
import java.util.logging.Logger

@Suppress("unused")
val moisesUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium & Pro Features - Moises",
    description = "Hooks Google Play BillingClient, RevenueCat EntitlementInfo, and subscription data models in Moises (v2.7.2 recommandée) to unlock client-side Pro features, bypass startup upgrade paywalls, Smart Metronome, chord detection, and pitch/speed controls.",
) {
    compatibleWith(COMPATIBILITY_MOISES)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMoisesUnlockPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executeMoisesUnlockPremiumLogic(logger: Logger) {
    logger.info("Executing Unlock Premium & Pro patch for Moises...")
    var hookedMethods = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()

        // Skip Android / Kotlin / Google framework internals and pairip protection internals
        if (
            tl.startsWith("landroid/") ||
            tl.startsWith("lkotlin/") ||
            tl.startsWith("ljava/") ||
            tl.startsWith("lcom/google/") ||
            tl.startsWith("lcom/pairip/")
        ) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. Hook Moises User data model:
        //    q() -> isSubscriptionActive (Ljava/lang/Boolean;)
        //    e() -> availableCredits (Ljava/lang/Integer;)
        if (type == "Lai/moises/data/model/User;") {
            for (method in classDef.methods.toList()) {
                val mName = method.name
                if (mName == "q" && method.returnType == "Ljava/lang/Boolean;") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                            return-object v0
                            """.trimIndent()
                        )
                        hookedMethods++
                        logger.info("[Moises Pro] Hooked User.q() -> Boolean.TRUE")
                    } catch (e: Exception) {
                        logger.fine("[Moises Pro] Failed to hook User.q: ${e.message}")
                    }
                }
                if (mName == "e" && method.returnType == "Ljava/lang/Integer;") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/16 v0, 0x3e7
                            invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                            move-result-object v0
                            return-object v0
                            """.trimIndent()
                        )
                        hookedMethods++
                        logger.info("[Moises Pro] Hooked User.e() -> 999 available credits")
                    } catch (e: Exception) {
                        logger.fine("[Moises Pro] Failed to hook User.e: ${e.message}")
                    }
                }
            }
        }

        // 2. Hook GraphQL subscription responses:
        //    UserDetailsQuery$Subscription -> c() (isPremium -> Boolean.TRUE)
        //    UserSubscriptionStatusQuery$Subscription -> a() (isPremium -> Boolean.TRUE)
        if (
            type == "Lai/moises/graphql/generated/UserDetailsQuery\$Subscription;" ||
            type == "Lai/moises/graphql/generated/UserSubscriptionStatusQuery\$Subscription;"
        ) {
            for (method in classDef.methods.toList()) {
                val mName = method.name
                if ((mName == "c" || mName == "a") && method.returnType == "Ljava/lang/Boolean;") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                            return-object v0
                            """.trimIndent()
                        )
                        hookedMethods++
                        logger.info("[Moises Pro] Hooked ${classDef.type}->${method.name} -> Boolean.TRUE")
                    } catch (e: Exception) {
                        logger.fine("[Moises Pro] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 3. Hook UserFeatureFlags:
        //    a() -> mobileAdaptPremiumToFree (Z -> false)
        //    b() -> slowerProcessingTime (Z -> false)
        if (type == "Lai/moises/data/model/UserFeatureFlags;") {
            for (method in classDef.methods.toList()) {
                val mName = method.name
                if ((mName == "a" || mName == "b") && method.returnType == "Z") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/4 v0, 0x0
                            return v0
                            """.trimIndent()
                        )
                        hookedMethods++
                        logger.info("[Moises Pro] Hooked UserFeatureFlags.${method.name} -> false")
                    } catch (e: Exception) {
                        logger.fine("[Moises Pro] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 4. Hook RevenueCat EntitlementInfo:
        //    isActive() -> Z (true)
        if (type == "Lcom/revenuecat/purchases/EntitlementInfo;") {
            for (method in classDef.methods.toList()) {
                val mName = method.name
                if (mName == "isActive" && method.returnType == "Z") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                        hookedMethods++
                        logger.info("[Moises Pro] Hooked EntitlementInfo.isActive() -> true")
                    } catch (e: Exception) {
                        logger.fine("[Moises Pro] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 5. Hook MainActivity paywall popup:
        //    H(PurchaseSource) -> void (no-op)
        if (type == "Lai/moises/ui/MainActivity;") {
            for (method in classDef.methods.toList()) {
                val mName = method.name
                if (mName == "H" && method.parameterTypes.size == 1 && method.returnType == "V") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            return-void
                            """.trimIndent()
                        )
                        hookedMethods++
                        logger.info("[Moises Pro] Hooked MainActivity.H() -> return-void (paywall dialog suppressed)")
                    } catch (e: Exception) {
                        logger.fine("[Moises Pro] Failed to hook MainActivity.H: ${e.message}")
                    }
                }
            }
        }

        // Generic fallback hooks for other subscription/pro status getters
        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // Hook primitive boolean getters for subscription status
            if (!isStatic && pTypes.isEmpty() && retType == "Z") {
                if (
                    mName == "ispro" ||
                    mName == "ispremium" ||
                    mName == "issubscribed" ||
                    mName == "hasproaccess" ||
                    mName == "haspremiumaccess" ||
                    mName == "isprosubscriber" ||
                    mName == "canuseprofeature" ||
                    mName == "canaccesspro" ||
                    mName == "isproactive" ||
                    mName == "isvalidsubscription" ||
                    mName == "hasactivesubscription" ||
                    mName == "issubscriptionactive" ||
                    mName == "ispaid" ||
                    mName == "isvip" ||
                    mName == "hasactiveplan" ||
                    mName == "isplanactive" ||
                    mName == "isaccountpro"
                ) {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                        hookedMethods++
                        logger.info("[Moises Pro] Hooked boolean ${classDef.type}->${method.name} -> true")
                    } catch (e: Exception) {
                        logger.fine("[Moises Pro] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }

            // Hook boxed Boolean getters
            if (!isStatic && pTypes.isEmpty() && retType == "Ljava/lang/Boolean;") {
                if (
                    mName == "ispro" ||
                    mName == "ispremium" ||
                    mName == "issubscribed" ||
                    mName == "hasproaccess" ||
                    mName == "haspremiumaccess" ||
                    mName == "issubscriptionactive" ||
                    mName == "ispaid" ||
                    mName == "isvip"
                ) {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                            return-object v0
                            """.trimIndent()
                        )
                        hookedMethods++
                        logger.info("[Moises Pro] Hooked Boolean ${classDef.type}->${method.name} -> Boolean.TRUE")
                    } catch (e: Exception) {
                        logger.fine("[Moises Pro] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }

            // Hook string getters for tier / plan name -> "PRO"
            if (!isStatic && pTypes.isEmpty() && retType == "Ljava/lang/String;") {
                if (
                    mName == "getsubscriptiontier" ||
                    mName == "getplan" ||
                    mName == "getplanname" ||
                    mName == "gettier" ||
                    mName == "getaccounttier" ||
                    mName == "getsubscriptiontype" ||
                    mName == "getcurrentplan" ||
                    mName == "getplantype"
                ) {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const-string v0, "PRO"
                            return-object v0
                            """.trimIndent()
                        )
                        hookedMethods++
                        logger.info("[Moises Pro] Hooked string ${classDef.type}->${method.name} -> 'PRO'")
                    } catch (e: Exception) {
                        logger.fine("[Moises Pro] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Moises Pro] Finished: $hookedMethods client entitlement hooks applied.")
}
