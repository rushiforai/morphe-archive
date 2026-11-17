/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.loadsInt
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.readsAfter
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val ALSO_DELETE_CHECKED = "$MESSAGE_MENU->alsoDeleteChecked([Z)Z"
internal const val ALSO_DELETE_LABEL = "Lorg/telegram/messenger/R\$string;->DeleteMessagesOptionAlso:I"
private const val ALSO_DELETE_FLAG = "[Z"
private val ALSO_DELETE_PEERS = listOf("Lorg/telegram/tgnet/TLRPC\$User;", "Lorg/telegram/tgnet/TLRPC\$Chat;",
    "Lorg/telegram/tgnet/TLRPC\$EncryptedChat;", "Lorg/telegram/tgnet/TLRPC\$ChatFull;")
/** CheckBoxCell's setText(text, value, checked, divider, animated). */
private val ALSO_DELETE_BOX_TEXT = listOf("Ljava/lang/CharSequence;", "Ljava/lang/String;", "Z", "Z", "Z")
private val ALSO_DELETE_CONSTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST)
private val ALSO_DELETE_INITS = setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE)

/**
 * Also delete for, checked by default: the delete dialog's Also delete for box, the flag Delete
 * reads, and the register its unchecked start is in, or why this build can't start it checked.
 */
internal class AlsoDeleteCheckedPlan(
    val missing: String?, internal val method: MutableMethod? = null, internal val at: Int = -1,
    private val flag: Int = 0, private val checked: Int = 0,
) {
    fun apply() = method!!.addInstructionsAtControlFlowLabel(at, alsoDeleteHook(flag, checked))
}

private fun alsoDeleteHook(flag: Int, checked: Int) = """
    invoke-static/range {v$flag .. v$flag}, $ALSO_DELETE_CHECKED
    move-result v$checked
"""

/**
 * Telegram's delete messages dialog: the static AlertsCreator method that takes the chat's user,
 * chat, secret chat and full chat and loads the Also delete for label. The delete chat dialogs
 * load the same label with other arguments.
 */
internal fun Method.isDeleteMessagesDialog(): Boolean = AccessFlags.STATIC.isSet(accessFlags) && origReturnType == "V" &&
    origParameterTypes.containsAll(ALSO_DELETE_PEERS) && controlBody().any { it.loadsInt() && it.controlRef() == ALSO_DELETE_LABEL }

/**
 * The box is a CheckBoxCell filled in once, straight after the label loads, with a constant
 * false for checked; its click listener gets the dialog's one-slot flag and flips it with the
 * box. Telegram itself only builds this box in a chat with a person, outside secret chats and
 * while a message can still go for both sides, so the hook never runs anywhere else. The hook
 * goes in front of that fill: it sets the flag and gives the box its start, and the same flag
 * still reaches the listener untouched, so the box, the flag and Delete agree.
 */
