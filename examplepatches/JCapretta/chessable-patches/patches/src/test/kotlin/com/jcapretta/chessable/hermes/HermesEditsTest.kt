package com.jcapretta.chessable.hermes

import java.nio.ByteBuffer
import java.nio.ByteOrder
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class HermesEditsTest {
    private val edit = HermesEdit("test branch", 160, "923501".hexBytes(), "080101".hexBytes())

    private fun checksum(bytes: ByteArray): ByteArray = bytes.also {
        it.copyOfRange(0, it.size - 20).digest("SHA-1").copyInto(it, it.size - 20)
    }

    private fun fixture(): ByteArray = checksum(ByteArray(256).also {
        "c61fbc03c103191f".hexBytes().copyInto(it)
        ByteBuffer.wrap(it).order(ByteOrder.LITTLE_ENDIAN).putInt(8, 96).putInt(32, it.size)
        edit.original.copyInto(it, edit.offset)
    })

    private fun patch(original: ByteArray, edits: List<HermesEdit> = listOf(edit)) =
        HermesEdits(original.digest("SHA-256").joinToString("") { "%02x".format(it) }, edits)

    @Test
    fun `changes only declared bytes and footer without mutating input`() {
        val original = fixture()
        val saved = original.copyOf()
        val result = patch(original).apply(original)
        assertContentEquals(saved, original)
        assertEquals(original.size, result.size)
        assertContentEquals(edit.replacement, result.copyOfRange(160, 163))
        for (i in 0 until result.size - 20) {
            if (i !in 160..162) assertEquals(original[i], result[i], "Unexpected change at $i")
        }
        assertContentEquals(result.copyOfRange(0, 236).digest("SHA-1"), result.copyOfRange(236, 256))
    }

    @Test
    fun `reapplying is idempotent`() {
        val original = fixture()
        val patch = patch(original)
        val result = patch.apply(original)
        assertContentEquals(result, patch.apply(result))
    }

    @Test
    fun `rejects foreign content even with a valid checksum and matching edit sites`() {
        val original = fixture()
        val foreign = checksum(original.copyOf().also { it[200] = 42 })
        assertFailsWith<IllegalArgumentException> { patch(original).apply(foreign) }
    }

    @Test
    fun `rejects malformed headers and truncated files`() {
        val original = fixture()
        val inputs = listOf(
            original.copyOf(40),
            checksum(original.copyOf().also { it[0] = 0 }),
            checksum(original.copyOf().also { it[8] = 95 }),
            checksum(original.copyOf().also { it[32] = 1 }),
        )
        inputs.forEach { assertFailsWith<IllegalArgumentException> { patch(original).apply(it) } }
    }

    @Test
    fun `rejects corrupt checksums`() {
        val original = fixture()
        val corrupt = original.copyOf().also { it[it.lastIndex] = (it.last().toInt() xor 1).toByte() }
        assertFailsWith<IllegalArgumentException> { patch(original).apply(corrupt) }
    }

    @Test
    fun `rejects unexpected instructions before making any changes`() {
        val original = fixture()
        val corrupt = checksum(original.copyOf().also { it[160] = 0 })
        val saved = corrupt.copyOf()
        assertFailsWith<IllegalArgumentException> { patch(original).apply(corrupt) }
        assertContentEquals(saved, corrupt)
    }

    @Test
    fun `rejects overlapping out of bounds and variable size edits`() {
        val original = fixture()
        val invalid = listOf(
            listOf(edit, edit),
            listOf(edit.copy(offset = -1)),
            listOf(edit.copy(offset = 235)),
            listOf(edit.copy(offset = Int.MAX_VALUE)),
            listOf(edit.copy(replacement = byteArrayOf(8))),
            listOf(edit.copy(original = byteArrayOf(), replacement = byteArrayOf())),
        )
        invalid.forEach { assertFailsWith<IllegalArgumentException> { patch(original, it).apply(original) } }
    }

    @Test
    fun `accepts partially applied known edits`() {
        val original = fixture()
        val second = edit.copy(name = "second", offset = 180, original = byteArrayOf(0, 0, 0))
        val patch = patch(original, listOf(edit, second))
        val partial = checksum(original.copyOf().also { edit.replacement.copyInto(it, edit.offset) })
        assertContentEquals(patch.apply(original), patch.apply(partial))
    }

    @Test
    fun `independent patches compose in either order without enabling siblings`() {
        val original = fixture()
        val second = edit.copy(name = "second", offset = 180, original = byteArrayOf(0, 0, 0))
        val recognized = listOf(edit, second)
        val sha = original.digest("SHA-256").joinToString("") { "%02x".format(it) }
        val firstPatch = HermesEdits(sha, listOf(edit), recognized)
        val secondPatch = HermesEdits(sha, listOf(second), recognized)
        val firstOnly = firstPatch.apply(original)
        val secondOnly = secondPatch.apply(original)
        assertContentEquals(second.original, firstOnly.copyOfRange(180, 183))
        assertContentEquals(edit.original, secondOnly.copyOfRange(160, 163))
        val combined = secondPatch.apply(firstOnly)
        assertContentEquals(combined, firstPatch.apply(secondOnly))
        assertContentEquals(combined, firstPatch.apply(secondPatch.apply(combined)))
        assertContentEquals(patch(original, recognized).apply(original), combined)
    }

    @Test
    fun `sibling recognition still rejects foreign edits and invalid declarations`() {
        val original = fixture()
        val second = edit.copy(name = "second", offset = 180, original = byteArrayOf(0, 0, 0))
        val sha = original.digest("SHA-256").joinToString("") { "%02x".format(it) }
        val selected = HermesEdits(sha, listOf(edit), listOf(edit, second))
        val foreign = checksum(selected.apply(original).also { it[200] = 42 })
        assertFailsWith<IllegalArgumentException> { selected.apply(foreign) }
        assertFailsWith<IllegalArgumentException> {
            HermesEdits(sha, listOf(second), listOf(edit)).apply(original)
        }
        assertFailsWith<IllegalArgumentException> {
            HermesEdits(sha, listOf(edit), listOf(edit, second.copy(offset = 161))).apply(original)
        }
    }
}
