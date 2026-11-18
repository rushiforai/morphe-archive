/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.translate

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterLiveness
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origName
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val PINNED_BAR_HIDDEN = "$TRANSLATE_BAR->pinnedBarHidden()Z"
internal const val PINNED_BAR_CHANGED = "$TRANSLATE_BAR->pinnedBarChanged(Ljava/lang/Object;)Z"
private const val CHAT_FULL = "Lorg/telegram/tgnet/TLRPC\$ChatFull;"
private const val USER_FULL = "Lorg/telegram/tgnet/TLRPC\$UserFull;"
private const val SET_TAG = "Landroid/view/View;->setTag(Ljava/lang/Object;)V"
/** Telegram keeps the pinned message a person closed in a chat under this and the chat id. */
private const val CLOSED_PIN = "pin_"
/** How many moves and gotos the hide path may take before it calls the hide. 13.2 takes two. */
private const val HIDE_REACH = 6
private val MOVES = setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)
private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
private val CONSTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16)
/** How far before the info check the comment thread read may sit. Plus Messenger asks about the closed pin in between. */
private const val THREAD_REACH = 16

/**
 * Where the chat screen decides whether its pinned message bar shows, or [missing], why this build
 * can't have the switch. [method] is the decision, [head] its first check, which asks whether the
 * chat is a comment thread, [scratch] the register that check loads and nothing reads before, and
 * [hide] the start of Telegram's own path that hides the bar.
 */
internal class PinnedBar(
    val method: MutableMethod?,
    private val head: Int,
    private val scratch: Int,
    private val hide: Int,
    val missing: String?,
) {
    /** A yes from the extension takes Telegram's hide path ahead of every check of the screen's own. */
    fun apply(target: MutableMethod) {
        target.addInstructionsAtControlFlowLabel(head, """
            invoke-static {}, $PINNED_BAR_HIDDEN
            move-result v$scratch
            if-nez v$scratch, :hush_pinned_hidden
        """, ExternalLabel("hush_pinned_hidden", target.getInstruction(hide)))
    }

    /** The hook put into a copy, so a method that can't take it is known before anything changes. */
    fun rehearse(): String? {
        val decision = method ?: return missing
        return try {
            apply(MutableMethod(ImmutableMethod.of(decision)))
            null
        } catch (refused: PatchException) {
            "the pinned message bar's decision can't take the hook (${refused.message})"
        }
    }
}

/**
 * Telegram's chat screen decides on its pinned message bar in one method, and that method is the only
 * place that shows it: it clears the bar's hidden tag and slides it in. The bar starts hidden when
 * it's made. Every reason to keep it hidden (a comment thread's own bar, no chat info yet, nothing
 * pinned, a pin the person closed, search or selection in the top bar) takes one path, which calls the
 * screen's hide and then lays the chat out again, so nothing is left where the bar was. Telegram's
 * checks start by asking whether the chat is a comment thread, then for the chat's or user's info.
 */
