package app.paresh.patches.telegram.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.telegram.shared.Constants.COMPATIBILITY_TELEGRAM
import com.android.tools.smali.dexlib2.AccessFlags

// Block database deletion — 4-param overload (JIZZ)
// p4 = async: true=user-initiated, false=server-side
object MarkMessagesAsDeletedFingerprint1 : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesStorage;",
    name = "markMessagesAsDeleted",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("J", "I", "Z", "Z"),
)

// Block database deletion — 6-param overload (JArrayListZZII)
// p4 = async: true=user-initiated, false=server-side
object MarkMessagesAsDeletedFingerprint2 : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesStorage;",
    name = "markMessagesAsDeleted",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("J", "Ljava/util/ArrayList;", "Z", "Z", "I", "I"),
)

// Block server-push deletion entirely
object DeleteMessagesByPushFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "deleteMessagesByPush",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PROTECTED),
    parameters = listOf("J", "Ljava/util/ArrayList;", "J"),
)

@Suppress("unused")
val antiDeleteMessagesPatch = bytecodePatch(
    name = "Anti-delete messages",
    description = "Prevents deleted messages from being removed locally."
) {
    compatibleWith(COMPATIBILITY_TELEGRAM)

    execute {
        // 4-param overload: if p4 (async) is false → server delete → return null
        MarkMessagesAsDeletedFingerprint1.method.addInstructions(0, """
            if-nez p4, :allow
            const/4 v0, 0x0
            return-object v0
            :allow
            nop
        """)

        // 6-param overload: if p4 (async) is false → server delete → return null
        MarkMessagesAsDeletedFingerprint2.method.addInstructions(0, """
            if-nez p4, :allow
            const/4 v0, 0x0
            return-object v0
            :allow
            nop
        """)

        // Block server-push deletion path entirely
        DeleteMessagesByPushFingerprint.method.addInstructions(0, "return-void")
    }
}
