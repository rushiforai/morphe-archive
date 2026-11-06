/*
 * Copyright (C) 2026 Ricardo ARM64 port contributors
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.smart123s.patches.ricardo

import app.morphe.patcher.patch.PatchException
import java.nio.ByteBuffer
import java.nio.ByteOrder
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

internal class NativeLibrariesTest {
    @Test
    fun `bundled libraries are AArch64 ELF files with 16 KiB load alignment`() {
        RicardoNativeLibraries.names.forEach { name ->
            val bytes = RicardoNativeLibraries.payload(name)
            val elf = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
            assertEquals(0x464c457f, elf.getInt(0), name)
            assertEquals(2, bytes[4].toInt(), name)
            assertEquals(183, elf.getShort(18).toInt(), name)
            val start = elf.getLong(32).toInt()
            val stride = elf.getShort(54).toInt()
            val count = elf.getShort(56).toInt()
            val loads = (0 until count).map { start + it * stride }.filter { elf.getInt(it) == 1 }
            assertTrue(loads.isNotEmpty(), name)
            loads.forEach { offset ->
                assertTrue(elf.getLong(offset + 48) >= 16384, name)
                assertEquals(0L, (elf.getLong(offset + 16) - elf.getLong(offset + 8)) % 16384, name)
            }
        }
    }

    @Test
    fun `a native library with a different engine build is rejected`() {
        assertFailsWith<PatchException> {
            RicardoNativeLibraries.validateOriginalLibraries(
                listOf("lib/armeabi-v7a/libgdx.so", "lib/armeabi-v7a/libgdx-box2d.so"),
            ) { ByteArray(4096) }
        }
    }

    @Test
    fun `an unsupported native dependency is rejected before writing any payload`() {
        assertFailsWith<PatchException> {
            RicardoNativeLibraries.validateOriginalLibraries(listOf("lib/armeabi-v7a/libunknown.so")) {
                error("Unsupported native entries should be rejected before they are read")
            }
        }
    }
}
