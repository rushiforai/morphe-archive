package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val AD_EVENTS = "ad_events"

/**
 * The inbox's row visibility tracker. Each time the visible rows change it updates its own state, then builds one
 * "inbox2_vr" event for the messenger_inbox_ads module (the top row's position and the row count) and hands it to the
 * logger. Only that last step is skipped, so the tracker's state and its ReqContext close run as before.
 */
internal const val INBOX_IMPRESSION_TRACKER = "InboxCustomizedImpressionTracker"
internal const val INBOX_VISIBILITY_EVENT = "inbox2_vr"
internal const val REQ_CONTEXT_CLOSE = "Lcom/facebook/fury/context/ReqContext;->close()V"

/**
 * The click-to-message event ("click_to_message_ad_app_switch_success") the ad deep link handler logs once a link from
 * an ad lands in Messenger. It fills in the ad's and the page's IDs and logs, nothing else. 588 moves the page's ID into
 * a static (event, long) helper and names the impression's client token in the event instead, so either one goes with
 * the ad's ID.
 */
internal const val AD_ENTRY_MARKS = "ad_id|page_id"
internal const val AD_ENTRY_TOKEN = "ad_impression_client_token"

private const val STRING = "Ljava/lang/String;"

private fun Method.stringLiterals() =
    implementation?.instructions?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }?.toSet()

/** Static (context, FbUserSession, four Strings)V that fills an event with the ad's and the page's IDs. */
internal fun Method.isAdEntryEvent(): Boolean {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "V") return false
    val params = parameterTypes.map { it.toString() }
    if (params.size != 6 || params[1] != FB_USER_SESSION || params.drop(2) != List(4) { STRING }) return false
    val (ad, page) = AD_ENTRY_MARKS.split('|')
    val literals = stringLiterals().orEmpty()
    return ad in literals && (page in literals || AD_ENTRY_TOKEN in literals)
}

/** The tracker's non-static (rows, visible)V callback that names both the tracker and its event. */
internal fun Method.isInboxVisibilityEvent(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || parameterTypes.size != 2 || parameterTypes[1].toString() != "Z") return false
    val literals = stringLiterals().orEmpty()
    return INBOX_VISIBILITY_EVENT in literals && INBOX_IMPRESSION_TRACKER in literals
}

internal fun findAdEvents(classes: Iterable<ClassDef>): List<Method> =
    classes.flatMap { it.methods }.filter { it.isAdEntryEvent() || it.isInboxVisibilityEvent() }

/** [skipFrom] is the event's new-instance, [event] its register, and [resume] the instruction after the logger call. */
internal class VisibilitySubmit(val skipFrom: Int, val event: Int, val resume: Int)

/** A catch handler that only rethrows what it caught, so it reads no register the skip leaves in another type. */
private fun List<Instruction>.rethrowsAt(at: Int?): Boolean {
    val caught = at?.let(::getOrNull) as? OneRegisterInstruction ?: return false
    val rethrow = getOrNull(at + 1) as? OneRegisterInstruction ?: return false
    return caught.opcode == Opcode.MOVE_EXCEPTION && rethrow.opcode == Opcode.THROW && rethrow.registerA == caught.registerA
}

/** iput, sput and aput in every width. Opcode.name is the smali spelling, such as iput-boolean. */
private val FIELD_WRITE = Regex("^[isa]put")

/**
 * The event is created right after its name loads, takes the name in its constructor, and goes to the logger in one
 * invoke-virtual whose only argument is that event. Everything from the new-instance through that call runs straight
 * through with nothing landing inside it. It writes no field or array, and every call in it is either on the event or
 * asked for its answer, so none is there only to change something else. After it the method only closes its
 * ReqContext and returns, reading no register the skipped code writes, and every catch handler covering the skip or
 * the close only rethrows.
 */
