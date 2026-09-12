package app.ytvr.patches.playback

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ytvr.patches.shared.Constants.COMPATIBILITY_YOUTUBE_VR

/**
 * The class is not obfuscated, so the method is matched by class and name.
 */
private val drcPreferenceFingerprint = Fingerprint(
    definingClass = "Lcom/google/android/libraries/youtube/media/interfaces/PlaybackAgnosticUserPreferences;",
    name = "getIsDrcEnabled",
    returnType = "Z",
)

@Suppress("unused")
val disableDrcAudioPatch = bytecodePatch(
    name = "Disable DRC audio",
    description = "Disables DRC (Dynamic Range Compression) audio.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_VR)

    execute {
        // Always report DRC audio as disabled to the media player.
        drcPreferenceFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
    }
}
