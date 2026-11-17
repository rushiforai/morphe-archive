/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.ids

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.liveAcrossInjection
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.definitionReaches
import app.morphe.util.namedRegisters
import app.morphe.util.names.loadsInt
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val FORWARD_DATES = "$EXTENSION_PACKAGE/misc/ForwardDates;"
internal const val FD_MESSAGE = "Lorg/telegram/messenger/MessageObject;"
internal const val FD_TL_MESSAGE = "Lorg/telegram/tgnet/TLRPC\$Message;"
internal const val FD_FWD_HEADER = "Lorg/telegram/tgnet/TLRPC\$MessageFwdHeader;"
internal const val FD_FORWARDED_FROM = "Lorg/telegram/messenger/R\$string;->ForwardedFrom:I"
internal const val FD_HEADER_HOOK = "$FORWARD_DATES->header(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;"
internal const val FD_COMPACT_HOOK = "$FORWARD_DATES->compact(Ljava/lang/Object;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;"

/** The string a public service announcement's header is looked up by, which only the line builder loads. */
private const val FD_PSA = "PsaMessage_"
private const val FD_STRING = "Ljava/lang/String;"
private const val FD_CHARS = "Ljava/lang/CharSequence;"
private const val FD_TL_OBJECT = "Lorg/telegram/tgnet/TLObject;"

/** The compact header row's set(label, peer, name, paint, text, maxWidth). */
private val FD_ROW_PARAMETERS = listOf(FD_STRING, FD_TL_OBJECT, FD_CHARS, "Landroid/text/TextPaint;", FD_CHARS, "I")

/**
 * The two places a message's bubble writes "Forwarded from": [line], the method that answers the
 * line above the original sender's name, and [compact], the header compact chats draw instead.
 */
internal class ForwardDatesPlan(
    val line: MutableMethod,
    val compact: MutableMethod,
    private val edits: Map<MutableMethod, List<Pair<Int, String>>>,
) {
    val methods: Set<MutableMethod> get() = edits.keys

    /** Where a method's code goes, in instruction order. */
    fun sites(method: MutableMethod): List<Int> = edits.getValue(method).map { it.first }.sorted()

    fun applyTo() = edits.forEach { (method, code) -> insert(method, code) }

    /** Puts every hook into a copy of its method first, so one that doesn't fit stops nothing halfway. */
    fun rehearse() = edits.forEach { (method, code) -> insert(MutableMethod(ImmutableMethod.of(method)), code) }

    private fun insert(target: MutableMethod, code: List<Pair<Int, String>>) {
        // From the bottom up, so each index still names the instruction it was found at.
        for ((index, smali) in code.sortedByDescending { it.first }) target.addInstructionsAtControlFlowLabel(index, smali)
    }
}

private class NoForwardDates(why: String) : Exception(why)

private fun forwardNeeded(ok: Boolean, why: String) {
    if (!ok) throw NoForwardDates(why)
}

/**
 * Forward dates add the date and time a forwarded message was first sent to its bubble's header,
 * from the forward header Telegram already keeps with the message. A bubble writes "Forwarded from"
 * in two places: the line builder that answers it above the sender's name (and the public service
 * announcement header instead, which keeps its own text), and the header row compact chats draw,
 * whose text slot Telegram leaves empty for a forward. The line gets the date after its text, the
 * compact row gets it in that slot. A build where either can't be found keeps the rest of the patch.
 *
 * @return the plan, and null; or null and why there's none
 */
internal fun BytecodePatchContext.resolveForwardDates(): Pair<ForwardDatesPlan?, String?> = try {
    Pair(forwardDatesPlan(), null)
} catch (missing: NoForwardDates) {
    Pair(null, missing.message)
} catch (missing: PatchException) {
    Pair(null, missing.message)
}

private fun Instruction.loadsForwardedFrom() = loadsInt() && controlRef() == FD_FORWARDED_FROM
private fun Instruction.isStaticCall() = opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE
private fun Instruction.loadsString(value: String) =
    (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) &&
        ((this as ReferenceInstruction).reference as? StringReference)?.string == value
private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val destination = namedRegisters().firstOrNull() ?: return false
    return destination == register || opcode.setsWideRegister() && destination + 1 == register
}
private fun ControlFlow.onlyFrom(at: Int, from: Int) =
    instructions.indices.filter { at in normal[it] } == listOf(from) && exceptional.none { at in it }
