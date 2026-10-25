package app.template.patches.truecaller.layout

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER

@Suppress("unused")
val hideWearOsSettingsPatch = bytecodePatch(
    name = "Hide Wear OS settings",
    description = "Hides the Wear OS entry in settings.",
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // Only the Settings row (#53). The "featurePromptWearApp" toggle behind it also gates the
        // menu's ANDROID_WATCH entry and a background work action, which are left alone.
        hideSettingsCategory("isWatchItemVisible")
    }
}
