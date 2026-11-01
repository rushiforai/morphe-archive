package app.southstar21.patches.instagram.misc.signature

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.southstar21.patches.instagram.shared.Constants.COMPATIBILITY_INSTAGRAM
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The class Instagram uses to decide whether another app's signature is trusted. Only the error
 * strings survive obfuscation, and the check itself is the (app, flag) method walking the
 * trusted signatures with keySet().
 */
internal object IsTrustedSignatureFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        strings = listOf("The provider for uri '", "' is not trusted: "),
    ),
    returnType = "Z",
    parameters = listOf("L", "Z"),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.name == "keySet"
        } == true
    },
)

// Ported from https://github.com/brosssh/instagram-morphe-patches-library (GPLv3).
@Suppress("unused")
val bypassSignatureCheckPatch = bytecodePatch(
    name = "Bypass signature check",
    description = "Stops Instagram rejecting apps by their signature, which a patched app no longer matches.",
    default = true
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        IsTrustedSignatureFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
