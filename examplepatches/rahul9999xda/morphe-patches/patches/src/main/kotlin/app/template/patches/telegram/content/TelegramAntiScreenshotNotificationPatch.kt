package app.template.patches.telegram.content

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.telegram.signature.telegramSpoofDependency
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.SendScreenshotMessageSecretFingerprint
import app.template.patches.telegram.SendScreenshotMessageUserFingerprint
import app.template.patches.telegram.Telegram1331SendScreenshotNotificationNormalFingerprint
import app.template.patches.telegram.Telegram1331SendScreenshotNotificationWebFingerprint
import app.template.patches.telegram.TelegramR8SendScreenshotNotificationNormalFingerprint
import app.template.patches.telegram.TelegramR8SendScreenshotNotificationWebFingerprint
import app.template.patches.telegram.TelegramPlusSendScreenshotNotificationFingerprint
import app.template.patches.telegram.TelegramPlus13221R8SendScreenshotNotificationFingerprint

@Suppress("unused")
val telegramAntiScreenshotNotificationPatch = bytecodePatch(
    name = "Anti-screenshot notification",
    description = "Blocks screenshot notifications from being sent to the other user.",
    default = true,
) {
    compatibleWith(TELEGRAM_COMPATIBILITY, TELEGRAM_WEB_COMPATIBILITY, TELEGRAM_PLUS_COMPATIBILITY)
    dependsOn(telegramSpoofDependency())

    execute {
        // Telegram/Web use boolean dispatchers; Plus 13.2.2.1 uses the void
        // rg1.H4(User, int, Message) sender. The Plus hook returns void before
        // TL_messages_sendScreenshotNotification is constructed.
        val currentAndroid = Telegram1331SendScreenshotNotificationNormalFingerprint.methodOrNull
            ?: TelegramR8SendScreenshotNotificationNormalFingerprint.methodOrNull
        val currentWeb = Telegram1331SendScreenshotNotificationWebFingerprint.methodOrNull
            ?: TelegramR8SendScreenshotNotificationWebFingerprint.methodOrNull
        val plusCurrent = TelegramPlus13221R8SendScreenshotNotificationFingerprint.methodOrNull
            ?: TelegramPlusSendScreenshotNotificationFingerprint.methodOrNull

        require(listOf(currentAndroid, currentWeb, plusCurrent).count { it != null } <= 1) {
            "Ambiguous screenshot-notification dispatcher: more than one target profile matched"
        }

        when {
            currentAndroid != null -> currentAndroid.addInstructions(0, """
                const/4 v0, 0x0
                return v0
            """)
            currentWeb != null -> currentWeb.addInstructions(0, """
                const/4 v0, 0x0
                return v0
            """)
            plusCurrent != null -> plusCurrent.addInstructions(0, "return-void")
            else -> {
                // Older named builds retain the two historical notification helpers.
                val legacy = listOfNotNull(
                    SendScreenshotMessageUserFingerprint.methodOrNull,
                    SendScreenshotMessageSecretFingerprint.methodOrNull,
                )
                require(legacy.isNotEmpty()) {
                    "No audited screenshot-notification dispatcher matched this APK"
                }
                legacy.forEach { it.addInstructions(0, "return-void") }
            }
        }
    }
}
