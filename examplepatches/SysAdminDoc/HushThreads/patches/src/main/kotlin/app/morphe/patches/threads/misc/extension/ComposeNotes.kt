/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 456 (2026-11-18).
 */
package app.morphe.patches.threads.misc.extension

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.TreeSet
import java.util.WeakHashMap

/*
 * Up to 455 every composable carried a source note, `<function> (<File>.kt:<line>)`, as a string
 * handed to Compose's trace call, next to the group's key. 456 strips the strings and keeps the
 * call with the key alone:
 *
 *     const v0, <key>
 *     invoke-static { v0 }, <trace start>(I)V
 *
 * compose-notes.tsv holds the notes the patches and their tests name, with the key each had in
 * 455, or the key read off the same method in a later build where its file changed. The Compose
 * compiler derives a key from its source file, so a key survives only while Meta leaves that file
 * alone: a note missing from the table is one whose file changed, and whoever needs it finds the
 * new key by reading the method and adds a row. The line in a moved row's note is still 455's.
 */

private const val NOTES_FILE = "compose-notes.tsv"

private object ComposeNoteTable {
    val notes: Map<Int, String> by lazy {
        val stream = ComposeNoteTable::class.java.getResourceAsStream(NOTES_FILE)
            ?: throw PatchException("The Compose note table $NOTES_FILE is missing from the patches")
        stream.bufferedReader(Charsets.UTF_8).useLines { lines ->
            lines.filter { it.isNotEmpty() }.associate { line ->
                val tab = line.indexOf('\t')
                java.lang.Long.parseLong(line.substring(0, tab), 16).toInt() to line.substring(tab + 1)
            }
        }
    }
}

/** A key handed to a one-int static void call, and that call. */
internal data class TraceCall(val key: Int, val callee: String)

/** The note Threads compiled under [key], when the table knows it. */
internal fun composeNote(key: Int): String? = ComposeNoteTable.notes[key]

/** Every key whose note starts with [prefix]. */
internal fun composeNoteKeys(prefix: String): List<Int> =
    ComposeNoteTable.notes.filterValues { it.startsWith(prefix) }.keys.sorted()

/** What [load] and the instruction after it pass to a one-int static void call, when they do. */
private fun traceCall(load: Instruction, call: Instruction): TraceCall? {
    if (load.opcode != Opcode.CONST && load.opcode != Opcode.CONST_HIGH16) return null
    val register = (load as OneRegisterInstruction).registerA
    val passes = when (call.opcode) {
        Opcode.INVOKE_STATIC -> (call as FiveRegisterInstruction).let { it.registerCount == 1 && it.registerC == register }
        Opcode.INVOKE_STATIC_RANGE -> (call as RegisterRangeInstruction).let { it.registerCount == 1 && it.startRegister == register }
        else -> false
    }
    if (!passes) return null
    val callee = call.getReference<MethodReference>() ?: return null
    if (callee.returnType != "V" || callee.parameterTypes.singleOrNull()?.toString() != "I") return null
    return TraceCall((load as NarrowLiteralInstruction).narrowLiteral, "${callee.definingClass}->${callee.name}(I)V")
}

/** Runs [action] on every trace-shaped call here, with the index of the instruction loading its key. */
private inline fun Iterable<Instruction>.forEachTraceCall(action: (Int, TraceCall) -> Unit) {
    var load: Instruction? = null
    var index = -1
    for (instruction in this) {
        index++
        val previous = load
        load = instruction
        if (previous != null) traceCall(previous, instruction)?.let { action(index - 1, it) }
    }
}

/** The trace call whose key is loaded at [index], when there is one. */
internal fun List<Instruction>.traceCallAt(index: Int): TraceCall? =
    if (index < 0 || index + 1 >= size) null else traceCall(this[index], this[index + 1])

/** The note whose key is loaded at [index], when one is. */
internal fun List<Instruction>.noteAt(index: Int): String? = traceCallAt(index)?.let { composeNote(it.key) }

/** Where a key of a note starting with [prefix] is loaded, in order. */
internal fun Iterable<Instruction>.noteSites(prefix: String): List<Int> = buildList {
    forEachTraceCall { index, call ->
        if (composeNote(call.key)?.startsWith(prefix) == true) add(index)
    }
}

/** Where the first key of a note starting with [prefix] is loaded, or -1. */
internal fun Iterable<Instruction>.indexOfNote(prefix: String): Int {
    forEachTraceCall { index, call ->
        if (composeNote(call.key)?.startsWith(prefix) == true) return index
    }
    return -1
}

/** Whether this method carries a note starting with [prefix]. */
internal fun Method.holdsNote(prefix: String): Boolean =
    implementation?.instructions?.let { it.indexOfNote(prefix) >= 0 } == true

/**
 * The call this method opens its trace sections with. A section's end goes through a call of the
 * same shape with another key, so the call is the one a known note uses or, when this method
 * holds none, the first one behind Compose's is-tracing check.
 */
internal fun List<Instruction>.traceStart(): String? {
    forEachTraceCall { _, call ->
        if (composeNote(call.key) != null) return call.callee
    }
    forEachTraceCall { index, call ->
        if (isBehindTracingCheck(index)) return call.callee
    }
    return null
}

/** Whether the key load at [index] runs only past `if (isTracing())`. */
private fun List<Instruction>.isBehindTracingCheck(index: Int): Boolean {
    if (index < 3) return false
    if (this[index - 1].opcode != Opcode.IF_EQZ || this[index - 2].opcode != Opcode.MOVE_RESULT) return false
    val check = this[index - 3]
    if (check.opcode != Opcode.INVOKE_STATIC) return false
    val callee = check.getReference<MethodReference>() ?: return false
    return callee.returnType == "Z" && callee.parameterTypes.isEmpty()
}

private val notedClasses = WeakHashMap<BytecodePatchContext, Map<String, Set<String>>>()

/** Which classes outside the extension carry each note, from one read of the whole app. */
private fun BytecodePatchContext.noteHolders(): Map<String, Set<String>> {
    val holders = HashMap<String, MutableSet<String>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        classDef.methods.forEach { method ->
            method.implementation?.instructions?.forEachTraceCall { _, call ->
                composeNote(call.key)?.let { holders.getOrPut(it) { TreeSet() } += classDef.type }
            }
        }
    }
    return holders
}

/** The classes outside the extension carrying a note that starts with [prefix], in a stable order. */
internal fun BytecodePatchContext.classesNoted(prefix: String): List<ClassDef> {
    val holders = synchronized(notedClasses) { notedClasses.getOrPut(this) { noteHolders() } }
    return holders.filterKeys { it.startsWith(prefix) }.values.flatten().toSortedSet().map { classDefBy(it) }
}
