package io.github.jordanwoodson.patches.kick.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import io.github.jordanwoodson.patches.kick.settings.kickMatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.settings.kickSettingsPatch
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting

private const val LIVE_CONFIGURATION = "Lcom/kick/mobile/playerv3/records/LiveConfiguration;"

@Suppress("unused")
val normalLatencyPatch = bytecodePatch(
    name = "Normal latency",
    description = "Adds a switch that turns off Kick's low-latency mode for live streams: more delay (about 15 " +
        "seconds more on the streams checked), fewer rebuffers on weak connections. Starts off. Turn it on in Lurk " +
        "settings > Playback.",
) {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickSettingsPatch)

    execute {
        // Kick's low-latency mode is the live configuration it gives a live stream's source (its remote flag
        // lowLatencyLivestream, on by default): a 2-second target offset from the live edge for Media3, and a rewrite
        // of the HLS playlist that plays its prefetch segments. The source's Media3 item and HLS source are built here;
        // without the configuration Media3 keeps the distance the playlist itself asks for.
        val build = BuildMediaSourceFingerprint.kickMatch("player media source builder").method
        if (classDefBy(VIDEO_SOURCE).fields.none { it.name == "liveConfiguration" && it.type == LIVE_CONFIGURATION }) {
            throw PatchException("Kick: the video source has no liveConfiguration")
        }
        Locators.record("kick.normal_latency.build_media_source", build)
        build.addInstructions(0, invokeStatic("$KICK_PLAYER->normalLatency(Ljava/lang/Object;)V", build.parameterRegister(1)))
        bridge(KICK_PLAYER, "liveConfiguration", """
            check-cast p0, $VIDEO_SOURCE
            iget-object p0, p0, $VIDEO_SOURCE->liveConfiguration:$LIVE_CONFIGURATION
            return-object p0
        """)
        bridge(KICK_PLAYER, "clearLiveConfiguration", """
            check-cast p0, $VIDEO_SOURCE
            const/4 v0, 0x0
            iput-object v0, p0, $VIDEO_SOURCE->liveConfiguration:$LIVE_CONFIGURATION
            return-void
        """, locals = 1)
        kickSettings.add(
            SwitchSetting(
                "normal_latency",
                "Normal latency",
                "Turns off low-latency mode for live streams: more delay (about 15 seconds), fewer rebuffers. " +
                    "Applies to streams opened afterwards.",
                Section.PLAYBACK,
                default = false,
            ),
        )
    }
}
