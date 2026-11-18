package io.github.jordanwoodson.patches.kick.player

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.kick.shared.OTA_UPDATES_OFF
import io.github.jordanwoodson.patches.kick.shared.kickHermes
import io.github.jordanwoodson.patches.kick.shared.kickHermesPatch
import io.github.jordanwoodson.patches.shared.settings.ChoiceSetting
import io.github.jordanwoodson.patches.shared.settings.Section
import java.nio.ByteBuffer
import java.nio.ByteOrder

private const val KEY = "vod_skip_seconds"

@Suppress("unused")
val seekIntervalPatch = bytecodePatch(
    name = "Seek interval",
    description = "Sets how far the rewind and forward buttons skip in videos and rewound live streams: 5, 15, 20 " +
        "or 30 seconds instead of 10. Starts at Kick's 10 seconds. Choose another in Lurk settings > Playback." + OTA_UPDATES_OFF,
) {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickHermesPatch)

    execute {
        // PlayerConfig.controls.skip.scale is {livestream: 60, vod: 10, 'live-vod': 10, clip: 10}: one object literal
        // whose four integers are one run in the literal buffer. The `vod` and `live-vod` values sit next to each other
        // and no other literal reads their bytes (dataChoice checks); the live-edge and clip values stay.
        fun seconds(value: Int) = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN).putInt(value).putInt(value).array()
        val skipScale = kickHermes.literals.filter { it.keys == listOf("livestream", "vod", "live-vod", "clip") }
            .singleOrNull() ?: throw PatchException("Kick: expected one PlayerConfig skip scale object")
        val values = kickHermes.literalValues(skipScale)
        val vod = values.getOrNull(1)
        val liveVod = values.getOrNull(2)
        // Type 7 is a 32-bit integer.
        if (vod == null || liveVod == null || vod.type != 7 || liveVod.type != 7 || vod.width != 4 ||
            liveVod.offset != vod.offset + 4 || vod.value != 10L || liveVod.value != 10L) {
            throw PatchException("Kick: the VOD skip scale is no longer 10 seconds for vod and live-vod")
        }
        val choices = listOf(5, 15, 20, 30)
        kickHermes.dataChoice(vod.offset, KEY, seconds(10), choices.associate { "$it" to seconds(it) },
            readers = listOf(skipScale))
        kickSettings.add(
            ChoiceSetting(
                KEY,
                "Seek interval",
                "How far rewind and forward skip in videos.",
                Section.PLAYBACK,
                "0",
                listOf("Kick's default (10 s)" to "0") + choices.map { "$it seconds" to "$it" },
                restart = true,
            ),
        )
    }
}
