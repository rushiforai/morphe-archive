package mightymich.morphe.patches.com.teslacoilsw.launcher

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Nova Launcher Prime",
    description = "Unlocks Nova Launcher Prime by forcing isPrime() to return true.",
    default = true
) {
    compatibleWith(NovaLauncherCompatibility.NOVA_LAUNCHER)

    val isPrimeFingerprint = Fingerprint(
        name = "isPrime",
        returnType = "Z"
    )

    execute {
        isPrimeFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find isPrime method.")
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
