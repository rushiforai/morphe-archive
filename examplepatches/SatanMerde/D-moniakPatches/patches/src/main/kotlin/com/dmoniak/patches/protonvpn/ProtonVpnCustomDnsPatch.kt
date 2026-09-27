package com.dmoniak.patches.protonvpn

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PROTON_VPN
import java.util.logging.Logger

@Suppress("unused")
val protonVpnCustomDnsPatch = bytecodePatch(
    name = "Unlock Custom DNS Settings - Proton VPN (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks custom upstream DNS resolver preferences (NextDNS, AdGuard DNS, Quad9) in Proton VPN settings without subscription restrictions.",
) {
    compatibleWith(COMPATIBILITY_PROTON_VPN)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeProtonVpnCustomDnsLogic(logger)
    }
}

fun BytecodePatchContext.executeProtonVpnCustomDnsLogic(logger: Logger) {
    logger.info("Executing Unlock Custom DNS patch for Proton VPN...")
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

            // Hook custom DNS allowed / available status
            if (!isStatic && (
                mName == "iscustomdnsallowed" ||
                mName == "iscustomdnsavailable" ||
                mName == "hascustomdnsfeature" ||
                mName == "canconfigurecustomdns"
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
                    logger.info("[Proton DNS] Unlocked custom DNS in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Proton DNS] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Proton DNS] Total custom DNS hooks applied: $hookedPoints")
}
