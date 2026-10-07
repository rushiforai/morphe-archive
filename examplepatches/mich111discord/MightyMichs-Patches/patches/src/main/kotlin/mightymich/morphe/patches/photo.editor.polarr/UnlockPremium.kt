package mightymich.morphe.patches.photo.editor.polarr

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium (Experimental)",
    description = "Unlocks Polarr Premium by forcing isPremium to true. WARNING: May cause crashes.",
    default = false
) {
    compatibleWith(PolarrCompatibility.POLARR)

    val isPremiumFingerprint = Fingerprint(
        name = "isPremium",
        returnType = "Z"
    )

    execute {
        isPremiumFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find isPremium method.")
            method.addInstructions(0, """
                const/4 v0, 0x1
                return v0
            """)
        }
    }
}
