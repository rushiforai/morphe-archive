package com.dmoniak.patches.terabox

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TERABOX
import java.util.logging.Logger

@Suppress("unused")
val teraBoxUnlockVipPatch = bytecodePatch(
    name = "Unlock Premium & VIP Membership - TeraBox (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks TeraBox Premium & VIP status flags, enabling high-speed multi-threaded download acceleration, cloud archive decompression, and removes video download queues.",
) {
    compatibleWith(COMPATIBILITY_TERABOX)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTeraBoxUnlockVipLogic(logger)
    }
}

fun BytecodePatchContext.executeTeraBoxUnlockVipLogic(logger: Logger) {
    logger.info("Executing Unlock Premium & VIP Membership patch for TeraBox...")
    var hookedPoints = 0

    // 1. Hook Google Play BillingClient for VIP subscriptions
    hookedPoints += executeGooglePlayBillingBypass(logger, "TeraBox")

    // 2. Hook internal VIP status checks
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
                mName == "ispremium" ||
                mName == "ispremiumuser" ||
                mName == "canusehighspeeddownload" ||
                mName == "isspeedupenabled" ||
                mName == "isclouddecompressallowed" ||
                mName == "canextractcloudarchive"
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
                    logger.info("[TeraBox VIP] Hooked ${classDef.type}->${method.name} -> true")
                } catch (e: Exception) {
                    logger.fine("[TeraBox VIP] Failed ${method.name}: ${e.message}")
                }
            }

            // Integer VIP type / level checks -> return 1 (VIP)
            if (!isStatic && retType == "I" && (
                mName == "getviptype" ||
                mName == "getviplevel" ||
                mName == "getmembertype"
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
                    logger.info("[TeraBox VIP] Hooked ${classDef.type}->${method.name} -> 1 (VIP)")
                } catch (e: Exception) {
                    logger.fine("[TeraBox VIP] Failed ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[TeraBox VIP] Total VIP hooks applied: $hookedPoints")
}
