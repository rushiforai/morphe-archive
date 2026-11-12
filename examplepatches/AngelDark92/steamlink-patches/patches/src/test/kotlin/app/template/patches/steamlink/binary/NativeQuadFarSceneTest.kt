package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import java.security.MessageDigest
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertNotEquals
import kotlin.test.assertTrue

class NativeQuadFarSceneTest {
    private val base = "5001712" to "2.0.20"

    private fun sha(bytes: ByteArray) =
        MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

    private fun hex(bytes: ByteArray) = bytes.joinToString("") { "%02x".format(it) }

    /** Synthetic AArch64 ELF64 image of [size] bytes with deterministic non-zero content. */
    private fun image(size: Int): ByteArray {
        val out = ByteArray(size) { (it * 31 + 7).toByte() }
        out[0] = 0x7f; out[1] = 'E'.code.toByte(); out[2] = 'L'.code.toByte(); out[3] = 'F'.code.toByte()
        out[4] = 2; out[18] = 0xb7.toByte(); out[19] = 0
        return out
    }

    private fun synthetic(size: Int = 4096): Pair<NativeQuadFarLayout, ByteArray> {
        val stock = image(size)
        fun site(name: String, offset: Int, length: Int, fill: Int) = NativeQuadFarSite(
            name, offset, length, sha(stock.copyOfRange(offset, offset + length)),
            hex(ByteArray(length) { (fill + it).toByte() }),
        )
        return NativeQuadFarLayout("2.0.20", "5001712", size, listOf(
            site("a", 0x100, 16, 0x10), site("b", 0x200, 32, 0x40), site("c", 0x400, 4, 0x80),
        )) to stock
    }

    @Test
    fun registryCoversOnlyTheSingleFarPlaneBase() {
        assertEquals(setOf(base.first), NATIVE_QUAD_FAR_LAYOUTS.keys)
        val layout = NATIVE_QUAD_FAR_LAYOUTS.getValue(base.first)
        assertEquals(base.second, layout.versionName)
        assertEquals(base.first, layout.versionCode)
        assertTrue(layout.size > 2_000_000)
        assertFalse(NATIVE_QUAD_FAR_LAYOUTS.containsKey("5001812"), "5001812 stays frozen")
        assertFalse(NATIVE_QUAD_FAR_LAYOUTS.containsKey("5002527"), "stock 5002527 is reference only")
    }

    @Test
    fun layoutIsWellFormed() {
        NATIVE_QUAD_FAR_LAYOUTS.values.forEach { layout ->
            val sites = layout.sites.sortedBy { it.offset }
            assertTrue(sites.size >= 13, layout.versionCode)
            assertEquals(sites.size, sites.map { it.name }.toSet().size, "unique names ${layout.versionCode}")
            sites.forEach {
                assertEquals(it.length * 2, it.patched.length, "${layout.versionCode} ${it.name}")
                assertEquals(0, it.offset % 4)
                assertEquals(0, it.length % 4)
                assertEquals(64, it.stockSha256.length)
                assertTrue(it.offset + it.length <= layout.size)
            }
            for (i in 1 until sites.size) {
                assertTrue(sites[i - 1].offset + sites[i - 1].length <= sites[i].offset, "overlap ${layout.versionCode}")
            }
            // the constructor/destructor/E2H hooks and the rewritten functions are present
            listOf("regionA", "regionB", "p_init", "p_flip_eye", "s_ctor", "s_dtor", "s_e2h", "s_pose_frame")
                .forEach { name -> assertTrue(sites.any { it.name == name }, "${layout.versionCode} $name") }
        }
    }

    @Test
    fun patchesStockCopyAndLeavesInputUntouched() {
        val (layout, stock) = synthetic()
        val before = stock.copyOf()
        val patched = applyNativeQuadFarLayout(stock, layout)
        assertContentEquals(before, stock)
        assertNotEquals(hex(before), hex(patched))
        layout.sites.forEach { site ->
            val expected = site.patched.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
            assertContentEquals(expected, patched.copyOfRange(site.offset, site.offset + site.length))
        }
        // nothing outside the owned sites changed
        val owned = layout.sites.flatMap { (it.offset until it.offset + it.length).toList() }.toSet()
        for (i in patched.indices) if (i !in owned) assertEquals(before[i], patched[i], "byte $i")
    }

