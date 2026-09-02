package app.paresh.patches.ticktick.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.ticktick.shared.Constants.COMPATIBILITY_TICKTICK

object CheckPrivacyPolicyConfirmedFingerprint : Fingerprint(
    definingClass = "Lcom/ticktick/task/helper/SettingsPreferencesHelper;",
    name = "checkPrivacyPolicyConfirmed",
    returnType = "Z",
    parameters = emptyList(),
)

@Suppress("unused")
val restoreRemindersPatch = bytecodePatch(
    name = "Restore reminder alarms",
    description = "Restores task/reminder alarm scheduling on re-signed apps.",
) {
    compatibleWith(COMPATIBILITY_TICKTICK)

    execute {
        CheckPrivacyPolicyConfirmedFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
