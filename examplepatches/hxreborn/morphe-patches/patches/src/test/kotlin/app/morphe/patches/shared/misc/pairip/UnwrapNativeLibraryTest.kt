/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.shared.misc.pairip

import java.nio.ByteBuffer
import java.nio.ByteOrder
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

internal class UnwrapNativeLibraryTest {
    @Test
    fun `restores the encrypted code and zero fills the padding`() {
        // given
        val library = SyntheticLibrary(wide = true)
        val key = NativeLibraryKey.parse(library.key(library.wrapped))

        // when
        val content = key.decryptContent(library.wrapped)

        // then
        assertContentEquals(library.textPlaintext, content.copyOfRange(library.textOffset, library.textOffset + SyntheticLibrary.TEXT_LENGTH))
        assertTrue(content.copyOfRange(library.textOffset + SyntheticLibrary.TEXT_LENGTH, library.textOffset + SyntheticLibrary.TEXT_LENGTH + SyntheticLibrary.PADDING_LENGTH).all { it.toInt() == 0 })
    }

    @Test
    fun `drops the pairip runtime from a 64-bit library`() {
        assertDropsRuntime(SyntheticLibrary(wide = true))
    }

    @Test
    fun `drops the pairip runtime from a 32-bit library`() {
        assertDropsRuntime(SyntheticLibrary(wide = false))
    }

    @Test
    fun `drops the pairip runtime from an x86-64 library`() {
        assertDropsRuntime(SyntheticLibrary(wide = true, machine = SyntheticLibrary.X86_64))
    }

    @Test
    fun `unwraps each architecture to its pinned output`() {
        PINNED_OUTPUTS.forEach { (library, digest, size) ->
            // given
            val key = library.keyForDigest(digest.chunked(2).map { it.toInt(16).toByte() }.toByteArray())

            // when
            val unwrapped = unwrapNativeLibrary(library.wrapped, key)

            // then
            assertEquals(size, unwrapped.size)
            assertContentEquals(library.textPlaintext, unwrapped.copyOfRange(library.textOffset, library.textOffset + SyntheticLibrary.TEXT_LENGTH))
        }
    }

    @Test
    fun `xors each block of a window with its own pattern`() {
        // given
        val wrapped = ByteArray(4000)
        val key = NativeLibraryKey.parse(
            SyntheticLibrary.rawKey(wrapped, wrapped) {
                putInt(1).putInt(100).putInt(3500)
                putShort(1).put(0x11)
                putShort(1).put(0x22)
                putShort(3).put(byteArrayOf(1, 2, 3))
                putInt(0).putInt(0)
            },
        )

        // when
        val content = key.decryptContent(wrapped)

        // then
        assertEquals(0, content[99].toInt())
        assertEquals(0x11, content[100].toInt())
        assertEquals(0x11, content[100 + 1703].toInt())
        assertEquals(0x22, content[100 + 1704].toInt())
        assertEquals(0x22, content[100 + 3407].toInt())
        assertContentEquals(byteArrayOf(1, 2, 3, 1, 2), content.copyOfRange(100 + 3408, 100 + 3413))
        assertEquals(2, content[100 + 3499].toInt())
        assertEquals(0, content[100 + 3500].toInt())
    }

    @Test
    fun `xors a record with another range of the wrapped library`() {
        // given
        val wrapped = byteArrayOf(1, 2, 3, 4, 0, 0, 0, 0, 5, 6, 7, 8)
        val key = NativeLibraryKey.parse(
            SyntheticLibrary.rawKey(wrapped, wrapped) {
                putInt(0)
                putInt(1).putInt(0).putInt(4).put(2).putInt(8)
                putInt(0)
            },
        )

        // when
        val content = key.decryptContent(wrapped)

        // then
        assertContentEquals(byteArrayOf(4, 4, 4, 12, 0, 0, 0, 0, 5, 6, 7, 8), content)
    }

    @Test
    fun `rejects a key cut short`() {
        val library = SyntheticLibrary(wide = true)
        val key = library.key(library.wrapped)

        assertFailsWith<IllegalStateException> { NativeLibraryKey.parse(key.copyOf(key.size - 3)) }
    }

    @Test
    fun `rejects a count larger than the key`() {
        val failure = assertFailsWith<IllegalStateException> {
            NativeLibraryKey.parse(SyntheticLibrary.rawKey(ByteArray(0), ByteArray(0)) { putInt(Int.MAX_VALUE) })
        }

        assertTrue("window count" in failure.message.orEmpty())
    }

