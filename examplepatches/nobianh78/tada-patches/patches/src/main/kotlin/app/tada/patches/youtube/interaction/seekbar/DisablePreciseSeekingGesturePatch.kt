package app.tada.patches.youtube.interaction.seekbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/DisablePreciseSeekingGesturePatch;"

val disablePreciseSeekingGesturePatch = bytecodePatch(
    description = "Adds an option to disable precise seeking when swiping up on the seekbar.",
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
    )

    execute {
        PreferenceScreen.SEEKBAR.addPreferences(
            SwitchPreference("tada_disable_precise_seeking_gesture", summary = true),
        )

        AllowSwipingUpGestureFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_CLASS->isGestureDisabled()Z
                    move-result v0
                    if-eqz v0, :disabled
                    return-void
                """,
                ExternalLabel("disabled", getInstruction(0)),
            )
        }

        ShowSwipingUpGuideFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_CLASS->isGestureDisabled()Z
                    move-result v0
                    if-eqz v0, :disabled
                    const/4 v0, 0x0
                    return v0
                """,
                ExternalLabel("disabled", getInstruction(0)),
            )
        }
    }
}
