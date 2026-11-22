package app.ckzombies.patches.nativelib

import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * Would the civilian patch have caught a stub that still ran the original damage, or a BL
 * that missed its cave? These checks are the eval: they fail if the control flow no longer
 * returns for a civilian and continues for everyone else.
 */
class CivilianImmunityEval {
    @Test
    fun `a civilian shot never reaches the body, a blast or fragment never subtracts HP`() {
        for (abi in ABIS) {
            val plan = NativeEdits.CIVILIAN_IMMUNITY.getValue(abi)
            val nop = plan.edits.single { it.new == 0xE1A00000L }
            val originalSkip = nop.old and 0xFFFFFFL
            assertTrue(
                originalSkip >= 4L,
                "$abi: the bne skipped the healing-gun compare and returned. " +
                    "Noping it means a civilian always hits that compare instead of taking damage.",
            )

            val stubs = listOf(plan.blastCaveBytes, plan.fragCaveBytes)
            for (hex in stubs) {
                val bne = word(hex, 3)
                assertEquals(0x1A000001L, bne, "$abi: civilian takes the return, a zombie the original ldrb")
                val originalLoad = word(hex, 4)
                assertEquals(0x3A3L, originalLoad and 0xFFFL, "$abi: the stub still tests neutralized")
            }
        }
    }

    @Test
    fun `currency then civilians, and civilians then currency, both apply to Glu's libraries`() {
        val root = File(System.getProperty("java.io.tmpdir"), "ckz-libs")
        if (!root.isDirectory) return
        for (abi in ABIS) {
            val stock = File(root, "$abi/${NativeEdits.LIBRARY}")
            if (!stock.isFile) return
            assertEquals(NativeEdits.STOCK_SHA256.getValue(abi), Elf32.sha256(stock.readBytes()), abi)

            applyBoth(stock.readBytes(), abi, currencyFirst = true)
            applyBoth(stock.readBytes(), abi, currencyFirst = false)
        }
    }

    private fun applyBoth(bytes: ByteArray, abi: String, currencyFirst: Boolean) {
        val elf = Elf32(bytes.copyOf())
        val currency = NativeEdits.CURRENCY.getValue(abi)
        val civ = NativeEdits.CIVILIAN_IMMUNITY.getValue(abi)
        val order = if (currencyFirst) "currency then civilians" else "civilians then currency"
        try {
            if (currencyFirst) {
                elf.mapExecutablePadding(abi)
                elf.writeIntoZeros(currency.cave, currency.caveBytes.hex())
                elf.apply(currency.edits)
                elf.mapExecutablePadding(abi)
                elf.writeIntoZeros(civ.blastCave, civ.blastCaveBytes.hex())
                elf.writeIntoZeros(civ.fragCave, civ.fragCaveBytes.hex())
                elf.apply(civ.edits)
            } else {
                elf.mapExecutablePadding(abi)
                elf.writeIntoZeros(civ.blastCave, civ.blastCaveBytes.hex())
                elf.writeIntoZeros(civ.fragCave, civ.fragCaveBytes.hex())
                elf.apply(civ.edits)
                elf.mapExecutablePadding(abi)
                elf.writeIntoZeros(currency.cave, currency.caveBytes.hex())
                elf.apply(currency.edits)
            }
        } catch (e: Exception) {
            throw AssertionError("$abi $order: ${e.message}", e)
        }
        for (edit in civ.edits) {
            assertEquals(edit.new, elf.word(edit.vaddr), "$abi $order: 0x%X".format(edit.vaddr))
        }
        for (edit in currency.edits) {
            assertEquals(edit.new, elf.word(edit.vaddr), "$abi $order: 0x%X".format(edit.vaddr))
        }
    }

    private fun String.hex() = ByteArray(length / 2) { substring(it * 2, it * 2 + 2).toInt(16).toByte() }

    private fun word(hex: String, index: Int): Long {
        val chunk = hex.substring(index * 8, index * 8 + 8)
        return chunk.chunked(2).map { it.toInt(16) }.foldIndexed(0L) { i, acc, b ->
            acc or (b.toLong() shl (8 * i))
        }
    }
}
