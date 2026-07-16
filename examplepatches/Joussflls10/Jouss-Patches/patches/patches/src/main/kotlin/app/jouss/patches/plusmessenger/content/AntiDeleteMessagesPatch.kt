package app.jouss.patches.plusmessenger.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.jouss.patches.plusmessenger.shared.Constants.COMPATIBILITY_PLUS_MESSENGER
import com.android.tools.smali.dexlib2.AccessFlags

object MarkMessagesAsDeletedFingerprint1 : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesStorage;",
    name = "markMessagesAsDeleted",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("J", "I", "Z", "Z"),
)

object MarkMessagesAsDeletedFingerprint2 : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesStorage;",
    name = "markMessagesAsDeleted",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("J", "Ljava/util/ArrayList;", "Z", "Z", "I", "I"),
)

object DeleteMessagesByPushFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "deleteMessagesByPush",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("J", "Ljava/util/ArrayList;", "J"),
)

@Suppress("unused")
val antiDeleteMessagesPatch = bytecodePatch(
    name = "Anti-delete messages",
    description = "Prevents deleted messages from being removed locally."
) {
    compatibleWith(COMPATIBILITY_PLUS_MESSENGER)

    execute {
        // Block remote deletions only
        // p4=true (async) = user-initiated → allow
        // p4=false (sync) = remote server update → block
        MarkMessagesAsDeletedFingerprint1.method.addInstructions(0, """
            if-nez p4, :allow
            const/4 v0, 0x0
            return-object v0
            :allow
            nop
        """)

        // 6-param version: p4=true (async) = user-initiated
        MarkMessagesAsDeletedFingerprint2.method.addInstructions(0, """
            if-nez p4, :allow
            const/4 v0, 0x0
            return-object v0
            :allow
            nop
        """)

        // Block push-triggered deletion (always remote)
        DeleteMessagesByPushFingerprint.method.addInstructions(0, "return-void")
    }
}
