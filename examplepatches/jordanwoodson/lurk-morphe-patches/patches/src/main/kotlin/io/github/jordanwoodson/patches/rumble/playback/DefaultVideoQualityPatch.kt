package io.github.jordanwoodson.patches.rumble.playback

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import io.github.jordanwoodson.patches.rumble.settings.rumbleSettings
import io.github.jordanwoodson.patches.rumble.settings.settingsPatch
import io.github.jordanwoodson.patches.rumble.shared.Constants.COMPATIBILITY_RUMBLE
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.rumble.shared.RUMBLE_PLAYBACK
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.rumble.shared.preferenceDefault
import io.github.jordanwoodson.patches.rumble.shared.single
import io.github.jordanwoodson.patches.rumble.shared.toStringGetter
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
    description = "Starts videos at a chosen quality, or the closest one available, instead of Rumble's 480p. " +
        "Once you pick a quality in the player, Rumble keeps using that one. Starting live streams at it too, " +
        "and a lower cap on mobile data, are separate settings. Starts off (Rumble's default). Choose a quality " +
        "in Lurk settings > Playback.",
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

        // Rumble's start-source chooser gets (sources, height and bitrate last picked in the player or nulls,
        // the server's preferred height, isLive, data saver, live uses Auto). With nulls it takes the video's
        // preferred height from the server, which for phones is 480p. The extension fills in the chosen
        // height, and on mobile data lowers it to the cap; the closest available height is then picked.
        // While capped, live streams don't start on Auto either. Only starting a video runs the chooser: a
        // quality picked in the player plays that source directly.
        val chooser = VideoSourceSelectionFingerprint.single("video source selection").method
        Locators.record("rumble.default_video_quality.chooser", chooser)
        chooser.apply {
            requireLocals(2)
            addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v0, p2
                    invoke-static/range { p1 .. p4 }, $RUMBLE_PLAYBACK->startHeight(Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;I)Ljava/lang/Integer;
                    move-result-object v1
                    if-eq v1, v0, :same
                    move-object/from16 p2, v1
                    const v0, 0x7fffffff
                    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                    move-result-object v0
                    move-object/from16 p3, v0
                    :same
                    invoke-static { }, $RUMBLE_PLAYBACK->capActive()Z
                    move-result v0
                    if-eqz v0, :original
                    const/4 v0, 0x0
                    move/from16 p7, v0
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

        // Live streams start on Auto while Rumble's "live uses Auto" preference is true, its default when
        // nothing is stored. Picking Auto in the player stores true, picking a quality on a live stream false.
        val preferences = UserPreferencesFingerprint.single("user preference manager").classDef
        preferenceDefault(preferences, "liveVideoUseAutoKey", "Ljava/lang/Boolean;->booleanValue()Z")
            .let { (reader, default) ->
                val register = reader.getInstruction<OneRegisterInstruction>(default).registerA
                reader.replaceInstruction(default, "invoke-static { }, $RUMBLE_PLAYBACK->liveUsesAutoByDefault()Z")
                reader.addInstruction(default + 1, "move-result v$register")
            }

        rumbleSettings.add(
            ChoiceSetting(
                KEY,
                "Default video quality",
                "Until you pick a quality in the player.",
                Section.PLAYBACK,
                default = height.toString(),
                choices = listOf("Rumble's default" to "0") +
                    (QUALITIES + height).filter { it > 0 }.distinct().sortedDescending()
                        .map { "${it}p" to it.toString() },
            ),
            SwitchSetting(
                LIVE_KEY,
                "Live streams too",
                "Start live streams at the default quality instead of Auto. Picking Auto in the player turns this " +
                    "off until you pick a quality on a live stream.",
                Section.PLAYBACK,
                default = live == true,
                parent = KEY,
                restart = true,
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
