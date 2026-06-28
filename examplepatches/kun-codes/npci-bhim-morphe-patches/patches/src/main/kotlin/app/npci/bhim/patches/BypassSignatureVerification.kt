package app.npci.bhim.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_BHIM

@Suppress("unused")
val bypassSignatureVerification = bytecodePatch(
    name = "Bypass Signature Verification",
    description = "Bypasses APK signature verification in com.pairip.SignatureCheck to prevent SignatureTamperedException on modified APKs.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BHIM)

    execute {
        SignatureCheckFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )
    }
}
