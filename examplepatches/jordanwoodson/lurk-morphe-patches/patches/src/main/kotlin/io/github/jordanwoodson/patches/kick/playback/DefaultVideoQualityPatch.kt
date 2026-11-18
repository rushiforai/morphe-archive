package io.github.jordanwoodson.patches.kick.playback

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import io.github.jordanwoodson.patches.kick.player.KICK_PLAYER
import io.github.jordanwoodson.patches.kick.player.SetMaxResolutionFingerprint
import io.github.jordanwoodson.patches.kick.player.VIDEO_PLAYER
import io.github.jordanwoodson.patches.kick.player.VIDEO_SIZE
import io.github.jordanwoodson.patches.kick.settings.kickMatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.settings.kickSettingsPatch
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.kick.shared.HermesOp
import io.github.jordanwoodson.patches.kick.shared.OTA_UPDATES_OFF
import io.github.jordanwoodson.patches.kick.shared.kickHermes
import io.github.jordanwoodson.patches.kick.shared.kickHermesPatch
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.settings.ChoiceSetting
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import java.nio.ByteBuffer
import java.nio.ByteOrder

private const val KEY = "default_video_quality"
private const val METERED = "quality_metered"

@Suppress("unused")
val defaultVideoQualityPatch = bytecodePatch(
    name = "Default video quality",
    description = "Sets the default adaptive quality ceiling to the selected height when that rendition exists. " +
        "Kick can still choose a lower quality. The player's Auto option uses this ceiling. A lower starting " +
        "ceiling can be set for mobile data in Lurk settings > Playback; it's off until then." + OTA_UPDATES_OFF,
    default = false,
) {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickHermesPatch, kickSettingsPatch)
    val quality by stringOption(
        key = "quality", default = "1080",
        values = listOf(1080, 720, 480, 360, 240).associate { "${it}p" to "$it" },
        title = "Default quality ceiling", description = "Adaptive playback ceiling. Repatch to change this height.",
        required = true,
    ) { it in listOf("1080", "720", "480", "360", "240") }
    execute {
        val height = quality!!.toInt()
        // Kick's player store starts every stream, and goes back on Auto, through setDefaultMaxResolution: it reduces
        // the stream's video tracks to the tallest one no taller than PlayerConfig.settings.defaultMaxAutoQualityHeight
        // (720) and makes it the player's maxResolution. That reducer is the closure setDefaultMaxResolution creates;
        // its read of the default height becomes the chosen height. The two other reads of the default, in the quality
        // picker, decide which picks need a signed-in account, and stay Kick's.
        val reducer = kickHermes.closureUsing(kickHermes.function("setDefaultMaxResolution"), "video track reducer",
            reads = listOf("defaultMaxAutoQualityHeight", "size", "height"))
        val property = kickHermes.stringId("defaultMaxAutoQualityHeight")
        val read = kickHermes.instructions(reducer).singleOrNull { it.propertyId() == property }
            ?: throw PatchException("Kick: the video track reducer reads the default height more than once")
        if (read.opcode != HermesOp.GET_BY_ID) throw PatchException("Kick: the default height read changed form")
        val constant = ByteBuffer.allocate(6).order(ByteOrder.LITTLE_ENDIAN)
            .put(HermesOp.LOAD_CONST_INT.toByte()).put(read.bytes[1]).putInt(height).array()
        kickHermes.replaceInstruction(reducer, KEY, read, constant)

        // Every ceiling reaches the player as its maxResolution, a video size: the stream's starting one, Auto and a
        // picked quality. On a metered network the mobile-data choice caps a starting ceiling: none, or the tallest
        // track no taller than Kick's 720 or this patch's height, which is what the reducer picks. Any other size is a
        // pick and passes through. Kick's stored choice isn't touched.
        SetMaxResolutionFingerprint.kickMatch("player maxResolution setter").method.apply {
            Locators.record("kick.default_video_quality.set_max_resolution", this)
            addInstructions(0, """
                ${invokeStatic("$KICK_PLAYER->maxResolution(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
                    parameterRegister(0), parameterRegister(1))}
                move-result-object p1
                check-cast p1, $VIDEO_SIZE
            """)
        }
        val videoTrack = "Lcom/kick/mobile/playerv3/records/VideoTrack;"
        bridge(KICK_PLAYER, "lurkHeight", "const/16 v0, $height\nreturn v0", locals = 1)
        bridge(KICK_PLAYER, "playerContext", """
            check-cast p0, $VIDEO_PLAYER
            invoke-virtual { p0 }, $VIDEO_PLAYER->getContext()Landroid/content/Context;
            move-result-object p0
            return-object p0
        """)
        bridge(KICK_PLAYER, "videoTracks", """
            check-cast p0, $VIDEO_PLAYER
            invoke-virtual { p0 }, $VIDEO_PLAYER->getAvailableVideoTracks()Ljava/util/List;
            move-result-object p0
            return-object p0
        """)
        bridge(KICK_PLAYER, "trackHeight", """
            check-cast p0, $videoTrack
            invoke-virtual { p0 }, $videoTrack->getSize()$VIDEO_SIZE
            move-result-object p0
            if-eqz p0, :none
            invoke-virtual { p0 }, $VIDEO_SIZE->getHeight()I
            move-result p0
            return p0
            :none
            const/4 p0, 0x0
            return p0
        """)
        bridge(KICK_PLAYER, "sizeWidth", """
            check-cast p0, $VIDEO_SIZE
            invoke-virtual { p0 }, $VIDEO_SIZE->getWidth()I
            move-result p0
            return p0
        """)
        bridge(KICK_PLAYER, "sizeHeight", """
            check-cast p0, $VIDEO_SIZE
            invoke-virtual { p0 }, $VIDEO_SIZE->getHeight()I
            move-result p0
            return p0
        """)
        bridge(KICK_PLAYER, "videoSize", """
            new-instance v0, $VIDEO_SIZE
            invoke-direct { v0, p0, p1 }, $VIDEO_SIZE-><init>(II)V
            return-object v0
        """, locals = 1)

        kickSettings.add(
            SwitchSetting(KEY, "Default video quality",
                "Uses an adaptive ${height}p default and Auto ceiling when available; player selections work normally.",
                Section.PLAYBACK, restart = true),
            ChoiceSetting(METERED, "Quality on mobile data",
                "The highest quality a stream starts at on metered networks. A quality you pick in the player " +
                    "still plays.", Section.PLAYBACK, "0",
                listOf("Same as on Wi-Fi" to "0", "720p" to "720", "480p" to "480", "360p" to "360", "160p" to "160")),
        )
    }
}
