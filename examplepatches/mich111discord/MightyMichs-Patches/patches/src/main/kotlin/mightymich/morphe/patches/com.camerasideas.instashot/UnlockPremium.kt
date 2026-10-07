package mightymich.morphe.patches.com.camerasideas.instashot

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium ",
    description = "Unlocks InShot premium by forcing billing methods to return true.",
    default = true
) {
    compatibleWith(InShotCompatibility.INSHOT)

    val uFingerprint = Fingerprint(
        definingClass = "Lcom/camerasideas/instashot/store/billing/L;",
        name = "u",
        returnType = "Z"
    )

    val wFingerprint = Fingerprint(
        definingClass = "Lcom/camerasideas/instashot/store/billing/L;",
        name = "w",
        returnType = "Z"
    )

    execute {
        uFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find method 'u' in class L.")
            method.addInstructions(0, """
                const/4 v0, 0x1
                return v0
            """)
        }
        wFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find method 'w' in class L.")
            method.addInstructions(0, """
                const/4 v0, 0x1
                return v0
            """)
        }
    }
}