internal fun BytecodePatchContext.resolvePinnedBar(screen: String): PinnedBar {
    controlHook(TRANSLATE_BAR, "pinnedBarHidden", emptyList(), "Z")
    controlHook(TRANSLATE_BAR, "pinnedBarChanged", listOf("Ljava/lang/Object;"), "Z")
    requireStatusMethod("hidePinnedBar")
    fun missing(why: String) = PinnedBar(null, -1, -1, -1, why)

    val screenClass = tgMutableClassDefBy(screen)
    val decisions = screenClass.methods.filter { method ->
        val body = method.controlBody()
        body.any { it.controlString() == CLOSED_PIN } && body.indices.any { body.infoChecks(it, screen) }
    }
    val method = decisions.singleOrNull() ?: return missing(if (decisions.isEmpty())
        "the chat screen no longer checks a closed pin and the chat's info in one place" else
        "the chat screen checks a closed pin and the chat's info in ${decisions.size} places")
    val body = method.controlBody()
    val checks = body.indices.filter { body.infoChecks(it, screen) }
    val info = checks.singleOrNull() ?: return missing("the pinned message bar checks the chat's info ${checks.size} times")
    val flow = try {
        ControlFlow.of(method)
    } catch (unreadable: IllegalArgumentException) {
        return missing("the pinned message bar's decision can't be read (${unreadable.message})")
    }
    val hide = flow.normal[info + 3].first()

    // From the hide path's start, past the moves of the animate flag and the gotos, to the screen's
    // hide, which answers whether anything changed and tags the bar hidden. Plus Messenger also sets
    // a number of its own on the way, which the hide doesn't read.
    var at = hide
    var hides = false
    val numbered = mutableSetOf<Int>()
    for (step in 1..HIDE_REACH) {
        val instruction = body.getOrNull(at) ?: break
        if (instruction.opcode in MOVES) { at++; continue }
        if (instruction.opcode in CONSTS) { numbered += (instruction as OneRegisterInstruction).registerA; at++; continue }
        if (instruction.opcode in GOTOS) { at = flow.normal[at].single(); continue }
        val call = instruction.call()
        val hider = screenClass.methods.singleOrNull { it.name == call?.name &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Z") && it.returnType == "Z" }
        hides = instruction.opcode in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE) && call != null &&
            call.definingClass == screen && body.getOrNull(at + 1)?.opcode == Opcode.MOVE_RESULT &&
            instruction.namedRegisters().none { it in numbered } &&
            hider?.controlBody()?.any { it.controlRef() == SET_TAG } == true
        break
    }
    if (!hides) return missing("the pinned message bar's hide path no longer hides it")

    // The comment thread check: the thread message, its null test straight to the info check, then a
    // flag. Telegram asks right before the info check. Plus Messenger loads its closed pin key between
    // the read and the test, and asks about the closed pin before the info check.
    val head = (info - 1 downTo maxOf(0, info - THREAD_REACH)).firstOrNull {
        body[it].opcode == Opcode.IGET_OBJECT && body[it].controlField()?.origType == MESSAGE_OBJECT
    } ?: -1
    val thread = body.getOrNull(head)
    val threadField = thread?.controlField()
    val keyed = body.getOrNull(head + 1)?.controlString() != null
    val test = head + if (keyed) 2 else 1
    if (thread !is TwoRegisterInstruction || thread.opcode != Opcode.IGET_OBJECT || threadField == null || threadField.definingClass != screen ||
        body.getOrNull(test)?.opcode != Opcode.IF_EQZ || (body[test] as OneRegisterInstruction).registerA != thread.registerA ||
        flow.normal[test].first() != info || body.getOrNull(test + 1)?.opcode != Opcode.IGET_BOOLEAN ||
        body.getOrNull(test + 2)?.opcode !in setOf(Opcode.IF_EQZ, Opcode.IF_NEZ) || !keyed && test + 3 != info) {
        return missing("the pinned message bar no longer starts by asking whether the chat is a comment thread")
    }
    val scratch = thread.registerA
    val liveness = RegisterLiveness.of(method)
    if (scratch == thread.registerB || scratch in liveness.liveInto(head)) {
        return missing("the comment thread check's register is still in use where it's loaded")
    }
    // The hook jumps from the read to the hide path, past the key load.
    if (keyed && (body[head + 1] as OneRegisterInstruction).registerA in liveness.liveInto(hide)) {
        return missing("the hide path reads the closed pin key the hook would skip")
    }
    return PinnedBar(method, head, scratch, hide, null)
}

/**
 * Where the chat screen comes back to the front, right after its super onResume, or [missing], why
 * a chat left open behind the settings keeps the bar it had. [free] holds three registers nothing
 * reads from there on: the screen, the answer, and the zero handed to the decision.
 */
internal class PinnedResume(
    val method: MutableMethod?,
    private val at: Int,
    private val free: List<Int>,
    private val decision: MutableMethod?,
    val missing: String?,
) {
    /** A changed answer has the screen decide on its bar again, animated, as Telegram's own callers do. */
    fun apply(target: MutableMethod) {
        val decision = decision!!
        val (screen, answer, zero) = free
        val args = decision.parameterTypes.joinToString("") { if (it.toString() == "Z") ", v$answer" else ", v$zero" }
        val invoke = if (AccessFlags.PRIVATE.isSet(decision.accessFlags)) "invoke-direct" else "invoke-virtual"
        val self = target.implementation!!.registerCount - 1
        target.addInstructionsWithLabels(at, """
            move-object/from16 v$screen, v$self
            invoke-static {v$screen}, $PINNED_BAR_CHANGED
            move-result v$answer
            if-eqz v$answer, :hush_pinned_same
            const/4 v$answer, 0x1
            const/4 v$zero, 0x0
            $invoke {v$screen$args}, ${decision.definingClass}->${decision.name}(${decision.parameterTypes.joinToString("")})V
        """, ExternalLabel("hush_pinned_same", target.getInstruction(at)))
    }

    /** The hook put into a copy, so a method that can't take it is known before anything changes. */
    fun rehearse(): String? {
        val resume = method ?: return missing
        return try {
            apply(MutableMethod(ImmutableMethod.of(resume)))
            null
        } catch (refused: PatchException) {
            "the chat screen's onResume can't take the hook (${refused.message})"
        }
    }
}

