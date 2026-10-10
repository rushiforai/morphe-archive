package app.tada.patches.youtube.interaction.loop

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.youtube.layout.buttons.overlay.addPlayerOverlayPreferences
import app.tada.patches.youtube.layout.buttons.overlay.playerOverlayButtonsSettingsPatch
import app.tada.patches.youtube.layout.player.buttons.playerOverlayButtonsHookPatch
import app.tada.patches.youtube.layout.player.icons.copyPlayerButtonIcons
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.playercontrols.addTopControl
import app.tada.patches.youtube.misc.playercontrols.initializeTopControl
import app.tada.patches.youtube.misc.playercontrols.legacyPlayerControlsPatch
import app.tada.patches.youtube.misc.playercontrols.legacyPlayerControlsResourcePatch
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.StartVideoInformerFingerprint

private val loopVideoButtonResourcePatch = resourcePatch {
    dependsOn(
        legacyPlayerControlsResourcePatch
    )

    execute {
        copyPlayerButtonIcons(
            "loopvideobutton",
            "tada_loop_video_button_on",
            "tada_loop_video_button_off",
            "tada_loop_video_button_range"
        )
    }

    finalize {
        addTopControl(
            "loopvideobutton",
            "@+id/tada_loop_video_button",
            "@+id/tada_loop_video_button"
        )
    }
}

private const val EXTENSION_BUTTON =
    "Lapp/morphe/extension/youtube/videoplayer/LoopVideoButton;"

internal val loopVideoButtonPatch = bytecodePatch(
    description = "Adds an option to display loop video button in the video player."
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        loopVideoButtonResourcePatch,
        playerOverlayButtonsSettingsPatch,
        legacyPlayerControlsPatch,
        playerOverlayButtonsHookPatch
    )

    execute {
        addPlayerOverlayPreferences(
            SwitchPreference("tada_loop_video_button")
        )

        initializeTopControl(EXTENSION_BUTTON)
        StartVideoInformerFingerprint.method.addInstruction(
            0,
            "invoke-static { }, $EXTENSION_BUTTON->resetLoopButton()V"
        )
    }
}
