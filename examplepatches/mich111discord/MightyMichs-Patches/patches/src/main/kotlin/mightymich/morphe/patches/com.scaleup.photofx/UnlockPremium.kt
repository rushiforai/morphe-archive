package mightymich.morphe.patches.com.scaleup.photofx

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium ",
    description = "Unlocks PhotoApp Premium by forcing UserViewModel.isPremium to true. WARNING: May cause crashes.",
    default = true
) {
    compatibleWith(PhotoAppCompatibility.PHOTOAPP)

    val isPremiumFingerprint = Fingerprint(
        definingClass = "Lcom/scaleup/photofx/viewmodel/UserViewModel;",
        name = "isPremium",
        returnType = "Z"
    )

    execute {
        isPremiumFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find isPremium in UserViewModel.")
            method.addInstructions(0, """
                const/4 v0, 0x1
                return v0
            """)
        }
    }
}
