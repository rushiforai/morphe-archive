/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.shared.misc.pairip

import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest

internal class SyntheticLibrary(val wide: Boolean, val machine: Int = if (wide) AARCH64 else ARM) {
    val wordSize = if (wide) 8 else 4
    val jumpSlotType = when (machine) {
        AARCH64 -> 1026L
        X86_64 -> 7L
        else -> 22L
    }
    val relocationSize = if (wide) 24 else 8
    val relocationSection = if (wide) ".rela.plt" else ".rel.plt"
    val textPlaintext = ByteArray(TEXT_LENGTH) { (it + 1).toByte() }
    val textKey = ByteArray(TEXT_LENGTH) { (0x40 + it * 3).toByte() }
    val runnerSlot = 0x2000L
    val keptSlot = 0x2008L
    val hiddenSlot = 0x2010L
    val hiddenName = "close"

    var textOffset = 0
        private set

    val wrapped: ByteArray = build()

    fun key(result: ByteArray, imports: List<Pair<Long, String>> = listOf(hiddenSlot to hiddenName)): ByteArray =
        keyForDigest(sha256(result), imports)

    fun keyForDigest(resultDigest: ByteArray, imports: List<Pair<Long, String>> = listOf(hiddenSlot to hiddenName)): ByteArray {
        val key = ByteArrayOutputStream()
        val buffer = ByteBuffer.allocate(4096).order(ByteOrder.LITTLE_ENDIAN)
        buffer.put("MKEY\u0001".toByteArray(Charsets.ISO_8859_1))
        buffer.put(sha256(wrapped)).put(resultDigest)
        buffer.putInt(0)
        buffer.putInt(2)
        buffer.putInt(textOffset).putInt(TEXT_LENGTH).put(0)
        buffer.put(textKey)
        buffer.putInt(textOffset + TEXT_LENGTH).putInt(PADDING_LENGTH).put(1)
        buffer.putInt(imports.size)
        imports.forEach { (slot, name) -> buffer.putLong(slot).put(name.length.toByte()).put(name.toByteArray(Charsets.US_ASCII)) }
        key.write(buffer.array(), 0, buffer.position())
        return key.toByteArray()
    }

    fun keyWithXorRecord(bytes: ByteArray): ByteArray {
        val buffer = ByteBuffer.allocate(bytes.size + 128).order(ByteOrder.LITTLE_ENDIAN)
        buffer.put("MKEY\u0001".toByteArray(Charsets.ISO_8859_1))
        buffer.put(sha256(wrapped)).put(sha256(wrapped))
        buffer.putInt(0)
        buffer.putInt(1).putInt(0).putInt(bytes.size).put(0).put(bytes)
        buffer.putInt(0)
        return buffer.array().copyOf(buffer.position())
    }

    private fun build(): ByteArray {
        val headerSize = if (wide) 64 else 52
        val programSize = if (wide) 56 else 32
        val sectionSize = if (wide) 64 else 40
        val strings = "\u0000libpairipcore.so\u0000ExecuteProgram\u0000getpid\u0000".toByteArray(Charsets.US_ASCII)
        val symbolSize = if (wide) 24 else 16
        val symbols = ByteBuffer.allocate(3 * symbolSize).order(ByteOrder.LITTLE_ENDIAN).also {
            it.position(symbolSize)
            putSymbol(it, 1 + "libpairipcore.so".length + 1)
            putSymbol(it, 1 + "libpairipcore.so".length + 1 + "ExecuteProgram".length + 1)
        }.array()
        val versions = ByteArray(6)
        val hashTable = ByteBuffer.allocate(HASH_TABLE_BYTES).order(ByteOrder.LITTLE_ENDIAN).also {
            it.putInt(1).putInt(3).putInt(2).putInt(0).putInt(0).putInt(1)
        }.array()
        val relocations = ByteBuffer.allocate(2 * relocationSize).order(ByteOrder.LITTLE_ENDIAN).also {
            putRelocation(it, runnerSlot, 1)
            putRelocation(it, keptSlot, 2)
        }.array()
        val dynamicEntrySize = 2 * wordSize
        val dynamicCapacity = 10
        val sectionNames = listOf("", ".dynstr", ".dynsym", ".gnu.version", ".hash", relocationSection, ".text", ".dynamic", ".shstrtab")
        val nameBlob = ByteArrayOutputStream().also { out -> sectionNames.forEach { out.write(it.toByteArray()); out.write(0) } }.toByteArray()
        val nameOffsets = sectionNames.runningFold(0) { at, name -> at + name.length + 1 }

        val offsets = mutableListOf<Int>()
        var at = headerSize + 2 * programSize
        listOf(strings.size, symbols.size, versions.size, hashTable.size, relocations.size, TEXT_LENGTH + PADDING_LENGTH, dynamicCapacity * dynamicEntrySize, nameBlob.size)
            .forEach { size ->
                at = (at + 7) / 8 * 8
                offsets += at
                at += size
            }
        val segmentEnd = (at + 7) / 8 * 8
        textOffset = offsets[5]

        val image = ByteBuffer.allocate(segmentEnd + sectionNames.size * sectionSize).order(ByteOrder.LITTLE_ENDIAN)
        image.put(byteArrayOf(0x7F, 'E'.code.toByte(), 'L'.code.toByte(), 'F'.code.toByte(), if (wide) 2 else 1, 1, 1))
        image.putShort(0x10, 3).putShort(0x12, machine.toShort())
        val fieldsAt = if (wide) 0x36 else 0x2A
        if (wide) image.putLong(0x20, headerSize.toLong()).putLong(0x28, segmentEnd.toLong()) else image.putInt(0x1C, headerSize).putInt(0x20, segmentEnd)
        image.putShort(fieldsAt, programSize.toShort()).putShort(fieldsAt + 2, 2).putShort(fieldsAt + 4, sectionSize.toShort())
            .putShort(fieldsAt + 6, sectionNames.size.toShort()).putShort(fieldsAt + 8, (sectionNames.size - 1).toShort())
        putSegment(image, headerSize, 1, 6, 0, segmentEnd)
        putSegment(image, headerSize + programSize, 2, 6, offsets[6], dynamicCapacity * dynamicEntrySize)

        listOf(strings, symbols, versions, hashTable, relocations, ByteArray(TEXT_LENGTH) { (textPlaintext[it].toInt() xor textKey[it].toInt()).toByte() } + ByteArray(PADDING_LENGTH) { 0x5A }).forEachIndexed { index, blob ->
            image.position(offsets[index])
            image.put(blob)
        }
        image.position(offsets[6])
        listOf(1L to 1L, 12L to 0x1000L, 5L to offsets[0].toLong(), 6L to offsets[1].toLong(), 10L to strings.size.toLong(), 2L to relocations.size.toLong(), 0x6FFFFFF0L to offsets[2].toLong(), 4L to offsets[3].toLong(), 0L to 0L)
            .forEach { (tag, value) -> putWord(image, tag); putWord(image, value) }
        image.position(offsets[7])
        image.put(nameBlob)

        val sectionSizes = listOf(0, strings.size, symbols.size, versions.size, hashTable.size, relocations.size, TEXT_LENGTH + PADDING_LENGTH, dynamicCapacity * dynamicEntrySize, nameBlob.size)
        val sectionOffsets = listOf(0) + offsets
        image.position(segmentEnd)
        sectionNames.indices.forEach { index ->
            val flags = if (index == 0 || index == sectionNames.lastIndex) 0L else 2L
            putSection(image, nameOffsets[index], if (index == 0) 0 else if (index == sectionNames.lastIndex) 3 else 1, flags, sectionOffsets[index], sectionSizes[index])
        }
        return image.array()
    }

