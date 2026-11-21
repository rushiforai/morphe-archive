package app.keyboardspeed.patches.youtube.keyboard

import app.keyboardspeed.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption

@Suppress("unused")
val keyboardSponsorBlockSkipShortcutPatch = bytecodePatch(
    name = "Keyboard SponsorBlock skip shortcut",
    description = "Makes a key of a hardware keyboard (Enter by default) press the skip button of SponsorBlock " +
        "while it is shown or hidden with the player controls. Apply together with the SponsorBlock patch of the Morphe YouTube patches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(keyboardShortcutsHookPatch)

    val key by stringOption(
        key = "sponsorBlockSkipKey",
        default = "Enter",
        values = mapOf(
            "Enter" to "Enter",
            "S" to "S",
            "Tab" to "Tab",
        ),
        title = "Key",
        description = "The key that presses the SponsorBlock skip button: Enter, Esc, Backspace, Tab, " +
            "or a single letter or digit.",
        required = true,
    ) { isValidKey(it) }

    execute {
        returnConstant(EXTENSION_SPONSORBLOCK_SKIP_CLASS, "getKeyCode", keyCodeOf(key!!))
        returnConstant(EXTENSION_SHORTCUTS_CLASS, "isSponsorBlockSkipEnabled", 1)
    }
}
