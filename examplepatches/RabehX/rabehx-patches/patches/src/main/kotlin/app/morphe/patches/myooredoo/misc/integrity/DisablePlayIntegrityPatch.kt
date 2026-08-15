/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.myooredoo.misc.integrity

import app.morphe.patches.myooredoo.shared.Constants
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Disables the Play Integrity request in Play.apic
 * (com.android.sec.utils.Play), which is called over the
 * MethodChannel ("apic"). The app receives the value "DISABLED" instantly
 * instead of performing an attestation request — Google Play Integrity
 * tokens cannot be forged and would always fail on modified builds anyway.
 */
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
    }
}
