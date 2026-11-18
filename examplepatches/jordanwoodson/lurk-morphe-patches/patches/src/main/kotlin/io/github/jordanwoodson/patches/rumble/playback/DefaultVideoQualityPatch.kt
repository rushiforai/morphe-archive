package io.github.jordanwoodson.patches.rumble.playback

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.jordanwoodson.patches.rumble.settings.rumbleSettings
import io.github.jordanwoodson.patches.rumble.settings.settingsPatch
import io.github.jordanwoodson.patches.rumble.shared.Constants.COMPATIBILITY_RUMBLE
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.rumble.shared.RUMBLE_PLAYBACK
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.rumble.shared.single
import io.github.jordanwoodson.patches.rumble.shared.toStringField
import io.github.jordanwoodson.patches.rumble.shared.toStringGetter
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.settings.ChoiceSetting
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.shared.settings.requireLocals

private val QUALITIES = listOf(2160, 1440, 1080, 720, 480, 360, 240)
private const val KEY = "video_quality"
private const val LIVE_KEY = "video_quality_live"
private const val MOBILE_KEY = "video_quality_mobile"

@Suppress("unused")
val defaultVideoQualityPatch = bytecodePatch(
    name = "Default video quality",
    description = "Starts videos at a chosen quality, or the closest one available, instead of Rumble's Auto. " +
        "A quality you pick in the player applies to that video. Starting live streams at it too, and a lower " +
        "cap on mobile data, are separate settings. Starts off (Rumble's default). Choose a quality in Lurk " +
        "settings > Playback.",
) {
    compatibleWith(COMPATIBILITY_RUMBLE)
    dependsOn(settingsPatch)

    val quality by stringOption(
        key = "quality",
        default = "0",
        values = mapOf("Rumble's default" to "0") + QUALITIES.associate { "${it}p" to it.toString() },
        title = "Quality",
        description = "The video height to start with, such as 1080, or 0 for Rumble's default. Can be changed " +
            "later in Lurk settings.",
        required = true,
    ) { it?.toIntOrNull()?.let { height -> height == 0 || height in 144..4320 } == true }
    val live by booleanOption(
        key = "live",
        default = false,
        title = "Live streams too",
        description = "Start live streams at the default quality instead of Auto. Can be changed later in " +
            "Lurk settings.",
    )
    val mobileQuality by stringOption(
        key = "mobileQuality",
        default = "0",
        values = mapOf("Same as on Wi-Fi" to "0") + QUALITIES.associate { "${it}p" to it.toString() },
        title = "On mobile data",
        description = "The highest quality a video starts at on metered networks, or 0 for the same as on " +
            "Wi-Fi. Can be changed later in Lurk settings.",
        required = true,
    ) { it?.toIntOrNull()?.let { height -> height == 0 || height in 144..4320 } == true }

    execute {
        val height = quality!!.toInt()
        val mobileHeight = mobileQuality!!.toInt()

        // Rumble's start-source chooser gets (sources, height, allowAuto, data saver). It starts on Auto whenever
        // Auto is allowed (every video but Shorts) and a source is Auto, else at the source nearest the height
        // (720p, or the Shorts' own); data saver takes the lowest. Rumble doesn't keep a quality picked in the
        // player. The extension returns the height to start at instead, with Auto off, or -1 for Rumble's
        // choice: the chosen quality, and on mobile data that or Rumble's start lowered to the cap. Only
        // starting a video runs the chooser (the player's video load and the Shorts cache).
        val chooser = VideoSourceSelectionFingerprint.single("video source selection").method
        Locators.record("rumble.default_video_quality.chooser", chooser)
        chooser.apply {
            requireLocals(1)
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p1 .. p4 }, $RUMBLE_PLAYBACK->startHeight(Ljava/util/List;IZZ)I
                    move-result v0
                    if-ltz v0, :original
                    move/from16 p2, v0
                    const/4 v0, 0x0
                    move/from16 p3, v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }
        // The extension reads each source's height to keep a cap from rounding up.
        val source = classDefBy(chooser.returnType)
        Locators.record("rumble.default_video_quality.source_height", source.toStringGetter(", resolution="))
        bridge(
            RUMBLE_PLAYBACK,
            "sourceHeight",
            """
                check-cast p0, ${source.type}
                invoke-virtual { p0 }, ${source.toStringGetter(", resolution=")}
                move-result p0
                return p0
            """,
        )

        // Live streams keep Rumble's Auto unless Live streams too is on. The chooser doesn't know what it plays:
        // the player's video load tells the extension first whether its video is live, from the video's
        // livestream status (an enum). R8 left that field without a getter, so it is made public for the
        // extension to read.
        val player = QualitySwitchFingerprint.single("player quality switch").classDef
        val load = player.videoLoad(chooser)
        val video = load.parameterTypes[0].toString()
        val status = classDefBy(video).toStringField(", livestreamStatus=")
        mutableClassDefBy(video).fields.single { it.name == status.name && it.type == status.type }.apply {
            setAccessFlags(
                (accessFlags and (AccessFlags.PRIVATE.value or AccessFlags.PROTECTED.value).inv()) or
                    AccessFlags.PUBLIC.value,
            )
        }
        Locators.record("rumble.default_video_quality.video_load", load)
        Locators.record("rumble.default_video_quality.live_status", status.toString())
        bridge(
            RUMBLE_PLAYBACK,
            "liveStatus",
            """
                check-cast p0, $video
                iget-object p0, p0, $status
                return-object p0
            """,
        )
        load.addInstruction(
            0,
            invokeStatic("$RUMBLE_PLAYBACK->loadingVideo(Ljava/lang/Object;)V", load.parameterRegister(1)),
        )

        rumbleSettings.add(
            ChoiceSetting(
                KEY,
                "Default video quality",
                "Instead of Auto. A quality you pick in the player applies to that video.",
                Section.PLAYBACK,
                default = height.toString(),
                choices = listOf("Rumble's default" to "0") +
                    (QUALITIES + height).filter { it > 0 }.distinct().sortedDescending()
                        .map { "${it}p" to it.toString() },
            ),
            SwitchSetting(
                LIVE_KEY,
                "Live streams too",
                "Start live streams at the default quality instead of Auto.",
                Section.PLAYBACK,
                default = live == true,
                parent = KEY,
            ),
            ChoiceSetting(
                MOBILE_KEY,
                "On mobile data",
                "The highest quality a video starts at on metered networks. A quality you pick in the player " +
                    "still plays.",
                Section.PLAYBACK,
                default = mobileHeight.toString(),
                choices = listOf("Same as on Wi-Fi" to "0") +
                    (QUALITIES + mobileHeight).filter { it > 0 }.distinct().sortedDescending()
                        .map { "${it}p" to it.toString() },
                parent = KEY,
            ),
        )
    }
}
