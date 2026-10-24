/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.shared.misc.secshell

import app.morphe.patcher.patch.PatchException
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.zip.CRC32
import java.util.zip.DataFormatException
import java.util.zip.Deflater
import java.util.zip.Inflater

private const val CIPHER_HEAD_SIZE = 0x20000
private const val BODY_KEY = 0xAC.toByte()

private const val LOCAL_HEADER_SIZE = 30
private const val CENTRAL_HEADER_SIZE = 46
private const val END_RECORD_SIZE = 22

private const val CENTRAL_SIGNATURE = 0x02014b50
private const val END_SIGNATURE = 0x06054b50

private const val STORED = 0
private const val DEFLATED = 8

private const val DATA_DESCRIPTOR_FLAG = 0x0008

private val CRC_TABLE = IntArray(256) { index ->
    (0 until 8).fold(index) { value, _ -> if ((value and 1) != 0) (value ushr 1) xor 0xEDB88320.toInt() else value ushr 1 }
}

private val CRC_INVERSE = IntArray(256).also { inverse ->
    CRC_TABLE.forEachIndexed { index, value -> inverse[value ushr 24] = index }
}

internal class SecShellJar private constructor(
    private val decoded: ByteArray,
    private val original: ByteArray,
) : SecShellContainer {
    private class Entry(
        val name: String,
        val localOffset: Int,
        val method: Int,
        val compressedSize: Int,
        val centralOffset: Int,
        val centralLength: Int,
    )

    private val buffer = ByteBuffer.wrap(decoded).order(ByteOrder.LITTLE_ENDIAN)

    private val endOffset = (decoded.size - END_RECORD_SIZE downTo 0).firstOrNull {
        buffer.getInt(it) == END_SIGNATURE
    } ?: throw PatchException("SecShell jar has no end of central directory record")

    private val entries: List<Entry> = run {
        var cursor = buffer.getInt(endOffset + 16)
        (0 until buffer.getShort(endOffset + 10).toInt()).map {
            if (buffer.getInt(cursor) != CENTRAL_SIGNATURE) {
                throw PatchException("SecShell jar has a damaged central directory at $cursor")
            }
            val nameLength = buffer.getShort(cursor + 28).toInt()
            val length = CENTRAL_HEADER_SIZE + nameLength +
                buffer.getShort(cursor + 30) + buffer.getShort(cursor + 32)
            Entry(
                name = String(decoded, cursor + CENTRAL_HEADER_SIZE, nameLength, Charsets.UTF_8),
                localOffset = buffer.getInt(cursor + 42),
                method = buffer.getShort(cursor + 10).toInt(),
                compressedSize = buffer.getInt(cursor + 20),
                centralOffset = cursor,
                centralLength = length,
            ).also { cursor += length }
        }
    }

    override fun dexEntries() = entries
        .filter { it.name.endsWith(".dex") && it.localOffset >= CIPHER_HEAD_SIZE }
        .map { it.name }

    override fun read(name: String): ByteArray {
        val entry = payloadEntry(name)
        val dataOffset = entry.localOffset + LOCAL_HEADER_SIZE +
            buffer.getShort(entry.localOffset + 26) + buffer.getShort(entry.localOffset + 28)
        val data = decoded.copyOfRange(dataOffset, dataOffset + entry.compressedSize)
        return when (entry.method) {
            STORED -> data
            DEFLATED -> inflate(data)
            else -> throw PatchException("SecShell jar entry $name uses compression method ${entry.method}")
        }
    }

    override fun withEntries(replacements: Map<String, ByteArray>): ByteArray {
        replacements.keys.forEach(::payloadEntry)
        if (entries.zipWithNext().any { (current, next) -> current.localOffset >= next.localOffset }) {
            throw PatchException("SecShell jar central directory is not in local record order")
        }

        val centralStart = entries.first().centralOffset
        val body = ByteArrayOutputStream()
        val central = ByteArrayOutputStream()
        body.write(decoded, 0, entries.first().localOffset)

        entries.forEachIndexed { index, entry ->
            val end = entries.getOrNull(index + 1)?.localOffset ?: centralStart
            val record = decoded.copyOfRange(entry.centralOffset, entry.centralOffset + entry.centralLength)
            val recordBuffer = ByteBuffer.wrap(record).order(ByteOrder.LITTLE_ENDIAN)
            val offset = body.size()

            val replacement = replacements[entry.name]
            if (replacement == null) {
                body.write(decoded, entry.localOffset, end - entry.localOffset)
            } else {
                val headerLength = LOCAL_HEADER_SIZE +
                    buffer.getShort(entry.localOffset + 26) + buffer.getShort(entry.localOffset + 28)
                val header = decoded.copyOfRange(entry.localOffset, entry.localOffset + headerLength)
                val compressed = deflate(replacement)
                val crc = CRC32().apply { update(replacement) }.value.toInt()
                ByteBuffer.wrap(header).order(ByteOrder.LITTLE_ENDIAN).apply {
                    putShort(6, (getShort(6).toInt() and DATA_DESCRIPTOR_FLAG.inv()).toShort())
                    putShort(8, DEFLATED.toShort())
                    putInt(14, crc)
                    putInt(18, compressed.size)
                    putInt(22, replacement.size)
                }
                recordBuffer.apply {
                    putShort(8, (getShort(8).toInt() and DATA_DESCRIPTOR_FLAG.inv()).toShort())
                    putShort(10, DEFLATED.toShort())
                    putInt(16, crc)
                    putInt(20, compressed.size)
                    putInt(24, replacement.size)
                }
                body.write(header)
                body.write(compressed)
            }
            recordBuffer.putInt(42, offset)
            central.write(record)
        }

        val endRecord = decoded.copyOfRange(endOffset, endOffset + END_RECORD_SIZE)
        ByteBuffer.wrap(endRecord).order(ByteOrder.LITTLE_ENDIAN).apply {
            putInt(12, central.size())
            putInt(16, body.size())
            putShort(20, FORGED_COMMENT_SIZE.toShort())
        }

        val rebuilt = body.toByteArray() + central.toByteArray() + endRecord + ByteArray(FORGED_COMMENT_SIZE)
        return sealed(rebuilt)
    }

    private fun sealed(rebuilt: ByteArray): ByteArray {
        val encoded = encode(rebuilt)
        val prefix = encoded.copyOf(encoded.size - FORGED_COMMENT_SIZE)
        return prefix + crcPadding(crcOf(prefix), crcOf(original))
    }

    private fun entry(name: String) =
        entries.firstOrNull { it.name == name } ?: throw PatchException("SecShell jar has no entry $name")

    private fun payloadEntry(name: String) = entry(name).also {
        if (it.localOffset < CIPHER_HEAD_SIZE) {
            throw PatchException("SecShell jar entry $name starts inside the ciphered head")
        }
    }

    companion object {
        private const val FORGED_COMMENT_SIZE = 4

        fun of(bytes: ByteArray): SecShellJar = SecShellJar(encode(bytes), bytes)

        private fun encode(bytes: ByteArray) = bytes.copyOf().also {
            for (index in CIPHER_HEAD_SIZE until it.size) it[index] = (it[index].toInt() xor BODY_KEY.toInt()).toByte()
        }

        private fun crcOf(bytes: ByteArray) = CRC32().apply { update(bytes) }.value.toInt()

        private fun crcPadding(current: Int, target: Int): ByteArray {
            var state = target.inv()
            val indices = IntArray(4)
            for (round in 3 downTo 0) {
                indices[round] = CRC_INVERSE[state ushr 24]
                state = (state xor CRC_TABLE[indices[round]]) shl 8
            }
            var register = current.inv()
            return ByteArray(4) { round ->
                val byte = (register xor indices[round]) and 0xFF
                register = (register ushr 8) xor CRC_TABLE[(register xor byte) and 0xFF]
                byte.toByte()
            }
        }

        private fun inflate(data: ByteArray): ByteArray {
            val inflater = Inflater(true).apply { setInput(data) }
            try {
                val output = ByteArrayOutputStream()
                val chunk = ByteArray(1 shl 16)
                while (!inflater.finished()) {
                    val read = inflater.inflate(chunk)
                    output.write(chunk, 0, read)
                    if (read == 0 && !inflater.finished() && (inflater.needsInput() || inflater.needsDictionary())) {
                        throw PatchException("SecShell jar entry ends before its deflate stream does")
                    }
                }
                return output.toByteArray()
            } catch (exception: DataFormatException) {
                throw PatchException("SecShell jar entry has a corrupt deflate stream", exception)
            } finally {
                inflater.end()
            }
        }

        private fun deflate(data: ByteArray): ByteArray {
            val deflater = Deflater(Deflater.DEFAULT_COMPRESSION, true).apply { setInput(data); finish() }
            val output = ByteArrayOutputStream()
            val chunk = ByteArray(1 shl 16)
            while (!deflater.finished()) output.write(chunk, 0, deflater.deflate(chunk))
            deflater.end()
            return output.toByteArray()
        }
    }
}
