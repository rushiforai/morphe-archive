package app.keyboardspeed.patches.youtube.speed

import app.keyboardspeed.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.keyboardspeed.patches.youtube.keyboard.EXTENSION_SHORTCUTS_CLASS
import app.keyboardspeed.patches.youtube.keyboard.EXTENSION_SPEED_CLASS
import app.keyboardspeed.patches.youtube.keyboard.keyboardShortcutsHookPatch
import app.keyboardspeed.patches.youtube.keyboard.returnConstant
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption

@Suppress("unused")
val keyboardSpeedShortcutsPatch = bytecodePatch(
    name = "Keyboard speed shortcuts",
    description = "Makes the - and = keys of a hardware keyboard decrease and increase the playback speed. " +
        "Apply together with the Morphe YouTube patches, which this patch uses to change the speed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(keyboardShortcutsHookPatch)

    val speedStep by intOption(
        key = "speedStep",
        default = 25,
        values = mapOf(
            "0.05x" to 5,
            "0.10x" to 10,
            "0.25x" to 25,
            "0.50x" to 50,
        ),
        title = "Speed step",
        description = "How much each key press changes the playback speed, in hundredths of 1x (25 = 0.25x).",
        required = true,
    ) { it != null && it in 1..100 }

    execute {
        returnConstant(EXTENSION_SPEED_CLASS, "getSpeedStep", speedStep!!)
        returnConstant(EXTENSION_SHORTCUTS_CLASS, "isSpeedEnabled", 1)
    }
}
