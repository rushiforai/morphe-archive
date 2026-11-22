package app.keyboardspeed.patches.youtube.keyboard

import app.keyboardspeed.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption

@Suppress("unused")
val keyboardTopCommentsShortcutPatch = bytecodePatch(
    name = "Keyboard top comments shortcut",
    description = "Makes a key of a hardware keyboard (K by default) show the Top comments of the video, " +
        "such as to leave the Timed comments, whose sort buttons are hard to get back to. " +
        "Apply together with the Morphe YouTube patches 2.2 or newer.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(keyboardShortcutsHookPatch)

    val key by stringOption(
        key = "topCommentsKey",
        default = "K",
        values = mapOf(
            "K" to "K",
            "T" to "T",
            "J" to "J",
        ),
        title = "Key",
        description = "The letter or digit key that shows the Top comments.",
        required = true,
    ) { isValidKey(it) }

    execute {
        returnConstant(EXTENSION_TOP_COMMENTS_CLASS, "getKeyCode", keyCodeOf(key!!))
        returnConstant(EXTENSION_SHORTCUTS_CLASS, "isTopCommentsEnabled", 1)
    }
}
