package app.template.patches.telegram.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.DeleteMessagesByPushFingerprint
import app.template.patches.telegram.MarkMessagesAsDeletedFingerprint2
import app.template.patches.telegram.NotificationsControllerRemoveDeletedMessagesFingerprint
import app.template.patches.telegram.NotificationsControllerRemoveDeletedMessagesPlusFingerprint
import app.template.patches.telegram.NotificationsControllerRemoveDeletedMessagesPlusLegacyFingerprint
import app.template.patches.telegram.MessagesControllerDeletePushMessagesPlusFingerprint
import app.template.patches.telegram.signature.telegramSpoofDependency

private val deletedMessageUiFilters = listOf(
    fieldAccess(
        definingClass = "Lorg/telegram/messenger/MessageObject;",
        name = "deleted",
        type = "Z",
        opcode = Opcode.IPUT_BOOLEAN,
    ),
    methodCall(
        definingClass = "Lorg/telegram/messenger/NotificationsController;",
        name = "removeDeletedMessagesFromNotifications",
        returnType = "V",
    ),
)

// Current UI workers: Telegram/Web 13.1.1 share the lambda signature; Plus 13.1.1.0
// uses the static synthetic m0 worker with the androidx.collection/k parameters.
private val deletedMessageUiFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    returnType = "V",
    filters = deletedMessageUiFilters,
    custom = { method, _ ->
        val parameters = method.parameterTypes.map { it.toString() }
        (method.name == "lambda\$processUpdateArray\$419" && parameters == listOf(
            "Lorg/telegram/messenger/support/LongSparseIntArray;",
            "Lorg/telegram/messenger/support/LongSparseIntArray;",
            "Landroid/util/SparseIntArray;",
            "Lz/f;", "Lz/f;", "Lz/f;", "Lz/f;", "Lz/f;",
            "Lorg/telegram/messenger/support/LongSparseIntArray;",
        )) || (method.name == "m0" && parameters == listOf(
            "Lorg/telegram/messenger/MessagesController;",
            "Lorg/telegram/messenger/support/LongSparseIntArray;",
            "Lorg/telegram/messenger/support/LongSparseIntArray;",
            "Landroid/util/SparseIntArray;",
            "Landroidx/collection/k;", "Landroidx/collection/k;", "Landroidx/collection/k;",
            "Landroidx/collection/k;", "Landroidx/collection/k;",
            "Lorg/telegram/messenger/support/LongSparseIntArray;",
            "Ljava/util/ArrayList;",
        ))
    },
)

// Unconstrained historical matcher retained separately for older DEX layouts; it is not used
// by the current patch path because current target signatures above are explicitly audited.
private val deletedMessageUiLegacyFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    returnType = "V",
    filters = deletedMessageUiFilters,
)

/*
 * The first parameter is build-specific:
 *   Telegram / Telegram Web 13.1.1 -> Lz/f;
 *   Telegram Plus 13.1.1.0 build 22621 -> Landroidx/collection/k;
 *   older Plus builds may use Landroidx/collection/h;.
 *
 * Resolve the exact known variant at patch time rather than using a stale
 * LongSparseArray descriptor or silently skipping the notification hook.
 */
// Backward-compatible descriptor retained for earlier Plus releases.
@Suppress("unused")
val telegramAntiDeletePatch = bytecodePatch(
    name = "Anti-delete messages",
    description = "Prevents messages deleted by other users from being removed locally.",
) {
    compatibleWith(
        TELEGRAM_COMPATIBILITY,
        TELEGRAM_PLUS_COMPATIBILITY,
        TELEGRAM_WEB_COMPATIBILITY,
    )
    dependsOn(telegramSpoofDependency())

    execute {
        // Current Plus 13.1.1.0 has no locally declared deleteMessagesByPush(J, ArrayList, J)V.
        // Use the verified static synthetic m3 worker for the current Plus descriptor.
        val deleteMessagesByPushMethod =
            DeleteMessagesByPushFingerprint.methodOrNull
                ?: MessagesControllerDeletePushMessagesPlusFingerprint.methodOrNull
                ?: error("Failed to match deleteMessagesByPush for Telegram/Web/Plus")

        deleteMessagesByPushMethod.addInstructions(0, "return-void")

        MarkMessagesAsDeletedFingerprint2.method.addInstructions(
            0,
            """
                if-nez p4, :morphe_anti_delete_continue_original
                new-instance v0, Ljava/util/ArrayList;
                invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                return-object v0
                :morphe_anti_delete_continue_original
                nop
            """,
        )

        val deletedMessageUiMatches = deletedMessageUiFingerprint.matchAllOrNull().orEmpty()
        require(deletedMessageUiMatches.size == 1) {
            "Expected exactly one deleted-message UI hook, found ${deletedMessageUiMatches.size}"
        }
        deletedMessageUiMatches.forEach { match ->
            match.instructionMatches
                .map { it.index }
                .reversed()
                .forEach { index ->
                    match.method.replaceInstruction(
                        index,
                        "nop\nnop",
                    )
                }
        }

        val removeDeletedMessagesMethod =
            NotificationsControllerRemoveDeletedMessagesFingerprint.methodOrNull
                ?: NotificationsControllerRemoveDeletedMessagesPlusFingerprint.methodOrNull
                ?: NotificationsControllerRemoveDeletedMessagesPlusLegacyFingerprint.methodOrNull

        requireNotNull(removeDeletedMessagesMethod) {
            "Failed to match removeDeletedMessagesFromNotifications for Telegram/Web/Plus"
        }.addInstructions(
            0,
            "return-void",
        )
    }
}
