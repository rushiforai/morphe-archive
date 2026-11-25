package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Hide read receipts' reaction hook: a reaction in a chat sends the Seen held back for it, as a reply does (#223). */
internal const val REACTION_READ = "reaction_read"

/**
 * The two mutations a reaction goes out as. Messenger looks both up by number in one of its Redex string tables, in
 * the one class that sends reactions from every chat, encrypted ones included.
 */
internal val REACTION_MUTATIONS = setOf("react_to_message", "react_to_message_v2")

internal const val REACTION_READ_CALL = "$SETTINGS->reactionSent(Ljava/lang/Object;)V"

/** The reaction mutations [this] names, as a literal or by number in a string table. */
private fun Method.reactionMutations(tables: Map<String, Map<Int, String>>): Set<String> {
    val literals = implementation?.instructions?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }.orEmpty()
    return (literals + tableStrings(tables)).toSet().intersect(REACTION_MUTATIONS)
}

/** A reaction send: an instance method of a thread's key that names exactly one of [REACTION_MUTATIONS]. */
internal fun Method.isReactionSend(tables: Map<String, Map<Int, String>>) =
    !AccessFlags.STATIC.isSet(accessFlags) && !AccessFlags.ABSTRACT.isSet(accessFlags) && implementation != null &&
        returnType == "V" && parameterTypes.firstOrNull()?.toString() == THREAD_KEY_TYPE && reactionMutations(tables).size == 1

/** Both reaction sends, which have to sit in one class, one for each mutation. Empty when Messenger's shape changed. */
internal fun findReactionRead(classes: Iterable<ClassDef>, tables: Map<String, Map<Int, String>>): List<Method> {
    val sends = classes.flatMap { it.methods }.filter { it.isReactionSend(tables) }
    val mutations = sends.map { send -> send.reactionMutations(tables).single() }
    return if (sends.map { it.definingClass }.toSet().size == 1 && mutations.sorted() == REACTION_MUTATIONS.sorted()) sends else emptyList()
}

internal fun MutableMethod.validateReactionRead() {
    if (!isReactionSend(activeStringTables)) {
        throw PatchException("Messenger controls: ${hookId()} isn't a reaction send of a thread's key")
    }
    // The call goes in first, ahead of anything that could jump back to the method's start.
    if (0 in jumpTargets()) throw PatchException("Messenger controls: the reaction send jumps back to its start")
}

/** The chat's key goes to the extension before Messenger sends the reaction. */
internal fun MutableMethod.injectReactionRead() {
    validateReactionRead()
    val thread = parameterRegister(1)
    addInstructions(0, "invoke-static/range {v$thread .. v$thread}, $REACTION_READ_CALL")
}
