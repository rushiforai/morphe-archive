/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/2616
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.youtube.layout.player.fullscreen

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.tada.patches.shared.misc.settings.preference.ListPreference
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.shared.misc.settings.preference.noTitleUnsortedPreferenceCategory
import app.tada.patches.youtube.layout.buttons.overlay.addPlayerOverlayPreferences
import app.tada.patches.youtube.layout.buttons.overlay.playerOverlayButtonsSettingsPatch
import app.tada.patches.youtube.layout.player.buttons.addPlayerBottomButton
import app.tada.patches.youtube.layout.player.buttons.playerOverlayButtonsHookPatch
import app.tada.patches.youtube.layout.player.icons.copyPlayerButtonIcons
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.playercontrols.addLegacyBottomControl
import app.tada.patches.youtube.misc.playercontrols.initializeLegacyBottomControl
import app.tada.patches.youtube.misc.playercontrols.legacyPlayerControlsPatch
import app.tada.patches.youtube.misc.playertype.playerTypeHookPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.shared.getPlayerTypeFingerprint
import app.tada.patches.youtube.video.format.hookAdaptiveFormat
import app.tada.patches.youtube.video.format.videoFormatPatch
import app.morphe.util.addInstructionsAtControlFlowLabel

private const val EXTENSION_CLASS_VIDEO_SCALE =
    "Lapp/morphe/extension/youtube/patches/FullscreenVideoScalePatch;"
private const val EXTENSION_BUTTON =
    "Lapp/morphe/extension/youtube/videoplayer/FullscreenVideoScaleButton;"

private val fullscreenVideoScaleResourcePatch = resourcePatch {
    dependsOn(
        settingsPatch,
        legacyPlayerControlsPatch
    )

    execute {
        copyPlayerButtonIcons(
            "fullscreenvideoscalebutton",
            "tada_fullscreen_video_scale_fit",
            "tada_fullscreen_video_scale_stretch",
            "tada_fullscreen_video_scale_zoom"
        )

        addLegacyBottomControl("fullscreenvideoscalebutton")
    }
}

@Suppress("unused")
val fullscreenVideoScalePatch = bytecodePatch(
    name = "Fullscreen video scale",
    description = "Adds options to stretch or zoom videos to fill the screen in fullscreen mode.",
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        playerTypeHookPatch,
        playerOverlayButtonsSettingsPatch,
        playerOverlayButtonsHookPatch,
        legacyPlayerControlsPatch,
        videoFormatPatch,
        fullscreenVideoScaleResourcePatch
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        PreferenceScreen.VIDEO.addPreferences(
            ListPreference("tada_fullscreen_video_scale")
        )

        addPlayerOverlayPreferences(
            noTitleUnsortedPreferenceCategory(
                SwitchPreference("tada_fullscreen_video_scale_button", summary = true),
                SwitchPreference("tada_fullscreen_video_scale_button_fullscreen_only", summary = true)
            )
        )

        addPlayerBottomButton(EXTENSION_BUTTON)
        initializeLegacyBottomControl(EXTENSION_BUTTON)
        hookAdaptiveFormat("$EXTENSION_CLASS_VIDEO_SCALE->setVideoAspectRatio")

        getPlayerTypeFingerprint().method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS_VIDEO_SCALE->" +
                    "attachPlayerOverlay(Landroid/view/View;)V"
        )

        YouTubePlayerOverlaysLayoutConstructorFingerprint.matchAll().forEach {
            it.method.addInstruction(
                it.instructionMatches.first().index,
                "invoke-static { p0 }, $EXTENSION_CLASS_VIDEO_SCALE->" +
                        "attachPlayerOverlay(Landroid/view/View;)V"
            )
        }

        YouTubePlayerViewOnLayoutFingerprint.let {
            it.method.addInstructionsAtControlFlowLabel(
                it.instructionMatches.first().index,
                "invoke-static { p0 }, $EXTENSION_CLASS_VIDEO_SCALE->" +
                        "onPlayerViewLayout(Landroid/view/View;)V"
            )
        }
    }
}
