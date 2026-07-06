package app.paresh.patches.jiohotstar.integrity

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import app.paresh.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR

@Suppress("unused")
val signatureBypassPatch = bytecodePatch(
    name = "Bypass signature check",
    description = "Bypasses app signature verification to allow API access."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        // Ee/o.c computes MD5(current_cert) as base64, compares with getSignFromJNI().
        // If they match → z10=false (not tampered). If not → z10=true (tampered).
        // After re-signing, the computed hash differs from the original.
        //
        // Fix: After MD5+Base64 computation (v0 holds the hash string),
        // replace v0 with the original cert's hash so comparison always succeeds.
        // The original hash "GnwgdTsKCP54v02ZSST5iA" is from libnative-lib.so getAppSignature.
        val method = SignatureCheckFingerprint.method
        val matches = SignatureCheckFingerprint.instructionMatches

        // instructionMatches[1] = Base64.encodeToString call
        // After it, move-result-object stores the hash in a register.
        // We overwrite that register with the original hash.
        val encodeIndex = matches[1].index
        // The move-result-object is at encodeIndex + 1
        val moveResultIndex = encodeIndex + 1
        val reg = method.getInstruction<OneRegisterInstruction>(moveResultIndex).registerA

        method.addInstructions(moveResultIndex + 1, """
            const-string v$reg, "GnwgdTsKCP54v02ZSST5iA"
        """)
    }
}