private fun BytecodePatchContext.mutable(method: Method): MutableMethod =
    tgMutableClassDefBy(method.definingClass).methods.single { it.toString() == method.toString() }

/** The register holding the method's one MessageObject parameter. */
private fun Method.messageParameter(): Int {
    val types = origParameterTypes
    val at = types.indexOf(FD_MESSAGE)
    forwardNeeded(at >= 0 && types.lastIndexOf(FD_MESSAGE) == at, "a forward header no longer takes one message")
    val after = parameterTypes.drop(at + 1).sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    return implementation!!.registerCount - after - 1
}

/**
 * A register an `invoke` can name, v15 or below, that still holds the message parameter at [use]: a
 * local the method copied the parameter into, or the parameter itself when nothing wrote it before.
 * Null when none does.
 */
private fun Method.messageAt(flow: ControlFlow, use: Int): Int? {
    val parameter = messageParameter()
    val body = flow.instructions
    fun intact(at: Int) = at == 0 || !body[0].writes(parameter) && flow.definitionReaches(0, at, parameter)
    val copies = (0 until use).mapNotNull { at ->
        val copy = body[at]
        val moved = copy.opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16) &&
            copy.namedRegisters().getOrNull(1) == parameter
        val register = copy.namedRegisters().firstOrNull()
        if (moved && intact(at) && register != null && flow.definitionReaches(at, use, register)) register else null
    }
    val itself = listOfNotNull(parameter.takeIf { use > 0 && intact(use) })
    return (copies + itself).firstOrNull { it <= 15 }
}

