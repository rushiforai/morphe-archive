package app.template.patches.telegram.content

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.telegram.signature.telegramSpoofDependency
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.DeleteMessagesByPushFingerprint
import app.template.patches.telegram.NotificationsControllerRemoveDeletedMessagesFingerprint

@Suppress("unused")
val telegramAntiDeletePatch = bytecodePatch(
    name = "Anti-delete messages",
    description = "Prevents messages deleted by other users from being removed locally.",
) {
    compatibleWith(TELEGRAM_COMPATIBILITY, TELEGRAM_WEB_COMPATIBILITY, TELEGRAM_PLUS_COMPATIBILITY)
    dependsOn(telegramSpoofDependency())

    execute {
        check(DeleteMessagesByPushFingerprint.method.implementation != null) {
            "Expected concrete deleteMessagesByPush implementation"
        }
        check(NotificationsControllerRemoveDeletedMessagesFingerprint.method.implementation != null) {
            "Expected concrete NotificationsController.removeDeletedMessages implementation"
        }

        val storageClass = mutableClassDefBy(
            classDefBy("Lorg/telegram/messenger/MessagesStorage;")
        )
        val markMessagesAsDeleted = storageClass.methods.filter {
            it.name == "markMessagesAsDeleted" &&
                it.returnType == "Ljava/util/ArrayList;"
        }

        check(markMessagesAsDeleted.size == 2) {
            "Expected exactly 2 MessagesStorage.markMessagesAsDeleted overloads, found ${markMessagesAsDeleted.size}"
        }

        val fourArg = markMessagesAsDeleted.single {
            it.parameterTypes == listOf("J", "I", "Z", "Z")
        }
        val sixArg = markMessagesAsDeleted.single {
            it.parameterTypes == listOf("J", "Ljava/util/ArrayList;", "Z", "Z", "I", "I")
        }

        // p4=Z is the async/local-only flag.
        // true = user-initiated local delete (allow); false = server-push delete (block).
        fourArg.addInstructions(0, """
            if-nez p4, :allow
            const/4 v0, 0x0
            return-object v0
            :allow
            nop
        """)

        sixArg.addInstructions(0, """
            if-nez p4, :allow
            const/4 v0, 0x0
            return-object v0
            :allow
            nop
        """)

        DeleteMessagesByPushFingerprint.method.addInstructions(0, "return-void")
        NotificationsControllerRemoveDeletedMessagesFingerprint.method.addInstructions(0, "return-void")
    }
}
