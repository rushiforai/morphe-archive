package mightymich.morphe.patches.pl.mobimax.cameraopus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium Features",
    description = "Unlocks Camera Opus Companion premium by forcing the license check to return true.",
    default = true
) {
    compatibleWith(CameraOpusCompatibility.CAMERA_OPUS)

    val licenseCheckFingerprint = Fingerprint(
        definingClass = "Lpl/mobimax/cameraopus/App;",
        name = "c",
        returnType = "Z"
    )

    execute {
        licenseCheckFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find c()Z method in App class.")

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
