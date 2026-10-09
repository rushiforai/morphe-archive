package mightymich.morphe.patches.me.pou.app.Unlockeverything

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockEverythingPatch = bytecodePatch(
    name = "Unlock Everything (Experimental)",
    description = "Unlocks all items in POU and bypasses integrity check. WARNING: May cause crashes.",
    default = false
) {
    compatibleWith(PouUnlockEverythingCompatibility.POU_UNLOCK_EVERYTHING)

    val hashCheckFingerprint = Fingerprint(
        definingClass = "Lme/pou/app/App;",
        name = "A0",
        returnType = "Z"
    )

    execute {
        hashCheckFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find App.A0 method.")
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
