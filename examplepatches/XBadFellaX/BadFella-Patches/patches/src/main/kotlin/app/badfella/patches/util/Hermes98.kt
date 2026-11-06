package app.badfella.patches.util

import java.security.MessageDigest

/** A byte edit relative to the matched function's start. */
internal data class Hermes98Edit(val offset: Int, val before: ByteArray, val after: ByteArray)

/** One reviewed whole-function fingerprint and its relative edits. */
internal data class Hermes98Variant(val size: Int, val hash: String, val edits: List<Hermes98Edit>)

/** A reviewed target role. Exactly one function in the table must match one variant. */
internal data class Hermes98Role(val name: String, val functionName: String, val variants: List<Hermes98Variant>)

internal class Hermes98Function(val index: Int, val offset: Int, val size: Int, val nameId: Int)

private const val MAGIC = 0x1f1903c103bc1fc6L
private const val HEADER_SIZE = 128
private const val FUNCTION_HEADER_SIZE = 12
private const val STRING_OVERFLOW_LENGTH = 0xff

/**
 * Reads and patches an HBC98 bundle by whole-function SHA-256 fingerprints and relative edits.
 * No absolute file offset, no whole-bundle input hash and no whole-output hash is assumed.
 */
internal class Hermes98Bundle private constructor(
    private val stock: ByteArray,
    val functions: List<Hermes98Function>,
    private val stringTableOff: Int,
    private val overflowTableOff: Int,
    private val storageOff: Int,
    private val storageSize: Int,
    val stringCount: Int,
    private val overflowCount: Int,
    private val footer: Int,
) {
    companion object {
        fun parse(stock: ByteArray): Hermes98Bundle {
            check(stock.size in 148..(128 * 1024 * 1024)) { "Hermes bundle size is invalid or exceeds 128 MiB" }
            check(longAt(stock, 0) == MAGIC) { "Hermes bytecode magic changed" }
            check(intAt(stock, 8) == 98) { "Hermes bytecode version changed; this app needs review" }
            check(intAt(stock, 32) == stock.size) { "Hermes bundle length is invalid" }
            val footer = stock.size - 20
            check(sha1(stock, 0, footer).contentEquals(stock.copyOfRange(footer, stock.size))) {
                "Hermes bytecode footer is invalid"
            }
            val count = intAt(stock, 40)
            check(count in 1..250_000) { "Hermes function table is invalid or exceeds the review limit" }
            val tableEnd = HEADER_SIZE.toLong() + count.toLong() * FUNCTION_HEADER_SIZE
            check(tableEnd <= footer) { "Hermes function table is truncated" }
            val kindCount = intAt(stock, 44)
            val identifierCount = intAt(stock, 48)
            val stringCount = intAt(stock, 52)
            val overflowCount = intAt(stock, 56)
            val storageSize = intAt(stock, 60)
            check(kindCount in 0..1_000_000 && identifierCount in 0..10_000_000 &&
                stringCount in 1..10_000_000 && overflowCount in 0..10_000_000 && storageSize in 0..stock.size) {
                "Hermes string table counts are invalid"
            }
            val identifierOff = tableEnd + kindCount.toLong() * 4
            val stringTableOff = identifierOff + identifierCount.toLong() * 4
            val overflowTableOff = stringTableOff + stringCount.toLong() * 4
            val storageOff = overflowTableOff + overflowCount.toLong() * 8
            check(storageOff + storageSize <= footer.toLong()) { "Hermes string table is invalid" }

            val functions = List(count) { index ->
                val header = HEADER_SIZE + index * FUNCTION_HEADER_SIZE
                val first = intAt(stock, header)
                val second = intAt(stock, header + 4)
                val third = intAt(stock, header + 8)
                var offset = first and 0x1ffffff
                var size = second and 0x3fff
                var nameId = (second ushr 14) and 0xff
                val flags = stock[header + 11].toInt() and 0xff
                if (flags and 0x20 != 0) {
                    val large = (nameId shl 24) or offset
                    check(large >= tableEnd && large.toLong() + 36 <= footer) { "Hermes overflow header is invalid" }
                    offset = intAt(stock, large)
                    size = intAt(stock, large + 12)
                    nameId = intAt(stock, large + 16)
                }
                check(offset >= tableEnd && size >= 0 && offset.toLong() + size <= footer.toLong()) {
                    "Hermes function bounds are invalid"
                }
                check(nameId in 0 until stringCount) { "Hermes function name reference is invalid" }
                Hermes98Function(index, offset, size, nameId)
            }
            return Hermes98Bundle(
                stock, functions, stringTableOff.toInt(), overflowTableOff.toInt(), storageOff.toInt(),
                storageSize, stringCount, overflowCount, footer,
            )
        }
    }

    val storageOffset: Int get() = storageOff

    private fun entryValue(id: Int): Int {
        check(id in 0 until stringCount) { "Hermes string reference is invalid" }
        return intAt(stock, stringTableOff + id * 4)
    }

    private fun entryIsUtf16(id: Int) = entryValue(id) and 1 == 1

    fun entryOffset(id: Int): Int {
        check(id in 0 until stringCount) { "Hermes string reference is invalid" }
        return stringTableOff + id * 4
    }

    private fun entryIsOverflow(id: Int) = (entryValue(id) ushr 24) and 0xff == STRING_OVERFLOW_LENGTH

    private fun entryLength(id: Int): Int {
        val entry = entryValue(id)
        return if (entryIsOverflow(id)) {
            val index = (entry ushr 1) and 0x7fffff
            check(index < overflowCount) { "Hermes overflow string reference is invalid" }
            intAt(stock, overflowTableOff + index * 8 + 4)
        } else {
            (entry ushr 24) and 0xff
        }
    }

    fun rawOffset(id: Int): Int {
        val entry = entryValue(id)
        val relative = if (entryIsOverflow(id)) {
            val index = (entry ushr 1) and 0x7fffff
            check(index < overflowCount) { "Hermes overflow string reference is invalid" }
            intAt(stock, overflowTableOff + index * 8)
        } else {
            (entry ushr 1) and 0x7fffff
        }
        val unit = if (entryIsUtf16(id)) 2 else 1
        check(relative >= 0 && relative.toLong() + entryLength(id).toLong() * unit <= storageSize) {
            "Hermes string bounds are invalid"
        }
        return storageOff + relative
    }

    fun string(id: Int): String {
        val length = entryLength(id)
        val start = rawOffset(id)
        val bytes = stock.copyOfRange(start, start + length * if (entryIsUtf16(id)) 2 else 1)
        return bytes.toString(if (entryIsUtf16(id)) Charsets.UTF_16LE else Charsets.ISO_8859_1)
    }

    /** Finds the single ASCII string-table entry whose contents equal [text]. */
    fun findExactEntry(text: String): Int {
        val expected = text.toByteArray(Charsets.ISO_8859_1)
        var found = -1
        for (id in 0 until stringCount) {
            if (entryIsOverflow(id) || entryIsUtf16(id) || entryLength(id) != expected.size) continue
            val start = rawOffset(id)
            if (stock.copyOfRange(start, start + expected.size).contentEquals(expected)) {
                check(found == -1) { "Hermes reviewed string is ambiguous: $text" }
                found = id
            }
        }
        check(found >= 0) { "Hermes reviewed string changed: $text" }
        return found
    }

    /** Finds the single string-table entry containing [text]; the caller receives its id. */
    fun findContainingEntry(text: String): Int {
        val matches = ArrayList<Int>()
        for (id in 0 until stringCount) {
            if (entryIsOverflow(id) || entryLength(id) < text.length) continue
            if (string(id).contains(text)) matches += id
        }
        check(matches.size == 1) { "Hermes reviewed string is missing or ambiguous: $text" }
        return matches.single()
    }

    fun patchRoles(roles: List<Hermes98Role>): ByteArray {
        check(roles.map { it.name }.distinct().size == roles.size) { "Duplicate Hermes role name" }
        val wantedSizes = roles.flatMap { role -> role.variants.map { it.size } }.toSet()
        val matches = HashMap<String, Pair<Hermes98Function, Hermes98Variant>>()
        val usedOffsets = HashMap<Int, String>()
        for (function in functions) {
            if (function.size !in wantedSizes) continue
            val hash = functionHash(function)
            for (role in roles) {
                val variant = role.variants.firstOrNull { it.size == function.size && it.hash == hash } ?: continue
                check(string(function.nameId) == role.functionName) {
                    "Hermes function role changed: ${role.name}; this app needs review"
                }
                check(matches.put(role.name, function to variant) == null) {
                    "Hermes target function is ambiguous: ${role.name}"
                }
                check(usedOffsets.put(function.offset, role.name) == null) {
                    "Hermes target function matches multiple roles: ${role.name}"
                }
            }
        }
        roles.forEach { role -> check(role.name in matches) { "Hermes target code changed: ${role.name}; this app needs review" } }
        val result = stock.copyOf()
        matches.values.forEach { (function, variant) ->
            val ranges = ArrayList<IntRange>()
            variant.edits.forEach { edit ->
                check(edit.offset >= 0 && edit.before.isNotEmpty() && edit.before.size == edit.after.size &&
                    edit.offset <= variant.size - edit.before.size) { "Hermes edit is out of bounds" }
                val range = (function.offset + edit.offset) until (function.offset + edit.offset + edit.before.size)
                check(ranges.none { it.first <= range.last && range.first <= it.last }) { "Overlapping Hermes edits" }
                ranges += range
                check(stock.copyOfRange(range.first, range.last + 1).contentEquals(edit.before)) {
                    "Hermes reviewed edit changed: ${function.index}"
                }
                edit.after.copyInto(result, range.first)
            }
        }
        return result
    }

    /** Rewrites the trailing SHA-1 after all same-length edits have been applied. */
    fun seal(result: ByteArray) {
        check(result.size == stock.size) { "Hermes bundle length changed" }
        sha1(result, 0, footer).copyInto(result, footer)
    }

    private fun functionHash(function: Hermes98Function): String {
        val digest = MessageDigest.getInstance("SHA-256")
        digest.update(stock, function.offset, function.size)
        return digest.digest().joinToString("") { "%02x".format(it) }
    }
}

