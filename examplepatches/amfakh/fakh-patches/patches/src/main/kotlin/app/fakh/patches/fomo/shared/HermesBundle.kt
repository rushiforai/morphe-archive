/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.fomo.shared

import app.morphe.patcher.patch.PatchException
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest

/**
 * A Hermes bytecode bundle (HBC version 98) that can be searched by instruction
 * pattern and rewritten in place.
 *
 * Patterns name strings instead of carrying their ids, and wildcard registers
 * and cache indexes, so they survive a rebuild that renumbers them.
 *
 * @param bytes The bundle, e.g. `assets/index.android.bundle`. Rewritten in place.
 */
internal class HermesBundle(private val bytes: ByteArray) {
    private val buf = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)

    /** Every ASCII string of up to 64 chars, mapped to the ids that spell it. */
    private val stringIds: Map<String, List<Int>>

    init {
        if (buf.getLong(0) != MAGIC || buf.getInt(8) != VERSION) {
            throw PatchException("FOMO: the bundle is not Hermes bytecode version $VERSION.")
        }
        if (!trailer().contentEquals(digest())) {
            throw PatchException("FOMO: the bundle does not end with a SHA-1 of its own bytes.")
        }

        val functions = buf.getInt(40)
        val kinds = buf.getInt(44)
        val identifiers = buf.getInt(48)
        val strings = buf.getInt(52)
        val overflow = buf.getInt(56)

        fun align(pos: Int) = (pos + 3) and 3.inv()
        var pos = align(HEADER_SIZE + functions * FUNCTION_HEADER_SIZE)
        pos = align(pos + kinds * 4)
        pos = align(pos + identifiers * 4)
        val smallTable = pos
        pos = align(smallTable + strings * 4)
        val overflowTable = pos
        val storage = align(overflowTable + overflow * 8)

        val ids = HashMap<String, MutableList<Int>>()
        for (id in 0 until strings) {
            val entry = buf.getInt(smallTable + id * 4)
            val length = entry ushr 24
            if (entry and 1 != 0 || length == OVERFLOW_LENGTH || length > MAX_NAME_LENGTH) continue
            val start = storage + ((entry ushr 1) and 0x7FFFFF)
            ids.getOrPut(String(bytes, start, length, Charsets.ISO_8859_1)) { mutableListOf() }.add(id)
        }
        stringIds = ids
    }

    /** The one id of [name] that fits a 16-bit operand. */
    fun stringId(name: String): Int =
        idsOf(name).singleOrNull { it <= 0xFFFF }
            ?: throw PatchException("FOMO: string '$name' does not have exactly one 16-bit id.")

    private fun idsOf(name: String): List<Int> =
        stringIds[name] ?: throw PatchException("FOMO: string '$name' is not in the bundle.")

    /**
     * Rewrites the single place where [spec] matches, with bytes of the same length.
     *
     * [spec] is whitespace separated: a hex byte matches itself, `??` any byte,
     * `@name` a 1-byte id of that string and `@@name` a 2-byte little-endian one.
     *
     * @param label Names the rewrite in errors.
     * @param build Gets the matched bytes and returns their replacement.
     */
    fun rewrite(label: String, spec: String, build: (ByteArray) -> ByteArray) {
        val steps = spec.trim().split(Regex("\\s+")).map { token ->
            when {
                token == "??" -> Step(1) { true }
                token.startsWith("@@") -> idsOf(token.drop(2)).let { ids -> Step(2) { ids.contains(it) } }
                token.startsWith("@") -> idsOf(token.drop(1)).let { ids -> Step(1) { ids.contains(it) } }
                else -> token.toInt(16).let { byte -> Step(1) { it == byte } }
            }
        }
        val width = steps.sumOf { it.width }

        val matches = (0..bytes.size - SHA1_SIZE - width).filter { start ->
            var at = start
            steps.all { step ->
                val value = if (step.width == 1) bytes[at].toInt() and 0xFF else buf.getShort(at).toInt() and 0xFFFF
                at += step.width
                step.accepts(value)
            }
        }
        val start = matches.singleOrNull()
            ?: throw PatchException("FOMO: '$label' matched ${matches.size} times in the bundle, expected 1.")

        val replacement = build(bytes.copyOfRange(start, start + width))
        check(replacement.size == width) { "FOMO: '$label' replacement is ${replacement.size} bytes, expected $width." }
        replacement.copyInto(bytes, start)
    }

    /** Recomputes the SHA-1 trailer so the rewritten bundle stays self-consistent. */
    fun seal() = digest().copyInto(bytes, bytes.size - SHA1_SIZE)

    private fun trailer(): ByteArray = bytes.copyOfRange(bytes.size - SHA1_SIZE, bytes.size)

    private fun digest(): ByteArray =
        MessageDigest.getInstance("SHA-1").digest(bytes.copyOfRange(0, bytes.size - SHA1_SIZE))

    private class Step(val width: Int, val accepts: (Int) -> Boolean)

    companion object {
        private const val MAGIC = 0x1F1903C103BC1FC6L
        private const val VERSION = 98
        private const val HEADER_SIZE = 128
        private const val FUNCTION_HEADER_SIZE = 12
        private const val SHA1_SIZE = 20
        private const val OVERFLOW_LENGTH = 255
        private const val MAX_NAME_LENGTH = 64

        /** HBC version 98 opcodes the patches emit. */
        const val OP_LOAD_CONST_STRING = 0x90
        const val OP_JMP = 0xAE
        const val OP_JSTRICT_EQUAL_LONG = 0xD4
    }
}
