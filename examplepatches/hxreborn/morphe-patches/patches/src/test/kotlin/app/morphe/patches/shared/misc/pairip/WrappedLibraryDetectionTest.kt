/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.shared.misc.pairip

import java.nio.ByteBuffer
import java.nio.ByteOrder
import kotlin.test.Test
import kotlin.test.assertFalse
import kotlin.test.assertTrue

internal class WrappedLibraryDetectionTest {
    @Test
    fun `detects the pairip runtime in a library with section headers`() {
        assertTrue(SyntheticLibrary(wide = true).wrapped.isPairipWrappedLibrary())
    }

    @Test
    fun `detects the pairip runtime in a library without section headers`() {
        // given
        val library = withoutSectionHeaders(SyntheticLibrary(wide = true).wrapped)

        // when
        val wrapped = library.isPairipWrappedLibrary()

        // then
        assertTrue(wrapped)
    }

    @Test
    fun `ignores a library that does not need the pairip runtime`() {
        // given
        val library = withNeededLibrary(SyntheticLibrary(wide = false).wrapped, "libothercore.so")

        // when
        val wrapped = library.isPairipWrappedLibrary()

        // then
        assertFalse(wrapped)
    }

    @Test
    fun `ignores a file that is not an ELF`() {
        assertFalse(ByteArray(128) { 0x41 }.isPairipWrappedLibrary())
    }

    private fun withoutSectionHeaders(library: ByteArray) = library.copyOf().also {
        ByteBuffer.wrap(it).order(ByteOrder.LITTLE_ENDIAN).putShort(WIDE_SECTION_COUNT_OFFSET, 0)
    }

    private fun withNeededLibrary(library: ByteArray, name: String) = library.copyOf().also {
        val runtime = "libpairipcore.so".toByteArray(Charsets.US_ASCII)
        val replacement = name.padEnd(runtime.size, '\u0000').toByteArray(Charsets.US_ASCII)
        val at = (0..it.size - runtime.size).first { start -> it.copyOfRange(start, start + runtime.size).contentEquals(runtime) }
        replacement.copyInto(it, at)
    }

    private companion object {
        const val WIDE_SECTION_COUNT_OFFSET = 0x3C
    }
}
