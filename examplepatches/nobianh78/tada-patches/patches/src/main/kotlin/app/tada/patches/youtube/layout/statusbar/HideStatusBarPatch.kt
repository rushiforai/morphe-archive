/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/3337
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.youtube.layout.statusbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.shared.YouTubeActivityOnCreateFingerprint
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/morphe/extension/youtube/patches/HideStatusBarPatch;"

@Suppress("unused")
val hideStatusBarPatch = bytecodePatch(
    name = "Hide status bar",
    description = "Adds an option to hide the system status bar. Swipe down from the top edge to show it for a moment.",
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        PreferenceScreen.GENERAL.addPreferences(
            SwitchPreference("tada_hide_status_bar", summary = true)
        )

        YouTubeActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->initialize(Landroid/app/Activity;)V",
        )

        // The status bar background view keeps the height of the hidden status bar
        // and is drawn over the top bars, making them invisible or clipped.
        StatusBarBackgroundShowFingerprint.let {
            it.method.apply {
                val index = it.instructionMatches.last().index
                val viewRegister = getInstruction<FiveRegisterInstruction>(index).registerC

                addInstruction(
                    index + 1,
                    "invoke-static { v$viewRegister }, $EXTENSION_CLASS->hideStatusBarBackground(Landroid/view/View;)V"
                )
            }
        }
    }
}
