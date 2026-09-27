package com.dmoniak.patches.bitwarden

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_BITWARDEN
import java.util.logging.Logger

@Suppress("unused")
val bitwardenUnlockPremiumTotpPatch = bytecodePatch(
    name = "Unlock Premium & Integrated TOTP 2FA - Bitwarden (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks Bitwarden Premium features: enables integrated 2FA TOTP code generation and displays vault security report indicators in Bitwarden.",
) {
    compatibleWith(COMPATIBILITY_BITWARDEN)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBitwardenUnlockPremiumTotpLogic(logger)
    }
}

fun BytecodePatchContext.executeBitwardenUnlockPremiumTotpLogic(logger: Logger) {
    logger.info("Executing Unlock Premium & Integrated TOTP patch for Bitwarden...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()

        // Focus specifically on Bitwarden application and vault domain classes
        if (!tl.contains("bitwarden")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // Premium status & TOTP authenticator feature access
            if (!isStatic && (
                mName.contains("premium") ||
                mName.contains("totp") ||
                mName == "canusetotp" ||
                mName == "istotpenabled"
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
                    logger.info("[Bitwarden Premium] Enabled feature in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Bitwarden Premium] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Bitwarden Premium] Total premium hooks applied: $hookedPoints")
}
