package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse

class VisualDelayPatchTest {
    @Test
    fun `native layouts patch all guarded sites and are idempotent`() {
        nativeLayouts.forEach { layout ->
            val stock = syntheticElf(layout)
            val patched = patchVisualDelay(stock, 60)

            assertFalse(stock.contentEquals(patched), layout.versionCode.toString())
            assertContentEquals(patched, patchVisualDelay(patched, 60), layout.versionCode.toString())
            assertContentEquals(
                stock.copyOfRange(stock.size - 32, stock.size),
                patched.copyOfRange(patched.size - 32, patched.size),
                "${layout.versionCode} live tail bytes",
            )
            assertEquals(1, patched.readU32LE(64 + 2 * 56), "${layout.versionCode} injected PT_LOAD")
            assertEquals(5, patched.readU32LE(64 + 2 * 56 + 4), "${layout.versionCode} RX flags")
            val injectedOffset = patched.readU64LE(64 + 2 * 56 + 8)
            val injectedVaddr = patched.readU64LE(64 + 2 * 56 + 16)
            val injectedAlignment = patched.readU64LE(64 + 2 * 56 + 48)
            assertEquals(layout.segmentAlignment, injectedAlignment, "${layout.versionCode} alignment")
            assertEquals(
                injectedOffset % injectedAlignment,
                injectedVaddr % injectedAlignment,
                "${layout.versionCode} PT_LOAD congruence",
            )
            layout.velocityStores.forEach { (offset, byteOffset, paired) ->
                assertContentEquals(
                    if (paired) sturXzrX19(byteOffset) else strWzrX19(byteOffset),
                    patched.copyOfRange(offset, offset + 4),
                    layout.versionCode.toString(),
                )
            }
        }
    }

    @Test
    fun `native layouts reject a changed hook without partial mutation`() {
        nativeLayouts.forEach { layout ->
            val changed = syntheticElf(layout).apply { this[layout.hookOffset] = 0 }
            val snapshot = changed.copyOf()

            assertFailsWith<PatchException>(layout.versionCode.toString()) {
                patchVisualDelay(changed, 60)
            }
            assertContentEquals(snapshot, changed, layout.versionCode.toString())
        }
    }

    @Test
    fun `unknown layout remains untouched`() {
        val input = ByteArray(128) { it.toByte() }
        assertContentEquals(input, patchVisualDelay(input, 60))
    }

    private fun syntheticElf(layout: TestLayout) = ByteArray(layout.fileSize).apply {
        writeU32LE(0, 0x464C457F)
        writeU64LE(32, 64)
        val sectionHeaders = size - 0x400
        writeU64LE(40, sectionHeaders.toLong())
        writeU16LE(54, 56)
        writeU16LE(56, 3)
        writeU16LE(58, 64)
        writeU16LE(60, 3)
        writeU16LE(62, 2)

        writeU32LE(64, 1)
        writeU32LE(64 + 4, 5)
        writeU64LE(64 + 8, 0)
        writeU64LE(64 + 16, 0)
        writeU64LE(64 + 32, (size - 0x1000).toLong())
        writeU64LE(64 + 40, (size - 0x1000).toLong())
        writeU64LE(64 + 48, layout.segmentAlignment)

        val writableLoad = 64 + 56
        val writableOffset = (size - 0x1000).toLong()
        val writableVaddr = 0x300000L + (writableOffset % layout.segmentAlignment)
        writeU32LE(writableLoad, 1)
        writeU32LE(writableLoad + 4, 6)
        writeU64LE(writableLoad + 8, writableOffset)
        writeU64LE(writableLoad + 16, writableVaddr)
        writeU64LE(writableLoad + 24, writableVaddr)
        writeU64LE(writableLoad + 32, 0x800)
        writeU64LE(writableLoad + 40, 0x20000)
        writeU64LE(writableLoad + 48, layout.segmentAlignment)

        val note = 64 + 2 * 56
        writeU32LE(note, 4)
        writeU32LE(note + 4, 4)
        writeU64LE(note + 8, 0x238)
        writeU64LE(note + 16, 0x238)
        writeU64LE(note + 24, 0x238)
        writeU64LE(note + 32, 0xBC)
        writeU64LE(note + 40, 0xBC)
        writeU64LE(note + 48, 4)

        val commentOffset = size - 0x800
        val stringTableOffset = size - 0x700
        val names = byteArrayOf(0) + ".comment\u0000.shstrtab\u0000".encodeToByteArray()
        names.copyInto(this, stringTableOffset)
        "Android synthetic toolchain comment".encodeToByteArray().copyInto(this, commentOffset)
        val commentSection = sectionHeaders + 64
        writeU32LE(commentSection, 1)
        writeU32LE(commentSection + 4, 1)
        writeU64LE(commentSection + 24, commentOffset.toLong())
        writeU64LE(commentSection + 32, 128)
        val stringTableSection = sectionHeaders + 128
        writeU32LE(stringTableSection, 10)
        writeU32LE(stringTableSection + 4, 3)
        writeU64LE(stringTableSection + 24, stringTableOffset.toLong())
        writeU64LE(stringTableSection + 32, names.size.toLong())

        byteArrayOf(0xe2.toByte(), 0x07, 0x40, 0xf9.toByte()).copyInto(this, layout.hookOffset)
        layout.velocityStores.forEachIndexed { index, (offset, byteOffset, paired) ->
            writeU32LE(
                offset,
                if (paired) {
                    0xFC000000.toInt() or ((byteOffset and 0x1FF) shl 12) or
                        (19 shl 5) or (index + 1)
                } else {
                    0xBD000000.toInt() or ((byteOffset / 4) shl 10) or
                        (19 shl 5) or (index + 1)
                },
            )
        }
    }

