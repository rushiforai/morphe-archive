package app.template.patches.aare

import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_AARE

@Suppress("unused")
val carMicrophonePatch = patch(
    name = "Car microphone",
    description = "Dictated replies and AARE's assistant listen through the car's microphone (the phone's if the car " +
        "has none). Android 13 or newer.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_AARE)

    extendWith("extensions/extension.mpe")

    dependsOn(settingsPatch, voiceReplyPatch)

    execute {
        registerSetting("car_microphone")
    }
}
