/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.shared.bytecode

/** Returns the first byte offset of [needle] in the receiver, or `null` if absent. */
internal fun ByteArray.indexOf(needle: ByteArray): Int? {
    if (needle.isEmpty() || needle.size > size) return null
    val first = needle[0]
    val lastStart = size - needle.size
    var i = 0
    while (i <= lastStart) {
        if (this[i] == first) {
            var matched = true
            for (j in 1 until needle.size) {
                if (this[i + j] != needle[j]) {
                    matched = false
                    break
                }
            }
            if (matched) return i
        }
        i++
    }
    return null
}

/** Returns every non-overlapping offset where [needle] appears in the receiver. */
internal fun ByteArray.indexOfAll(needle: ByteArray): List<Int> {
    if (needle.isEmpty() || needle.size > size) return emptyList()
    val first = needle[0]
    val lastStart = size - needle.size
    val offsets = mutableListOf<Int>()
    var i = 0
    while (i <= lastStart) {
        if (this[i] == first) {
            var matched = true
            for (j in 1 until needle.size) {
                if (this[i + j] != needle[j]) {
                    matched = false
                    break
                }
            }
            if (matched) {
                offsets += i
                i += needle.size
                continue
            }
        }
        i++
    }
    return offsets
}

private val IDENTIFIER_BYTES: Set<Byte> =
    (('a'..'z') + ('A'..'Z') + ('0'..'9') + listOf('_', '.', '/', '-'))
        .map { it.code.toByte() }
        .toSet()

/** Occurrences of [needle] that start a Dart/C pool entry rather than continue an identifier. */
internal fun ByteArray.indexOfAllAtEntryStart(needle: ByteArray): List<Int> =
    indexOfAll(needle).filter { offset ->
        val previous = if (offset > 0) this[offset - 1] else 0.toByte()
        previous !in IDENTIFIER_BYTES
    }

internal class NeutralisationEdit(val offset: Int, val length: Int, val literal: String)

internal class NeutralisationPlan(
    val edits: List<NeutralisationEdit>,
    val absent: List<String>,
)

/** Plans same-length overwrite edits for overlapping literals (longest first) before writing. */
internal fun ByteArray.planNeutralisations(literals: List<String>): NeutralisationPlan {
    val edits = mutableListOf<NeutralisationEdit>()
    val absent = mutableListOf<String>()
    val covered = HashSet<Int>()

    literals.sortedByDescending { it.length }.forEach { literal ->
        val needle = literal.toByteArray(Charsets.US_ASCII)
        val offsets = indexOfAllAtEntryStart(needle)
        if (offsets.isEmpty()) {
            absent += literal
            return@forEach
        }
        offsets.forEach { offset ->
            val span = (offset until offset + needle.size).toSet()
            when {
                covered.containsAll(span) -> Unit
                covered.any { it in span } -> error(
                    "$literal@$offset partially overlaps an already planned literal",
                )
                else -> {
                    covered += span
                    edits += NeutralisationEdit(offset, needle.size, literal)
                }
            }
        }
    }
    return NeutralisationPlan(edits, absent)
}

/** Applies a [NeutralisationPlan] by filling planned spans with `'Z'` in a copy. */
internal fun ByteArray.applyNeutralisations(plan: NeutralisationPlan): ByteArray {
    val patched = copyOf()
    val filler = 'Z'.code.toByte()
    plan.edits.forEach { edit -> ByteArray(edit.length) { filler }.copyInto(patched, edit.offset) }
    return patched
}