    private fun strWzrX19(byteOffset: Int): ByteArray {
        val word = 0xB9000000.toInt() or ((byteOffset / 4) shl 10) or (19 shl 5) or 31
        return ByteArray(4).apply { writeU32LE(0, word) }
    }

    private fun ByteArray.writeU16LE(offset: Int, value: Int) {
        this[offset] = value.toByte()
        this[offset + 1] = (value ushr 8).toByte()
    }

    private fun ByteArray.writeU32LE(offset: Int, value: Int) {
        for (index in 0 until 4) this[offset + index] = (value ushr (index * 8)).toByte()
    }

    private fun ByteArray.writeU64LE(offset: Int, value: Long) {
        for (index in 0 until 8) this[offset + index] = (value ushr (index * 8)).toByte()
    }

    private fun ByteArray.readU32LE(offset: Int): Int =
        (this[offset].toInt() and 0xFF) or
            ((this[offset + 1].toInt() and 0xFF) shl 8) or
            ((this[offset + 2].toInt() and 0xFF) shl 16) or
            ((this[offset + 3].toInt() and 0xFF) shl 24)

    private fun ByteArray.readU64LE(offset: Int): Long =
        (readU32LE(offset).toLong() and 0xFFFFFFFFL) or
            ((readU32LE(offset + 4).toLong() and 0xFFFFFFFFL) shl 32)

    private companion object {
        data class TestLayout(
            val versionCode: Int,
            val fileSize: Int,
            val hookOffset: Int,
            val velocityStores: List<Triple<Int, Int, Boolean>>,
            val segmentAlignment: Long = if (versionCode >= 5002172) 0x4000 else 0x1000,
        )

        val nativeLayouts = listOf(
            TestLayout(
                5001712,
                2_221_072,
                0x1014E8,
                listOf(
                    Triple(0x101514, 28, true),
                    Triple(0x101530, 36, false),
                    Triple(0x101610, 40, false),
                    Triple(0x101614, 44, false),
                    Triple(0x101620, 48, false),
                ),
            ),
            TestLayout(
                5001740,
                2_220_528,
                0x101378,
                listOf(
                    Triple(0x1013A4, 28, true),
                    Triple(0x1013C0, 36, false),
                    Triple(0x1014A0, 40, false),
                    Triple(0x1014A4, 44, false),
                    Triple(0x1014B0, 48, false),
                ),
            ),
            TestLayout(
                5002318,
                2_277_488,
                0x100B0C,
                listOf(
                    Triple(0x100D80, 28, false),
                    Triple(0x100D84, 32, false),
                    Triple(0x100D88, 36, false),
                    Triple(0x100D94, 40, false),
                    Triple(0x100D98, 44, false),
                    Triple(0x100DA4, 48, false),
                ),
            ),
            TestLayout(
                5002322,
                2_283_400,
                0x101154,
                listOf(
                    Triple(0x1013C8, 28, false),
                    Triple(0x1013CC, 32, false),
                    Triple(0x1013D0, 36, false),
                    Triple(0x1013DC, 40, false),
                    Triple(0x1013E0, 44, false),
                    Triple(0x1013EC, 48, false),
                ),
            ),
        )
    }

    private fun sturXzrX19(byteOffset: Int): ByteArray {
        val word = 0xF8000000.toInt() or ((byteOffset and 0x1FF) shl 12) or (19 shl 5) or 31
        return ByteArray(4).apply { writeU32LE(0, word) }
    }
}
