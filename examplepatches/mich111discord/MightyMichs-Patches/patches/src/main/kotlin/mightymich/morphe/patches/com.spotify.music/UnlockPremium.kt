package mightymich.morphe.patches.com.spotify.music

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Spotify Premium",
    description = "Unlocks Spotify Premium by forcing isPremium() to return true.",
    default = true
) {
    compatibleWith(SpotifyCompatibility.SPOTIFY)

    val isPremiumFingerprint = Fingerprint(
        name = "isPremium",
        returnType = "Z"
    )

    execute {
        isPremiumFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find isPremium method.")
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