    private fun putWord(buffer: ByteBuffer, value: Long) {
        if (wide) buffer.putLong(value) else buffer.putInt(value.toInt())
    }

    private fun putSymbol(buffer: ByteBuffer, name: Int) {
        buffer.putInt(name)
        if (wide) buffer.put(0x12).put(0).putShort(0).putLong(0).putLong(0) else buffer.putInt(0).putInt(0).put(0x12).put(0).putShort(0)
    }

    private fun putRelocation(buffer: ByteBuffer, slot: Long, symbol: Int) {
        putWord(buffer, slot)
        putWord(buffer, if (wide) (symbol.toLong() shl 32) or jumpSlotType else (symbol.toLong() shl 8) or jumpSlotType)
        if (wide) buffer.putLong(0)
    }

    private fun putSegment(buffer: ByteBuffer, at: Int, type: Int, flags: Int, offset: Int, size: Int) {
        if (wide) {
            buffer.putInt(at, type).putInt(at + 4, flags).putLong(at + 8, offset.toLong()).putLong(at + 16, offset.toLong())
                .putLong(at + 24, offset.toLong()).putLong(at + 32, size.toLong()).putLong(at + 40, size.toLong()).putLong(at + 48, 8)
        } else {
            buffer.putInt(at, type).putInt(at + 4, offset).putInt(at + 8, offset).putInt(at + 12, offset)
                .putInt(at + 16, size).putInt(at + 20, size).putInt(at + 24, flags).putInt(at + 28, 8)
        }
    }

    private fun putSection(buffer: ByteBuffer, name: Int, type: Int, flags: Long, offset: Int, size: Int) {
        buffer.putInt(name).putInt(type)
        putWord(buffer, flags)
        putWord(buffer, offset.toLong())
        putWord(buffer, offset.toLong())
        putWord(buffer, size.toLong())
        buffer.putInt(0).putInt(0)
        putWord(buffer, 8)
        putWord(buffer, 0)
    }

    companion object {
        const val ARM = 40
        const val X86_64 = 62
        const val AARCH64 = 183
        const val TEXT_LENGTH = 16
        const val PADDING_LENGTH = 8
        const val HASH_TABLE_BYTES = 24

        fun rawKey(wrappedBytes: ByteArray, resultBytes: ByteArray, body: ByteBuffer.() -> Unit): ByteArray {
            val buffer = ByteBuffer.allocate(16384).order(ByteOrder.LITTLE_ENDIAN)
            buffer.put("MKEY\u0001".toByteArray(Charsets.ISO_8859_1))
            buffer.put(sha256(wrappedBytes)).put(sha256(resultBytes))
            buffer.body()
            return buffer.array().copyOf(buffer.position())
        }

        fun sha256(bytes: ByteArray): ByteArray = MessageDigest.getInstance("SHA-256").digest(bytes)
    }
}
