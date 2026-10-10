/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/2624
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.youtube.layout.player.buttons

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.youtube.layout.buttons.overlay.addPlayerOverlayPreferences
import app.tada.patches.youtube.layout.buttons.overlay.playerOverlayButtonsSettingsPatch
import app.tada.patches.youtube.layout.player.icons.copyPlayerButtonIcons
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.playercontrols.addLegacyBottomControl
import app.tada.patches.youtube.misc.playercontrols.initializeLegacyBottomControl
import app.tada.patches.youtube.misc.playercontrols.legacyPlayerControlsPatch
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.shared.StartVideoInformerFingerprint
import app.tada.patches.youtube.video.volume.playerVolumeHookPatch

private const val EXTENSION_BUTTON =
    "Lapp/morphe/extension/youtube/videoplayer/MuteVideoButton;"

private val muteVideoButtonResourcePatch = resourcePatch {
    dependsOn(
        settingsPatch,
        legacyPlayerControlsPatch
    )

    execute {
        copyPlayerButtonIcons("mutevideobutton", "tada_mute_video_button_off", "tada_mute_video_button_on")

        addLegacyBottomControl("mutevideobutton")
    }
}

@Suppress("unused")
val muteVideoButtonPatch = bytecodePatch(
    name = "Mute button",
    description = "Adds an option to show a player button that mutes the video audio.",
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        playerOverlayButtonsSettingsPatch,
        playerOverlayButtonsHookPatch,
        legacyPlayerControlsPatch,
        playerVolumeHookPatch,
        muteVideoButtonResourcePatch
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        addPlayerOverlayPreferences(
            SwitchPreference("tada_mute_video_button")
        )

        addPlayerBottomButton(EXTENSION_BUTTON)
        initializeLegacyBottomControl(EXTENSION_BUTTON)

        // Mute is per video, not a saved setting.
        StartVideoInformerFingerprint.method.addInstruction(
            0,
            "invoke-static { }, $EXTENSION_BUTTON->resetMuteButton()V"
        )
    }
}
