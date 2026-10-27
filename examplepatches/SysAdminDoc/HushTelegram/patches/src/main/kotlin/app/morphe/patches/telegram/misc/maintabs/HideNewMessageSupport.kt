/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.maintabs

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireParameterIntact
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val NEW_MESSAGE_BUTTON = "$MAIN_TABS->newMessageButton(Ljava/lang/Object;)V"
internal const val NEW_MESSAGE_DONE = "$MAIN_TABS->newMessageDone(Ljava/lang/Object;)V"
internal const val NEW_MESSAGE_VISIBILITY = "$MAIN_TABS->newMessageVisibility(Ljava/lang/Object;I)V"
internal const val COMPOSE_ICON = "Lorg/telegram/messenger/R\$drawable;->filled_fab_compose_32:I"
internal const val DONE_ICON = "Lorg/telegram/messenger/R\$drawable;->floating_check:I"
internal const val NEW_MESSAGE_TITLE = "Lorg/telegram/messenger/R\$string;->NewMessageTitle:I"

/**
 * The chat list's round pencil button, or [missing], why this build can't have the switch.
 * [at] is the instruction in [method] that starts the pencil's look, and [register] holds the
 * button there.
 */
internal class NewMessageButton(
    val method: MutableMethod?, val at: Int, val register: Int, val missing: String?,
    val doneAt: Int = 0, val doneRegister: Int = 0,
    val animation: MutableMethod? = null, val visibilityAt: Int = 0,
) {
    /** The same edit on a copy, so a smali problem refuses before the app is touched. */
    fun rehearse() {
        if (method != null) {
            insert(MutableMethod(ImmutableMethod.of(method)))
            visibility(MutableMethod(ImmutableMethod.of(animation!!)))
        }
    }

    fun apply() {
        if (method != null) {
            insert(method)
            visibility(animation!!)
        }
    }

    private fun insert(target: MutableMethod) {
        for ((index, view, hook) in listOf(Triple(at, register, NEW_MESSAGE_BUTTON), Triple(doneAt, doneRegister, NEW_MESSAGE_DONE))
            .sortedByDescending { it.first }) {
            target.addInstructionsAtControlFlowLabel(index, "invoke-static/range {v$view .. v$view}, $hook")
        }
    }

    private fun visibility(target: MutableMethod) {
        val (view, value) = target.controlBody()[visibilityAt].namedRegisters()
        target.replaceInstruction(visibilityAt, "invoke-static {v$view, v$value}, $NEW_MESSAGE_VISIBILITY")
    }
}

/**
 * The chat list sets its round button's picture from one method: the check mark while choosing
 * chats, the pencil the rest of the time. The pencil's branch is the only place that loads the
 * compose icon. Register that instance, clear its registration on the Done branch, and guard its
 * later animation visibility writes. No Android View method or unrelated widget is patched.
 */
