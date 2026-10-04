package com.dmoniak.patches.undercover

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_UNDERCOVER
import java.util.logging.Logger

@Suppress("unused")
val undercoverBlockCookieConsentBannerPatch = bytecodePatch(
    name = "Block Cookie & Consent Banner - Undercover (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Blocks and removes the GDPR / Google UMP Cookie consent dialog on first launch by spoofing consent status as OBTAINED and neutralizing consent form presentation.",
) {
    compatibleWith(COMPATIBILITY_UNDERCOVER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeUndercoverBlockCookieBannerLogic(logger)
    }
}

fun BytecodePatchContext.executeUndercoverBlockCookieBannerLogic(logger: Logger) {
    logger.info("Executing Block Cookie & Consent Banner patch for Undercover...")
    var hookedMethods = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()

        // 1. Hook standard Google User Messaging Platform (UMP) classes directly (concrete classes only)
        if (
            type.contains("com/google/android/ump/ConsentInformation") ||
            type.contains("com/google/android/gms/internal/consent_sdk")
        ) {
            val mutableClass by lazy { mutableClassDefBy(classDef) }
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name
                val retType = method.returnType

                // getConsentStatus() -> ConsentStatus.OBTAINED (3)
                if (mName == "getConsentStatus" && retType == "I") {
                    try {
                        val mm = mutableClass.findMutableMethodOf(method)
                        mm?.addInstructions(
                            0,
                            """
                            const/4 v0, 0x3
                            return v0
                            """.trimIndent()
                        )
                        hookedMethods++
                    } catch (e: Exception) {
                        logger.fine("Failed to hook $mName: ${e.message}")
                    }
                }

                // canRequestAds() -> true
                if (mName == "canRequestAds" && retType == "Z") {
                    try {
                        val mm = mutableClass.findMutableMethodOf(method)
                        mm?.addInstructions(
                            0,
                            """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                        hookedMethods++
                    } catch (e: Exception) {
                        logger.fine("Failed to hook $mName: ${e.message}")
                    }
                }

                // isConsentFormAvailable() -> false
                if (mName == "isConsentFormAvailable" && retType == "Z") {
                    try {
                        val mm = mutableClass.findMutableMethodOf(method)
                        mm?.addInstructions(
                            0,
                            """
                            const/4 v0, 0x0
                            return v0
                            """.trimIndent()
                        )
                        hookedMethods++
                    } catch (e: Exception) {
                        logger.fine("Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }

        // 2. Hook UserMessagingPlatform and ConsentForm presentation methods to avoid showing the webview popup
        if (
            type.contains("com/google/android/ump/UserMessagingPlatform") ||
            type.contains("com/google/android/ump/ConsentForm")
        ) {
            val mutableClass by lazy { mutableClassDefBy(classDef) }
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name
                val retType = method.returnType

                if ((mName == "show" || mName.contains("loadAndShowConsentForm")) && retType == "V") {
                    try {
                        val mm = mutableClass.findMutableMethodOf(method)
                        mm?.addInstructions(
                            0,
                            """
                            return-void
                            """.trimIndent()
                        )
                        hookedMethods++
                    } catch (e: Exception) {
                        logger.fine("Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("Hooked $hookedMethods consent and cookie banner points in Undercover.")
}
