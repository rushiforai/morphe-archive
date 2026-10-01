package mightymich.morphe.patches.com.videoplayer.arcplayer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium Features",
    description = "Unlocks Arc Player premium by forcing isPremiumUser to return true.",
    default = true
) {
    compatibleWith(ArcPlayerCompatibility.ARC_PLAYER)


    val isPremiumUserFingerprint = Fingerprint(
        name = "isPremiumUser",
        returnType = "Z"
    )

    execute {
        isPremiumUserFingerprint.let { fingerprint ->
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
