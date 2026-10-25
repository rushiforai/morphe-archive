package app.template.patches.telegram.ghost

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.signature.telegramSpoofDependency

/**
 * Telegram/Web 13.1.1 and Plus Messenger 13.0.3.0 no longer expose
 * the old needSendTyping() hook used by
 * earlier versions. DEX verification shows that the actual controller-level
 * dispatchers are MessagesController.sendTyping(JJII)Z and
 * MessagesController.sendTyping(JJILjava/lang/String;I)Z.
 *
 * Returning false from both overloads blocks the typing TL dispatch directly
 * and avoids broad matchAll() hooks against unrelated methods.
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
    description = "Blocks Telegram's controller-level sendTyping dispatch on audited Telegram/Web 13.1.1 and Plus 13.0.3.0 builds.",
) {
    compatibleWith(
        TELEGRAM_COMPATIBILITY,
        TELEGRAM_WEB_COMPATIBILITY,
        TELEGRAM_PLUS_COMPATIBILITY,
    )
    dependsOn(telegramSpoofDependency())

    execute {
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
