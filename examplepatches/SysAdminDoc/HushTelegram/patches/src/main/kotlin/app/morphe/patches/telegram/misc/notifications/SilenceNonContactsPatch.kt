/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.notifications

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val NON_CONTACTS = "$EXTENSION_PACKAGE/misc/NonContacts;"
internal const val SILENCED = "$NON_CONTACTS->silenced(Ljava/lang/Object;)Z"
internal const val NOTIFICATIONS = "Lorg/telegram/messenger/NotificationsController;"
internal const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"
internal const val TL_USER = "Lorg/telegram/tgnet/TLRPC\$User;"
private const val MESSAGES = "Lorg/telegram/messenger/MessagesController;"
internal const val SILENT_FLAG = "Lorg/telegram/tgnet/TLRPC\$Message;->silent:Z"

@Suppress("unused")
val silenceNonContactsPatch = bytecodePatch(
    name = "Silence people outside your contacts",
    description = "Shows notifications from people who aren't in your contacts without sound or vibration. Bots, " +
        "reminders and login codes keep their sound. Starts off. Turn it on in HushTelegram settings > Notifications.",
    default = true,
) {
    category("Notifications")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val hook = resolveSilenceNonContacts()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        hook.applyTo(MutableMethod(ImmutableMethod.of(hook.method)))
        writeStub(NON_CONTACTS, "dialog", 3, """
            check-cast p0, $MESSAGE_OBJECT
            invoke-virtual {p0}, $MESSAGE_OBJECT->getDialogId()J
            move-result-wide v0
            return-wide v0
        """)
        writeStub(NON_CONTACTS, "user", 4, """
            check-cast p0, $MESSAGE_OBJECT
            iget v0, p0, $MESSAGE_OBJECT->currentAccount:I
            invoke-static {v0}, $MESSAGES->getInstance(I)$MESSAGES
            move-result-object v0
            invoke-virtual {p0}, $MESSAGE_OBJECT->getDialogId()J
            move-result-wide v1
            invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
            move-result-object v1
            invoke-virtual {v0, v1}, $MESSAGES->getUser(Ljava/lang/Long;)$TL_USER
            move-result-object v0
            return-object v0
        """)
        for (flag in listOf("contact", "bot", "self")) {
            writeStub(NON_CONTACTS, flag, 2, """
                check-cast p0, $TL_USER
                iget-boolean v0, p0, $TL_USER->$flag:Z
                return v0
            """)
        }
        hook.applyTo(hook.method)
        enableStatus("silenceNonContacts")
    }
}

private const val SENDER_MESSAGE = "$MESSAGE_OBJECT->messageOwner:Lorg/telegram/tgnet/TLRPC\$Message;"
internal const val REACTION_PUSH = "$MESSAGE_OBJECT->isReactionPush:Z"

/**
 * One copy of Telegram's silent notification check, `message.messageOwner.silent || message.isReactionPush`.
 * Up to 13.1 it was NotificationsController.isSilentMessage; from 13.2 R8 inlines it, twice, into
 * showOrUpdateNotification. Either way it reads, from [start] on:
 *
 *     iget-object vS, vM, MessageObject->messageOwner
 *     iget-boolean vS, vS, TLRPC$Message->silent
 *     if-nez vS, :silent
 *     iget-boolean vF, vM, MessageObject->isReactionPush
 *
 * [message] is vM, [sender] is vS, [silent] is the instruction the sender's flag jumps to, and
 * [reaction] is the reaction flag's read.
 */
internal class SilentCheck(val start: Int, val message: Int, val sender: Int, val silent: Int, val reaction: Int)

/** Where [method] tests a message's own silent flag the way the check starts: the first three instructions above. */
private fun senderTests(method: Method): List<Int> {
    val body = method.controlBody()
    return (0..body.size - 3).filter { i ->
        val owner = body[i]
        val flag = body[i + 1]
        val test = body[i + 2]
        if (owner.opcode != Opcode.IGET_OBJECT || owner.controlRef() != SENDER_MESSAGE ||
            flag.opcode != Opcode.IGET_BOOLEAN || flag.controlRef() != SILENT_FLAG || test.opcode != Opcode.IF_NEZ) return@filter false
        val sender = (owner as TwoRegisterInstruction).registerA
        val read = flag as TwoRegisterInstruction
        // The sender's flag lands in the register that held the sender, the one the test reads.
        read.registerA == sender && read.registerB == sender && (test as OneRegisterInstruction).registerA == sender
    }
}