private fun BytecodePatchContext.forwardDatesPlan(): ForwardDatesPlan {
    controlHook(FORWARD_DATES, "header", listOf("Ljava/lang/Object;", FD_STRING), FD_STRING)
    controlHook(FORWARD_DATES, "compact", listOf("Ljava/lang/Object;", FD_CHARS), FD_CHARS)
    controlHook(FORWARD_DATES, "sentAt", listOf("Ljava/lang/Object;"), "I")
    controlMembers(FD_MESSAGE, "messageOwner:$FD_TL_MESSAGE")
    controlMembers(FD_TL_MESSAGE, "fwd_from:$FD_FWD_HEADER")
    controlMembers(FD_FWD_HEADER, "date:I")

    // The line builder: one message in, a String out, the announcement's header looked up in one branch
    // and "Forwarded from" answered in the other.
    val lines = classDefsMentioning(Mention.string(FD_PSA))
        .filter { !it.type.startsWith("Lapp/hushtelegram/") }
        .flatMap { owner -> owner.methods.filter { method ->
            method.origParameterTypes == listOf(FD_MESSAGE) && method.origReturnType == FD_STRING &&
                !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.controlBody().let { body -> body.any { it.loadsString(FD_PSA) } && body.any { it.loadsForwardedFrom() } }
        } }
    forwardNeeded(lines.size == 1, "the bubble's Forwarded from line is missing or ambiguous")
    val line = lines.single()
    val lineBody = line.controlBody()
    val lineFlow = ControlFlow.of(line)
    val loads = lineBody.indices.filter { lineBody[it].loadsForwardedFrom() }
    forwardNeeded(loads.size == 1, "the bubble's Forwarded from line loads its text more than once")
    val load = loads.single()
    // The text comes from one getString call, and the method answers it straight away.
    val made = (load + 1 until lineBody.size).firstOrNull { lineBody[it].isStaticCall() && lineBody[it].call()?.returnType == FD_STRING }
    forwardNeeded(made != null && lineBody.getOrNull(made + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
        lineBody.getOrNull(made + 2)?.opcode == Opcode.RETURN_OBJECT, "the bubble's Forwarded from line no longer answers its text at once")
    val returned = made!! + 2
    val text = lineBody[made + 1].namedRegisters().single()
    forwardNeeded(lineBody[returned].namedRegisters().single() == text, "the bubble's Forwarded from line answers something else")
    forwardNeeded((load + 1..returned).all { lineFlow.onlyFrom(it, it - 1) }, "something jumps into the bubble's Forwarded from line")
    forwardNeeded(lineBody[load].namedRegisters().single() == lineBody[made].namedRegisters().first(),
        "the bubble's Forwarded from line asks for another string")
    val message = line.messageAt(lineFlow, load)
    forwardNeeded(message != null && message <= 15, "the bubble's Forwarded from line no longer has its message at hand")
    // A local the line doesn't read again and doesn't write on its way to the answer keeps the message until then.
    val live = line.liveAcrossInjection(load)
    val kept = (0 until minOf(line.localRegisterCount(), 16)).firstOrNull { register ->
        register !in live && register != text && (load until returned).none { lineBody[it].writes(register) }
    }
    forwardNeeded(kept != null && text <= 15, "the bubble's Forwarded from line has no register to spare")

    // The compact header: the one other place the bubble loads "Forwarded from", handed to the row with no text.
    val owner = tgMutableClassDefBy(line.definingClass)
    val compacts = owner.methods.filter { method ->
        method.toString() != line.toString() && method.controlBody().any { it.loadsForwardedFrom() }
    }
    forwardNeeded(compacts.size == 1, "the compact Forwarded from header is missing or ambiguous")
    val compact = compacts.single()
    val compactBody = compact.controlBody()
    val compactFlow = ControlFlow.of(compact)
    val labels = compactBody.indices.filter { compactBody[it].loadsForwardedFrom() }
    forwardNeeded(labels.size == 1, "the compact Forwarded from header loads its label more than once")
    val label = labels.single()
    val named = compactBody.getOrNull(label + 1)
    forwardNeeded(named != null && named.isStaticCall() && named.call()?.returnType == FD_STRING &&
        named.namedRegisters().firstOrNull() == compactBody[label].namedRegisters().single() &&
        compactBody.getOrNull(label + 2)?.opcode == Opcode.MOVE_RESULT_OBJECT, "the compact Forwarded from header changed")
    val labelText = compactBody[label + 2].namedRegisters().single()
    val rows = (label + 3 until compactBody.size).filter { at ->
        compactBody[at].call()?.let { c -> c.parameterTypes.map { it.toString() } == FD_ROW_PARAMETERS && c.returnType == "V" } == true
    }
    forwardNeeded(rows.isNotEmpty(), "the compact Forwarded from row is missing")
    val row = rows.first()
    val arguments = compactBody[row].namedRegisters()
    // The receiver, then label, peer, name, paint, text and width.
    forwardNeeded(arguments.size == 7 && arguments[1] == labelText && compactFlow.definitionReaches(label + 2, row, labelText),
        "the compact Forwarded from row takes another label")
    forwardNeeded((label + 1..row).all { compactFlow.onlyFrom(it, it - 1) }, "something jumps into the compact Forwarded from row")
    val snippet = arguments[5]
    val compactMessage = compact.messageAt(compactFlow, row)
    forwardNeeded(compactMessage != null && compactMessage <= 15 && snippet <= 15, "the compact Forwarded from row no longer has its message at hand")

    val edits = linkedMapOf<Method, List<Pair<Int, String>>>(
        line to listOf(
            load to "move-object v$kept, v$message",
            returned to """
                invoke-static {v$kept, v$text}, $FD_HEADER_HOOK
                move-result-object v$text
            """,
        ),
        compact to listOf(
            row to """
                invoke-static {v$compactMessage, v$snippet}, $FD_COMPACT_HOOK
                move-result-object v$snippet
            """,
        ),
    )
    val mutableEdits = edits.entries.associate { (method, code) -> mutable(method) to code }
    val byMethod = mutableEdits.keys.associateBy { it.toString() }
    return ForwardDatesPlan(
        line = byMethod.getValue(line.toString()),
        compact = byMethod.getValue(compact.toString()),
        edits = mutableEdits,
    ).also { it.rehearse() }
}

/** When a forwarded message was first sent, from the forward header its message keeps; 0 when it isn't a forward. */
internal fun BytecodePatchContext.writeForwardDates() {
    writeStub(FORWARD_DATES, "sentAt", 2, """
        instance-of v0, p0, $FD_MESSAGE
        if-eqz v0, :hush_none
        check-cast p0, $FD_MESSAGE
        iget-object v0, p0, $FD_MESSAGE->messageOwner:$FD_TL_MESSAGE
        if-eqz v0, :hush_none
        iget-object v0, v0, $FD_TL_MESSAGE->fwd_from:$FD_FWD_HEADER
        if-eqz v0, :hush_none
        iget v0, v0, $FD_FWD_HEADER->date:I
        return v0
        :hush_none
        const/4 v0, 0x0
        return v0
    """)
}
