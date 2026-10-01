package mightymich.morphe.patches.com.yaunquan.guitartuna

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium Features",
    description = "Unlocks Guitar Tuner premium.",
    default = true
) {
    compatibleWith(GuitarTunerCompatibility.GUITAR_TUNER)

    // Próbujemy znaleźć typową metodę isVip lub podobną.
    // Jeśli nie zadziała, trzeba znaleźć dokładną nazwę w MT Managerze.
    val isVipFingerprint = Fingerprint(name = "isVip", returnType = "Z")

    execute {
        isVipFingerprint.let { fingerprint ->
            val method = fingerprint.method
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
