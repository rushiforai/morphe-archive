package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import org.junit.Assume.assumeTrue
import java.io.File
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class VisualDelayPatchTest {
    @Test
    fun `native layouts patch all guarded sites and are idempotent`() {
        nativeLayouts.forEach { layout ->
            val stock = syntheticElf(layout)
            val patched = patchVisualDelay(stock, 60, layout.versionName, layout.versionCode.toString())

            assertFalse(stock.contentEquals(patched), layout.versionCode.toString())
            assertContentEquals(patched, patchVisualDelay(patched, 60, layout.versionName, layout.versionCode.toString()), layout.versionCode.toString())
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
                patchVisualDelay(changed, 60, layout.versionName, layout.versionCode.toString())
            }
            assertContentEquals(snapshot, changed, layout.versionCode.toString())
        }
    }

    @Test
    fun `unknown layout remains untouched`() {
        val input = ByteArray(128) { it.toByte() }
        assertContentEquals(input, patchVisualDelay(input, 60))
    }

    @Test
    fun `5002363 requires exact metadata and rejects unexpected size`() {
        val stock = syntheticElf(layout5002363)
        val patched = patchVisualDelay(stock, 60, layout5002363.versionName, layout5002363.versionCode.toString())
        assertFalse(stock.contentEquals(patched))
        assertContentEquals(patched, patchVisualDelay(patched, 60, layout5002363.versionName, layout5002363.versionCode.toString()))
        assertContentEquals(stock, patchVisualDelay(stock, 60, "2.0.22", "5002363"))
        assertContentEquals(stock, patchVisualDelay(stock, 60, "2.0.23", "5002322"))
        assertFailsWith<PatchException> {
            patchVisualDelay(ByteArray(128), 60, "2.0.23", "5002363")
        }
    }

    @Test
    fun `5002395 requires exact metadata and rejects unexpected size`() {
        val stock = syntheticElf(layout5002395)
        val patched = patchVisualDelay(stock, 60, layout5002395.versionName, layout5002395.versionCode.toString())
        assertFalse(stock.contentEquals(patched))
        assertContentEquals(patched, patchVisualDelay(patched, 60, layout5002395.versionName, layout5002395.versionCode.toString()))
        assertContentEquals(stock, patchVisualDelay(stock, 60, "2.0.23", "5002395"))
        assertContentEquals(stock, patchVisualDelay(stock, 60, "2.0.24", "5002363"))
        assertFailsWith<PatchException> {
            patchVisualDelay(ByteArray(128), 60, "2.0.24", "5002395")
        }
    }

    @Test
    fun `5002395 timestamp transitions change only canonical trampoline body`() {
        val stock = syntheticElf(layout5002395)
        val cave = stock.size - 0x800
        val offsets = listOf(0L, 1L, 60L, 1000L, 4000L)
        for (from in offsets) {
            val patched = patchVisualDelay(stock, from, "2.0.24", "5002395")
            assertFalse(stock.contentEquals(patched))
            for (to in offsets) {
                val transitioned = patchVisualDelay(patched, to, "2.0.24", "5002395")
                assertContentEquals(
                    patchVisualDelay(stock, to, "2.0.24", "5002395"), transitioned,
                    "$from -> $to",
                )
                assertContentEquals(patched.copyOfRange(0, cave + 4), transitioned.copyOfRange(0, cave + 4))
                assertContentEquals(patched.copyOfRange(cave + 16, patched.size), transitioned.copyOfRange(cave + 16, transitioned.size))
            }
        }
    }

    @Test
    fun `5002527 requires exact metadata and rejects unexpected size`() {
        val stock = syntheticElf(layout5002527)
        val patched = patchVisualDelay(stock, 60, layout5002527.versionName, layout5002527.versionCode.toString())
        assertFalse(stock.contentEquals(patched))
        assertContentEquals(patched, patchVisualDelay(patched, 60, layout5002527.versionName, layout5002527.versionCode.toString()))
        // Neighbouring builds and wrong version names never select this layout.
        assertContentEquals(stock, patchVisualDelay(stock, 60, "2.0.23", "5002527"))
        assertContentEquals(stock, patchVisualDelay(stock, 60, "2.0.24", "5002526"))
        assertContentEquals(stock, patchVisualDelay(stock, 60, "2.0.24", "5002528"))
        assertFailsWith<PatchException> {
            patchVisualDelay(ByteArray(128), 60, "2.0.24", "5002527")
        }
        // The size-only legacy contract must never select the new base.
        assertContentEquals(stock, patchVisualDelay(stock, 60))
    }

    @Test
    fun `5002527 timestamp transitions change only canonical trampoline body`() {
        val stock = syntheticElf(layout5002527)
        val cave = stock.size - 0x800
        val offsets = listOf(0L, 1L, 60L, 1000L, 4000L)
        for (from in offsets) {
            val patched = patchVisualDelay(stock, from, "2.0.24", "5002527")
            assertFalse(stock.contentEquals(patched))
            for (to in offsets) {
                val transitioned = patchVisualDelay(patched, to, "2.0.24", "5002527")
                assertContentEquals(
                    patchVisualDelay(stock, to, "2.0.24", "5002527"), transitioned,
                    "$from -> $to",
                )
                assertContentEquals(patched.copyOfRange(0, cave + 4), transitioned.copyOfRange(0, cave + 4))
                assertContentEquals(patched.copyOfRange(cave + 16, patched.size), transitioned.copyOfRange(cave + 16, transitioned.size))
            }
        }
    }

    @Test
    fun `5002527 refuses altered trampoline hook or velocities and out of range offsets`() {
        val stock = syntheticElf(layout5002527)
        val patched = patchVisualDelay(stock, 60, "2.0.24", "5002527")
        val cave = stock.size - 0x800
        val corruptOffsets = (0 until 20).map { cave + it } +
            layout5002527.hookOffset + layout5002527.velocityStores.map { it.first }
        for (offset in corruptOffsets) {
            val malformed = patched.copyOf().apply { this[offset] = (this[offset].toInt() xor 0x80).toByte() }
            val snapshot = malformed.copyOf()
            assertFailsWith<PatchException>("offset=$offset") {
                patchVisualDelay(malformed, 1000, "2.0.24", "5002527")
            }
            assertContentEquals(snapshot, malformed)
        }
        // A stock library whose hook or any one velocity store is not the audited instruction.
        for (offset in listOf(layout5002527.hookOffset) + layout5002527.velocityStores.map { it.first }) {
            val changed = stock.copyOf().apply { this[offset] = (this[offset].toInt() xor 0x80).toByte() }
            val snapshot = changed.copyOf()
            assertFailsWith<PatchException>("stock offset=$offset") {
                patchVisualDelay(changed, 60, "2.0.24", "5002527")
            }
            assertContentEquals(snapshot, changed)
        }
        for (offset in listOf(-1L, 4001L)) assertFailsWith<PatchException> {
            patchVisualDelay(stock, offset, "2.0.24", "5002527")
        }
    }

    @Test
    fun `5002527 real decoded renderer changes only the hook cave mapping and six velocity stores`() {
        val file = decodedScene("2.0.24", "5002527")
        assumeTrue("BLOCKED: decoded 2.0.24/5002527 scene is absent", file != null)
        val stock = file!!.readBytes()
        assertEquals(2_333_472, stock.size)
        assertEquals("cfa9a9081afe9f011d50088642b11c04c8c386f393231d434621121e2c65ea03", sha256(stock))
        // Independent expectation: stock instruction words at the audited addresses.
        assertContentEquals(byteArrayOf(0xe2.toByte(), 0x07, 0x40, 0xf9.toByte()), stock.copyOfRange(0x102b90, 0x102b94))
        val patched = patchVisualDelay(stock, 60, "2.0.24", "5002527")
        assertContentEquals(patched, patchVisualDelay(patched, 60, "2.0.24", "5002527"))
        val changed = stock.indices.filter { stock[it] != patched[it] }
        val phoff = stock.readU64LE(32).toInt()
        val noteHeader = (0 until stock.readU16LE(56)).map { phoff + it * 56 }.single { stock.readU32LE(it) == 4 }
        val allowed = buildList {
            add(0x102b90 until 0x102b94)
            layout5002527.velocityStores.forEach { add(it.first until it.first + 4) }
            add(0x2392e8 until 0x2392e8 + 20) // .comment trampoline
            add(noteHeader until noteHeader + 56) // PT_NOTE repurposed as the executable mapping
        }
        assertTrue(changed.isNotEmpty())
        assertTrue(changed.all { index -> allowed.any { index in it } }, "Out-of-scope byte changed")
        assertEquals(1, patched.readU32LE(noteHeader), "PT_NOTE repurposed as PT_LOAD")
        layout5002527.velocityStores.forEach { (offset, byteOffset, _) ->
            assertContentEquals(strWzrX19(byteOffset), patched.copyOfRange(offset, offset + 4))
        }
        for (offset in listOf(0L, 1L, 60L, 4000L)) {
            val transitioned = patchVisualDelay(patched, offset, "2.0.24", "5002527")
            assertContentEquals(patchVisualDelay(stock, offset, "2.0.24", "5002527"), transitioned, "-> $offset")
        }
        // Prior pairs fail closed on this library: their exact sizes differ.
        for ((version, code) in listOf("2.0.23" to "5002363", "2.0.24" to "5002395")) {
            assertFailsWith<PatchException>(code) { patchVisualDelay(stock, 60, version, code) }
        }
    }

    @Test
    fun `5002363 timestamp transitions change only canonical trampoline body`() {
        val stock = syntheticElf(layout5002363)
        val cave = stock.size - 0x800
        val offsets = listOf(0L, 1L, 60L, 1000L, 4000L)
        for (from in offsets) {
            val patched = patchVisualDelay(stock, from, "2.0.23", "5002363")
            assertFalse(stock.contentEquals(patched))
            for (to in offsets) {
                val transitioned = patchVisualDelay(patched, to, "2.0.23", "5002363")
                assertContentEquals(
                    patchVisualDelay(stock, to, "2.0.23", "5002363"), transitioned,
                    "$from -> $to",
                )
                assertContentEquals(patched.copyOfRange(0, cave + 4), transitioned.copyOfRange(0, cave + 4))
                assertContentEquals(patched.copyOfRange(cave + 16, patched.size), transitioned.copyOfRange(cave + 16, transitioned.size))
            }
        }
    }

    @Test
    fun `5002363 refuses altered trampoline hook or velocities without mutating input`() {
        val stock = syntheticElf(layout5002363)
        val patched = patchVisualDelay(stock, 60, "2.0.23", "5002363")
        val cave = stock.size - 0x800
        val corruptOffsets = (0 until 20).map { cave + it } +
            layout5002363.hookOffset + layout5002363.velocityStores.map { it.first }
        for (offset in corruptOffsets) {
            // 0x80 changes an opcode/register or makes an immediate non-canonical/non-millisecond.
            val malformed = patched.copyOf().apply { this[offset] = (this[offset].toInt() xor 0x80).toByte() }
            val snapshot = malformed.copyOf()
            assertFailsWith<PatchException>("offset=$offset") {
                patchVisualDelay(malformed, 1000, "2.0.23", "5002363")
            }
            assertContentEquals(snapshot, malformed)
        }
        for (offset in listOf(-1L, 4001L)) assertFailsWith<PatchException> {
            patchVisualDelay(stock, offset, "2.0.23", "5002363")
        }
    }

    @Test
    fun `5002363 rejects corrupted injected load on reapply and offset transition`() {
        val patched = patchVisualDelay(syntheticElf(layout5002363), 60, "2.0.23", "5002363")
        val header = 64 + 2 * 56
        val malformedHeaders = listOf(
            patched.copyOf().apply { writeU32LE(header, 0) },
            patched.copyOf().apply { writeU32LE(header + 4, 4) },
            patched.copyOf().apply { writeU64LE(header + 8, readU64LE(header + 8) + 4) },
            patched.copyOf().apply { writeU64LE(header + 16, readU64LE(header + 16) + 4) },
            patched.copyOf().apply { writeU64LE(header + 24, 0) },
            patched.copyOf().apply { writeU64LE(header + 32, readU64LE(header + 32) + 4) },
            patched.copyOf().apply { writeU64LE(header + 32, size.toLong() + 1) },
            patched.copyOf().apply { writeU64LE(header + 40, 0) },
            patched.copyOf().apply { writeU64LE(header + 40, readU64LE(header + 40) + 4) },
            patched.copyOf().apply { writeU64LE(header + 48, 0x1000) },
        )
        malformedHeaders.forEachIndexed { index, malformed ->
            val snapshot = malformed.copyOf()
            for (offset in listOf(60L, 1000L)) {
                assertFailsWith<PatchException>("header variant=$index offset=$offset") {
                    patchVisualDelay(malformed, offset, "2.0.23", "5002363")
                }
                assertContentEquals(snapshot, malformed)
            }
        }
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

    private fun ByteArray.readU16LE(offset: Int): Int =
        (this[offset].toInt() and 0xFF) or ((this[offset + 1].toInt() and 0xFF) shl 8)

    private fun sha256(bytes: ByteArray): String =
        java.security.MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

    // Gradle runs tests from patches/, so locate the repository root explicitly; absent
    // inputs skip the real-base audit and never substitute synthetic bytes for it.
    private fun decodedScene(version: String, code: String): File? {
        val root = generateSequence(File(System.getProperty("user.dir")).canonicalFile) { it.parentFile }
            .firstOrNull { File(it, "patches/src/main/kotlin").isDirectory } ?: return null
        return File(root, "android-steamlinkvr-release-base-$version-$code/lib/arm64-v8a/libvrlink_scene.so")
            .takeIf { it.isFile }
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

    @Test
    fun `real decoded renderers patch and reapply on every restored base`() {
        val bases = listOf(
            Triple("2.0.20", "5001712", 2_221_072),
            Triple("2.0.20", "5001812", 2_220_872),
            Triple("2.0.21", "5001968", 2_234_048),
            Triple("2.0.22", "5002244", 2_251_920),
            Triple("2.0.23", "5002363", 2_292_008),
            Triple("2.0.24", "5002395", 2_301_432),
            Triple("2.0.24", "5002527", 2_333_472),
        )
        bases.forEach { (version, code, size) ->
            val file = File("android-steamlinkvr-release-base-$version-$code/lib/arm64-v8a/libvrlink_scene.so")
            assumeTrue("BLOCKED: decoded $version/$code scene is absent", file.isFile)
            val stock = file.readBytes()
            assertEquals(size, stock.size, "$version/$code")
            val patched = patchVisualDelay(stock, 60, version, code)
            assertFalse(stock.contentEquals(patched), "$version/$code")
            assertContentEquals(patched, patchVisualDelay(patched, 60, version, code), "$version/$code")
        }
    }

    private companion object {
        data class TestLayout(
            val versionCode: Int,
            val versionName: String,
            val fileSize: Int,
            val hookOffset: Int,
            val velocityStores: List<Triple<Int, Int, Boolean>>,
            val segmentAlignment: Long = if (versionCode >= 5002244) 0x4000 else 0x1000,
        )

        val layout5002363 = TestLayout(
            5002363, "2.0.23", 2_292_008, 0x101f1c,
            listOf(
                Triple(0x102190, 28, false), Triple(0x102194, 32, false),
                Triple(0x102198, 36, false), Triple(0x1021a4, 40, false),
                Triple(0x1021a8, 44, false), Triple(0x1021b4, 48, false),
            ),
        )

        val layout5002395 = TestLayout(
            5002395, "2.0.24", 2_301_432, 0x103174,
            listOf(
                Triple(0x1033e8, 28, false), Triple(0x1033ec, 32, false),
                Triple(0x1033f0, 36, false), Triple(0x1033fc, 40, false),
                Triple(0x103400, 44, false), Triple(0x10340c, 48, false),
            ),
        )

        val layout5002527 = TestLayout(
            5002527, "2.0.24", 2_333_472, 0x102b90,
            listOf(
                Triple(0x102e04, 28, false), Triple(0x102e08, 32, false),
                Triple(0x102e0c, 36, false), Triple(0x102e18, 40, false),
                Triple(0x102e1c, 44, false), Triple(0x102e28, 48, false),
            ),
        )

        val nativeLayouts = listOf(
            layout5002363,
            layout5002395,
            layout5002527,
            TestLayout(
                5001712, "2.0.20",
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
        )
    }

    private fun sturXzrX19(byteOffset: Int): ByteArray {
        val word = 0xF8000000.toInt() or ((byteOffset and 0x1FF) shl 12) or (19 shl 5) or 31
        return ByteArray(4).apply { writeU32LE(0, word) }
    }
}
