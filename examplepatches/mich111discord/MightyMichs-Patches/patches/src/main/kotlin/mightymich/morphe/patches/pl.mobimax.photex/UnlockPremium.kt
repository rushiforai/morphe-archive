package mightymich.morphe.patches.pl.mobimax.photex

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium (Experimental)",
    description = "Unlocks Photex Companion premium by forcing the license check to return true. WARNING: May cause crashes.",
    default = false
) {
    compatibleWith(PhotexCompatibility.PHOTEX)

    val licenseCheckFingerprint = Fingerprint(
        definingClass = "Lpl/mobimax/photex/App;",
        name = "b",
        returnType = "Z"
    )

    execute {
        licenseCheckFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find b()Z method in App class.")

            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
    }
}