internal fun BytecodePatchContext.resolveNewMessageButton(): NewMessageButton {
    controlHook(MAIN_TABS, "newMessageButton", listOf("Ljava/lang/Object;"), "V")
    controlHook(MAIN_TABS, "newMessageDone", listOf("Ljava/lang/Object;"), "V")
    controlHook(MAIN_TABS, "newMessageVisibility", listOf("Ljava/lang/Object;", "I"), "V")
    fun missing(why: String) = NewMessageButton(null, 0, 0, why)

    val found = mutableListOf<Pair<MutableMethod, Int>>()
    forEachClassMentioning(Mention.allReferences(listOf(COMPOSE_ICON, NEW_MESSAGE_TITLE))) { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        mutableClassDefBy(cls.type).methods.forEach { m ->
            if (AccessFlags.STATIC.isSet(m.accessFlags) || m.returnType != "V" || m.parameterTypes.isNotEmpty()) return@forEach
            val body = m.controlBody()
            val icons = body.indices.filter { body[it].opcode == Opcode.SGET && body[it].controlRef() == COMPOSE_ICON }
            if (icons.size == 1 && body.any { it.controlRef() == NEW_MESSAGE_TITLE }) found += m to icons.single()
        }
    }
    if (found.size != 1) return missing("the chat list no longer sets its new message button in one place (${found.size})")
    val (method, icon) = found.single()
    val body = method.controlBody()
    val set = body.getOrNull(icon + 1)
    val call = set?.call()
    if (set?.opcode != Opcode.INVOKE_VIRTUAL || call?.name != "setImageResource" || call.parameterTypes.map(CharSequence::toString) != listOf("I")) {
        return missing("the new message button's picture is no longer set right after the icon loads")
    }
    val button = set.namedRegisters().first()
    if (button == body[icon].namedRegisters().first()) return missing("the new message button shares a register with its icon")
    if (button > 255) return missing("the new message button sits in a register a call can't name")
    val flow = ControlFlow.of(method)
    fun buttonField(at: Int, register: Int): String? {
        val read = reachingWrite(flow, at, register) ?: return null
        val field = body[read].controlField() ?: return null
        return field.toString().takeIf {
            body[read].opcode == Opcode.IGET_OBJECT && field.definingClass == method.definingClass &&
                field.type == call.definingClass && body[read].namedRegisters()[1] == method.localRegisterCount()
        }
    }
    val field = buttonField(icon, button)
        ?: return missing("the compose icon no longer belongs to the chat list's own button")
    val done = body.indices.filter { body[it].opcode == Opcode.SGET && body[it].controlRef() == DONE_ICON }.singleOrNull()
        ?: return missing("the chat list no longer sets one Done button role")
    val doneSet = body.getOrNull(done + 1)
    val doneView = doneSet?.namedRegisters()?.firstOrNull()
    if (doneSet?.opcode != Opcode.INVOKE_VIRTUAL || doneSet.controlRef() != set.controlRef() || doneView == null ||
        doneView > 255 || buttonField(done, doneView) != field) {
        return missing("the Done role no longer belongs to the compose button")
    }

    if (classDefByOrNull(call.definingClass) == null) return missing("the compose button's class is missing")
    val buttonClass = mutableClassDefBy(call.definingClass)
    val animations = buttonClass.methods.filter { m ->
        if (!AccessFlags.STATIC.isSet(m.accessFlags) || m.returnType != "V" ||
            m.parameterTypes.map(CharSequence::toString) != listOf("Landroid/view/View;", "F")) return@filter false
        val instructions = m.controlBody()
        if (instructions.isEmpty()) return@filter false
        val view = m.parameterRegisterNumber(0)
        listOf("setAlpha(F)V", "setScaleX(F)V", "setScaleY(F)V", "setVisibility(I)V").all { setter ->
            val writes = instructions.indices.filter { instructions[it].controlRef() == "Landroid/view/View;->$setter" }
            writes.size == 1 && writes.single().let { index ->
                instructions[index].opcode == Opcode.INVOKE_VIRTUAL && instructions[index].namedRegisters().first() == view
            }
        }
    }
    val animation = animations.singleOrNull()
        ?: return missing("the compose button no longer has one native visibility animator (${animations.size})")
    val animationRef = "${animation.definingClass}->${animation.name}(Landroid/view/View;F)V"
    val callbacks = buttonClass.methods.filter { m ->
        val parameters = m.parameterTypes.map(CharSequence::toString)
        if (AccessFlags.STATIC.isSet(m.accessFlags) || m.returnType != "V" || parameters.size != 4 ||
            parameters.take(3) != listOf("I", "F", "F") || !parameters[3].startsWith("L")) return@filter false
        val instructions = m.controlBody()
        if (instructions.isEmpty()) return@filter false
        val self = m.localRegisterCount()
        val factor = m.parameterRegisterNumber(1)
        instructions.indices.count { index ->
            instructions[index].opcode == Opcode.INVOKE_STATIC && instructions[index].controlRef() == animationRef &&
                instructions[index].namedRegisters() == listOf(self, factor)
        } == 1
    }
    if (callbacks.size != 1) return missing("the compose button no longer animates its own visibility once (${callbacks.size})")
    val visibilityAt = animation.controlBody().indexOfFirst { it.controlRef() == "Landroid/view/View;->setVisibility(I)V" }
    try {
        method.requireThisIntact("new message role", listOf(icon, done))
        animation.requireParameterIntact("new message visibility", 0, listOf(visibilityAt))
        val callback = callbacks.single()
        val instructions = callback.controlBody()
        val self = callback.localRegisterCount()
        val at = instructions.indices.filter { index ->
            instructions[index].controlRef() == animationRef && instructions[index].namedRegisters().first() == self
        }
        callback.requireThisIntact("new message animation", at)
        callback.requireParameterIntact("new message animation", 1, at)
    } catch (changed: PatchException) {
        return missing("the compose animation or role no longer keeps its original view and factor")
    }
    if (animation.controlBody()[visibilityAt].namedRegisters().any { it > 15 }) {
        return missing("the compose visibility write sits beyond the hook's registers")
    }
    return NewMessageButton(method, icon, button, null, done, doneView, animation, visibilityAt)
}

/**
 * The one write of [register] that reaches [use] on every path in, walking predecessors past
 * branches and handlers, or null when none or several do. A textually nearer write on a branch
 * that returns first never counts, unlike [defined].
 */
private fun reachingWrite(flow: ControlFlow, use: Int, register: Int): Int? {
    val predecessors = Array(flow.instructions.size) { mutableListOf<Int>() }
    for (index in flow.instructions.indices) for (next in flow.normal[index] + flow.exceptional[index]) predecessors[next] += index
    val pending = ArrayDeque(predecessors[use])
    val visited = mutableSetOf<Int>()
    val writes = mutableSetOf<Int>()
    while (pending.isNotEmpty()) {
        val index = pending.removeFirst()
        if (!visited.add(index)) continue
        val instruction = flow.instructions[index]
        val destination = instruction.namedRegisters().firstOrNull()
        val writesIt = instruction.opcode.setsRegister() &&
            (destination == register || instruction.opcode.setsWideRegister() && destination?.plus(1) == register)
        if (writesIt) writes += index else if (predecessors[index].isEmpty()) return null else pending.addAll(predecessors[index])
    }
    return writes.singleOrNull()
}