/**
 * Telegram decides on the pinned message bar when something about the chat changes, never when the
 * screen comes back, so the switch flipped in settings with a chat open behind them reaches it only
 * when the chat is opened again. The screen's onResume calls its super first. Right after, nothing
 * is held but the screen, so the hook can ask whether the answer changed and run the [decision].
 */
internal fun BytecodePatchContext.resolvePinnedResume(decision: MutableMethod): PinnedResume {
    fun missing(why: String) = PinnedResume(null, -1, emptyList(), null, why)
    if (AccessFlags.STATIC.isSet(decision.accessFlags) || decision.returnType != "V" ||
        decision.parameterTypes.map(CharSequence::toString).sorted() != listOf("I", "Z")) {
        return missing("the pinned message bar's decision no longer takes a step and an animate flag")
    }
    val resume = tgMutableClassDefBy(decision.definingClass).methods.singleOrNull { it.origName == "onResume" &&
        it.parameterTypes.isEmpty() && it.returnType == "V" && !AccessFlags.STATIC.isSet(it.accessFlags) }
        ?: return missing("the chat screen has no onResume of its own")
    val body = resume.controlBody()
    val supers = body.indices.filter { body[it].opcode in SUPER_CALLS && body[it].call()?.let { c -> c.name == "onResume" && c.parameterTypes.isEmpty() } == true }
    val call = supers.singleOrNull() ?: return missing("the chat screen's onResume calls its super ${supers.size} times")
    val at = call + 1
    val flow = try {
        ControlFlow.of(resume)
    } catch (unreadable: IllegalArgumentException) {
        return missing("the chat screen's onResume can't be read (${unreadable.message})")
    }
    if (at >= body.size || flow.normal[call] != listOf(at) || flow.normal.withIndex().any { (i, next) -> i != call && at in next } ||
        flow.exceptional[at].isNotEmpty()) {
        return missing("the chat screen's onResume goes on another way after its super call")
    }
    val self = resume.implementation!!.registerCount - 1
    val live = RegisterLiveness.of(resume).liveInto(at)
    val free = (0 until 16).filter { it !in live && it != self }.take(3)
    if (free.size < 3) return missing("the chat screen's onResume holds too much after its super call")
    try {
        resume.requireThisIntact("Hide translate bar", listOf(at))
    } catch (moved: PatchException) {
        return missing("the chat screen's onResume no longer holds the screen (${moved.message})")
    }
    return PinnedResume(resume, at, free, decision, null)
}

private val SUPER_CALLS = setOf(Opcode.INVOKE_SUPER, Opcode.INVOKE_SUPER_RANGE)

/**
 * Whether instruction [at] starts the check for the chat's info: the chat's, and when it has none,
 * the user's, with no info at all hiding the bar.
 */
private fun List<Instruction>.infoChecks(at: Int, screen: String): Boolean {
    if (at + 3 >= size) return false
    fun read(index: Int, type: String) = this[index].opcode == Opcode.IGET_OBJECT &&
        this[index].controlField()?.let { it.definingClass == screen && it.origType == type } == true
    val register = (this[at] as? OneRegisterInstruction)?.registerA ?: return false
    fun tests(index: Int, opcode: Opcode) = this[index].opcode == opcode && (this[index] as OneRegisterInstruction).registerA == register
    return read(at, CHAT_FULL) && tests(at + 1, Opcode.IF_NEZ) && read(at + 2, USER_FULL) &&
        (this[at + 2] as OneRegisterInstruction).registerA == register && tests(at + 3, Opcode.IF_EQZ)
}
