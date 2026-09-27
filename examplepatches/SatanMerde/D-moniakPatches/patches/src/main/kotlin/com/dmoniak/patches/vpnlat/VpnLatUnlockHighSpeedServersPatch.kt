package com.dmoniak.patches.vpnlat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_VPN_LAT
import java.util.logging.Logger

@Suppress("unused")
val vpnLatUnlockHighSpeedServersPatch = bytecodePatch(
    name = "Unlock High-Speed Dedicated Nodes & Low Ping - VPN.lat (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks dedicated high-speed server gateways, removes artificial speed throttling, and enables automatic lowest-latency server selection for gaming in VPN.lat.",
) {
    compatibleWith(COMPATIBILITY_VPN_LAT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeVpnLatUnlockHighSpeedServersLogic(logger)
    }
}

fun BytecodePatchContext.executeVpnLatUnlockHighSpeedServersLogic(logger: Logger) {
    logger.info("Executing Unlock High-Speed Servers patch for VPN.lat...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. High speed server & gaming mode flags -> true
            if (!isStatic && (
                mName == "ishighspeedserver" ||
                mName == "isunlimitedspeed" ||
                mName == "canusegamingmode" ||
                mName == "islowpingenabled" ||
                mName == "isdedicatedipavailable"
            ) && retType == "Z") {
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
                    logger.info("[VPN.lat Speed] Forced high-speed node check in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[VPN.lat Speed] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Throttled flag -> false
            if (!isStatic && (
                mName == "isthrottled" ||
                mName == "isspeedlimited" ||
                mName == "hasbandwidthcap"
            ) && retType == "Z") {
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
                    logger.info("[VPN.lat Speed] Disabled throttling check in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[VPN.lat Speed] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[VPN.lat Speed] Total high-speed hooks applied: $hookedPoints")
}
