package dev.brave.patches.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

internal object RetentionPublisherOnReceiveFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/notifications/retention/RetentionNotificationPublisher;",
    name = "onReceive",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;")
)

internal object RetentionScheduleDormantFingerprint : Fingerprint(
    definingClass = "Le9g;",
    name = "a",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("dormant_users_days_14")
    )
)

internal object RetentionScheduleAlarmFingerprint : Fingerprint(
    definingClass = "Le9g;",
    name = "b",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    filters = listOf(
        string("notification_type")
    )
)

internal object RetentionScheduleAtTimeFingerprint : Fingerprint(
    definingClass = "Le9g;",
    name = "c",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "J"),
    filters = listOf(
        string("notification_type")
    )
)

internal object TipsNotificationsOptInPromoFingerprint : Fingerprint(
    definingClass = "Lglk;",
    name = "onResult",
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        string("Chrome.TipsNotifications.OptInShowCount")
    )
)

@Suppress("unused")
val stopPromoNotificationsPatch = patch(
    name = "Stop Promo Notifications",
    description = "Disables Brave retention notification alarms/receivers and Chromium tips notification opt-in promos."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    execute {
        RetentionPublisherOnReceiveFingerprint.method.apply {
            addInstructions(0, "return-void")
        }
        RetentionScheduleDormantFingerprint.method.apply {
            addInstructions(0, "return-void")
        }
        RetentionScheduleAlarmFingerprint.method.apply {
            addInstructions(0, "return-void")
        }
        RetentionScheduleAtTimeFingerprint.method.apply {
            addInstructions(0, "return-void")
        }
        TipsNotificationsOptInPromoFingerprint.method.apply {
            addInstructions(0, "return-void")
        }
    }
}
