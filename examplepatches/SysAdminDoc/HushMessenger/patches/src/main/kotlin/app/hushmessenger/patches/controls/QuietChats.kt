package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Logging chats that don't notify (#143), under Keep a message log. Messenger's notification check ends a muted chat's
 * push at its mute check, and a restricted chat's at its folder check, so the notification constructor the log reads
 * from never runs for either. [QUIET_LOG_CHECK] lets both on through the check and marks the chat quiet, and
 * [QUIET_LOG_DROP] drops a quiet chat's notification at the start of the notification manager's new-message method,
 * after the log has its text. An unsend still goes through the manager, so the log marks it as it does any other.
 */
internal const val QUIET_LOG_CHECK = "quiet_log_check"
internal const val QUIET_LOG_DROP = "quiet_log_drop"

private const val NOTIFICATION_SETTING = "Lcom/facebook/messaging/model/threads/NotificationSetting;"
private const val JSON_OBJECT = "Lorg/json/JSONObject;"
private const val JSON_PUT_OBJECT = "Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;"
/** The new-message method's own name, which it logs under and keeps on every build. */
internal const val NOTIFY_NEW_MESSAGE = "notifyNewMessageInternal"
private const val QUIET_CHAT = "$SETTINGS->quietChat(Ljava/lang/Object;)Z"
private const val DROP_QUIET = "$SETTINGS->dropQuiet(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Z"
private const val NOTIFICATION_FOLDER = "$SETTINGS->notificationFolder(Ljava/lang/Object;)Ljava/lang/Object;"
private val STRING_LOADS = setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO)

/**
 * Where a quiet chat's message lives, in this exact build, past what [MessageLogContract] already has. Resolved from the
 * stock classes at patch time; a build where any of it is missing or ambiguous refuses the switch.
 */
internal class QuietChatContract(
    /** The new-message notification's Message field, the one the notification manager's new-message method reads. */
    val notificationMessage: String,
    /** Message's sender, the ParticipantInfo field Messenger puts under "senderInfo" when it writes a message as JSON. */
    val senderField: String,
    /** ParticipantInfo's name, the SecretString its toString puts under "name". */
    val nameField: String,
)

internal var quietChatContract: QuietChatContract? = null

private fun fieldId(reference: FieldReference) = "${reference.definingClass}->${reference.name}:${reference.type}"

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Method.loadsString(text: String) = code().any {
    it.opcode in STRING_LOADS && ((it as ReferenceInstruction).reference as StringReference).string == text
}

private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun MutableMethod.calls(reference: String) = code().any { it.methodRef()?.toString() == reference }

/** Every [owner] field of [type] read straight after `const-string key` and handed with it to [put], on the same registers. */
private fun Method.keyedReads(key: String, owner: String, type: String, put: String): List<String> {
    val code = code()
    return (0 until (code.size - 2).coerceAtLeast(0)).mapNotNull { at ->
        val load = code[at]
        if (load.opcode !in STRING_LOADS || ((load as ReferenceInstruction).reference as StringReference).string != key) return@mapNotNull null
        val read = code[at + 1]
        val field = (read as? ReferenceInstruction)?.reference as? FieldReference
        if (read.opcode != Opcode.IGET_OBJECT || field == null || field.definingClass != owner || field.type != type) return@mapNotNull null
        val call = code[at + 2] as? FiveRegisterInstruction ?: return@mapNotNull null
        if (code[at + 2].methodRef()?.toString() != put || call.registerCount != 3 ||
            call.registerD != (load as OneRegisterInstruction).registerA || call.registerE != (read as TwoRegisterInstruction).registerA) return@mapNotNull null
        fieldId(field)
    }
}

/** The Message ParticipantInfo fields every (Message, ...)JSONObject writer puts under "senderInfo". */
internal fun findSenderFields(classes: Iterable<ClassDef>): List<String> =
    classes.flatMap { it.methods }.filter { it.returnType == JSON_OBJECT && MESSAGE in it.parameterTypes.map(CharSequence::toString) }
        .flatMap { it.keyedReads("senderInfo", MESSAGE, PARTICIPANT_INFO, JSON_PUT_OBJECT) }.distinct()