    @Test
    fun reapplicationIsIdempotent() {
        val (layout, stock) = synthetic()
        val once = applyNativeQuadFarLayout(stock, layout)
        val twice = applyNativeQuadFarLayout(once, layout)
        assertContentEquals(once, twice)
        assertTrue(isNativeQuadFarPlanePatched(once, layout))
    }

    @Test
    fun partiallyPatchedOrForeignBytesAreRejected() {
        val (layout, stock) = synthetic()
        val full = applyNativeQuadFarLayout(stock, layout)
        val mixed = stock.copyOf()
        System.arraycopy(full, 0x100, mixed, 0x100, 16)
        assertFailsWith<PatchException> { applyNativeQuadFarLayout(mixed, layout) }
        val foreign = stock.copyOf().also { it[0x205] = (it[0x205] + 1).toByte() }
        assertFailsWith<PatchException> { applyNativeQuadFarLayout(foreign, layout) }
        val brokenAfterPatch = full.copyOf().also { it[0x401] = (it[0x401] + 1).toByte() }
        assertFailsWith<PatchException> { applyNativeQuadFarLayout(brokenAfterPatch, layout) }
    }

    @Test
    fun otherPatchesOutsideOwnedSitesDoNotBreakComposition() {
        val (layout, stock) = synthetic()
        val other = stock.copyOf().also { it[0x300] = 0x55; it[0x3ff] = 0x66 }   // not owned
        val patched = applyNativeQuadFarLayout(other, layout)
        assertEquals(0x55, patched[0x300].toInt())
        assertContentEquals(applyNativeQuadFarLayout(patched, layout), patched)
        // the opposite order: our patch first, the other patch afterwards
        val first = applyNativeQuadFarLayout(stock, layout).also { it[0x300] = 0x55; it[0x3ff] = 0x66 }
        assertContentEquals(patched, first)
    }

    @Test
    fun wrongSizeAndWrongElfAreRejected() {
        val (layout, stock) = synthetic()
        assertFailsWith<PatchException> { applyNativeQuadFarLayout(stock.copyOf(stock.size + 4), layout) }
        val notElf = stock.copyOf().also { it[0] = 0 }
        assertFailsWith<PatchException> { applyNativeQuadFarLayout(notElf, layout) }
        val wrongMachine = stock.copyOf().also { it[18] = 0x3e }
        assertFailsWith<PatchException> { applyNativeQuadFarLayout(wrongMachine, layout) }
    }

    @Test
    fun unknownOrMismatchedBuildsAreRejected() {
        val stock = ByteArray(16)
        assertFailsWith<PatchException> { applyNativeQuadFarPlaneScene(stock, "2.0.24", "5002527") }
        assertFailsWith<PatchException> { applyNativeQuadFarPlaneScene(stock, "2.0.20", "5001812") }
        assertFailsWith<PatchException> { applyNativeQuadFarPlaneScene(stock, "2.0.20", "5002363") }
        assertFailsWith<PatchException> { applyNativeQuadFarPlaneScene(stock, "2.0.20", "5001712") }   // wrong size
        assertFailsWith<PatchException> { applyNativeQuadFarPlaneScene(stock, "9.9.9", "123") }
    }

    @Test
    fun overlappingSitesInALayoutAreRejected() {
        val (layout, stock) = synthetic()
        val bad = NativeQuadFarLayout(layout.versionName, layout.versionCode, layout.size,
            layout.sites + NativeQuadFarSite("x", 0x108, 16, "0".repeat(64), "00".repeat(16)))
        assertFailsWith<PatchException> { applyNativeQuadFarLayout(stock, bad) }
    }
}
