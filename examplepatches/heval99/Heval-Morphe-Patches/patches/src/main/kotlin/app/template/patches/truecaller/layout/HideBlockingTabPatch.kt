package app.template.patches.truecaller.layout

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER

@Suppress("unused")
val hideBlockingTabPatch = bytecodePatch(
    name = "Hide Blocking tab",
    description = "Hides the Blocking tab from the bottom navigation bar.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // Family Protect members get FAMILY_PROTECTION_CONFIG in the same slot, also labelled
        // "Blocking". With "Hide Scam feed" the Scam Feed slot falls back to these tabs, so it
        // stays empty.
        hideBottomBarTabs("BLOCKING", "FAMILY_PROTECTION_CONFIG")
    }
}