internal fun hexBytes(value: String): ByteArray {
    check(value.length % 2 == 0 && value.all { Character.digit(it, 16) >= 0 }) { "Invalid hex bytes" }
    return ByteArray(value.length / 2) { index ->
        ((Character.digit(value[index * 2], 16) shl 4) or Character.digit(value[index * 2 + 1], 16)).toByte()
    }
}

internal fun writeIntLe(target: ByteArray, offset: Int, value: Int) {
    check(offset >= 0 && offset + 4 <= target.size) { "Integer write is out of bounds" }
    target[offset] = value.toByte()
    target[offset + 1] = (value ushr 8).toByte()
    target[offset + 2] = (value ushr 16).toByte()
    target[offset + 3] = (value ushr 24).toByte()
}

private fun intAt(bytes: ByteArray, offset: Int): Int {
    check(offset >= 0 && offset + 4 <= bytes.size) { "Hermes read is out of bounds" }
    return (bytes[offset].toInt() and 0xff) or
        ((bytes[offset + 1].toInt() and 0xff) shl 8) or
        ((bytes[offset + 2].toInt() and 0xff) shl 16) or
        ((bytes[offset + 3].toInt() and 0xff) shl 24)
}

private fun longAt(bytes: ByteArray, offset: Int): Long {
    check(offset >= 0 && offset + 8 <= bytes.size) { "Hermes read is out of bounds" }
    return (intAt(bytes, offset).toLong() and 0xffffffffL) or (intAt(bytes, offset + 4).toLong() shl 32)
}

private fun sha1(bytes: ByteArray, offset: Int, length: Int): ByteArray =
    MessageDigest.getInstance("SHA-1").apply { update(bytes, offset, length) }.digest()
