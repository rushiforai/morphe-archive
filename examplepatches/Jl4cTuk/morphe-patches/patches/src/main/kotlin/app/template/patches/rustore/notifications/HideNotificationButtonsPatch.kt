package app.template.patches.rustore.notifications

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.rustore.shared.Constants.COMPATIBILITY_RUSTORE

@Suppress("unused")
val hideNotificationButtonsPatch = bytecodePatch(
    name = "Hide notification buttons",
    description = "Removes notification buttons from the search bar and Mine screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)

    execute {
        NotificationCenterIconButtonWidgetFingerprint.method.addInstructions(0, "return-void")
    }
}
