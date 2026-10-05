package dev.twitchpatches.patches.twitch.shared.hermes

import java.nio.ByteBuffer
import java.nio.ByteOrder

internal class HermesLiterals(private val bytes: ByteArray, private val strings: List<String>) {
    private val buffer = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
    private data object Undefined

    fun objectAt(values: Int, valuesSize: Int, keys: Int, keysSize: Int, shapes: Int, shapeCount: Int,
        shape: Int, offset: Int): Map<String, Any?> {
        require(shape in 0 until shapeCount && shapes.toLong() + shapeCount.toLong() * 8 <= bytes.size - 20)
        val at = shapes + shape * 8
        val keyOffset = buffer.getInt(at)
        val count = buffer.getInt(at + 4)
        val names = read(keys, keysSize, keyOffset, count).map { require(it is String); it }
        val literals = read(values, valuesSize, offset, count)
        require(names.distinct().size == names.size) { "Hermes literal has duplicate keys." }
        return names.zip(literals).toMap()
    }

    fun read(start: Int, size: Int, offset: Int, count: Int): List<Any?> {
        require(size >= 0 && start >= 0 && start.toLong() + size <= bytes.size - 20 &&
            count in 0..4096 && offset >= 0 && offset <= size)
        var cursor = start + offset
        val end = start + size
        val output = mutableListOf<Any?>()
        while (output.size < count) {
            require(cursor < end)
            val tag = bytes[cursor++].toInt() and 255
            val type = tag ushr 4 and 7
            var length = tag and 15
            if (tag and 128 != 0) { require(cursor < end); length = length * 256 + (bytes[cursor++].toInt() and 255) }
            require(length > 0) { "Hermes literal has empty run." }
            repeat(minOf(length, count - output.size)) {
                val width = when (type) { 3 -> 8; 4, 7 -> 4; 5 -> 2; else -> 0 }
                require(cursor.toLong() + width <= end) { "Hermes literal is truncated." }
                val value: Any? = when (type) {
                    0 -> null
                    1 -> true
                    2 -> false
                    3 -> buffer.getDouble(cursor)
                    4, 5 -> {
                        val id = if (type == 4) buffer.getInt(cursor) else buffer.getShort(cursor).toInt() and 65535
                        require(id in strings.indices); strings[id]
                    }
                    6 -> Undefined
                    7 -> buffer.getInt(cursor)
                    else -> error("Unknown Hermes literal tag.")
                }
                cursor += width
                output.add(value)
            }
        }
        return output
    }
}
