package dev.ytmruskippper.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

@Suppress("unused")
val autoSkipPatch = patch(
    name = "Auto-skip russian tracks",
    description = "Skips tracks using title characters and artist country data from MusicBrainz.",
) {
    compatibleWith(youtubeMusic)
    dependsOn(skipperExtension)

    execute {
        addPlaybackHooks(TRACK_SKIPPER)
        addSettingsScreen()

        ApplicationOnCreateFingerprint.matchAll(1..1).single().method.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, $SKIPPER_SETTINGS->initialize(Landroid/content/Context;)V",
        )

        // Re-applies the flags whenever the app sets the artist line.
        NowPlayingArtistFingerprint.matchAll(1..1).single().let { match ->
            val setText = match.instructionMatches.last()
            val view = setText.getInstruction<FiveRegisterInstruction>().registerC
            match.method.addInstruction(
                setText.index + 1,
                "invoke-static/range {v$view .. v$view}, $ARTIST_FLAGS->onArtistTextBound(Landroid/widget/TextView;)V",
            )
        }
    }
}

@Suppress("unused")
val playbackProbePatch = patch(
    name = "Playback metadata probe",
    description = "Logs video IDs, notification track credits, and media-session metadata to Logcat.",
    default = false,
) {
    compatibleWith(youtubeMusic)
    dependsOn(skipperExtension)

    execute { addPlaybackHooks(PLAYBACK_PROBE) }
}
