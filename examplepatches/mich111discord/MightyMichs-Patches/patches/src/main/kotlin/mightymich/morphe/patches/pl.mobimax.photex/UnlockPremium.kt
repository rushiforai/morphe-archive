package mightymich.morphe.patches.pl.mobimax.photex

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium Features",
    description = "Unlocks Photex Companion premium by forcing the license check to return true.",
    default = true
) {
    compatibleWith(PhotexCompatibility.PHOTEX)

    // Fingerprint: locate the method c()Z in the App class.
    // This method is called to determine the license status (PREMIUM/FREE).
    val licenseCheckFingerprint = Fingerprint(
        definingClass = "Lpl/mobimax/photex/App;",
        name = "c",
        returnType = "Z"
    )

    execute {
        licenseCheckFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find c()Z method in App class.")

            // Insert instructions at the very beginning:
            //   const/4 v0, 0x1  -> load 1 (true) into register v0
            //   return v0        -> return true immediately
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
