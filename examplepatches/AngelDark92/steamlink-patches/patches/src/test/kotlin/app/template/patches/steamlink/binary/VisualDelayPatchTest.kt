package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import kotlin.test.Test
import kotlin.test.assertContentEquals
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
        writeU16LE(54, 56)
        writeU16LE(56, 1)
        writeU32LE(64, 1)
        writeU64LE(64 + 8, 0)
        writeU64LE(64 + 16, 0)
        writeU64LE(64 + 32, size.toLong())

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
        val cave = size - 32
        val brX17 = byteArrayOf(0x20, 0x02, 0x1f, 0xd6.toByte())
        brX17.copyInto(this, cave + 12)
        brX17.copyInto(this, cave + 28)
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

    private companion object {
        data class TestLayout(
            val versionCode: Int,
            val fileSize: Int,
            val hookOffset: Int,
            val velocityStores: List<Triple<Int, Int, Boolean>>,
        )

        val nativeLayouts = listOf(
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
