/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 455 (2026-11-12).
 */
package app.morphe.patches.threads.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.threads.comments.PERMALINK_REPOSITORY
import app.morphe.patches.threads.comments.RepliesParseFingerprint
import app.morphe.patches.threads.comments.responseListSite
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.util.ControlFlow
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Hide suggested users"

/** What an opened post's page of replies reads each of its suggested threads as. */
internal const val RELATED_THREAD = "Lcom/instagram/api/schemas/RelatedThreadIntf;"

internal const val SUGGESTED_THREADS = "$EXTENSION_PACKAGE/comments/SuggestedThreads;"
internal const val RELATED_THREADS_CALL = "$SUGGESTED_THREADS->relatedThreads(Ljava/util/List;)Ljava/util/List;"

/**
 * Where the parse of an opened post's page of replies reads the page's suggested threads: in
 * [method], the call at [read] answers the list, and the `move-result-object` after it puts it in [list].
 */
internal class RelatedThreadsRead(val method: MutableMethod, val read: Int, val list: Int)

/**
 * Finds where an opened post reads the suggested threads Threads draws under its replies.
 *
 * Each page of replies Threads loads for an opened post comes with two lists: the replies, and the
 * related threads it shows as cards below them under a header of its own. The parse Filter comments
 * hooks reads both, one after the other, and walks each one, casting every entry of the second to
 * [RELATED_THREAD]. That cast tells the lists apart, so the read has to be the only one of its shape,
 * with nothing branching onto the instruction after it, or the patch refuses.
 */
internal fun BytecodePatchContext.relatedThreadsRead(): RelatedThreadsRead {
    val method = RepliesParseFingerprint.method
    val read = method.responseListSite(RELATED_THREAD, PATCH, "suggested threads")
    val list = (method.implementation!!.instructions.elementAt(read + 1) as OneRegisterInstruction).registerA
    return RelatedThreadsRead(method, read, list)
}

/**
 * Hands the list to the extension right after it's read, and walks what comes back. Call only with
 * what [relatedThreadsRead] found. `move-result-object` writes up to v255, so the call is a range call.
 */
internal fun hookRelatedThreads(read: RelatedThreadsRead) {
    read.method.addInstructions(
        read.read + 2,
        """
            invoke-static/range { v${read.list} .. v${read.list} }, $RELATED_THREADS_CALL
            move-result-object v${read.list}
        """,
    )
}

/**
 * Where the suggested threads Threads fetches apart from an opened post's replies come in: in
 * [method], the `iget-object` at [read] puts the answer's threads in [list].
 */
internal class RelatedThreadsFetch(val method: MutableMethod, val read: Int, val list: Int)

/**
 * The row Threads draws for each suggested thread under an opened post: what the replies parse
 * turns each related thread into, the one static call taking a [RELATED_THREAD].
 */
internal fun Method.relatedThreadRow(): String {
    val body = implementation?.instructions?.toList() ?: throw PatchException("$PATCH: $definingClass->$name has no body")
    return body.mapNotNull { instruction ->
        val call = instruction.getReference<MethodReference>() ?: return@mapNotNull null
        if (instruction.opcode !in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)) return@mapNotNull null
        if (call.parameterTypes.map(CharSequence::toString) != listOf(RELATED_THREAD) || !call.returnType.startsWith("L")) {
            return@mapNotNull null
        }
        call.returnType
    }.singleOrPatchException("$PATCH: the row the opened post's parse makes of a related thread")
}

/**
 * Finds where an opened post takes in the suggested threads Threads fetches on their own.
 *
 * Since 455 the cards under an opened post's replies come from a query of their own rather than
 * the page of replies [relatedThreadsRead] hooks. A collector the permalink repository starts takes
 * each answer (the header's two lines and the threads), builds the same row the replies parse makes
 * of a related thread for each thread, and writes the rows into the post's state, where an answer
 * with no threads clears them. The collector is the one class holding the repository whose `emit`
 * builds that row. The answer is the type its first cast names, and the read is the answer's one
 * List field, walked with each entry cast to what the row is built from. Anything else, or a branch
 * onto the instruction after the read, and the patch refuses.
 */
