/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.shared.misc.pairip

import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest

private val KEY_MAGIC = "MKEY\u0001".toByteArray(Charsets.ISO_8859_1)
private const val DIGEST_BYTES = 32
private const val BLOCK_SIZE = 1704
private const val WINDOW_BYTES = 8
private const val PATTERN_HEADER_BYTES = 2
private const val RECORD_BYTES = 9
private const val IMPORT_BYTES = 10

internal class KeyWindow(val offset: Int, val length: Int, val patterns: List<ByteArray>)

internal enum class KeyRecordOperation { XOR, ZERO, WRAPPED }

internal class KeyRecord(val offset: Int, val length: Int, val operation: KeyRecordOperation, val bytes: ByteArray, val source: Int)

internal class HiddenImport(val slot: Long, val name: String)

internal class NativeLibraryKey private constructor(
    val wrappedDigest: ByteArray,
    val resultDigest: ByteArray,
    val windows: List<KeyWindow>,
    val records: List<KeyRecord>,
    val imports: List<HiddenImport>,
) {
    fun decryptContent(wrapped: ByteArray): ByteArray {
        check(MessageDigest.getInstance("SHA-256").digest(wrapped).contentEquals(wrappedDigest)) {
            "Library does not match the key it is unwrapped with"
        }
        windows.forEach { checkRange(it.offset, it.length, wrapped.size, "Key window") }
        records.forEach { record ->
            checkRange(record.offset, record.length, wrapped.size, "Key record")
            if (record.operation == KeyRecordOperation.WRAPPED) checkRange(record.source, record.length, wrapped.size, "Key record source")
        }
        val content = wrapped.copyOf()
        windows.forEach { window ->
            var blockStart = window.offset
            window.patterns.forEach { pattern ->
                val blockEnd = minOf(blockStart + BLOCK_SIZE, window.offset + window.length)
                for (position in blockStart until blockEnd) {
                    content[position] = (content[position].toInt() xor pattern[(position - blockStart) % pattern.size].toInt()).toByte()
                }
                blockStart = blockEnd
            }
        }
        records.forEach { record ->
            for (index in 0 until record.length) {
                val position = record.offset + index
                content[position] = when (record.operation) {
                    KeyRecordOperation.ZERO -> 0
                    KeyRecordOperation.XOR -> (content[position].toInt() xor record.bytes[index].toInt()).toByte()
                    KeyRecordOperation.WRAPPED -> (content[position].toInt() xor wrapped[record.source + index].toInt()).toByte()
                }
            }
        }
        return content
    }

    companion object {
        fun parse(bytes: ByteArray): NativeLibraryKey {
            val buffer = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
            check(buffer.remaining() >= KEY_MAGIC.size + 2 * DIGEST_BYTES) { "Truncated native library key" }
            check(ByteArray(KEY_MAGIC.size).also(buffer::get).contentEquals(KEY_MAGIC)) { "Not a native library key" }
            val wrappedDigest = ByteArray(DIGEST_BYTES).also(buffer::get)
            val resultDigest = ByteArray(DIGEST_BYTES).also(buffer::get)

            val windows = List(buffer.readCount("window", WINDOW_BYTES)) {
                check(buffer.remaining() >= WINDOW_BYTES) { "Truncated native library key" }
                val offset = buffer.int
                val length = buffer.int
                check(offset >= 0 && length > 0) { "Invalid key window at $offset with length $length" }
                val blocks = (length.toLong() + BLOCK_SIZE - 1) / BLOCK_SIZE
                val patterns = List(blocks.toInt()) {
                    check(buffer.remaining() >= PATTERN_HEADER_BYTES) { "Truncated native library key" }
                    val period = buffer.short.toInt() and 0xFFFF
                    check(period > 0) { "Empty key pattern in window at $offset" }
                    buffer.readBytes(period)
                }
                KeyWindow(offset, length, patterns)
            }

            val records = List(buffer.readCount("record", RECORD_BYTES)) {
                check(buffer.remaining() >= RECORD_BYTES) { "Truncated native library key" }
                val offset = buffer.int
                val length = buffer.int
                val operationIndex = buffer.get().toInt()
                check(offset >= 0 && length > 0) { "Invalid key record at $offset with length $length" }
                check(operationIndex in KeyRecordOperation.entries.indices) { "Unknown key record operation $operationIndex" }
                when (val operation = KeyRecordOperation.entries[operationIndex]) {
                    KeyRecordOperation.ZERO -> KeyRecord(offset, length, operation, ByteArray(0), 0)
                    KeyRecordOperation.XOR -> KeyRecord(offset, length, operation, buffer.readBytes(length), 0)
                    KeyRecordOperation.WRAPPED -> {
                        check(buffer.remaining() >= Int.SIZE_BYTES) { "Truncated native library key" }
                        val source = buffer.int
                        check(source >= 0) { "Invalid key record source $source" }
                        KeyRecord(offset, length, operation, ByteArray(0), source)
                    }
                }
            }

            val imports = List(buffer.readCount("import", IMPORT_BYTES)) {
                check(buffer.remaining() >= Long.SIZE_BYTES + 1) { "Truncated native library key" }
                val slot = buffer.long
                val nameLength = buffer.get().toInt() and 0xFF
                check(slot >= 0 && nameLength > 0) { "Invalid hidden import at slot $slot" }
                HiddenImport(slot, buffer.readBytes(nameLength).toString(Charsets.US_ASCII))
            }
            check(!buffer.hasRemaining()) { "Trailing bytes in native library key" }
            return NativeLibraryKey(wrappedDigest, resultDigest, windows, records, imports)
        }

        private fun ByteBuffer.readCount(what: String, minimumBytes: Int): Int {
            check(remaining() >= Int.SIZE_BYTES) { "Truncated native library key" }
            val count = int
            check(count in 0..remaining() / minimumBytes) { "Invalid $what count $count in native library key" }
            return count
        }

        private fun ByteBuffer.readBytes(length: Int): ByteArray {
            check(remaining() >= length) { "Truncated native library key" }
            return ByteArray(length).also(::get)
        }

        private fun checkRange(offset: Int, length: Int, size: Int, what: String) {
            check(offset >= 0 && length >= 0 && offset.toLong() + length <= size) {
                "$what at $offset with length $length is outside the $size byte library"
            }
        }
    }
}

internal fun unwrapNativeLibrary(wrapped: ByteArray, keyBytes: ByteArray): ByteArray {
    val key = NativeLibraryKey.parse(keyBytes)
    val unwrapped = ElfImage(key.decryptContent(wrapped)).withoutPairipRuntime(key.imports)
    check(MessageDigest.getInstance("SHA-256").digest(unwrapped).contentEquals(key.resultDigest)) {
        "Unwrapped library does not match the expected result"
    }
    return unwrapped
}