    @Test
    fun `rejects an unknown record operation`() {
        val failure = assertFailsWith<IllegalStateException> {
            NativeLibraryKey.parse(SyntheticLibrary.rawKey(ByteArray(0), ByteArray(0)) { putInt(0).putInt(1).putInt(0).putInt(4).put(9) })
        }

        assertTrue("Unknown key record operation 9" in failure.message.orEmpty())
    }

    @Test
    fun `rejects a window pattern with no bytes`() {
        val failure = assertFailsWith<IllegalStateException> {
            NativeLibraryKey.parse(SyntheticLibrary.rawKey(ByteArray(0), ByteArray(0)) { putInt(1).putInt(0).putInt(16).putShort(0) })
        }

        assertTrue("Empty key pattern" in failure.message.orEmpty())
    }

    @Test
    fun `rejects a record with a negative offset`() {
        val failure = assertFailsWith<IllegalStateException> {
            NativeLibraryKey.parse(SyntheticLibrary.rawKey(ByteArray(0), ByteArray(0)) { putInt(0).putInt(1).putInt(-1).putInt(4).put(1) })
        }

        assertTrue("Invalid key record" in failure.message.orEmpty())
    }

    @Test
    fun `rejects a record past the end of the library`() {
        // given
        val wrapped = ByteArray(16)
        val key = NativeLibraryKey.parse(SyntheticLibrary.rawKey(wrapped, wrapped) { putInt(0).putInt(1).putInt(12).putInt(8).put(1).putInt(0) })

        // when
        val failure = assertFailsWith<IllegalStateException> { key.decryptContent(wrapped) }

        // then
        assertTrue("outside the 16 byte library" in failure.message.orEmpty())
    }

    @Test
    fun `rejects a window past the end of the library`() {
        // given
        val wrapped = ByteArray(16)
        val key = NativeLibraryKey.parse(
            SyntheticLibrary.rawKey(wrapped, wrapped) {
                putInt(1).putInt(8).putInt(16).putShort(1).put(1)
                putInt(0).putInt(0)
            },
        )

        // when
        val failure = assertFailsWith<IllegalStateException> { key.decryptContent(wrapped) }

        // then
        assertTrue("Key window" in failure.message.orEmpty())
    }

    @Test
    fun `rejects a wrapped source past the end of the library`() {
        // given
        val wrapped = ByteArray(16)
        val key = NativeLibraryKey.parse(SyntheticLibrary.rawKey(wrapped, wrapped) { putInt(0).putInt(1).putInt(0).putInt(8).put(2).putInt(12).putInt(0) })

        // when
        val failure = assertFailsWith<IllegalStateException> { key.decryptContent(wrapped) }

        // then
        assertTrue("Key record source" in failure.message.orEmpty())
    }

    @Test
    fun `rejects a key whose result digest does not match`() {
        val library = SyntheticLibrary(wide = true)

        assertFailsWith<IllegalStateException> { unwrapNativeLibrary(library.wrapped, library.key(library.wrapped)) }
    }

    @Test
    fun `rejects a key built for another library`() {
        // given
        val library = SyntheticLibrary(wide = true)
        val other = library.wrapped.copyOf().also { it[library.textOffset] = (it[library.textOffset] + 1).toByte() }

        // when
        val failure = assertFailsWith<IllegalStateException> { unwrapNativeLibrary(other, library.key(library.wrapped)) }

        // then
        assertTrue("does not match the key" in failure.message.orEmpty())
    }

    @Test
    fun `rejects a key with trailing bytes`() {
        val library = SyntheticLibrary(wide = true)

        assertFailsWith<IllegalStateException> { NativeLibraryKey.parse(library.key(library.wrapped) + 0) }
    }

    private fun assertDropsRuntime(library: SyntheticLibrary) {
        // given
        val key = NativeLibraryKey.parse(library.key(library.wrapped))

        // when
        val unwrapped = ElfImage(key.decryptContent(library.wrapped)).withoutPairipRuntime(key.imports)

        // then
        val elf = ParsedElf(unwrapped, library.wide)
        assertFalse(elf.neededLibraries.contains("libpairipcore.so"))
        assertFalse(elf.dynamicTags.contains(12L))
        assertEquals(listOf("getpid", "close"), elf.pltSymbols.map { it.second })
        assertEquals(listOf(library.keptSlot, library.hiddenSlot), elf.pltSymbols.map { it.first })
        assertContentEquals(library.textPlaintext, unwrapped.copyOfRange(library.textOffset, library.textOffset + SyntheticLibrary.TEXT_LENGTH))
        assertTrue(unwrapped.size > library.wrapped.size)
        assertEquals(listOf(1, 4, 2, 0, 0, 1, 0), elf.hashWords(unwrapped.size))
        assertEquals(4, elf.symbolCount)
    }

