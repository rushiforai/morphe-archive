/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.shared.bytecode

/** Byte-array helpers for binary bundle patching (Hermes bytecode, etc.). */
internal fun ByteArray.toHexString(separator: String = " "): String =
    joinToString(separator) { "%02x".format(it) }

internal fun ByteArray.hex(): String = toHexString("")

internal fun String.hexToBytes(): ByteArray {
    val clean = lineSequence()
        .joinToString("") { it.substringBefore('#') }
        .filterNot(Char::isWhitespace)
    require(clean.length % 2 == 0) { "hex string must have even length" }
    return ByteArray(clean.length / 2) { i ->
        clean.substring(i * 2, i * 2 + 2).toInt(16).toByte()
    }
}

internal fun ByteArray.indexOfAll(needle: ByteArray): List<Int> {
    val result = mutableListOf<Int>()
    if (needle.isEmpty() || needle.size > size) return result
    var from = 0
    while (true) {
        val idx = indexOf(needle, from) ?: break
        result.add(idx)
        from = idx + 1
    }
    return result
}

internal fun ByteArray.indexOf(needle: ByteArray): Int? = indexOf(needle, 0)

private fun ByteArray.indexOf(needle: ByteArray, from: Int): Int? {
    if (needle.isEmpty() || needle.size > size - from) return null
    outer@ for (i in from..size - needle.size) {
        for (j in needle.indices) {
            if (this[i + j] != needle[j]) continue@outer
        }
        return i
    }
    return null
}

internal fun ByteArray.requireIndexOf(needle: ByteArray, message: String): Int =
    indexOf(needle) ?: error(message)

internal fun ByteArray.requireOccurrenceCount(needle: ByteArray, expected: Int, message: String) {
    val count = indexOfAll(needle).size
    require(count == expected) { "$message (found $count, expected $expected)" }
}

internal fun ByteArray.replaceFirst(needle: ByteArray, replacement: ByteArray): ByteArray {
    val idx = requireIndexOf(needle, "needle not found")
    return copyOfRange(0, idx) + replacement + copyOfRange(idx + needle.size, size)
}

internal fun ByteArray.requireByteAt(offset: Int, expected: Byte, message: String) {
    require(size > offset && this[offset] == expected) { "$message (at $offset)" }
}
