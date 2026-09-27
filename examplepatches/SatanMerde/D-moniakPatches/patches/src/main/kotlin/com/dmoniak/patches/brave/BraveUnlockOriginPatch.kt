package com.dmoniak.patches.brave

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_BRAVE
import java.util.logging.Logger

@Suppress("unused")
val braveUnlockOriginPatch = bytecodePatch(
    name = "Unlock Brave Origin & Premium Features - Brave (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Débloque la licence officielle Brave Origin ($59.99), active le mode minimaliste sans bloatware, débloque l'assistant IA Brave Leo Premium en illimité et active les entitlements Brave VPN.",
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBraveUnlockOriginLogic(logger)
    }
}

fun BytecodePatchContext.executeBraveUnlockOriginLogic(logger: Logger) {
    logger.info("Executing Unlock Brave Origin & Premium Features patch for Brave...")
    var hookedPoints = 0

    // 1. Hook Google Play BillingClient for Brave Origin one-time purchase & VPN subscriptions
    hookedPoints += executeGooglePlayBillingBypass(logger, "Brave")

    // 2. Hook internal Brave Origin, Leo AI Premium, and VPN entitlement methods
    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // A. Brave Origin license checks -> return true
            if (!isStatic && retType == "Z" && (
                mName == "isoriginlicensed" ||
                mName == "isoriginenabled" ||
                mName == "hasoriginlicense" ||
                mName == "isoriginpurchased" ||
                mName == "isoriginactive" ||
                mName == "hasvalidorigintoken" ||
                mName == "isoriginfeatureavailable"
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
                    logger.info("[Brave Origin] Forced license unlocked in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Brave Origin] Failed ${method.name}: ${e.message}")
                }
            }

            // B. Brave Leo Premium AI checks -> return true
            if (!isStatic && retType == "Z" && (
                mName == "isleopremium" ||
                mName == "hasleoaccess" ||
                mName == "isleounlimited" ||
                mName == "canuseleoadvancedmodels" ||
                mName == "hasleosubscription" ||
                mName == "ispremiumleoallowed"
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
                    logger.info("[Brave Origin] Forced Leo Premium in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Brave Origin] Failed ${method.name}: ${e.message}")
                }
            }

            // C. Brave Firewall & VPN checks -> return true
            if (!isStatic && retType == "Z" && (
                mName == "hasvpnsubscription" ||
                mName == "isvpnpurchased" ||
                mName == "isvpnactive" ||
                mName == "isfirewallvpnenabled" ||
                mName == "isbravevpnlicensed"
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
                    logger.info("[Brave Origin] Forced VPN entitlement in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Brave Origin] Failed ${method.name}: ${e.message}")
                }
            }

            // D. Suppress Origin purchase prompts and upgrade banners -> return false
            if (!isStatic && retType == "Z" && (
                mName == "shouldshoworiginupgradebanner" ||
                mName == "isoriginupsellneeded" ||
                mName == "shouldpromptoriginlicense"
            )) {
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
                    logger.info("[Brave Origin] Suppressed upsell prompt in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Brave Origin] Failed ${method.name}: ${e.message}")
                }
            }

            // E. Integer status codes for Origin license -> return 1 (ACTIVE / LICENSED)
            if (!isStatic && retType == "I" && (
                mName == "getoriginlicensestate" ||
                mName == "getoriginstatus" ||
                mName == "getoriginplanid"
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
                    logger.info("[Brave Origin] Forced Origin license state in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Brave Origin] Failed ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("Unlock Brave Origin & Premium Features executed: $hookedPoints points hooked.")
}
