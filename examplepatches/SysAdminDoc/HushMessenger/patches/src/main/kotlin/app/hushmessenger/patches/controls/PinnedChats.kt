package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** How many chats Messenger lets you pin above the chat list. */
internal const val PINNED_CHATS = "pinned_chats"

/**
 * The config number Messenger reads its pinned chat limit from. 585 dropped the getter 584 had and reads it in place
 * wherever the pinned count is compared with it: the Pin row's check before a pin, the recount after one, the chat
 * list's fetch of pinned chats and the thread details' Pin state.
 */
internal const val PINNED_CHAT_LIMIT_CONFIG = 0x8205ad0002101eL

internal const val PINNED_CHAT_LIMIT_GATE = "$SETTINGS->pinnedChatLimit(I)I"

private fun pinLimitChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the pinned chat limit changed ($detail)")

private fun Method.limitLoads(): List<Int> = implementation?.instructions?.withIndex()
    ?.filter { (_, i) -> i.opcode == Opcode.CONST_WIDE && (i as WideLiteralInstruction).wideLiteral == PINNED_CHAT_LIMIT_CONFIG }
    ?.map { it.index }.orEmpty()

/**
 * Index of the `move-result` that takes the limit, or null when this method doesn't read it that way. The read loads
 * the limit's config id once and hands that register pair straight to a static (Object, J)I config read, whose answer
 * the next instruction takes.
 */
internal fun Method.pinnedChatLimitRead(): Int? {
    val loads = limitLoads()
    if (loads.size != 1) return null
    val code = implementation!!.instructions.toList()
    val at = loads.single()
    val id = (code[at] as OneRegisterInstruction).registerA
    val read = code.getOrNull(at + 1) as? FiveRegisterInstruction ?: return null
    val target = (read as ReferenceInstruction).reference as? MethodReference ?: return null
    if (read.opcode != Opcode.INVOKE_STATIC || target.returnType != "I" ||
        target.parameterTypes.map { it.toString() } != listOf("Ljava/lang/Object;", "J")) return null
    if (read.registerCount != 3 || read.registerD != id || read.registerE != id + 1) return null
    return if (code.getOrNull(at + 2)?.opcode == Opcode.MOVE_RESULT) at + 2 else null
}

/** Every method that reads the limit, when each one reads it that way, or none. */
internal fun findPinnedChatLimit(classes: Iterable<ClassDef>): List<Method> {
    val readers = classes.flatMap { it.methods }.filter { it.limitLoads().isNotEmpty() }
    return if (readers.isNotEmpty() && readers.all { it.pinnedChatLimitRead() != null }) readers else emptyList()
}

internal fun MutableMethod.validatePinnedChatLimit(): Int =
    pinnedChatLimitRead() ?: pinLimitChanged("unexpected method ${hookId()}")

/**
 * Each read hands Messenger's own limit to the extension right after taking it, and keeps what comes back. With the
 * switch on that's a higher number, so every check that asks sees the same one. Off, Pause and safe mode give the
 * number back unchanged.
 */
internal fun MutableMethod.injectPinnedChatLimit() {
    val taken = validatePinnedChatLimit()
    val register = (implementation!!.instructions.elementAt(taken) as OneRegisterInstruction).registerA
    addInstructions(taken + 1, """
        invoke-static/range {v$register .. v$register}, $PINNED_CHAT_LIMIT_GATE
        move-result v$register
    """.trimIndent())
}