    private companion object {
        val PINNED_OUTPUTS = listOf(
            Triple(SyntheticLibrary(wide = true), "12bb2c7fa4774a4171db01462925007522628c823e8ffbe1f5c196b7e73a6d76", 1384),
            Triple(SyntheticLibrary(wide = false), "13a30bff8bf0b29ded5c659bc5b77358ff1cfe13015ad864d2193fffb5eeec2f", 940),
            Triple(SyntheticLibrary(wide = true, machine = SyntheticLibrary.X86_64), "fb2c580be087f57e1d8ebdf523c2bb057a35b8e32136f235c79c1859715092be", 1384),
        )
    }

    private class ParsedElf(val bytes: ByteArray, val wide: Boolean) {
        private val buffer = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
        private val sectionCount = buffer.getShort(if (wide) 0x3C else 0x30).toInt()
        private val sectionSize = buffer.getShort(if (wide) 0x3A else 0x2E).toInt()
        private val sectionOffset = (if (wide) buffer.getLong(0x28) else buffer.getInt(0x20).toLong()).toInt()
        private val namesAt = section(sectionCount - 1).second
        private val sectionsByName = (0 until sectionCount).associateBy { name(buffer.getInt(sectionOffset + it * sectionSize)) }
        val dynamicTags: List<Long>
        val dynamicValues: Map<Long, Long>
        val symbolCount: Int
        val neededLibraries: List<String>
        val pltSymbols: List<Pair<Long, String>>

        init {
            val dynamic = section(sectionsByName.getValue(".dynamic"))
            val entry = if (wide) 16 else 8
            val entries = (0 until dynamic.third / entry).map {
                val at = dynamic.second + it * entry
                if (wide) buffer.getLong(at) to buffer.getLong(at + 8) else buffer.getInt(at).toLong() to buffer.getInt(at + 4).toLong()
            }.takeWhile { it.first != 0L }
            dynamicTags = entries.map { it.first }
            dynamicValues = entries.toMap()
            val strings = section(sectionsByName.getValue(".dynstr")).second
            neededLibraries = entries.filter { it.first == 1L }.map { cString(strings + it.second.toInt()) }
            val symbols = section(sectionsByName.getValue(".dynsym")).second
            val symbolSize = if (wide) 24 else 16
            symbolCount = section(sectionsByName.getValue(".dynsym")).third / symbolSize
            val relocations = section(sectionsByName.getValue(if (wide) ".rela.plt" else ".rel.plt"))
            val relocationSize = if (wide) 24 else 8
            pltSymbols = (0 until relocations.third / relocationSize).map {
                val at = relocations.second + it * relocationSize
                val slot = if (wide) buffer.getLong(at) else buffer.getInt(at).toLong()
                val info = if (wide) buffer.getLong(at + 8) else buffer.getInt(at + 4).toLong()
                val symbol = (if (wide) info ushr 32 else info ushr 8).toInt()
                slot to cString(strings + buffer.getInt(symbols + symbol * symbolSize))
            }
        }

        fun hashWords(limit: Int): List<Int> {
            val at = dynamicValues.getValue(4L).toInt()
            val bucketCount = buffer.getInt(at)
            val chainCount = buffer.getInt(at + 4)
            check(at + 4 * (2 + bucketCount + chainCount) <= limit) { "hash table past the end of the image" }
            return (0 until 2 + bucketCount + chainCount).map { buffer.getInt(at + 4 * it) }
        }

        private fun section(index: Int): Triple<Int, Int, Int> {
            val at = sectionOffset + index * sectionSize
            return if (wide) {
                Triple(index, buffer.getLong(at + 24).toInt(), buffer.getLong(at + 32).toInt())
            } else {
                Triple(index, buffer.getInt(at + 16), buffer.getInt(at + 20))
            }
        }

        private fun name(offset: Int) = cString(namesAt + offset)

        private fun cString(at: Int): String {
            val end = (at until bytes.size).first { bytes[it].toInt() == 0 }
            return String(bytes, at, end - at, Charsets.US_ASCII)
        }
    }
}
