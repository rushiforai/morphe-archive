/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.myooredoo.misc.integrity

import app.morphe.patches.myooredoo.shared.Constants
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/** Disables integrity checks. */
@Suppress("unused")
val disablePlayIntegrityPatch = bytecodePatch(
    name = "Disable Play Integrity",
    description = "Short-circuits the Google Play Integrity attestation request with a " +
            "\"DISABLED\" response, avoiding failures on modified or non-Play builds.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_MYOOREDOO)

    execute {
        // Only Play.apic contains the IntegrityManagerFactory reference.
        val apicFingerprint = object : Fingerprint(
            definingClass = "Lcom/android/sec/utils/Play;",
            name = "apic",
            returnType = "V",
            parameters = listOf("Lio/flutter/plugin/common/MethodChannel\$Result;"),
        ) {}

        runCatching { apicFingerprint.method }.getOrNull()?.let { method ->
            method.addInstructions(
                0,
                """
                    const-string v0, "DISABLED"
                    invoke-interface {p1, v0}, Lio/flutter/plugin/common/MethodChannel${'$'}Result;->success(Ljava/lang/Object;)V
                    return-void
                """
            )
        }

        // AppIntegrityCheckerPlugin: returns original classes.dex CRC and Play Store signature
        val aicChecksumFingerprint = object : Fingerprint(
            definingClass = "Lcom/emrys/aic/app_integrity_checker/AppIntegrityCheckerPlugin;",
            name = "getChecksum",
            returnType = "Ljava/lang/String;",
            parameters = listOf(),
        ) {}

        runCatching { aicChecksumFingerprint.method }.getOrNull()?.let { method ->
            method.addInstructions(
                0,
                """
                    const-string v0, "3138619328"
                    return-object v0
                """
            )
        }

        val aicSigFingerprint = object : Fingerprint(
            definingClass = "Lcom/emrys/aic/app_integrity_checker/AppIntegrityCheckerPlugin;",
            name = "getSignature",
            returnType = "Ljava/lang/String;",
            parameters = listOf(),
        ) {}

        runCatching { aicSigFingerprint.method }.getOrNull()?.let { method ->
            method.addInstructions(
                0,
                """
                    const-string v0, "iZolMPZ+iE5k+Ps3hGJtLCTCZpchWE/f8yydfZSyfZY=\\n"
                    return-object v0
                """
            )
        }
    }
}
