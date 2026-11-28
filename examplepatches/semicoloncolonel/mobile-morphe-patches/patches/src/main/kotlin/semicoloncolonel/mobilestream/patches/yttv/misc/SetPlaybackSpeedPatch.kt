package semicoloncolonel.mobilestream.patches.yttv.misc

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import semicoloncolonel.mobilestream.patches.yttv.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Set playback speed.
//
// YouTube TV can change playback speed on the web but shows no speed control in
// the app. Uses the shared playback rate hook (PlaybackRateHook.kt): when the
// app sets the speed for a new video, the chosen speed is used instead.
//
// This is a fixed speed chosen in the options, not an in-player menu.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val setPlaybackSpeedPatch = bytecodePatch(
    name = "Set playback speed",
    description = "Plays videos at a speed you choose in the patch options, " +
        "since YouTube TV has no speed control in the app.",
    default = false,
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(playbackRateHookPatch)

    val speed by stringOption(
        key = "speed",
        default = "1.5",
        values = mapOf(
            "0.5x" to "0.5",
            "0.75x" to "0.75",
            "1x (normal)" to "1",
            "1.25x" to "1.25",
            "1.5x" to "1.5",
            "1.75x" to "1.75",
            "2x" to "2",
        ),
        title = "Playback speed",
        description = "The speed videos play at.",
        required = true,
    ) { it?.toFloatOrNull()?.let { v -> v in 0.25f..4f } == true }

    execute {
        setSpeedValue(DefaultRateFingerprint, speed!!.toFloat())
    }
}
