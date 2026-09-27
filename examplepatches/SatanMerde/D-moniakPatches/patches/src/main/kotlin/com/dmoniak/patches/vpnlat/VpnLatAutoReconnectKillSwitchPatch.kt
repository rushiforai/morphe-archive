package com.dmoniak.patches.vpnlat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_VPN_LAT
import java.util.logging.Logger

@Suppress("unused")
val vpnLatAutoReconnectKillSwitchPatch = bytecodePatch(
    name = "Auto-Reconnect & Keep-Alive Background Service - VPN.lat (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Keeps the VPN tunnel active during screen-off/doze mode, enforces auto-reconnection on network switches, and prevents dropped connections in VPN.lat.",
) {
    compatibleWith(COMPATIBILITY_VPN_LAT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeVpnLatAutoReconnectLogic(logger)
    }
}

fun BytecodePatchContext.executeVpnLatAutoReconnectLogic(logger: Logger) {
    logger.info("Executing Auto-Reconnect & Keep-Alive patch for VPN.lat...")
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

            // Auto-reconnect & keep-alive flags
            if (!isStatic && (
                mName == "isautoreconnectenabled" ||
                mName == "shouldautoreconnect" ||
                mName == "iskeepaliveenabled" ||
                mName == "iskillswitchenabled" ||
                mName == "canusepersistentnotification"
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
                    logger.info("[VPN.lat KeepAlive] Forced keep-alive/auto-reconnect flag in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[VPN.lat KeepAlive] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[VPN.lat KeepAlive] Total keep-alive hooks applied: $hookedPoints")
}
