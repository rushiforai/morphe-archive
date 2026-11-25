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
import app.template.patches.telegram.Telegram1331WebMarkMessagesAsDeletedFingerprint
import app.template.patches.telegram.Telegram1331ProcessUpdateArrayNormalFingerprint
import app.template.patches.telegram.Telegram1331ProcessUpdateArrayWebFingerprint
import app.template.patches.telegram.TelegramR8ProcessUpdateArrayNormalFingerprint
import app.template.patches.telegram.TelegramR8ProcessUpdateArrayWebFingerprint
import app.template.patches.telegram.TelegramPlusR8ProcessUpdateArrayFingerprint
import app.template.patches.telegram.TelegramPlus13221R8ProcessUpdateArrayFingerprint
import app.template.patches.telegram.TelegramR8PushRemoteMessageDeleteFingerprint
import app.template.patches.telegram.TelegramWebR8MarkMessagesAsDeletedFingerprint
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

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
    description = "Ignores incoming remote deletion updates while leaving the local delete action path intact.",
) {
    compatibleWith(
        TELEGRAM_COMPATIBILITY,
        TELEGRAM_PLUS_COMPATIBILITY,
        TELEGRAM_WEB_COMPATIBILITY,
    )
    dependsOn(telegramSpoofDependency())

    execute {
        val currentR8UpdateMethods = listOf(
            Telegram1331ProcessUpdateArrayNormalFingerprint,
            Telegram1331ProcessUpdateArrayWebFingerprint,
            TelegramR8ProcessUpdateArrayNormalFingerprint,
            TelegramR8ProcessUpdateArrayWebFingerprint,
            TelegramPlus13221R8ProcessUpdateArrayFingerprint,
            TelegramPlusR8ProcessUpdateArrayFingerprint,
        ).mapNotNull { it.methodOrNull }
        require(currentR8UpdateMethods.size <= 1) {
            "Multiple current R8 update-array dispatchers matched; refusing an ambiguous Anti-delete patch"
        }
        val currentR8UpdateMethod = currentR8UpdateMethods.singleOrNull()

        if (currentR8UpdateMethod != null) {
            // In Telegram/Web 13.2.2 (Android build 73031 / Web build 73039), and Plus 13.2.2.1 build 22718 (with a separate 13.2.1.0 fallback),
            // the old deleteMessagesByPush entry point is folded into the independently fingerprinted update-array
            // dispatcher (N3 for Telegram/Web; Bh for Plus). Do not suppress the whole update
            // (which would stall pts); suppress only the two message-id list appends
            // for TL_updateDeleteMessages and TL_updateDeleteChannelMessages.
            // Scheduled, ephemeral and group-call delete updates remain untouched.
            // Locally initiated deletion uses separate callbacks: Android/Web
            // MessagesController wp/sp.b0 -> MessagesStorage is/ds.P0. Plus 13.2.2.1
            // keeps local delete callbacks separate from mo0.Bh; the legacy 13.2.1.0
            // storage path remains unchanged. This hook only removes remote update IDs
            // from N3/Bh and does not patch those callbacks.
            // A deletion initiated on another device for an
            // outgoing message is not distinguishable from a peer deletion in the
            // TL_updateDelete* payload (IDs only), so author-aware filtering for that
            // cross-device case is deliberately not claimed.
            // Restore the independently proven Web 13.2.2 private-chat storage guard
            // from telegram-web-antidelete-repair.zip. Keep this separate from push
            // notification handling: do not replace or bypass the update-array logic.
            if (currentR8UpdateMethod.definingClass == "Lorg/telegram/messenger/sp;" ||
                currentR8UpdateMethod.definingClass == "Lorg/telegram/messenger/pp;") {
                val storageDeleteMethod = requireNotNull(
                    Telegram1331WebMarkMessagesAsDeletedFingerprint.methodOrNull
                        ?: TelegramWebR8MarkMessagesAsDeletedFingerprint.methodOrNull
                ) {
                    "Failed to match Telegram Web MessagesStorage P0"
                }
                storageDeleteMethod.addInstructions(
                    0,
                    """
                        if-nez p4, :morphe_web_anti_delete_storage_continue
                        new-instance v0, Ljava/util/ArrayList;
                        invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                        return-object v0
                        :morphe_web_anti_delete_storage_continue
                        nop
                    """,
                )
            }

            val instructions = requireNotNull(currentR8UpdateMethod.implementation) {
                "R8 MessagesController update-array method has no implementation"
            }.instructions.toList()
            val deleteAppendIndexes = instructions.indices.filter { index ->
                if (index == 0) return@filter false
                val invoke = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
                if (invoke?.definingClass != "Ljava/util/ArrayList;" ||
                    invoke.name != "addAll" ||
                    invoke.parameterTypes != listOf("Ljava/util/Collection;") ||
                    invoke.returnType != "Z"
                ) return@filter false
                val field = (instructions[index - 1] as? ReferenceInstruction)?.reference as? FieldReference
                field?.name == "messages" && field.type == "Ljava/util/ArrayList;" &&
                    (field.definingClass == "Lorg/telegram/tgnet/tl/TL_update\$TL_updateDeleteMessages;" ||
                        field.definingClass == "Lorg/telegram/tgnet/tl/TL_update\$TL_updateDeleteChannelMessages;")
            }
            val expectedDeleteFields = setOf(
                "Lorg/telegram/tgnet/tl/TL_update\$TL_updateDeleteMessages;",
                "Lorg/telegram/tgnet/tl/TL_update\$TL_updateDeleteChannelMessages;",
            )
            val matchedDeleteFields = deleteAppendIndexes.mapNotNull { index ->
                ((instructions[index - 1] as? ReferenceInstruction)?.reference as? FieldReference)
                    ?.definingClass
            }
            require(deleteAppendIndexes.size == 2 && matchedDeleteFields.toSet() == expectedDeleteFields &&
                matchedDeleteFields.size == expectedDeleteFields.size) {
                "Expected one normal and one channel remote-delete ID append in R8 update processing; " +
                    "found ${deleteAppendIndexes.size} appends for ${matchedDeleteFields.joinToString()}"
            }
            // Removing only addAll leaves an empty chat-key entry in the delete map.
            // Telegram subsequently dispatches that entry to NotificationCenter and the
            // notification controller; some consumers interpret an empty ID list as a
            // chat-wide deletion refresh. Remove the key itself instead, so no remote
            // deletion event is emitted downstream at all. The nearest preceding map
            // lookup is the exact map/key pair used to obtain the ArrayList receiver.
            // Telegram/Web use La0/h (f/l, m/n); Plus uses Lu/k (f/l, n/q).
            val expectedMapClass = when (currentR8UpdateMethod.definingClass) {
                "Lorg/telegram/messenger/wp;", "Lorg/telegram/messenger/sp;",
                "Lorg/telegram/messenger/tp;", "Lorg/telegram/messenger/pp;" -> "La0/h;"
                "Lorg/telegram/messenger/ko0;", "Lorg/telegram/messenger/mo0;" -> "Lu/k;"
                else -> error("Unrecognized current R8 delete dispatcher ${currentR8UpdateMethod.definingClass}")
            }
            fun invokeRegisters(instruction: Instruction): List<Int>? = when (instruction) {
                is FiveRegisterInstruction -> when (instruction.registerCount) {
                    1 -> listOf(instruction.registerC)
                    2 -> listOf(instruction.registerC, instruction.registerD)
                    3 -> listOf(instruction.registerC, instruction.registerD, instruction.registerE)
                    4 -> listOf(instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF)
                    5 -> listOf(instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF, instruction.registerG)
                    else -> null
                }
                is RegisterRangeInstruction -> (0 until instruction.registerCount).map { instruction.startRegister + it }
                else -> null
            }
            deleteAppendIndexes.sortedDescending().forEach { index ->
                val mapLookupIndex = (index - 1 downTo 0).firstOrNull { candidate ->
                    val reference = (instructions[candidate] as? ReferenceInstruction)?.reference as? MethodReference
                    reference?.definingClass == expectedMapClass && reference.name == "f" &&
                        reference.parameterTypes == listOf("J") && reference.returnType == "Ljava/lang/Object;"
                } ?: error("Could not resolve the delete-map key preceding addAll at instruction $index")
                val mapReference = (instructions[mapLookupIndex] as ReferenceInstruction).reference as MethodReference
                val registers = invokeRegisters(instructions[mapLookupIndex])
                    ?: error("Could not read delete-map lookup registers at instruction $mapLookupIndex")
                require(registers.size == 3) {
                    "Expected map + wide-key registers for delete-map lookup; got $registers"
                }
                require(instructions.getOrNull(index + 1)?.opcode !in setOf(
                    Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_OBJECT, Opcode.MOVE_RESULT_WIDE,
                )) {
                    "Remote-delete addAll result is consumed; refusing an unsafe replacement"
                }
                currentR8UpdateMethod.replaceInstruction(
                    index,
                    "invoke-virtual {${registers.joinToString(", ") { "v$it" }}}, ${mapReference.definingClass}->l(J)V",
                )
            }

            // Remote MESSAGE_DELETED push payloads take a second route that bypasses
            // N3/Bh: PushListenerController parses the push's `messages` field and
            // directly asks NotificationsController to remove those IDs. Suppress
            // only the notification-removal call whose boolean argument is false
            // inside this handler. The true-flag READ_REACTION branch is deliberately
            // left intact, as are the storage/update callbacks and pts processing.
            val pushDeleteMethod = requireNotNull(TelegramR8PushRemoteMessageDeleteFingerprint.methodOrNull) {
                "Failed to match PushListenerController.lambda\$processRemoteMessage\$6(String, String, long)"
            }
            val notificationCall = when (currentR8UpdateMethod.definingClass) {
                "Lorg/telegram/messenger/wp;" -> Triple(
                    "Lorg/telegram/messenger/nt;", "M", listOf("La0/h;", "Z"),
                )
                "Lorg/telegram/messenger/sp;" -> Triple(
                    "Lorg/telegram/messenger/kt;", "M", listOf("La0/h;", "Z"),
                )
                "Lorg/telegram/messenger/tp;" -> Triple(
                    "Lorg/telegram/messenger/jt;", "M", listOf("La0/h;", "Z"),
                )
                "Lorg/telegram/messenger/pp;" -> Triple(
                    "Lorg/telegram/messenger/ft;", "M", listOf("La0/h;", "Z"),
                )
                "Lorg/telegram/messenger/ko0;" -> Triple(
                    "Lorg/telegram/messenger/f31;", "p1", listOf("Lu/k;", "Z"),
                )
                "Lorg/telegram/messenger/mo0;" -> Triple(
                    "Lorg/telegram/messenger/h31;", "p1", listOf("Lu/k;", "Z"),
                )
                else -> error("Unrecognized current R8 delete dispatcher ${currentR8UpdateMethod.definingClass}")
            }
            val pushInstructions = requireNotNull(pushDeleteMethod.implementation) {
                "PushListenerController remote-message handler has no implementation"
            }.instructions.toList()
            val notificationCallIndexes = pushInstructions.indices.filter { index ->
                val reference = (pushInstructions[index] as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == notificationCall.first &&
                    reference.name == notificationCall.second &&
                    reference.parameterTypes == notificationCall.third && reference.returnType == "V"
            }
            val messageDeletedNotificationIndex = when (notificationCallIndexes.size) {
                // Earlier Android/Plus DEX layouts expose two calls. The false-flag
                // call is the delete route; retain the true-flag reaction route.
                2 -> {
                    val falseFlagCalls = notificationCallIndexes.filter { index ->
                        val registers = invokeRegisters(pushInstructions[index]) ?: return@filter false
                        val flagRegister = registers.lastOrNull() ?: return@filter false
                        val previous = pushInstructions.getOrNull(index - 1) ?: return@filter false
                        val constant = previous as? NarrowLiteralInstruction ?: return@filter false
                        val destination = previous as? OneRegisterInstruction ?: return@filter false
                        previous.opcode == Opcode.CONST_4 && destination.registerA == flagRegister &&
                            constant.narrowLiteral == 0
                    }
                    require(falseFlagCalls.size == 1) {
                        "Expected one false-flag delete notification call; found ${falseFlagCalls.size}"
                    }
                    falseFlagCalls.single()
                }
                // Web 13.2.2 build 73039 has a single notification-removal call
                // in lambda$processRemoteMessage$6. Its boolean is materialized as
                // true immediately before invoke; this is the sole `messages`-IDs
                // notification route in this handler. Do not apply the old two-call
                // assumption (which prevented the Web repair from matching).
                1 -> {
                    val index = notificationCallIndexes.single()
                    val registers = invokeRegisters(pushInstructions[index])
                        ?: error("Cannot decode Web push notification call registers")
                    val flagRegister = registers.lastOrNull()
                        ?: error("Web push notification call has no flag register")
                    val previous = pushInstructions.getOrNull(index - 1)
                        ?: error("Web push notification call has no preceding flag constant")
                    val constant = previous as? NarrowLiteralInstruction
                    val destination = previous as? OneRegisterInstruction
                    require(previous.opcode == Opcode.CONST_4 && destination?.registerA == flagRegister &&
                        constant?.narrowLiteral == 1) {
                        "Web push notification call no longer matches the audited single-call shape"
                    }
                    index
                }
                else -> error("Expected one Web or two legacy push notification calls; found ${notificationCallIndexes.size}")
            }
            pushDeleteMethod.replaceInstruction(messageDeletedNotificationIndex, "nop")
        } else {
            // Historical named-class and Plus variants retain their original
            // independently audited delete worker and storage hook.
            val deleteMessagesByPushMethod =
                DeleteMessagesByPushFingerprint.methodOrNull
                    ?: MessagesControllerDeletePushMessagesPlusFingerprint.methodOrNull
            requireNotNull(deleteMessagesByPushMethod) {
                "Failed to match deleteMessagesByPush for legacy/Plus APK"
            }.addInstructions(0, "return-void")

            val markMessagesAsDeletedMethod =
                MarkMessagesAsDeletedFingerprint2.methodOrNull
            requireNotNull(markMessagesAsDeletedMethod) {
                "Failed to match markMessagesAsDeleted(J, ArrayList, Z, Z, I, I)"
            }.addInstructions(
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
            deletedMessageUiMatches.forEach { match ->
                match.instructionMatches.map { it.index }.distinct().sortedDescending().forEach { index ->
                    match.method.replaceInstruction(index, "nop\nnop")
                }
            }

            val removeDeletedMessagesMethod =
                NotificationsControllerRemoveDeletedMessagesFingerprint.methodOrNull
                    ?: NotificationsControllerRemoveDeletedMessagesPlusFingerprint.methodOrNull
                    ?: NotificationsControllerRemoveDeletedMessagesPlusLegacyFingerprint.methodOrNull
            removeDeletedMessagesMethod?.addInstructions(0, "return-void")
        }
    }
}
