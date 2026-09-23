package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class ControllerPoseCadenceTest {
    @Test
    fun `controller velocity ids fallback is valid XML`() {
        val document = DocumentBuilderFactory.newInstance()
            .newDocumentBuilder()
            .parse(ByteArrayInputStream(CONTROLLER_VELOCITY_IDS_XML_FALLBACK.toByteArray()))

        assertEquals("resources", document.documentElement.tagName)
    }

    @Test
    fun `controller velocity patch skips the native XR build only`() {
        assertTrue(isControllerVelocityPatchNoOpBuild("2.0.23", "5002363"))
        assertFalse(isControllerVelocityPatchNoOpBuild("2.0.22", "5002313"))
        assertFalse(isControllerVelocityPatchNoOpBuild("2.0.22", "5002318"))
        assertFalse(isControllerVelocityPatchNoOpBuild("2.0.22", "5002322"))
        assertFalse(isControllerVelocityPatchNoOpBuild("2.0.20", "5002318"))
    }

    @Test
    fun `all cadence modes leave an unknown native layout untouched`() {
        val input = ByteArray(128) { it.toByte() }

        listOf("stock-4x", "half-2x", "display-1x").forEach { mode ->
            assertContentEquals(input, patchControllerPoseCadence(input, mode))
        }
    }

    @Test
    fun `verified cadence layouts are reversible`() {
        cadenceLayouts.forEach { layout ->
            val stock = syntheticElf(layout)
            val half = patchControllerPoseCadence(stock, "half-2x")
            val display = patchControllerPoseCadence(stock, "display-1x")

            assertFalse(stock.contentEquals(half), "versionCode ${layout.versionCode}")
            assertFalse(stock.contentEquals(display), "versionCode ${layout.versionCode}")
            assertContentEquals(half, patchControllerPoseCadence(half, "half-2x"))
            assertContentEquals(stock, patchControllerPoseCadence(half, "stock-4x"))
            assertContentEquals(stock, patchControllerPoseCadence(display, "stock-4x"))
        }
    }

    @Test
    fun `verified cadence layouts reject a changed instruction atomically`() {
        cadenceLayouts.forEach { layout ->
            val changed = syntheticElf(layout).apply { this[layout.blocks.first().count] = 0 }
            val snapshot = changed.copyOf()

            assertFailsWith<PatchException>(layout.versionCode.toString()) {
                patchControllerPoseCadence(changed, "half-2x")
            }
            assertContentEquals(snapshot, changed, layout.versionCode.toString())
        }
    }

    private data class TestBlock(
        val count: Int,
        val pointer: Int,
        val phase2: Int,
        val phase3: Int,
        val event2: Int,
        val event3: Int,
        val event3Register: Int,
    )

    private data class TestLayout(
        val versionCode: Int,
        val size: Int,
        val blocks: List<TestBlock>,
    )

    private val cadenceLayouts = listOf(
        TestLayout(
            5001712,
            2_221_072,
            listOf(
                TestBlock(0xF6468, 0xF6458, 0xF64B0, 0xF64C4, 0xF64EC, 0xF64D0, 9),
                TestBlock(0xF6568, 0xF6558, 0xF65B0, 0xF65C4, 0xF65EC, 0xF65D0, 9),
                TestBlock(0xF6630, 0xF6620, 0xF6678, 0xF6688, 0xF66B4, 0xF66BC, 10),
            ),
        ),
        TestLayout(
            5002244,
            2_251_920,
            listOf(
                TestBlock(0xF3518, 0xF3508, 0xF3560, 0xF3574, 0xF359C, 0xF3580, 9),
                TestBlock(0xF361C, 0xF360C, 0xF3664, 0xF3678, 0xF36A0, 0xF3684, 9),
                TestBlock(0xF36E4, 0xF36D4, 0xF372C, 0xF373C, 0xF3768, 0xF3770, 10),
            ),
        ),
    )

    private fun syntheticElf(layout: TestLayout): ByteArray = ByteArray(layout.size).apply {
        writeU32LE(0, 0x464C457F)
        writeU64LE(32, 64)
        writeU16LE(54, 56)
        writeU16LE(56, 1)
        writeU32LE(64, 1)
        writeU64LE(64 + 8, 0)
        writeU64LE(64 + 16, 0)
        writeU64LE(64 + 32, layout.size.toLong())

        layout.blocks.forEach { block ->
            writeU32LE(block.count, 0x528000A2)
            writeU32LE(block.pointer, 0x910023E1.toInt())
            writeU32LE(block.phase2, 0x5280004B)
            writeU32LE(block.phase3, 0x5280006C)
            writeU32LE(block.event2, 0xB9002FED.toInt())
            writeU32LE(
                block.event3,
                0xB9000000.toInt() or (15 shl 10) or (31 shl 5) or block.event3Register,
            )
        }
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
}
