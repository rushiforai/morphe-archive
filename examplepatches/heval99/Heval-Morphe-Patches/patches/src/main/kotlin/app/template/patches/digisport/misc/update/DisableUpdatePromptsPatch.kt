package app.template.patches.digisport.misc.update

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_DIGISPORT

@Suppress("unused")
val disableUpdatePromptsPatch = bytecodePatch(
    name = "Disable update prompts",
    description = "Disables the in-app update prompt.",
) {
    compatibleWith(COMPATIBILITY_DIGISPORT)

    execute {
        // The app never asks Play for an update, so no in-app update flow starts.
        CheckUpdateFingerprint.method.returnEarly()
    }
}
