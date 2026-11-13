package com.dmoniak.patches.bandlab

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_BANDLAB
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val bandLabUnlockMembershipPatch = bytecodePatch(
    name = "Unlock Creator Membership & Audio Tools - BandLab (Experimental)",
    description = "Hooks Google Play Billing Client and membership state models in BandLab to unlock client-side Creator Membership perks, audio presets, master presets, and removes membership upgrade paywalls.",
) {
    compatibleWith(COMPATIBILITY_BANDLAB)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBandLabUnlockMembershipLogic(logger)
    }
}

fun BytecodePatchContext.executeBandLabUnlockMembershipLogic(logger: Logger) {
    logger.info("Executing Unlock Creator Membership patch for BandLab...")
    var hookedMethods = 0

    // 1. Hook Google Play BillingClient SDK via universal BillingHookHelper
    hookedMethods += executeGooglePlayBillingBypass(logger, "BandLab")

    // 2. Hook BandLab Membership boolean state getters with clean bytecode replacement
    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()

        // Skip framework internals
        if (
            tl.startsWith("landroid/") ||
            tl.startsWith("lkotlin/") ||
            tl.startsWith("ljava/") ||
            tl.startsWith("lcom/google/android/material/")
        ) return@classDefForEach

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // Active membership / Pro status -> true
            if (!isStatic && (
                mName == "ismembershipactive" ||
                mName == "hasactivemembership" ||
                mName == "ismember" ||
                mName == "issubscribed" ||
                mName == "hasmembership" ||
                mName == "iscreatorplus" ||
                mName == "isprosubscriber"
            ) && retType == "Z") {
                try {
                    replaceMethod(
                        method = method,
                        registerCount = 3,
                        smaliCode = """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    hookedMethods++
                    logger.info("[BandLab Membership] Unlocked active membership in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[BandLab Membership] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Membership paywalls & restrictions -> false
            if (!isStatic && (
                mName == "shouldshowmembershippaywall" ||
                mName == "ismembershiprequired" ||
                mName == "isfeaturelockedbymembership" ||
                mName == "ispresetrestricted"
            ) && retType == "Z") {
                try {
                    replaceMethod(
                        method = method,
                        registerCount = 3,
                        smaliCode = """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    hookedMethods++
                    logger.info("[BandLab Membership] Bypassed paywall restriction in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[BandLab Membership] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[BandLab Membership] Total hooks applied: $hookedMethods")
}