internal fun BytecodePatchContext.resolveAlsoDeleteChecked(): AlsoDeleteCheckedPlan = try {
    requireStatusMethod("alsoDeleteChecked")
    controlHook(MESSAGE_MENU, "alsoDeleteChecked", listOf(ALSO_DELETE_FLAG), "Z")
    val dialogs = mutableListOf<Pair<String, Method>>()
    forEachClassMentioning(Mention.reference(ALSO_DELETE_LABEL)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.filter { it.isDeleteMessagesDialog() }.forEach { dialogs += cls.origType to it }
    }
    val (owner, found) = dialogs.controlSingle("the delete messages dialog")
    val method = tgMutableClassDefBy(owner).methods.single {
        it.name == found.name && it.returnType == found.returnType && it.parameterTypes.map(Any::toString) == found.parameterTypes.map(Any::toString)
    }
    val body = method.controlBody()
    val label = body.indices.filter { body[it].loadsInt() && body[it].controlRef() == ALSO_DELETE_LABEL }.controlSingle("the Also delete for label")
    val set = (label + 1 until body.size).firstOrNull { body[it].isBoxText() }
    controlShape(set != null, "the Also delete for box is no longer filled in after its label")
    set!!
    val flow = ControlFlow.of(method)
    val into = Array(body.size) { mutableListOf<Int>() }
    for (i in body.indices) (flow.normal[i] + flow.exceptional[i]).forEach { into[it] += i }
    controlShape((label + 1..set).all { into[it] == listOf(it - 1) && it in flow.normal[it - 1] },
        "the Also delete for box isn't filled in straight after its label")

    val box = body[set].namedRegisters()
    val checked = box[3]
    controlShape(checked <= 255, "the Also delete for box's start is out of a result's reach")
    val start = (set - 1 downTo label + 1).firstOrNull { body[it].writes(checked) }
    controlShape(start != null && body[start].opcode in ALSO_DELETE_CONSTS && (body[start] as NarrowLiteralInstruction).narrowLiteral == 0,
        "Telegram no longer starts the Also delete for box unchecked")
    controlShape(method.readsAfter(set, checked).isEmpty(), "Telegram reads the Also delete for box's start again")

    // The box's listener: built with the dialog's flag, then set on the box.
    val listen = (set + 1 until body.size).firstOrNull { i ->
        body[i].call()?.let { it.name == "setOnClickListener" && it.parameterTypes.map(Any::toString) == listOf("Landroid/view/View\$OnClickListener;") } == true
    }
    controlShape(listen != null, "the Also delete for box has no click listener")
    val listener = body[listen!!].namedRegisters()[1]
    val init = (listen - 1 downTo set + 1).firstOrNull { i ->
        body[i].opcode in ALSO_DELETE_INITS && body[i].call()?.name == "<init>" && body[i].namedRegisters().firstOrNull() == listener
    }
    controlShape(init != null, "the Also delete for box's listener is no longer built beside it")
    val made = body[init!!].call()!!
    val params = made.parameterTypes.map(Any::toString)
    val slot = params.indices.filter { params[it] == ALSO_DELETE_FLAG }.controlSingle("the Also delete for flag")
    val flag = body[init].namedRegisters()[1 + params.take(slot).sumOf { if (it == "J" || it == "D") 2 else 1 }]
    controlShape(flow.keepsBetween(set, init, flag), "the Also delete for flag changes between the box and its listener")
    val cell = body[set].call()!!.definingClass
    val click = tgClassDefByOrNull(made.origDefiningClass)?.methods?.firstOrNull {
        it.name == "onClick" && it.parameterTypes.map(Any::toString) == listOf("Landroid/view/View;")
    }?.controlBody().orEmpty()
    controlShape(click.any { it.opcode == Opcode.APUT_BOOLEAN } &&
        click.any { c -> c.call()?.let { it.definingClass == cell && it.parameterTypes.map(Any::toString) == listOf("Z", "Z") } == true },
        "the Also delete for box no longer flips Telegram's flag")

    // Assembled on a copy first, so a refusal leaves the app untouched.
    MutableMethod(ImmutableMethod.of(method)).addInstructionsAtControlFlowLabel(set, alsoDeleteHook(flag, checked))
    AlsoDeleteCheckedPlan(null, method, set, flag, checked)
} catch (refused: PatchException) {
    AlsoDeleteCheckedPlan(refused.message ?: "the delete messages dialog can't be read")
} catch (failed: RuntimeException) {
    AlsoDeleteCheckedPlan("the delete messages dialog doesn't compile (${failed.javaClass.simpleName}: ${failed.message})")
}

private fun Instruction.isBoxText(): Boolean = (opcode == Opcode.INVOKE_VIRTUAL || opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
    call()?.let { it.origParameterTypes == ALSO_DELETE_BOX_TEXT && it.origReturnType == "V" } == true

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val destination = namedRegisters().firstOrNull() ?: return false
    return destination == register || opcode.setsWideRegister() && destination + 1 == register
}

/** Whether no path from [from] to [to] writes [register] on the way. */
private fun ControlFlow.keepsBetween(from: Int, to: Int, register: Int): Boolean {
    val size = instructions.size
    val ahead = BooleanArray(size)
    val pending = ArrayDeque<Int>()
    (normal[from] + exceptional[from]).forEach { if (!ahead[it]) { ahead[it] = true; pending += it } }
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at == to) continue
        (normal[at] + exceptional[at]).forEach { if (!ahead[it]) { ahead[it] = true; pending += it } }
    }
    if (!ahead[to]) return false
    val into = Array(size) { mutableListOf<Int>() }
    for (i in 0 until size) (normal[i] + exceptional[i]).forEach { into[it] += i }
    val behind = BooleanArray(size)
    into[to].forEach { if (!behind[it]) { behind[it] = true; pending += it } }
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at == from) continue
        into[at].forEach { if (!behind[it]) { behind[it] = true; pending += it } }
    }
    return (0 until size).none { it != from && it != to && ahead[it] && behind[it] && instructions[it].writes(register) }
}
