package app.morphe.patches.delonghi.notifications

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.delonghi.shared.COMPATIBILITY_DELONGHI_COMFORT

@Suppress("unused")
val disableNotificationPromptPatch = bytecodePatch(
    name = "Disable notification permission prompt",
    description = "Prevents De'Longhi Comfort from asking to enable notifications.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DELONGHI_COMFORT)

    execute {
        AskNotificationPermissionFingerprint.method.addInstructions(0, "return-void")
    }
}
