package mightymich.morphe.patches.com.mixplorer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Disables MiXplorer self-signature / CRC fingerprint gate.
 *
 * Official builds compute CRC-32 of the signing cert (libs.u92.Call) and require
 * it to be listed in libs.zt0.h (seeded with 87ed1907, 9eccce78, d725ce3f).
 * Re-signed APKs fail those contains() checks.
 *
 * Fix: after the official seeds are added, also add the runtime fingerprint
 * (field u92.p) to the allow-list so any signer is accepted.
 */
@Suppress("unused")
val disableSignatureVerificationPatch = bytecodePatch(
    name = "Disable signature verification",
    description = "Allows re-signed MiXplorer builds by adding the installed " +
        "signing cert fingerprint to the internal allow-list.",
    default = false
) {
    compatibleWith(MiXplorerCompatibility.MIXPLORER)

    val callFingerprint = Fingerprint(
        definingClass = "Llibs/u92;",
        name = "Call",
        returnType = "Ljava/lang/String;",
        parameters = emptyList(),
        filters = listOf(
            string("87ed1907"),
            string("CRC-32")
        )
    )

    execute {
        val method = callFingerprint.method
            ?: throw PatchException(
                "MiXplorer: u92.Call() not found (CRC-32 / 87ed1907)."
            )

        val insns = method.implementation?.instructions
            ?: throw PatchException("MiXplorer: u92.Call() has no implementation.")

        var insertAt: Int? = null
        insns.forEachIndexed { index, insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? StringReference
            if (ref?.string == "d725ce3f") {
                // After const-string + invoke-interface add (+ optional move)
                insertAt = index + 3
            }
        }

        val at = insertAt
            ?: throw PatchException(
                "MiXplorer: could not locate allow-list seed d725ce3f in u92.Call()."
            )

        // v0 holds the ArrayList after the three official adds (6.71.15 layout).
        method.addInstructions(
            at,
            """
                sget-object v1, Llibs/u92;->p:Ljava/lang/String;
                if-eqz v1, :mix_sig_skip
                invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
                :mix_sig_skip
                nop
            """
        )
    }
}