internal fun Method.inboxVisibilitySubmit(): VisibilitySubmit {
    fun refuse(): Nothing =
        throw PatchException("Messenger controls: the inbox visibility event in ${hookId()} no longer matches the tested build")
    val code = implementation?.instructions?.toList() ?: refuse()
    val name = code.indices.singleOrNull {
        ((code[it] as? ReferenceInstruction)?.reference as? StringReference)?.string == INBOX_VISIBILITY_EVENT
    } ?: refuse()
    val nameRegister = (code[name] as OneRegisterInstruction).registerA
    val create = code.getOrNull(name + 1)?.takeIf { it.opcode == Opcode.NEW_INSTANCE } ?: refuse()
    val event = (create as OneRegisterInstruction).registerA
    val eventType = ((create as ReferenceInstruction).reference as TypeReference).type
    val init = code.getOrNull(name + 2) as? FiveRegisterInstruction
    if (init?.opcode != Opcode.INVOKE_DIRECT || (init as ReferenceInstruction).reference.toString() != "$eventType-><init>($STRING)V" ||
        init.registerCount != 2 || init.registerC != event || init.registerD != nameRegister) refuse()
    val submit = (name + 3 until code.size).firstOrNull { i ->
        val call = code[i] as? FiveRegisterInstruction ?: return@firstOrNull false
        val target = (call as ReferenceInstruction).reference as? MethodReference ?: return@firstOrNull false
        call.opcode == Opcode.INVOKE_VIRTUAL && target.returnType == "V" &&
            target.parameterTypes.map { it.toString() } == listOf(eventType) && call.registerCount == 2 && call.registerD == event
    } ?: refuse()
    val skipped = name + 1..submit
    val targets = jumpTargets()
    // Skipping half of a lock pair would leave the lock held, or release one this thread never took.
    if (skipped.any { it in targets || code[it] is OffsetInstruction || !code[it].opcode.canContinue() ||
            code[it].opcode == Opcode.MONITOR_ENTER || code[it].opcode == Opcode.MONITOR_EXIT }) refuse()
    for (i in name + 1 until submit) {
        val call = (code[i] as? ReferenceInstruction)?.reference as? MethodReference
        val receiver = when (val instruction = code[i]) {
            is FiveRegisterInstruction -> instruction.registerC.takeIf { instruction.registerCount > 0 }
            is RegisterRangeInstruction -> instruction.startRegister.takeIf { instruction.registerCount > 0 }
            else -> null
        }
        val invoke = code[i].opcode.name.startsWith("invoke")
        val answerUsed = code.getOrNull(i + 1)?.opcode?.name?.startsWith("move-result") == true
        // A call on anything but the event has to be asked for its answer. One made for its effect alone could be
        // changing the tracker.
        if (FIELD_WRITE.containsMatchIn(code[i].opcode.name) || invoke && call == null ||
            call != null && receiver != event && (call.returnType == "V" || !answerUsed)) refuse()
    }
    val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    val indexAt = code.indices.associateBy { addresses[it] }
    val covered = implementation!!.tryBlocks.filter { block ->
        (name + 1..submit + 2).any { addresses[it] in block.startCodeAddress until block.startCodeAddress + block.codeUnitCount }
    }
    if (covered.any { block -> block.exceptionHandlers.any { !code.rethrowsAt(indexAt[it.handlerCodeAddress]) } }) refuse()
    val written = skipped.flatMap { i ->
        val instruction = code[i]
        if (!instruction.opcode.setsRegister()) return@flatMap emptyList()
        val register = (instruction as OneRegisterInstruction).registerA
        if (instruction.opcode.setsWideRegister()) listOf(register, register + 1) else listOf(register)
    }.toSet()
    val guard = code.getOrNull(submit + 1) as? OneRegisterInstruction
    val close = code.getOrNull(submit + 2) as? FiveRegisterInstruction
    if (guard == null || guard.opcode != Opcode.IF_EQZ ||
        code.branchTarget(submit + 1) != submit + 3 || close?.opcode != Opcode.INVOKE_INTERFACE ||
        (close as ReferenceInstruction).reference.toString() != REQ_CONTEXT_CLOSE ||
        close.registerCount != 1 || close.registerC != guard.registerA || guard.registerA in written ||
        code.getOrNull(submit + 3)?.opcode != Opcode.RETURN_VOID) refuse()
    return VisibilitySubmit(name + 1, event, submit + 1)
}

internal fun MutableMethod.validateAdEvent() {
    when {
        isAdEntryEvent() -> validateSwitch()
        isInboxVisibilityEvent() -> inboxVisibilitySubmit()
        else -> throw PatchException("Messenger controls: ${hookId()} isn't an ad event")
    }
}

/**
 * The entry event returns before its first instruction. The visibility callback still updates the tracker, then
 * skips from the event's new-instance to past its logger call. The event register is about to be overwritten there,
 * so it holds the switch's answer. Off, Pause and safe mode run Messenger's own code.
 */
internal fun MutableMethod.injectAdEvent() {
    validateAdEvent()
    if (isAdEntryEvent()) return injectSwitch("$SETTINGS->stopAdEvents()Z", "0x0")
    val at = inboxVisibilitySubmit()
    addInstructionsWithLabels(at.skipFrom, """
        invoke-static {}, $SETTINGS->stopAdEvents()Z
        move-result v${at.event}
        if-nez v${at.event}, :skip_ad_event
    """.trimIndent(), ExternalLabel("skip_ad_event", getInstruction(at.resume)))
}