internal fun BytecodePatchContext.relatedThreadsFetch(): RelatedThreadsFetch {
    val row = RepliesParseFingerprint.method.relatedThreadRow()
    val collectors = mutableListOf<Pair<String, String>>()
    classDefForEach { classDef ->
        if (classDef.fields.none { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == PERMALINK_REPOSITORY }) {
            return@classDefForEach
        }
        classDef.methods.forEach { method ->
            if (method.name != "emit" || method.returnType != OBJECT || method.parameterTypes.size != 2) return@forEach
            val code = method.implementation?.instructions ?: return@forEach
            if (code.any { it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == row }) {
                collectors += classDef.type to method.toString()
            }
        }
    }
    val (type, signature) = collectors.singleOrPatchException("$PATCH: the collector that builds $row rows from fetched suggested threads")
    val method = mutableClassDefBy(type).methods.single { it.toString() == signature }
    val body = method.implementation!!.instructions.toList()
    val answer = body.firstOrNull { it.opcode == Opcode.CHECK_CAST }?.getReference<TypeReference>()?.type
        ?: throw PatchException("$PATCH: $signature never casts what it's handed")
    val read = body.indices.filter { at ->
        val field = body[at].getReference<FieldReference>() ?: return@filter false
        body[at].opcode == Opcode.IGET_OBJECT && field.definingClass == answer && field.type == LIST
    }.singleOrPatchException("$PATCH: the threads $signature reads off $answer")
    val list = (body[read] as TwoRegisterInstruction).registerA
    val source = body.mapNotNull { instruction ->
        val call = instruction.getReference<MethodReference>() ?: return@mapNotNull null
        if (instruction.opcode !in setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE) ||
            call.definingClass != row || call.name != "<init>"
        ) {
            return@mapNotNull null
        }
        call.parameterTypes.firstOrNull()?.toString()
    }.toSet().singleOrPatchException("$PATCH: what $signature builds each $row from")
    val walked = body.entryCast(read, list)
    if (walked != source) throw PatchException("$PATCH: $signature walks $answer's threads as $walked, not $source")
    // The hook goes in front of the instruction after the read. A branch or handler landing there
    // would skip it and hand Threads the threads untouched, so that build is refused.
    val flow = ControlFlow.of(method)
    val entered = flow.normal.indices.any { from ->
        (from != read && read + 1 in flow.normal[from]) || read + 1 in flow.exceptional[from]
    }
    if (entered) throw PatchException("$PATCH: a branch in $signature lands right after the fetched suggested threads")
    return RelatedThreadsFetch(method, read, list)
}

/**
 * What the entries of the list put in [list] at [read] are cast to: the iterator made from it within
 * eight instructions, its next entry within twelve more, and the first cast within eight of that on
 * the entry or on a register a `move-object` copied it into. Null when it isn't walked that way.
 */
internal fun List<Instruction>.entryCast(read: Int, list: Int): String? {
    fun Instruction.callsOn(owner: String, name: String, register: Int): Boolean {
        val call = getReference<MethodReference>() ?: return false
        val first = when (this) {
            is FiveRegisterInstruction -> registerC
            is RegisterRangeInstruction -> startRegister
            else -> return false
        }
        return call.definingClass == owner && call.name == name && first == register
    }
    val iterator = (read + 1 until minOf(size, read + 9)).firstOrNull { this[it].callsOn(LIST, "iterator", list) } ?: return null
    val iterating = (getOrNull(iterator + 1) as? OneRegisterInstruction)?.registerA ?: return null
    val next = (iterator + 1 until minOf(size, iterator + 13))
        .firstOrNull { this[it].callsOn("Ljava/util/Iterator;", "next", iterating) } ?: return null
    val entry = (getOrNull(next + 1) as? OneRegisterInstruction)?.registerA ?: return null
    val holders = mutableSetOf(entry)
    for (at in next + 2 until minOf(size, next + 10)) {
        val instruction = this[at]
        if (instruction.opcode in MOVES && (instruction as TwoRegisterInstruction).registerB in holders) holders += instruction.registerA
        if (instruction.opcode == Opcode.CHECK_CAST && (instruction as OneRegisterInstruction).registerA in holders) {
            return instruction.getReference<TypeReference>()?.type
        }
    }
    return null
}

/**
 * Hands the fetched threads to the extension right after they're read, so with the switch on the
 * collector sees none and clears the cards. Call only with what [relatedThreadsFetch] found.
 */
internal fun hookRelatedThreadsFetch(fetch: RelatedThreadsFetch) {
    fetch.method.addInstructions(
        fetch.read + 1,
        """
            invoke-static/range { v${fetch.list} .. v${fetch.list} }, $RELATED_THREADS_CALL
            move-result-object v${fetch.list}
        """,
    )
}

private const val LIST = "Ljava/util/List;"
private const val OBJECT = "Ljava/lang/Object;"
private val MOVES = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
