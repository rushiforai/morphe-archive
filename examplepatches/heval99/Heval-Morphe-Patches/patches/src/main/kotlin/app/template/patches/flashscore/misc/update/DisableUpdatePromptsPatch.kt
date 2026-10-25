package app.template.patches.flashscore.misc.update

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE

@Suppress("unused")
val disableUpdatePromptsPatch = bytecodePatch(
    name = "Disable update prompts",
    description = "Disables the update prompts.",
) {
    compatibleWith(COMPATIBILITY_FLASHSCORE)

    execute {
        // Both the splash screen and the event list show the dialog only through this method.
        UpdateDialogFingerprint.method.returnEarly()
    }
}
