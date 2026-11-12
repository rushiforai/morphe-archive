package app.keyboardspeed.patches.youtube.keyboard

import app.keyboardspeed.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption

@Suppress("unused")
val keyboardMinimizeShortcutPatch = bytecodePatch(
    name = "Keyboard minimize shortcut",
    description = "Makes a key of a hardware keyboard (Esc by default) minimize the open video to the miniplayer, " +
        "also from fullscreen or with the comments open.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(keyboardShortcutsHookPatch)

    val key by stringOption(
        key = "minimizeKey",
        default = "Esc",
        values = mapOf(
            "Esc" to "Esc",
            "Backspace" to "Backspace",
            "N" to "N",
        ),
        title = "Key",
        description = "The key that minimizes the video: Esc, Backspace, Tab, or a single letter or digit.",
        required = true,
    ) { isValidKey(it) }

    execute {
        returnConstant(EXTENSION_MINIMIZE_CLASS, "getKeyCode", keyCodeOf(key!!))
        returnConstant(EXTENSION_SHORTCUTS_CLASS, "isMinimizeEnabled", 1)
    }
}
