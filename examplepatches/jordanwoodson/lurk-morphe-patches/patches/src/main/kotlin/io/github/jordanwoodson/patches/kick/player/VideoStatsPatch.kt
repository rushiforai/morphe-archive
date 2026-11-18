package io.github.jordanwoodson.patches.kick.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import io.github.jordanwoodson.patches.kick.settings.kickMatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.settings.kickSettingsPatch
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting

private const val KICK_STATS = "Lio/github/jordanwoodson/extension/shared/kick/KickStats;"

@Suppress("unused")
val videoStatsPatch = bytecodePatch(
    name = "Show video stats",
    description = "Shows a small panel in the corner of the player with what Kick's video player reports, " +
        "refreshed every second: latency to the broadcaster, bitrate and the network estimate, buffer, dropped " +
        "frames, quality and codecs. The numbers come from the player on your phone; nothing is sent anywhere, " +
        "and the panel never takes a tap. Starts off. Turn it on in Lurk settings > Playback.",
) {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickSettingsPatch)

    execute {
        // Kick's player sends React Native a time update from its interval clock, on the main thread, once a second
        // for its player (whether it plays or not). KickStats reads what the Media3 player keeps there and draws it in
        // the overlay of the player view the player is on.
        PlayerTimeUpdateFingerprint.kickMatch("player time update").method.apply {
            Locators.record("kick.video_stats.time_update", this)
            addInstructions(0, invokeStatic("$KICK_STATS->onTimeUpdate(Ljava/lang/Object;)V", parameterRegister(0)))
        }
        bridge(KICK_STATS, "playerView", """
            check-cast p0, $VIDEO_PLAYER
            invoke-virtual { p0 }, $VIDEO_PLAYER->getCurrentVideoView()$PLAYER_VIEW
            move-result-object p0
            return-object p0
        """)
        bridge(KICK_STATS, "exoPlayer", """
            check-cast p0, $VIDEO_PLAYER
            invoke-virtual { p0 }, $VIDEO_PLAYER->getPlayer()$EXO_PLAYER
            move-result-object p0
            return-object p0
        """)
        kickSettings.add(
            SwitchSetting(
                "video_stats",
                "Show video stats",
                "A panel over the player with latency, bitrate, buffer, dropped frames, quality and codecs, " +
                    "refreshed every second. Applies at once.",
                Section.PLAYBACK,
                default = false,
            ),
        )
    }
}
