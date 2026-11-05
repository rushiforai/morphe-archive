package io.github.jordanwoodson.patches.rumble.refresh

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import io.github.jordanwoodson.patches.rumble.playback.QualitySwitchFingerprint
import io.github.jordanwoodson.patches.rumble.playback.VideoSourceSelectionFingerprint
import io.github.jordanwoodson.patches.rumble.playback.videoLoad
import io.github.jordanwoodson.patches.rumble.settings.AppInfoSectionFingerprint
import io.github.jordanwoodson.patches.rumble.settings.rumbleSettings
import io.github.jordanwoodson.patches.rumble.settings.settingsPatch
import io.github.jordanwoodson.patches.rumble.shared.Constants.COMPATIBILITY_RUMBLE
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.rumble.shared.RUMBLE_PLAYER
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.rumble.shared.clickableCall
import io.github.jordanwoodson.patches.rumble.shared.single
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.shared.settings.requireLocals

private const val KEY = "refresh_stream"
private const val RELOAD = "lurkReload"

@Suppress("unused")
val refreshStreamPatch = bytecodePatch(
    name = "Refresh stream",
    description = "When a video or live stream fails, tap the error screen to reload it at the same point. On " +
        "by default. Turn it off in Lurk settings > Playback.",
) {
    compatibleWith(COMPATIBILITY_RUMBLE)
    dependsOn(settingsPatch)

    execute {
        // Picking a quality in the player plays that source again from the current position: the reload
        // Rumble itself has. Since 3.22.0 it no longer saves the source as the picked quality, so a reload
        // through it changes nothing else.
        val switchMatch = QualitySwitchFingerprint.single("player quality switch")
        val player = switchMatch.classDef
        val switch = switchMatch.method
        val source = switch.parameterTypes[0].toString()
        val sourceField = player.fields.singleOrNull { it.type == source && !AccessFlags.STATIC.isSet(it.accessFlags) }
            ?: throw PatchException("Rumble: expected one current source field in the player")
        val currentSource = "${player.type}->${sourceField.name}:$source"
        player.methods.add(
            ImmutableMethod(
                player.type,
                RELOAD,
                listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null)),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(2),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        check-cast p0, ${player.type}
                        iget-object v0, p0, $currentSource
                        if-eqz v0, :done
                        invoke-virtual { p0, v0 }, $switch
                        :done
                        return-void
                    """,
                )
            },
        )
        bridge(RUMBLE_PLAYER, "reloadPlayer", "invoke-static { p0 }, ${player.type}->$RELOAD(Ljava/lang/Object;)V\nreturn-void")

        // The player's video load (the one asking the start-source chooser) tells the extension which player
        // plays which video, so the error panel of a video reloads its own player.
        val chooser = VideoSourceSelectionFingerprint.single("video source selection").method
        val videoLoad = player.videoLoad(chooser)
        videoLoad.addInstruction(0, "invoke-static/range { p0 .. p1 }, $RUMBLE_PLAYER->onVideoLoaded(Ljava/lang/Object;Ljava/lang/Object;)V")

        // The error panel becomes clickable while the switch is on.
        val errorView = MobileErrorViewFingerprint.single("player error panel").method
        Locators.record("rumble.refresh_stream.player", player.type)
        Locators.record("rumble.refresh_stream.quality_switch", switch)
        Locators.record("rumble.refresh_stream.video_load", videoLoad)
        Locators.record("rumble.refresh_stream.error_view", errorView)
        Locators.record("rumble.refresh_stream.chooser", chooser)
        Locators.record("rumble.refresh_stream.current_source", currentSource)
        val modifier = errorView.parameterTypes[0].toString()
        val clickable = AppInfoSectionFingerprint.single("App Info settings section").method.clickableCall(modifier)
        bridge(
            RUMBLE_PLAYER,
            "clickable",
            """
                move-object v0, p0
                check-cast v0, $modifier
                const/4 v1, 0x0
                const/4 v2, 0x0
                const/4 v3, 0x0
                const/4 v4, 0x0
                move-object v5, p1
                check-cast v5, Lkotlin/jvm/functions/Function0;
                const/16 v6, 0xf
                const/4 v7, 0x0
                invoke-static/range { v0 .. v7 }, $clickable
                move-result-object v0
                return-object v0
            """,
            locals = 6,
        )
        errorView.apply {
            requireLocals(1)
            addInstructions(
                0,
                """
                    invoke-static/range { p0 .. p1 }, $RUMBLE_PLAYER->refreshable(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v0
                    check-cast v0, $modifier
                    move-object/from16 p0, v0
                """,
            )
        }

        rumbleSettings.add(
            SwitchSetting(
                KEY,
                "Refresh stream",
                "Tap the player's error screen to reload the video or stream at the same point.",
                Section.PLAYBACK,
                default = true,
            ),
        )
    }
}
