package com.dmoniak.patches.protonpass

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PROTON_PASS
import java.util.logging.Logger

@Suppress("unused")
val protonPassUnlockProFeaturesPatch = bytecodePatch(
    name = "Unlock Pro Vaults & 2FA Authenticator - Proton Pass (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks client-side Proton Pass Plus capabilities: built-in 2FA TOTP authenticator generation, unlimited custom vaults, custom item fields, and disables upgrade lock screens.",
) {
    compatibleWith(COMPATIBILITY_PROTON_PASS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeProtonPassUnlockProFeaturesLogic(logger)
    }
}

fun BytecodePatchContext.executeProtonPassUnlockProFeaturesLogic(logger: Logger) {
    logger.info("Executing Unlock Pro Vaults & 2FA Authenticator patch for Proton Pass...")
    var unlockedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Hook Pro entitlement getters -> force true
            if (!isStatic && (
                mName == "ispaidplan" ||
                mName == "ispassplus" ||
                mName == "hasprosubscription" ||
                mName == "hasunlimitedvaults" ||
                mName == "canusetotpauthenticator" ||
                mName == "cancreatecustomfields" ||
                mName == "is2faenabledinplan"
            ) && retType == "Z" && method.parameterTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    unlockedPoints++
                    logger.fine("[Proton Pass Pro] Unlocked Plus capability: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Proton Pass Pro] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Hook feature lock & paywall checks -> force false
            if (!isStatic && (
                mName == "isfeaturegated" ||
                mName == "isplusfeaturelocked" ||
                mName == "isvaultlimitreached" ||
                mName == "requirespassplus"
            ) && retType == "Z" && method.parameterTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    unlockedPoints++
                    logger.fine("[Proton Pass Pro] Bypassed lock gate: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Proton Pass Pro] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Proton Pass Pro] Total Pro feature hooks applied: $unlockedPoints")
}
