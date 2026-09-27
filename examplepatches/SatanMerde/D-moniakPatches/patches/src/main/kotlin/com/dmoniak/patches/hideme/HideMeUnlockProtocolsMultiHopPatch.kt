package com.dmoniak.patches.hideme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HIDEME
import java.util.logging.Logger

@Suppress("unused")
val hideMeUnlockProtocolsMultiHopPatch = bytecodePatch(
    name = "Unlock WireGuard Stealth & Multi-Hop - hide.me VPN (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks WireGuard Stealth protocol, Multi-Hop (Double VPN cascading), and custom port binding in hide.me VPN.",
) {
    compatibleWith(COMPATIBILITY_HIDEME)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeHideMeUnlockProtocolsMultiHopLogic(logger)
    }
}

fun BytecodePatchContext.executeHideMeUnlockProtocolsMultiHopLogic(logger: Logger) {
    logger.info("Executing Unlock WireGuard Stealth & Multi-Hop patch for hide.me VPN...")
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

            // Protocol & Multi-Hop unlocks
            if (!isStatic && (
                mName == "canusemultihop" ||
                mName == "ismultihopavailable" ||
                mName == "canusewireguard" ||
                mName == "isstealthprotocolenabled" ||
                mName == "canselectcustomport" ||
                mName == "isp2psupported"
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
                    logger.info("[hide.me Protocols] Forced Multi-Hop/Protocol feature in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[hide.me Protocols] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[hide.me Protocols] Total protocol/multi-hop hooks applied: $hookedPoints")
}