/** The SecretString fields ParticipantInfo's toString reads straight after loading "name". */
internal fun findParticipantNameFields(classes: Iterable<ClassDef>): List<String> =
    classes.filter { it.type == PARTICIPANT_INFO }.flatMap { it.methods }
        .filter { it.name == "toString" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" }
        .flatMap { method ->
            val code = method.code()
            (0 until (code.size - 1).coerceAtLeast(0)).mapNotNull { at ->
                val load = code[at]
                if (load.opcode !in STRING_LOADS || ((load as ReferenceInstruction).reference as StringReference).string != "name") return@mapNotNull null
                val field = (code[at + 1] as? ReferenceInstruction)?.reference as? FieldReference
                if (code[at + 1].opcode != Opcode.IGET_OBJECT || field == null || field.definingClass != PARTICIPANT_INFO ||
                    field.type != SECRET_STRING) return@mapNotNull null
                fieldId(field)
            }
        }.distinct()

private fun Method.isNewMessageMethod() = definingClass == MESSAGES_NOTIFICATION_MANAGER && returnType == "V" &&
    !AccessFlags.STATIC.isSet(accessFlags) &&
    parameterTypes.map(CharSequence::toString) == listOf(FB_USER_SESSION, NEW_MESSAGE_NOTIFICATION) && loadsString(NOTIFY_NEW_MESSAGE)

/** The notification manager's (session, new-message notification)V method that logs itself as notifyNewMessageInternal. */
internal fun findQuietLogDrop(classes: Iterable<ClassDef>): List<Method> =
    listOfNotNull(classes.firstOrNull { it.type == MESSAGES_NOTIFICATION_MANAGER }?.methods?.filter { it.isNewMessageMethod() }?.singleOrNull())

/** Whether the class declares [fieldId] as a field code in [reader] may read: public, or non-private in its package. */
private fun ClassDef.lets(reader: String, fieldId: String): Boolean {
    val field = fields.firstOrNull { "${it.definingClass}->${it.name}:${it.type}" == fieldId } ?: return false
    return AccessFlags.PUBLIC.isSet(field.accessFlags) ||
        (!AccessFlags.PRIVATE.isSet(field.accessFlags) && type.substringBeforeLast('/') == reader.substringBeforeLast('/'))
}

/**
 * The fields the drop reads, all of which the notification manager must be allowed to read, since a field it can't would
 * fail the verifier on every notification. Null when [log] is, or anything is missing or ambiguous.
 */
internal fun resolveQuietChatContract(classes: Iterable<ClassDef>, log: MessageLogContract?): QuietChatContract? {
    log ?: return null
    val byType = classes.filter {
        it.type in setOf(MESSAGE, NEW_MESSAGE_NOTIFICATION, PARTICIPANT_INFO, SECRET_STRING)
    }.associateBy { it.type }
    val message = byType[MESSAGE] ?: return null
    val notification = byType[NEW_MESSAGE_NOTIFICATION] ?: return null
    val participant = byType[PARTICIPANT_INFO] ?: return null
    val secret = byType[SECRET_STRING] ?: return null
    val drop = findQuietLogDrop(classes).singleOrNull() ?: return null
    val read = drop.code().filter { it.opcode == Opcode.IGET_OBJECT }
        .mapNotNull { (it as ReferenceInstruction).reference as? FieldReference }
        .filter { it.definingClass == NEW_MESSAGE_NOTIFICATION && it.type == MESSAGE }.map(::fieldId).distinct()
        .singleOrNull() ?: return null
    val sender = findSenderFields(classes).singleOrNull() ?: return null
    val name = findParticipantNameFields(classes).singleOrNull() ?: return null
    val reader = MESSAGES_NOTIFICATION_MANAGER
    if (!notification.lets(reader, read) || !message.lets(reader, sender) || !message.lets(reader, log.threadKeyField) ||
        !message.lets(reader, log.messageIdField) || !participant.lets(reader, name) || !secret.lets(reader, log.secretField)) return null
    return QuietChatContract(read, sender, name)
}

/**
 * The thread check's mute check: [branch] is the `if-eqz`/`if-nez` on [register] that decides it, [muted] whether a
 * nonzero [register] means the chat is muted rather than that it notifies, [threadKey] the check's own ThreadKey field
 * and [self] the register holding the check.
 */
internal class MuteCheck(val branch: Int, val register: Int, val muted: Boolean, val threadKey: String, val self: Int)

private val PLAIN_MOVES = setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)

/**
 * The branch on 587's flipped answer: the first `if-eqz`/`if-nez` on the `xor-int/lit8 vM, vA, 0x1` at [xor], with only
 * plain moves writing vM on the way. Those are the snooze check handing over its own muted answer, so the branch is
 * where every muted answer meets.
 */
private fun List<Instruction>.flippedBranch(xor: Int): Int? {
    val muted = (this[xor] as TwoRegisterInstruction).registerA
    for (at in xor + 1 until size) {
        val i = this[at]
        if ((i.opcode == Opcode.IF_EQZ || i.opcode == Opcode.IF_NEZ) && (i as OneRegisterInstruction).registerA == muted) return at
        if (i.opcode.setsRegister() && i is OneRegisterInstruction &&
            (i.registerA == muted || (i.opcode.setsWideRegister() && i.registerA + 1 == muted)) && i.opcode !in PLAIN_MOVES) return null
    }
    return null
}

