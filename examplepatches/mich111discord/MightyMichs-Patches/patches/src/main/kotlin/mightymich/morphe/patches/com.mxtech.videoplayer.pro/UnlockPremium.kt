package mightymich.morphe.patches.com.mxtech.videoplayer.pro

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock MX Player Pro",
    description = "Unlocks MX Player Pro by disabling ads and forcing pro status.",
    default = true
) {
    compatibleWith(MXPlayerCompatibility.MX_PLAYER)


    val adsFingerprint = Fingerprint(
        definingClass = "Lxo;",
        name = "j1",
        returnType = "Z"
    )


    val isProFingerprint = Fingerprint(
        name = "isPro",
        returnType = "Z"
    )

    execute {

        adsFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find j1 method in class xo.")
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }


        isProFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find isPro method.")
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
