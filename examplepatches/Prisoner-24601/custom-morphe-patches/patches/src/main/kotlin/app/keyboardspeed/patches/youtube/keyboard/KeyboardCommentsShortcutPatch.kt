package app.keyboardspeed.patches.youtube.keyboard

import app.keyboardspeed.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption

@Suppress("unused")
val keyboardCommentsShortcutPatch = bytecodePatch(
    name = "Keyboard comments shortcut",
    description = "Makes a key of a hardware keyboard (M by default) show and hide the comments of the video. " +
        "Apply together with the Morphe YouTube patches 2.2 or newer, which this patch uses to show the comments.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(keyboardShortcutsHookPatch)

    val key by stringOption(
        key = "commentsKey",
        default = "M",
        values = mapOf(
            "M" to "M",
            "N" to "N",
            "B" to "B",
            "V" to "V",
        ),
        title = "Key",
        description = "The letter or digit key that shows and hides the comments.",
        required = true,
    ) { isValidKey(it) }

    execute {
        returnConstant(EXTENSION_COMMENTS_CLASS, "getKeyCode", keyCodeOf(key!!))
        returnConstant(EXTENSION_SHORTCUTS_CLASS, "isCommentsEnabled", 1)
    }
}
