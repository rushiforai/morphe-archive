package io.github.jordanwoodson.patches.kick.player

import app.morphe.patcher.patch.bytecodePatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting

private const val KEY = "player_gestures"

@Suppress("unused")
val playerGesturesPatch = bytecodePatch(
    name = "Player gestures",
    description = "In landscape, swipe up or down on the left of the video to change the brightness, on the right " +
        "to change the volume. The middle of the video keeps Kick's own swipes (out of fullscreen), and Kick's taps " +
        "and pinch to zoom stay. Starts off. Turn it on in Lurk settings > Playback.",
) {
    compatibleWith(COMPATIBILITY_KICK)
    // The swipes are read in MainActivity's dispatchTouchEvent (kickPlayerTouchPatch), on Kick's player view.
    dependsOn(kickPlayerTouchPatch)

    execute {
        kickSettings.add(
            SwitchSetting(
                KEY,
                "Player gestures",
                "In landscape: swipe on the left of the video for brightness, on the right for volume. The middle " +
                    "keeps Kick's own swipes.",
                Section.PLAYBACK,
                default = false,
            ),
        )
    }
}
