package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertFailsWith

class PermissionPromptPatchTest {
    private val original = byteArrayOf(
        0xff.toByte(), 0x83.toByte(), 0x01, 0xd1.toByte(),
        0xfd.toByte(), 0x7b, 0x01, 0xa9.toByte(),
    )
    private val replacement = byteArrayOf(
        0x20, 0x00, 0x80.toByte(), 0x52,
        0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte(),
    )

    @Test
    fun `verified permission prompt layouts patch and remain idempotent`() {
        listOf(
            Triple(2_251_920, 0x1422c4, 5002244),
            Triple(2_276_872, 0x1472a8, 5002313),
        ).forEach { (size, offset, versionCode) ->
            val input = ByteArray(size).apply { original.copyInto(this, offset) }
            val patched = patchPermissionPrompt(input)

            assertContentEquals(
                replacement,
                patched.copyOfRange(offset, offset + replacement.size),
                "versionCode $versionCode",
            )
            assertContentEquals(patched, patchPermissionPrompt(patched), "versionCode $versionCode")
        }
    }

    @Test
    fun `verified permission prompt layouts reject changed prologue`() {
        listOf(2_251_920, 2_276_872).forEach { size ->
            assertFailsWith<PatchException> { patchPermissionPrompt(ByteArray(size)) }
        }
    }

    @Test
    fun `native permission requests remain untouched`() {
        listOf(
            Triple(5002318, 2_277_488, 0x147418),
            Triple(5002322, 2_283_400, 0x148aac),
        ).forEach { (versionCode, size, offset) ->
            val input = ByteArray(size).apply { original.copyInto(this, offset) }
            assertContentEquals(input, patchPermissionPrompt(input), versionCode.toString())
        }
    }

    @Test
    fun `unknown permission prompt layout is left untouched`() {
        val input = ByteArray(128) { it.toByte() }
        assertContentEquals(input, patchPermissionPrompt(input))
    }
}
