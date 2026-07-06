package app.paresh.patches.plusmessenger.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.plusmessenger.shared.Constants.COMPATIBILITY_PLUS_MESSENGER

object SendScreenshotMessageUserFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/SendMessagesHelper;",
    name = "sendScreenshotMessage",
    returnType = "V",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$User;", "I", "Lorg/telegram/tgnet/TLRPC\$Message;"),
)

object SendScreenshotMessageSecretFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/SecretChatHelper;",
    name = "sendScreenshotMessage",
    returnType = "V",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$EncryptedChat;", "Ljava/util/ArrayList;", "Lorg/telegram/tgnet/TLRPC\$Message;"),
)

@Suppress("unused")
val antiScreenshotNotificationPatch = bytecodePatch(
    name = "Anti-screenshot notification",
    description = "Blocks screenshot notifications from being sent to the other user."
) {
    compatibleWith(COMPATIBILITY_PLUS_MESSENGER)

    execute {
        SendScreenshotMessageUserFingerprint.method.addInstructions(0, "return-void")
        SendScreenshotMessageSecretFingerprint.method.addInstructions(0, "return-void")
    }
}