/** Every copy of the silent notification check in [method], in order. */
internal fun silentChecks(method: Method): List<SilentCheck> {
    val body = method.controlBody()
    val tests = senderTests(method)
    if (tests.isEmpty()) return emptyList()
    val flow = ControlFlow.of(method)
    return tests.mapNotNull { i ->
        val owner = body[i] as TwoRegisterInstruction
        val reaction = body.getOrNull(i + 3)
        // The reaction flag comes from the same message, right after the sender's test.
        if (reaction == null || reaction.opcode != Opcode.IGET_BOOLEAN || reaction.controlRef() != REACTION_PUSH ||
            (reaction as TwoRegisterInstruction).registerB != owner.registerB) return@mapNotNull null
        // A silent sender lands on the check's answer yes, in the register the reaction flag used.
        val silent = flow.normal[i + 2].singleOrNull { it != i + 3 } ?: return@mapNotNull null
        val yes = body[silent]
        if (yes.opcode != Opcode.CONST_4 || (yes as NarrowLiteralInstruction).narrowLiteral != 1 ||
            (yes as OneRegisterInstruction).registerA != (reaction as TwoRegisterInstruction).registerA) return@mapNotNull null
        SilentCheck(i, owner.registerB, owner.registerA, silent, i + 3)
    }
}

/**
 * The one method of NotificationsController holding the silent notification check, and every copy
 * of it there, for a hook to find. Null when it's in more than one method, or when a test of the
 * sender's flag there no longer goes on to the reaction flag: a copy that changed, which a hook
 * would miss.
 */
internal fun BytecodePatchContext.silentCheckHost(): Pair<MutableMethod, List<SilentCheck>>? {
    val hosts = tgMutableClassDefByOrNull(NOTIFICATIONS)?.methods?.mapNotNull { method ->
        val tests = senderTests(method)
        if (tests.isEmpty()) return@mapNotNull null
        method to silentChecks(method).takeIf { it.size == tests.size }
    } ?: emptyList()
    val host = hosts.singleOrNull() ?: return null
    return host.second?.let { host.first to it }
}

/**
 * In front of each copy of the silent notification check, a stranger's message jumps straight to
 * the check's silent answer. Otherwise Telegram's own check runs as it was.
 */
internal class SilenceHook(val method: MutableMethod, val checks: List<SilentCheck>) {
    fun applyTo(target: MutableMethod) {
        // Each answer's instruction is taken before anything moves, and the later copy goes first, so
        // the earlier one's start still holds.
        val answers = checks.associateWith { target.getInstruction(it.silent) }
        for ((n, check) in checks.sortedByDescending { it.start }.withIndex()) {
            target.addInstructionsAtControlFlowLabel(check.start, """
                invoke-static/range {v${check.message} .. v${check.message}}, $SILENCED
                move-result v${check.sender}
                if-nez v${check.sender}, :hush_silent_$n
            """.trimIndent(), ExternalLabel("hush_silent_$n", answers.getValue(check)))
        }
    }
}

/**
 * Telegram's silent notification check decides whether a notification plays its sound: a message
 * sent without sound, or a reaction. The person behind a private chat comes from
 * MessagesController.getUser, and TLRPC.User says whether they're a contact, a bot or you.
 */
internal fun BytecodePatchContext.resolveSilenceNonContacts(): SilenceHook {
    requireStatusMethod("silenceNonContacts")
    controlHook(NON_CONTACTS, "silenced", listOf("Ljava/lang/Object;"), "Z")
    controlHook(NON_CONTACTS, "dialog", listOf("Ljava/lang/Object;"), "J")
    controlHook(NON_CONTACTS, "user", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;")
    for (flag in listOf("contact", "bot", "self")) controlHook(NON_CONTACTS, flag, listOf("Ljava/lang/Object;"), "Z")

    controlShape(tgClassDefByOrNull(NOTIFICATIONS) != null, "NotificationsController is missing")
    val host = silentCheckHost()
    controlShape(host != null, "the silent notification check is missing, changed or in more than one place")
    val (method, checks) = host!!
    for (check in checks) {
        controlShape(check.message != check.sender && check.sender <= 255,
            "the silent notification check keeps the sender in a register a hook can't answer in")
    }

    val message = tgClassDefByOrNull(MESSAGE_OBJECT)
    controlShape(message != null && message.fields.any { it.origName == "currentAccount" && it.origType == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) } &&
        message.methods.any { it.origName == "getDialogId" && it.parameterTypes.isEmpty() && it.origReturnType == "J" && AccessFlags.PUBLIC.isSet(it.accessFlags) },
        "a message no longer says which chat and account it belongs to")
    val messages = tgClassDefByOrNull(MESSAGES)
    controlShape(messages != null && messages.methods.any { it.origName == "getInstance" && it.origParameterTypes == listOf("I") && it.origReturnType == MESSAGES } &&
        messages.methods.any { it.origName == "getUser" && it.origParameterTypes == listOf("Ljava/lang/Long;") && it.origReturnType == TL_USER && AccessFlags.PUBLIC.isSet(it.accessFlags) },
        "MessagesController no longer looks up a user by ID")
    val user = tgClassDefByOrNull(TL_USER)
    controlShape(user != null && listOf("contact", "bot", "self").all { flag -> user.fields.any { it.origName == flag && it.origType == "Z" && !AccessFlags.STATIC.isSet(it.accessFlags) } },
        "a Telegram user no longer says whether they're a contact, a bot or you")
    return SilenceHook(method, checks)
}
