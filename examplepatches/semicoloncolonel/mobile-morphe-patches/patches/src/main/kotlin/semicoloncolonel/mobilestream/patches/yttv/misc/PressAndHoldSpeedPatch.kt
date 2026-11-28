package semicoloncolonel.mobilestream.patches.yttv.misc

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import semicoloncolonel.mobilestream.patches.yttv.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Press and hold to speed up.
//
// Uses the shared player touch hook on WatchLayout (PlayerTouchHook.kt) and the
// shared playback rate hook (PlaybackRateHook.kt). Holding a
// finger still on the player for the system long-press time raises the playback
// rate to the chosen speed; lifting it returns to the normal speed (the "Set
// playback speed" value when that patch is on, otherwise 1x). Moving the finger
// or adding a second one cancels the hold, so drags and pinches are unaffected.
//
// The first version hooked onLongPress on the gesture handler of YouTube TV's
// "elements" UI, which the fullscreen player does not use, so it never ran.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val pressAndHoldSpeedPatch = bytecodePatch(
    name = "Press and hold to speed up",
    description = "Hold your finger on the player to speed up playback, and let go to return to normal speed. " +
        "Choose the hold speed in the patch options.",
    default = false,
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(playerTouchHookPatch, playbackRateHookPatch)

    val speed by stringOption(
        key = "speed",
        default = "2",
        values = mapOf(
            "1.25x" to "1.25",
            "1.5x" to "1.5",
            "2x" to "2",
            "2.5x" to "2.5",
            "3x" to "3",
        ),
        title = "Hold speed",
        description = "The playback speed while you hold your finger on the player.",
        required = true,
    ) { it?.toFloatOrNull()?.let { v -> v in 1.1f..4f } == true }

    execute {
        setSpeedValue(HoldRateFingerprint, speed!!.toFloat())
        enablePlayerTouchFeature(HoldEnabledFingerprint)
    }
}
