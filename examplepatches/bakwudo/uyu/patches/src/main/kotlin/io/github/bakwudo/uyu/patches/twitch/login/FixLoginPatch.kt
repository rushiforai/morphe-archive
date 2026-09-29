/*
 * Based on "Fix login" from hoomans-morphe-patches by arandomhooman (GPLv3).
 * https://github.com/arandomhooman/hoomans-morphe-patches
 */

package io.github.bakwudo.uyu.patches.twitch.login

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH

private const val SETUP_BEGIN_EVENT = "play_integrity_setup_begin"

@Suppress("unused")
val fixLoginPatch = bytecodePatch(
    name = "Fix login",
    description = "Fixes the \"This app version/OS is not currently supported\" error that blocks " +
        "login after patching. Twitch reports a Play Integrity result to its login server and the " +
        "re-signed app fails that check. This stops the app from sending the attestation, so it " +
        "behaves like a device without Google Play, where login works normally.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    execute {
        // The attestation flow lives in one class. Its orchestrator method runs setup, requests a
        // StandardIntegrity token and POSTs it to /api/v1/android/attestation. Login itself only
        // sends credentials, so skipping the attestation is enough.
        //
        // Find the class by the analytics event it logs when setup begins, then return immediately
        // from the method that logs it. The method is a suspend function (returns Object) whose only
        // caller compares the result against COROUTINE_SUSPENDED, so returning null completes it.
        val attestationClass = classDefByStrings(SETUP_BEGIN_EVENT).singleOrNull()
            ?: throw PatchException(
                "Play Integrity attestation class (\"$SETUP_BEGIN_EVENT\") not found or ambiguous.",
            )

        val setupMethod = mutableClassDefBy(attestationClass).methods.singleOrNull { method ->
            method.implementation?.instructions?.any { instruction ->
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                    SETUP_BEGIN_EVENT
            } == true
        } ?: throw PatchException(
            "Play Integrity setup method (logging \"$SETUP_BEGIN_EVENT\") not found uniquely.",
        )

        setupMethod.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )
    }
}
