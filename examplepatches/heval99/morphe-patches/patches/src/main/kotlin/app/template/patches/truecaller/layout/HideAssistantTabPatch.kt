package app.template.patches.truecaller.layout

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER

@Suppress("unused")
val hideAssistantTabPatch = bytecodePatch(
    name = "Hide Assistant tab",
    description = "Turns off Call Assistant and hides its tab.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        CallAssistantFeatureFingerprint.method.returnEarly(false)
    }
}
