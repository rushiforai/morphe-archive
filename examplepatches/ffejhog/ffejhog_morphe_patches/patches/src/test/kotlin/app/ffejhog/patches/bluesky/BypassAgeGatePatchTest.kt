package app.ffejhog.patches.bluesky

import java.security.MessageDigest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

/**
 * Tests the byte-level transform of [withAgeGateBypassed] without needing the real app bundle.
 *
 * The gate sequence is reproduced as a fixture: the two `GetById` operand tails plus the
 * `JStrictEqual` that jumps to the age gate screen, surrounded by unrelated bytes.
 */
class BypassAgeGatePatchTest {

    private val gatePattern = byteArrayOf(
        0x78, 0x8d.toByte(), 0x45, 0x0c,
        0x0c, 0x1a, 0x7b, 0xd0.toByte(),
        0xd4.toByte(), 0x3b, 0x12, 0x0c,
    )

    private val gateReplacement = byteArrayOf(
        0x78, 0x8d.toByte(), 0x45, 0x0c,
        0x0c, 0x1a, 0x7b, 0xd0.toByte(),
        0x16, 0x15, 0x12, 0x0c,
    )

    /** A fake bytecode file: filler, the gate sequence, more filler, then a valid SHA-1 footer. */
    private fun bundle(fillerBefore: Int = 64, fillerAfter: Int = 64): ByteArray {
        val body = ByteArray(fillerBefore).map { (it % 251).toByte() }.toByteArray() +
            gatePattern +
            ByteArray(fillerAfter).map { ((it + 7) % 251).toByte() }.toByteArray()
        return body + MessageDigest.getInstance("SHA-1").digest(body)
    }

    @Test
    fun `replaces the branch and nothing else`() {
        val original = bundle()
        val patched = original.withAgeGateBypassed()

        // The comparison starts 8 bytes into the 12-byte sequence: the first 8 are the
        // operand tails of the two preceding GetById instructions.
        val instructionStart = 64 + 8

        assertEquals(original.size, patched.size, "The file size must not change.")
        assertFalse(contains(patched, gatePattern), "The conditional jump must be gone.")
        assertTrue(contains(patched, gateReplacement), "The non-branching comparison must be present.")

        val changed = original.indices.filter { original[it] != patched[it] }
        // 4 instruction bytes may differ; the 20-byte footer is recomputed and may differ too.
        assertTrue(
            changed.all {
                (it >= instructionStart && it < instructionStart + 4) || it >= original.size - 20
            },
            "Only the comparison instruction and the footer may change, but got $changed",
        )
    }

    @Test
    fun `recomputes the sha1 footer`() {
        val patched = original().withAgeGateBypassed()
        val sha1 = MessageDigest.getInstance("SHA-1")
        sha1.update(patched, 0, patched.size - 20)
        val expected: ByteArray = sha1.digest()
        val actual: ByteArray = patched.takeLast(20).toByteArray()
        assertTrue(expected.contentEquals(actual), "The footer must be a valid SHA-1.")
    }

    @Test
    fun `is idempotent in effect when applied to already patched bytes`() {
        val patched = original().withAgeGateBypassed()
        // The gate pattern is gone, so a second run must fail rather than corrupt the file.
        assertFailsWith<IllegalStateException> { patched.withAgeGateBypassed() }
    }

    @Test
    fun `fails when the pattern is missing`() {
        val noGate = ByteArray(200) { it.toByte() } + ByteArray(20)
        val error = assertFailsWith<IllegalStateException> { noGate.withAgeGateBypassed() }
        assertTrue(error.message!!.contains("found 0 matches"))
    }

    @Test
    fun `fails when the pattern is ambiguous`() {
        val body = ByteArray(32) + gatePattern + ByteArray(32) + gatePattern + ByteArray(32)
        val ambiguous = body + MessageDigest.getInstance("SHA-1").digest(body)
        val error = assertFailsWith<IllegalStateException> { ambiguous.withAgeGateBypassed() }
        assertTrue(error.message!!.contains("found 2 matches"))
    }

    @Test
    fun `fails on a file too small to hold a footer`() {
        assertFailsWith<IllegalStateException> { ByteArray(10).withAgeGateBypassed() }
    }

    private fun original() = bundle()

    private fun contains(haystack: ByteArray, needle: ByteArray): Boolean =
        (0..haystack.size - needle.size).any { start ->
            needle.indices.all { haystack[start + it] == needle[it] }
        }
}
