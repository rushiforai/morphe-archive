package dev.twitchpatches.patches.twitch.shared.hermes

import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest

internal class HermesBundle(val bytes: ByteArray) {
    data class Function(val id: Int, val offset: Int, val size: Int, val name: Int, val params: Int)
    val functions: List<Function>
    val strings: List<String>
    val global: Int
    private val literals: Int
    private val buffer = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)

    init {
        require(bytes.size in 148..64 * 1024 * 1024) { "Hermes bundle: invalid size." }
        require(buffer.getLong(0) == 0x1f1903c103bc1fc6L && word(8) == 98) {
            "Modern Twitch hooks require the inspected Hermes 98 execution format."
        }
        require(word(32) == bytes.size) { "Hermes bundle: length mismatch." }
        val digest = MessageDigest.getInstance("SHA-1").digest(bytes.copyOfRange(0, bytes.size - 20))
        require(digest.contentEquals(bytes.copyOfRange(bytes.size - 20, bytes.size))) {
            "Hermes bundle: footer hash mismatch. Use an unmodified original."
        }
        global = word(36)
        val count = word(40)
        require(count in 1..100000 && global in 0 until count)
        functions = (0 until count).map { id ->
            val at = 128 + id * 12
            val first = word(at)
            val second = word(at + 4)
            val flags = byte(at + 11)
            if (flags and 32 != 0) {
                val large = (first and 0x1ffffff) or ((second ushr 14 and 255) shl 24)
                Function(id, word(large), word(large + 12), word(large + 16), word(large + 4))
            } else Function(id, first and 0x1ffffff, second and 0x3fff,
                second ushr 14 and 255, first ushr 25 and 31)
        }
        var cursor = aligned(128 + count * 12)
        cursor = aligned(cursor + word(44) * 4) // String kinds.
        cursor = aligned(cursor + word(48) * 4) // Identifier hashes.
        val table = cursor
        val stringCount = word(52)
        require(stringCount in 1..400000)
        cursor = aligned(cursor + stringCount * 4)
        val overflow = cursor
        cursor = aligned(cursor + word(56) * 8)
        val storage = cursor
        val storageSize = word(60)
        literals = aligned(storage + storageSize)
        require(storageSize >= 0 && storage.toLong() + storageSize <= bytes.size - 20)
        strings = (0 until stringCount).map { id ->
            val entry = word(table + id * 4)
            val utf16 = entry and 1 != 0
            var offset = entry ushr 1 and 0x7fffff
            var length = entry ushr 24
            if (length == 255) {
                require(offset < word(56))
                length = word(overflow + offset * 8 + 4)
                offset = word(overflow + offset * 8)
            }
            val size = length.toLong() * if (utf16) 2 else 1
            require(offset >= 0 && size >= 0 && offset.toLong() + size <= storageSize)
            String(bytes, storage + offset, size.toInt(), if (utf16) Charsets.UTF_16LE else Charsets.ISO_8859_1)
        }
        functions.forEach { fn ->
            require(fn.name in strings.indices && fn.params >= 1 && fn.offset >= 128 && fn.size >= 0 &&
                fn.offset.toLong() + fn.size <= bytes.size - 20) { "Hermes function header is invalid." }
        }
    }

    fun instructions(fn: Function): List<HermesInstruction> = HermesOpcodes.decode(bytes, fn.offset, fn.size)
    fun objectLiteral(shape: Int, offset: Int): Map<String, Any?> {
        val keys = aligned(literals + word(80))
        val shapes = aligned(keys + word(84))
        return HermesLiterals(bytes, strings).objectAt(literals, word(80), keys, word(84), shapes, word(88), shape, offset)
    }
    fun integerArray(offset: Int, count: Int): List<Int> {
        require(count in 0..4096 && offset >= 0 && offset < word(80))
        var cursor = literals + offset
        val end = literals + word(80)
        val values = mutableListOf<Int>()
        while (values.size < count) {
            require(cursor < end)
            val tag = byte(cursor++)
            val type = tag ushr 4 and 7
            var length = tag and 15
            if (tag and 128 != 0) { require(cursor < end); length = length * 256 + byte(cursor++) }
            require(type == 7 && length > 0 && values.size + length <= count && cursor + length * 4 <= end) {
                "Modern Twitch: expected a bounded integer dependency array."
            }
            repeat(length) { values.add(word(cursor)); cursor += 4 }
        }
        return values
    }
    private fun word(at: Int): Int {
        require(at >= 0 && at.toLong() + 4 <= bytes.size - 20) { "Hermes table exceeds bundle bounds." }
        return buffer.getInt(at)
    }
    private fun byte(at: Int): Int = bytes[at].toInt() and 255
    private fun aligned(value: Int): Int = (value + 3) and -4
}
