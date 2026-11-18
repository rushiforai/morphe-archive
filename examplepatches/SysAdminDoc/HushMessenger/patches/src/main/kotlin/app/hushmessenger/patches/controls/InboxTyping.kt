package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Typing shown on a chat in your list, not only inside the chat. Messenger already carries the whole thing as four
 * plugins, the inbox loader that subscribes for it, the store that keeps who's typing, the teardown that drops those
 * subscriptions, and the thread snippet that writes the words over a chat's last message. All four ask Meta's server
 * for the same flag first, and on the builds we patch the server says no, so none of it ever runs.
 */
internal const val INBOX_TYPING = "inbox_typing"

/** The flag all four read, as 587 numbers it. */
internal const val INBOX_TYPING_FLAG = 0x010100eb0000136fL

private const val INBOX_TYPING_CONFIG = "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;"

internal const val INBOX_TYPING_HELPER = "$SETTINGS->inboxTyping(Z)Z"

/** One read of the flag: the move-result that takes the answer, and the register it fills. */
internal class InboxTypingSite(val result: Int, val register: Int)

private fun inboxTypingChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the chat list's typing plugins changed ($detail)")

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Instruction.wide() = (this as? WideLiteralInstruction)?.wideLiteral

private fun Instruction.register() = (this as? OneRegisterInstruction)?.registerA

private fun Instruction.reads(): List<Int> =
    if (this is FiveRegisterInstruction) listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount) else emptyList()

private fun Instruction.method() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun List<Instruction>.loadsInboxTypingFlag() =
    indices.filter { this[it].opcode == Opcode.CONST_WIDE && this[it].wide() == INBOX_TYPING_FLAG }

/**
 * Every read of the flag this switch can answer: the flag loaded into a pair, with nothing but a move or a cast before
 * the config interface's (long) check of it, the answer taken straight into a register, and a branch on that answer
 * right after. The store's read branches the other way than the other three, which changes nothing here: the switch
 * replaces the answer, not the branch. Nothing may land on the branch, since the switch's call goes in front of it.
 */
internal fun Method.inboxTypingSites(): List<InboxTypingSite> {
    val code = code()
    val landings by lazy { jumpTargets() }
    return code.loadsInboxTypingFlag().mapNotNull { at ->
        val flag = code[at].register() ?: return@mapNotNull null
        val read = (at + 1..at + 3).firstOrNull { code.getOrNull(it)?.opcode == Opcode.INVOKE_INTERFACE } ?: return@mapNotNull null
        for (between in at + 1 until read) {
            val step = code[between]
            if (step.opcode !in STEPS) return@mapNotNull null
            if (step.register() == flag || step.register() == flag + 1) return@mapNotNull null
        }
        val call = code[read].method() ?: return@mapNotNull null
        val args = code[read].reads()
        if (call.definingClass != INBOX_TYPING_CONFIG || call.returnType != "Z" ||
            call.parameterTypes.map { it.toString() } != listOf("J") ||
            args.size != 3 || args[1] != flag || args[2] != flag + 1
        ) return@mapNotNull null
        val result = code.getOrNull(read + 1) ?: return@mapNotNull null
        val answer = result.register() ?: return@mapNotNull null
        if (result.opcode != Opcode.MOVE_RESULT) return@mapNotNull null
        val branch = read + 2
        if (code.getOrNull(branch)?.opcode !in BRANCHES || code[branch].register() != answer) return@mapNotNull null
        if (branch in landings) return@mapNotNull null
        InboxTypingSite(read + 1, answer)
    }
}

private val STEPS = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.CHECK_CAST)

private val BRANCHES = setOf(Opcode.IF_EQZ, Opcode.IF_NEZ)

/**
 * Every method that reads the flag, but only while this switch can answer all of them. One read left alone would turn
 * on a part of the feature without the rest, so a build whose reads don't all match gets no hook and the switch stays
 * unapplied. 587 reads it four times, once per plugin.
 */
internal fun findInboxTyping(classes: Iterable<ClassDef>): List<Method> {
    val readers = classes.flatMap { it.methods }.filter { it.code().loadsInboxTypingFlag().isNotEmpty() }
    if (readers.isEmpty()) return emptyList()
    if (readers.any { it.inboxTypingSites().size != it.code().loadsInboxTypingFlag().size }) return emptyList()
    return readers
}

internal fun MutableMethod.validateInboxTyping(): List<InboxTypingSite> =
    inboxTypingSites().takeIf { it.size == code().loadsInboxTypingFlag().size && it.isNotEmpty() }
        ?: inboxTypingChanged("no answerable flag read in ${hookId()}")

/**
 * While the switch is on, every plugin reads the flag as yes, so the inbox subscribes for typing, the store keeps it
 * and the snippet writes it over the chat's last message. Off, Pause and safe mode keep Meta's own answer. The answer
 * is read fresh each time, but Messenger only asks while it sets the plugins up, so the change lands on a restart.
 */
internal fun MutableMethod.injectInboxTyping() {
    for (site in validateInboxTyping().asReversed()) addInstructions(site.result + 1, """
        invoke-static/range {v${site.register} .. v${site.register}}, $INBOX_TYPING_HELPER
        move-result v${site.register}
    """.trimIndent())
}
