package app.badfella.patches.ticktick.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.badfella.patches.ticktick.shared.Constants.COMPATIBILITY_TICKTICK

object CheckPrivacyPolicyConfirmedFingerprint : Fingerprint(
    definingClass = "Lcom/ticktick/task/helper/SettingsPreferencesHelper;",
    name = "checkPrivacyPolicyConfirmed",
    returnType = "Z",
    parameters = emptyList(),
)

private object ReminderPremiumConsistencyFingerprint : Fingerprint(
    definingClass = "Ljd/d;", // Reminder scheduler in the supported 8.2.4.0 build; excludes the diagnostic copy.
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = "Lcom/ticktick/task/data/User;", name = "<init>"),
        methodCall(definingClass = "Lcom/ticktick/task/data/User;", name = "isPro"),
        methodCall(definingClass = "Lcom/ticktick/task/data/User;", name = "getProType"),
        methodCall(definingClass = "Lcom/ticktick/task/network/sync/common/model/SignUserInfo;", name = "<init>"),
        methodCall(definingClass = "Lcom/ticktick/task/network/sync/common/model/SignUserInfo;", name = "isPro"),
        methodCall(definingClass = "Lcom/ticktick/task/data/User;", name = "isLocalMode"),
        methodCall(definingClass = "Lcom/ticktick/task/data/User;", name = "getProTypeForFake"),
    ),
)

@Suppress("unused")
val restoreRemindersPatch = bytecodePatch(
    name = "Restore reminder alarms",
    description = "Restores task/reminder alarm scheduling on re-signed apps.",
) {
    compatibleWith(COMPATIBILITY_TICKTICK)

    execute {
        // A blank User now reports pro, so the reminder-specific consistency check rejects every reminder.
        ReminderPremiumConsistencyFingerprint.method.returnEarly(false)
        CheckPrivacyPolicyConfirmedFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
