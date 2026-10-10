/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.interaction.swipecontrols

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.tada.patches.shared.misc.settings.preference.InputType
import app.tada.patches.shared.misc.settings.preference.ListPreference
import app.tada.patches.shared.misc.settings.preference.NonInteractivePreference
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.shared.misc.settings.preference.TextPreference
import app.tada.patches.youtube.layout.player.icons.copyPlayerIcons
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.playertype.playerTypeHookPatch
import app.tada.patches.youtube.misc.playservice.is_20_34_or_greater
import app.tada.patches.youtube.misc.playservice.versionCheckPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.shared.YouTubeMainActivityConstructorFingerprint
import app.tada.patches.youtube.video.audio.soundBoostPatch
import app.tada.patches.youtube.video.information.videoInformationPatch
import app.morphe.util.insertLiteralOverride
import app.morphe.util.transformMethods
import app.morphe.util.traverseClassHierarchy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val EXTENSION_CLASS = "Lapp/morphe/extension/youtube/swipecontrols/SwipeControlsHostActivity;"

private val swipeControlsResourcePatch = resourcePatch {
    dependsOn(
        settingsPatch,
        versionCheckPatch,
        soundBoostPatch
    )

    execute {
        // If fullscreen swipe is enabled in newer versions the app can crash.
        // It likely is caused by conflicting experimental flags that are never enabled together.
        // Flag was completely removed in 20.34+
        if (!is_20_34_or_greater) {
            PreferenceScreen.SWIPE_CONTROLS.addPreferences(
                SwitchPreference("tada_swipe_change_video", summary = true)
            )
        }

        PreferenceScreen.SWIPE_CONTROLS.addPreferences(
            ListPreference(
                "tada_swipe_left_zone",
                entriesKey = "tada_swipe_zone_action_entries",
                entryValuesKey = "tada_swipe_zone_action_entry_values"
            ),
            ListPreference(
                "tada_swipe_right_zone",
                entriesKey = "tada_swipe_zone_action_entries",
                entryValuesKey = "tada_swipe_zone_action_entry_values"
            ),
            ListPreference(
                "tada_swipe_top_zone",
                entriesKey = "tada_swipe_zone_action_entries",
                entryValuesKey = "tada_swipe_zone_action_entry_values"
            ),
            NonInteractivePreference(
                key = "tada_swipe_zone_width",
                tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference"
            ),
            NonInteractivePreference(
                key = "tada_swipe_speed_zone_height",
                tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference"
            ),
            NonInteractivePreference(
                key = "tada_swipe_zone_preview",
                summaryKey = null,
                tag = "app.morphe.extension.youtube.settings.preference.SwipeZonePreference"
            ),
            NonInteractivePreference(
                key = "tada_swipe_brightness_sensitivity",
                tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference"
            ),
            NonInteractivePreference(
                key = "tada_swipe_volume_distance",
                tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference"
            ),
            ListPreference(
                "tada_swipe_volume_steps",
                tag = "app.morphe.extension.youtube.settings.preference.SwipeVolumeStepsPreference"
            ),
            SwitchPreference("tada_volume_boost", summary = true),
            NonInteractivePreference(
                key = "tada_swipe_speed_sensitivity",
                tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference"
            ),
            ListPreference("tada_swipe_speed_step"),
            SwitchPreference("tada_swipe_ignore_when_locked", summary = true),
            SwitchPreference("tada_swipe_press_to_engage", summary = true),
            SwitchPreference("tada_swipe_haptic_feedback"),
            SwitchPreference("tada_swipe_save_and_restore_brightness", summary = true),
            SwitchPreference("tada_swipe_lowest_value_enable_auto_brightness", summary = true),
            ListPreference("tada_swipe_overlay_style"),
            NonInteractivePreference(
                key = "tada_swipe_overlay_background_opacity",
                tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference"
            ),
            TextPreference("tada_swipe_overlay_progress_brightness_color",
                tag = "app.morphe.extension.shared.settings.preference.ColorPickerWithOpacitySliderPreference",
                inputType = InputType.TEXT_CAP_CHARACTERS
            ),
            TextPreference("tada_swipe_overlay_progress_volume_color",
                tag = "app.morphe.extension.shared.settings.preference.ColorPickerWithOpacitySliderPreference",
                inputType = InputType.TEXT_CAP_CHARACTERS
            ),
            TextPreference("tada_swipe_overlay_progress_speed_color",
                tag = "app.morphe.extension.shared.settings.preference.ColorPickerWithOpacitySliderPreference",
                inputType = InputType.TEXT_CAP_CHARACTERS
            ),
            NonInteractivePreference(
                key = "tada_swipe_text_overlay_size",
                tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference"
            ),
            TextPreference("tada_swipe_overlay_timeout", inputType = InputType.NUMBER),
            TextPreference("tada_swipe_threshold", inputType = InputType.NUMBER)
        )

        copyPlayerIcons(
            "swipecontrols",
            "tada_ic_sc_brightness_auto",
            "tada_ic_sc_brightness_full",
            "tada_ic_sc_brightness_high",
            "tada_ic_sc_brightness_low",
            "tada_ic_sc_brightness_medium",
            "tada_ic_sc_volume_high",
            "tada_ic_sc_volume_low",
            "tada_ic_sc_volume_mute",
            "tada_ic_sc_volume_normal",
            "tada_ic_sc_speed"
        )
    }
}

@Suppress("unused")
val swipeControlsPatch = bytecodePatch(
    name = "Swipe controls",
    description = "Adds options to enable and configure volume and brightness swipe controls."
) {
    dependsOn(
        sharedExtensionPatch,
        playerTypeHookPatch,
        swipeControlsResourcePatch,
        videoInformationPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val wrapperClass = SwipeControlsHostActivityFingerprint.classDef
        val targetClass = YouTubeMainActivityConstructorFingerprint.classDef

        // Inject the wrapper class from the extension into the class hierarchy of MainActivity.
        wrapperClass.setSuperClass(targetClass.superclass)
        targetClass.setSuperClass(wrapperClass.type)

        // Ensure all classes and methods in the hierarchy are non-final, so we can override them in the extension.
        traverseClassHierarchy(targetClass) {
            accessFlags = accessFlags and AccessFlags.FINAL.value.inv()
            transformMethods {
                ImmutableMethod(
                    definingClass,
                    name,
                    parameters,
                    returnType,
                    accessFlags and AccessFlags.FINAL.value.inv(),
                    annotations,
                    hiddenApiRestrictions,
                    implementation,
                ).toMutable()
            }
        }

        if (!is_20_34_or_greater) {
            SwipeChangeVideoFingerprint.let {
                it.method.insertLiteralOverride(
                    it.instructionMatches.last().index,
                    "$EXTENSION_CLASS->allowSwipeChangeVideo(Z)Z"
                )
            }
        }

        PlayerOverlayContainerFingerprint.let {
            val overlayNameField = it.classDef.fields.first { field ->
                field.type == "Ljava/lang/String;"
            }

            it.method.addInstructions(
                0,
                """
                    iget-object v0, p0, $overlayNameField
                    invoke-static { p0, v0 }, $EXTENSION_CLASS->setPlayerOverlay(Landroid/view/View;Ljava/lang/String;)V
                """
            )
        }
    }
}
