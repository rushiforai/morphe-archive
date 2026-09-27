package com.dmoniak.patches.turbovpn

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TURBO_VPN
import java.util.logging.Logger

@Suppress("unused")
val turboVpnUnlockVipPatch = bytecodePatch(
    name = "Unlock VIP & All Server Locations - Turbo VPN (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks Turbo VPN VIP subscription status, granting free access to high-speed VIP servers, dedicated streaming locations, and removes server country locks.",
) {
    compatibleWith(COMPATIBILITY_TURBO_VPN)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTurboVpnUnlockVipLogic(logger)
    }
}

fun BytecodePatchContext.executeTurboVpnUnlockVipLogic(logger: Logger) {
    logger.info("Executing Unlock VIP & All Server Locations patch for Turbo VPN...")
    var hookedPoints = 0

    // 1. Hook Google Play BillingClient for in-app VIP subscriptions
    hookedPoints += executeGooglePlayBillingBypass(logger, "TurboVPN")

    // 2. Hook internal VIP entitlement and server lock verification methods
    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // Boolean VIP check methods
            if (!isStatic && retType == "Z" && (
                mName == "isvip" ||
                mName == "isvipuser" ||
                mName == "issubscribed" ||
                mName == "isvippremium" ||
                mName == "isviplocationallowed" ||
                mName == "isvipserver" ||
                mName == "ispro" ||
                mName == "canconnecttovip"
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
                    logger.info("[Turbo VPN VIP] Hooked ${classDef.type}->${method.name} -> true")
                } catch (e: Exception) {
                    logger.fine("[Turbo VPN VIP] Failed ${method.name}: ${e.message}")
                }
            }

            // Integer VIP type / level checks -> return 1 (VIP)
            if (!isStatic && retType == "I" && (
                mName == "getviptype" ||
                mName == "getviplevel" ||
                mName == "getuserlevel"
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
                    logger.info("[Turbo VPN VIP] Hooked ${classDef.type}->${method.name} -> 1 (VIP)")
                } catch (e: Exception) {
                    logger.fine("[Turbo VPN VIP] Failed ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Turbo VPN VIP] Total VIP hooks applied: $hookedPoints")
}
