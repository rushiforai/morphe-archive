package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import app.template.patches.steamlink.androidxr.MODERN_TONGUE_LIBRARY_SIZE_5002363
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
        Layout("2.0.22", "5002244", 2_251_920, 0x1422c4),
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
        val input = ByteArray(MODERN_TONGUE_LIBRARY_SIZE_5002363).apply { original.copyInto(this, 0x148aac) }
        assertContentEquals(input, patchPermissionPrompt(input, "2.0.23", "5002363"))
    }

    @Test
    fun `wrong version or build is left untouched even when size matches`() {
        val layout = legacyLayouts.first()
        val input = ByteArray(layout.size).apply { original.copyInto(this, layout.offset) }

        assertContentEquals(input, patchPermissionPrompt(input, "2.0.22", layout.versionCode))
        assertContentEquals(input, patchPermissionPrompt(input, layout.versionName, "5001713"))
    }
}