/**
 * The check's own ThreadKey field, read once: a typed field up to 586, and in 587's merged class an Object field cast to
 * ThreadKey straight after its read.
 */
private fun Method.threadKeyField(): String? {
    val code = code()
    return code.indices.mapNotNull { at ->
        val field = (code[at] as? ReferenceInstruction)?.reference as? FieldReference
        if (code[at].opcode != Opcode.IGET_OBJECT || field == null || field.definingClass != definingClass) return@mapNotNull null
        val cast = code.getOrNull(at + 1)
        fieldId(field).takeIf {
            field.type == THREAD_KEY_TYPE || (field.type == "Ljava/lang/Object;" && cast?.opcode == Opcode.CHECK_CAST &&
                (cast as OneRegisterInstruction).registerA == (code[at] as OneRegisterInstruction).registerA &&
                (cast as ReferenceInstruction).reference.toString() == THREAD_KEY_TYPE)
        }
    }.distinct().singleOrNull()
}

/**
 * The one `invoke-virtual ThreadSummary->()NotificationSetting` whose result is asked a ()Z straight after. Up to 586
 * the answer, whether the chat notifies, is branched on straight away, and nothing may land on that branch. 587 flips it
 * into whether the chat is muted and branches on that after its snooze check (see [flippedBranch]). Nothing may write
 * the check's own register, and the branched register has to fit the 4-bit reads the guard puts in front of it.
 */
internal fun Method.muteCheck(): MuteCheck? {
    if (!isThreadCheck()) return null
    val registers = implementation?.registerCount ?: return null
    val code = code()
    val sites = (0 until (code.size - 4).coerceAtLeast(0)).mapNotNull { at ->
        val get = code[at].methodRef()
        if (code[at].opcode != Opcode.INVOKE_VIRTUAL || get == null || get.definingClass != THREAD_SUMMARY ||
            get.returnType != NOTIFICATION_SETTING || get.parameterTypes.isNotEmpty()) return@mapNotNull null
        if (code[at + 1].opcode != Opcode.MOVE_RESULT_OBJECT) return@mapNotNull null
        val setting = (code[at + 1] as OneRegisterInstruction).registerA
        val ask = code[at + 2].methodRef()
        if (code[at + 2].opcode != Opcode.INVOKE_VIRTUAL || ask == null || ask.definingClass != NOTIFICATION_SETTING ||
            ask.returnType != "Z" || ask.parameterTypes.isNotEmpty() || (code[at + 2] as FiveRegisterInstruction).registerC != setting) return@mapNotNull null
        if (code[at + 3].opcode != Opcode.MOVE_RESULT) return@mapNotNull null
        val result = (code[at + 3] as OneRegisterInstruction).registerA
        val next = code[at + 4]
        when {
            (next.opcode == Opcode.IF_EQZ || next.opcode == Opcode.IF_NEZ) && (next as OneRegisterInstruction).registerA == result ->
                Triple(at + 4, result, false)
            next.opcode == Opcode.XOR_INT_LIT8 && (next as TwoRegisterInstruction).registerB == result &&
                (next as NarrowLiteralInstruction).narrowLiteral == 1 ->
                code.flippedBranch(at + 4)?.let { Triple(it, (next as TwoRegisterInstruction).registerA, true) }
            else -> null
        }
    }
    val (branch, register, muted) = sites.singleOrNull() ?: return null
    if (register > 15 || (!muted && branch in jumpTargets())) return null
    val threadKey = threadKeyField() ?: return null
    val self = registers - 2
    if (code.any { it.opcode.setsRegister() && it is OneRegisterInstruction && (it.registerA == self || (it.opcode.setsWideRegister() && it.registerA + 1 == self)) }) return null
    return MuteCheck(branch, register, muted, threadKey, self)
}

/** The thread check, taken when it has both the folder read the guard goes after and the mute check. */
internal fun findQuietLogCheck(classes: Iterable<ClassDef>): List<Method> {
    val check = findRestrictedNotify(classes).singleOrNull() ?: return emptyList()
    return if (check.muteCheck() != null) listOf(check) else emptyList()
}

/** The folder guard [injectRestrictedNotify] and this control share is already in. */
internal fun Method.folderRouted() = code().any { it.methodRef()?.toString() == NOTIFICATION_FOLDER }

