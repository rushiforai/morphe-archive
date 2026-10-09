/*
 * The composer text watcher anchor is adapted from the ReVanced patch "Disable switching emoji to sticker" (Messenger).
 * GPL-3.0. See NOTICE.
 */
package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val EMOJI_SEARCH = "emoji_search"

/** The mode Messenger asks its emoji and sticker tray for after typing, and the plain mode it asks for otherwise. */
internal const val EMOJI_SEARCH_MODE = "expression_search"
internal const val EMOJI_PLAIN_MODE = "expression"

internal const val EMOJI_SEARCH_HELPER = "$SETTINGS->emojiSearchMode(Ljava/lang/String;)Ljava/lang/String;"

private val EDITABLE_WATCHER = listOf("Landroid/text/Editable;", "Z")

private fun searchChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the composer's emoji search mode call moved ($detail)")

private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

/**
 * The composer's text watcher, `(Editable, boolean)V`. It tells the emoji tray which mode to show after each edit and
 * is the only method that names both "afterTextChanged" and the plain "expression" mode.
 */
internal fun Method.isEmojiSearchWatcher(): Boolean {
    if (returnType != "V" || AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.map { it.toString() } != EDITABLE_WATCHER) return false
    val strings = implementation?.instructions?.mapNotNull { it.string() }?.toSet() ?: return false
    return "afterTextChanged" in strings && EMOJI_PLAIN_MODE in strings
}

/** The one text watcher, or none when more than one method looks like it. */
internal fun findEmojiSearch(classes: Iterable<ClassDef>): List<Method> =
    classes.flatMap { it.methods }.filter { it.isEmojiSearchWatcher() }.let { if (it.size == 1) it else emptyList() }

/**
 * Index of the call that hands the mode to the tray's listener. Both modes meet there:
 *
 *     581:  const-string vS, "expression_search"        580:  const/16 vK, key
 *           invoke-interface {vL, vS}, ...(String)V  <-         invoke-static {vK}, table(I)String
 *           ...                                                 move-result-object vS
 *           const-string vS, "expression"                       invoke-interface {vL, vS}, ...(String)V  <-
 *           goto <the invoke>                                   ...
 *                                                               const-string vS, "expression"
 *                                                               goto <the invoke>
 *
 * 580 reaches the search string through a generated switch table that returns "expression_search" for its key, so the
 * extension compares the string it's handed at run time. The plain path is the only jump into the call, and it already
 * holds the plain mode, so hooking the call from above (the fall-through search path) is enough.
 */
internal fun Method.emojiSearchCall(): Int {
    val code = implementation?.instructions?.toList() ?: searchChanged("no code")
    val plain = code.indices.filter { code[it].string() == EMOJI_PLAIN_MODE }.singleOrNull() ?: searchChanged("plain mode loads")
    val mode = (code[plain] as OneRegisterInstruction).registerA
    val jump = code.getOrNull(plain + 1)
    if (jump?.opcode !in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)) searchChanged("jump after the plain mode")
    val call = code.branchTarget(plain + 1)
    val invoke = code.getOrNull(call) as? FiveRegisterInstruction ?: searchChanged("jump target")
    val callee = (invoke as? ReferenceInstruction)?.reference as? MethodReference ?: searchChanged("call target")
    if (call < 1 || call > plain || (invoke.opcode != Opcode.INVOKE_INTERFACE && invoke.opcode != Opcode.INVOKE_VIRTUAL) ||
        invoke.registerCount != 2 || invoke.registerD != mode || callee.returnType != "V" ||
        callee.parameterTypes.map { it.toString() } != listOf("Ljava/lang/String;")) searchChanged("mode call")
    // The search mode arrives by falling through: a literal in 581, or a switch-table lookup answer in 580.
    val before = code[call - 1]
    val search = when {
        before.string() == EMOJI_SEARCH_MODE -> true
        before.opcode == Opcode.MOVE_RESULT_OBJECT -> {
            val lookup = (code.getOrNull(call - 2) as? ReferenceInstruction)?.reference as? MethodReference
            code[call - 2].opcode == Opcode.INVOKE_STATIC && lookup?.returnType == "Ljava/lang/String;" &&
                lookup.parameterTypes.map { it.toString() } == listOf("I")
        }
        else -> false
    }
    if (!search || (before as? OneRegisterInstruction)?.registerA != mode) searchChanged("search mode")
    // Only the plain path may jump straight to the call, or the search value could skip the extension.
    val entries = code.indices.filter { code[it] is OffsetInstruction && code.branchTarget(it) == call }
    if (entries != listOf(plain + 1)) searchChanged("other jumps into the call")
    // The helper is a plain invoke, which reaches v15 at most. The call's own registers already fit that.
    if (mode > 15) searchChanged("register out of range")
    return call
}

internal fun MutableMethod.validateEmojiSearch(): Int {
    if (!isEmojiSearchWatcher()) throw PatchException("Messenger controls: unexpected composer text watcher ${hookId()}")
    return emojiSearchCall()
}

/**
 * Passes the mode through the extension just before the tray hears it. With the switch on, the search mode becomes
 * the plain one, so typing never moves the tray to search results. Off, Pause and safe mode hand it back unchanged.
 */
internal fun MutableMethod.injectEmojiSearch() {
    val call = validateEmojiSearch()
    val mode = (implementation!!.instructions.elementAt(call) as FiveRegisterInstruction).registerD
    addInstructions(call, """
        invoke-static {v$mode}, $EMOJI_SEARCH_HELPER
        move-result-object v$mode
    """.trimIndent())
}
