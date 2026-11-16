package app.keyboardspeed.patches.youtube.keyboard

import app.keyboardspeed.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption

@Suppress("unused")
val keyboardFrameStepShortcutPatch = bytecodePatch(
    name = "Keyboard frame step shortcuts",
    description = "Makes the , and . keys of a hardware keyboard pause the video and step one frame back and forward, " +
        "like on the YouTube website. Holding a key repeats the step.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(keyboardShortcutsHookPatch)

    val frameRate by intOption(
        key = "frameRate",
        default = 0,
        values = mapOf(
            "Automatic" to 0,
            "24 fps" to 24,
            "25 fps" to 25,
            "30 fps" to 30,
            "50 fps" to 50,
            "60 fps" to 60,
        ),
        title = "Frame rate",
        description = "Frame rate of a step. Automatic uses the frame rate of the video quality, such as 60 for 1080p60, and 30 otherwise.",
        required = true,
    ) { it != null && it in 0..240 }

    execute {
        returnConstant(EXTENSION_FRAME_STEP_CLASS, "getFrameRate", frameRate!!)
        returnConstant(EXTENSION_SHORTCUTS_CLASS, "isFrameStepEnabled", 1)
    }
}
