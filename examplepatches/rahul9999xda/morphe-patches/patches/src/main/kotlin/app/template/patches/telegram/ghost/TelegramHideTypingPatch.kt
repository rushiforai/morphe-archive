package app.template.patches.telegram.ghost

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.signature.telegramSpoofDependency
import app.template.patches.telegram.Telegram1331SendTypingNormalFingerprint
import app.template.patches.telegram.Telegram1331SendTypingWebFingerprint
import app.template.patches.telegram.TelegramR8SendTypingNormalFingerprint
import app.template.patches.telegram.TelegramR8SendTypingWebFingerprint
import app.template.patches.telegram.TelegramPlusR8SendTypingFingerprint
import app.template.patches.telegram.TelegramPlus13221R8SendTypingFingerprint

/**
 * Telegram/Web 13.2.2 and Plus Messenger 13.2.2.1 use separately mapped
 * controller-level sendTyping dispatchers. Plus 13.2.2.1 resolves to
 * mo0.Pi(JJILjava/lang/String;I)Z; older Plus and named builds retain
 * their own independent fingerprints and fallback overloads.
 */
private val sendTypingLegacyFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "sendTyping",
    returnType = "Z",
    parameters = listOf("J", "J", "I", "I"),
)

private val sendTypingActionFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "sendTyping",
    returnType = "Z",
    parameters = listOf("J", "J", "I", "Ljava/lang/String;", "I"),
)

@Suppress("unused")
val telegramHideTypingPatch = bytecodePatch(
    name = "Hide typing indicator",
    description = "Blocks Telegram's controller-level sendTyping dispatch on audited Telegram/Web 13.2.2 and Plus 13.2.2.1 builds.",
) {
    compatibleWith(
        TELEGRAM_COMPATIBILITY,
        TELEGRAM_WEB_COMPATIBILITY,
        TELEGRAM_PLUS_COMPATIBILITY,
    )
    dependsOn(telegramSpoofDependency())

    execute {
        val currentR8Method =
            Telegram1331SendTypingNormalFingerprint.methodOrNull
                ?: Telegram1331SendTypingWebFingerprint.methodOrNull
                ?: TelegramR8SendTypingNormalFingerprint.methodOrNull
                ?: TelegramR8SendTypingWebFingerprint.methodOrNull
                ?: TelegramPlus13221R8SendTypingFingerprint.methodOrNull
                ?: TelegramPlusR8SendTypingFingerprint.methodOrNull
        if (currentR8Method != null) {
            // 13.2.2 Android/Web and Plus 13.2.2.1 use their independently mapped sendTyping dispatchers.
            currentR8Method.addInstructions(0, """
                const/4 v0, 0x0
                return v0
            """)
        } else {
            requireNotNull(sendTypingLegacyFingerprint.methodOrNull) {
                "Missing MessagesController.sendTyping(JJII)Z"
            }.addInstructions(0, """
                const/4 v0, 0x0
                return v0
            """)
            requireNotNull(sendTypingActionFingerprint.methodOrNull) {
                "Missing MessagesController.sendTyping(JJILjava/lang/String;I)Z"
            }.addInstructions(0, """
                const/4 v0, 0x0
                return v0
            """)
        }
    }
}
