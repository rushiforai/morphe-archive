package semicoloncolonel.mobilestream.patches.yttv.misc

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.yttv.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Volume and brightness sliders.
//
// Uses the shared player touch hook on WatchLayout (PlayerTouchHook.kt) and
// turns on YttvScreenGestures through YttvPlayerTouch.slidersEnabled(). While the
// player is fullscreen, a vertical drag on the right half changes the media
// volume and on the left half the brightness of the app's own window. Drags that
// start in the top or bottom edge band, horizontal drags, taps, double taps, and
// pinches are left to the player.
//
// The first version hooked onScroll on the gesture handler of YouTube TV's
// "elements" UI, which the fullscreen player does not use, so it never ran.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val screenGesturesPatch = bytecodePatch(
    name = "Volume and brightness sliders",
    description = "While the player is fullscreen, slide up and down to change the volume on the right side and the " +
        "screen brightness on the left. All the way down is mute for volume and automatic for brightness. " +
        "The brightness change applies only inside YouTube TV.",
    default = false,
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(playerTouchHookPatch)

    execute {
        enablePlayerTouchFeature(SlidersEnabledFingerprint)
    }
}
