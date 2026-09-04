package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertFailsWith

class PermissionPromptPatchTest {
    private data class Layout(
        val versionName: String,
        val versionCode: String,
        val size: Int,
        val offset: Int,
    )

    private val legacyLayouts = listOf(
        Layout("2.0.20", "5001712", 2_221_072, 0x142c0c),
        Layout("2.0.20", "5001740", 2_220_528, 0x142a9c),
        Layout("2.0.22", "5002244", 2_251_920, 0x1422c4),
        Layout("2.0.22", "5002296", 2_265_656, 0x14478c),
        Layout("2.0.22", "5002313", 2_276_872, 0x1472a8),
    )

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
        legacyLayouts.forEach { layout ->
            val input = ByteArray(layout.size).apply { original.copyInto(this, layout.offset) }
            val patched = patchPermissionPrompt(input, layout.versionName, layout.versionCode)

            assertContentEquals(
                replacement,
                patched.copyOfRange(layout.offset, layout.offset + replacement.size),
                "versionCode ${layout.versionCode}",
            )
            assertContentEquals(
                patched,
                patchPermissionPrompt(patched, layout.versionName, layout.versionCode),
                "versionCode ${layout.versionCode}",
            )
        }
    }

    @Test
    fun `known exact layouts reject changed size or prologue`() {
        legacyLayouts.forEach { layout ->
            assertFailsWith<PatchException>("bad size ${layout.versionCode}") {
                patchPermissionPrompt(ByteArray(layout.size - 1), layout.versionName, layout.versionCode)
            }
            assertFailsWith<PatchException>("bad prologue ${layout.versionCode}") {
                patchPermissionPrompt(ByteArray(layout.size), layout.versionName, layout.versionCode)
            }
        }
    }

    @Test
    fun `native permission requests remain untouched`() {
        listOf(
            Triple("5002318", 2_277_488, 0x147418),
            Triple("5002322", 2_283_400, 0x148aac),
        ).forEach { (versionCode, size, offset) ->
            val input = ByteArray(size).apply { original.copyInto(this, offset) }
            assertContentEquals(input, patchPermissionPrompt(input, "2.0.22", versionCode), versionCode)
        }
    }

    @Test
    fun `wrong version or build is left untouched even when size matches`() {
        val layout = legacyLayouts.first()
        val input = ByteArray(layout.size).apply { original.copyInto(this, layout.offset) }

        assertContentEquals(input, patchPermissionPrompt(input, "2.0.22", layout.versionCode))
        assertContentEquals(input, patchPermissionPrompt(input, layout.versionName, "5001713"))
    }
}
