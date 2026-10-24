/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.shared.misc.pairip

import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

private val ELF_MAGIC = byteArrayOf(0x7F, 'E'.code.toByte(), 'L'.code.toByte(), 'F'.code.toByte())
private val DEX_MAGIC = "dex\n".toByteArray(Charsets.US_ASCII)
private const val PRINTABLE_RUN = 64

private fun ByteArray.contains(sequence: ByteArray) = (0..size - sequence.size).any { start ->
    sequence.indices.all { this[start + it] == sequence[it] }
}

private fun ByteArray.longestPrintableRun(): Int {
    var longest = 0
    var run = 0
    forEach { byte ->
        run = if (byte in 0x20..0x7E) run + 1 else 0
        longest = maxOf(longest, run)
    }
    return longest
}

private fun NativeLibraryKey.restoredCodeFindings(): List<String> {
    val material = windows.flatMap { it.patterns } + records.map { it.bytes }
    return buildList {
        if (material.any { it.contains(ELF_MAGIC) }) add("ELF header")
        if (material.any { it.contains(DEX_MAGIC) }) add("dex header")
        if (material.any { it.longestPrintableRun() >= PRINTABLE_RUN }) add("printable run")
    }
}

internal class NativeLibraryKeyFilesTest {
    private val keyFiles = File(javaClass.getResource("/pairip")!!.toURI()).listFiles { file -> file.name.startsWith("key-") }!!

    @Test
    fun `finds a key file for every wrapped library`() {
        assertTrue(keyFiles.isNotEmpty())
    }

    @Test
    fun `shipped keys hold no restored code`() {
        val findings = keyFiles.associate { it.name to NativeLibraryKey.parse(it.readBytes()).restoredCodeFindings() }

        assertEquals(emptyMap(), findings.filterValues { it.isNotEmpty() })
    }

    @Test
    fun `flags a record that holds an ELF header`() {
        assertEquals(listOf("ELF header"), keyWith(ELF_MAGIC).restoredCodeFindings())
    }

    @Test
    fun `flags a record that holds a dex header`() {
        assertEquals(listOf("dex header"), keyWith(DEX_MAGIC).restoredCodeFindings())
    }

    @Test
    fun `flags a record that holds readable text`() {
        val text = ByteArray(PRINTABLE_RUN) { 'a'.code.toByte() }

        assertEquals(listOf("printable run"), keyWith(text).restoredCodeFindings())
    }

    private fun keyWith(bytes: ByteArray) = NativeLibraryKey.parse(SyntheticLibrary(wide = true).keyWithXorRecord(bytes))
}
