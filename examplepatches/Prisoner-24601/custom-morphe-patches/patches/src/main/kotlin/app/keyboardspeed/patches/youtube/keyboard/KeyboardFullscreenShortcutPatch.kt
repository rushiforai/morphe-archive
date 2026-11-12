package app.keyboardspeed.patches.youtube.keyboard

import app.keyboardspeed.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption

@Suppress("unused")
val keyboardFullscreenShortcutPatch = bytecodePatch(
    name = "Keyboard fullscreen shortcut",
    description = "Makes a key of a hardware keyboard (F by default) enter and exit fullscreen while a video is open.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(keyboardShortcutsHookPatch)

    val key by stringOption(
        key = "fullscreenKey",
        default = "F",
        values = mapOf(
            "F" to "F",
            "G" to "G",
            "T" to "T",
        ),
        title = "Key",
        description = "The letter or digit key that enters and exits fullscreen.",
        required = true,
    ) { isValidKey(it) }

    execute {
        returnConstant(EXTENSION_FULLSCREEN_CLASS, "getKeyCode", keyCodeOf(key!!))
        returnConstant(EXTENSION_SHORTCUTS_CLASS, "isFullscreenEnabled", 1)
    }
}