internal fun MutableMethod.validateQuietLogCheck(): MuteCheck {
    if (!folderRouted() && folderRead() == null) throw PatchException("Messenger controls: the notification check's folder read changed in ${hookId()}")
    return muteCheck() ?: throw PatchException("Messenger controls: the notification check's mute check changed in ${hookId()}")
}

/**
 * The folder goes through the same extension guard as Notify for restricted chats, which lets a restricted chat on as
 * Inbox while this switch is on. Then, at the mute check, a muted chat asks the extension whether to go on (only while
 * the switch is on), and a chat that notifies tells it so, which forgets an old quiet mark. Either way the branch sees a
 * plain Z in its own sense, so Messenger's own mute path runs unchanged when the extension says no.
 */
internal fun MutableMethod.injectQuietLogCheck() {
    validateQuietLogCheck()
    if (calls(QUIET_CHAT)) return
    if (!folderRouted()) injectRestrictedNotify()
    val site = validateQuietLogCheck()
    val result = "v${site.register}"
    val threadKey = "move-object/from16 $result, v${site.self}\niget-object $result, $result, ${site.threadKey}"
    // quietChat answers whether the chat goes on, so 587's muted register takes it flipped.
    val guard = listOfNotNull(
        "${if (site.muted) "if-eqz" else "if-nez"} $result, :hush_loud_chat",
        threadKey,
        "invoke-static {$result}, $QUIET_CHAT",
        "move-result $result",
        "xor-int/lit8 $result, $result, 0x1".takeIf { site.muted },
        "goto :hush_mute_check",
        ":hush_loud_chat",
        threadKey,
        "invoke-static {$result}, $SETTINGS->loudChat(Ljava/lang/Object;)V",
        "const/4 $result, ${if (site.muted) "0x0" else "0x1"}",
    ).joinToString("\n")
    // The branch moves down past the guard, keeping its own jump, and whatever jumped onto it lands on the guard instead.
    // It goes in as a new instruction: the stock one listed twice would answer the guard's goto with its first place.
    val stock = getInstruction<BuilderInstruction21t>(site.branch)
    addInstruction(site.branch + 1, BuilderInstruction21t(stock.opcode, stock.registerA, stock.target))
    addInstructionsWithLabels(site.branch + 1, guard, ExternalLabel("hush_mute_check", getInstruction(site.branch + 1)))
    removeInstruction(site.branch)
}

/** The drop needs v0 to v3, read before stock code writes them. */
internal fun MutableMethod.validateQuietLogDrop(): QuietChatContract {
    if (!isNewMessageMethod()) throw PatchException("Messenger controls: ${hookId()} isn't the notification manager's new-message method")
    if ((implementation?.registerCount ?: 0) < 3 + 4) throw PatchException("Messenger controls: ${hookId()} has no room for the quiet chat check")
    if (messageLogContract == null) throw PatchException("Messenger controls: the message and thread fields don't match the tested build")
    return quietChatContract ?: throw PatchException("Messenger controls: the message sender fields don't match the tested build")
}

/**
 * At the top of the new-message method, while the switch is on: a quiet chat's new message hands the extension its
 * chat, id and sender's name and, when the extension says so, returns before anything goes up. An unsend, a message
 * from a chat that notifies, and the switch off all go on as stock.
 */
internal fun MutableMethod.injectQuietLogDrop() {
    val quiet = validateQuietLogDrop()
    if (calls(DROP_QUIET)) return
    val log = messageLogContract!!
    val notification = "p${parameterTypes.size}"
    addInstructionsWithLabels(0, """
        invoke-static {}, $SETTINGS->logQuietChats()Z
        move-result v0
        if-eqz v0, :stock_behavior
        move-object/from16 v0, $notification
        iget-object v0, v0, ${quiet.notificationMessage}
        if-eqz v0, :stock_behavior
        invoke-static {v0}, ${log.unsentCheck}
        move-result v1
        if-nez v1, :stock_behavior
        iget-object v1, v0, ${log.threadKeyField}
        iget-object v2, v0, ${log.messageIdField}
        iget-object v3, v0, ${quiet.senderField}
        if-eqz v3, :quiet_no_sender
        iget-object v3, v3, ${quiet.nameField}
        if-eqz v3, :quiet_no_sender
        iget-object v3, v3, ${log.secretField}
        goto :quiet_drop
        :quiet_no_sender
        const/4 v3, 0x0
        :quiet_drop
        invoke-static {v1, v2, v3}, $DROP_QUIET
        move-result v0
        if-eqz v0, :stock_behavior
        return-void
    """.trimIndent(), ExternalLabel("stock_behavior", getInstruction(0)))
}
