package app.ckzombies.patches.nativelib

import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals

/**
 * Would this patch have caught a cave that returns the real clip while reloading, or one that
 * branches past the zero write? These checks apply the stub to Glu's library and verify the
 * hook reaches it, the cave still loads the real clip first, and both branches land where the
 * zero write and the return are.
 */
class ReloadHudEval {
    private fun target(at: Long, word: Long): Long {
        val imm = word and 0xFFFFFFL
        return at + 8 + 4 * (if (imm and 0x800000L != 0L) imm - 0x1000000L else imm)
    }

    @Test
    fun `the hook reaches the cave and the cave returns zero only while reloading`() {
        val root = File(System.getProperty("java.io.tmpdir"), "ckz-libs")
        if (!root.isDirectory) return
        val clipLoad = mapOf("armeabi" to 0xE593219CL, "armeabi-v7a" to 0xE590119CL)
        val zeroClip = mapOf("armeabi" to 0xE3A02000L, "armeabi-v7a" to 0xE3A01000L)
        for (abi in ABIS) {
            val stock = File(root, "$abi/${NativeEdits.LIBRARY}")
            if (!stock.isFile) return
            assertEquals(NativeEdits.STOCK_SHA256.getValue(abi), Elf32.sha256(stock.readBytes()), abi)

            val elf = Elf32(stock.readBytes())
            val plan = NativeEdits.HUD_RELOAD.getValue(abi)
            val edit = plan.edits.single()
            elf.mapExecutablePadding(abi)
            elf.writeIntoZeros(plan.cave, plan.caveBytes.hex())
            elf.apply(plan.edits)

            val at = "$abi at 0x%X".format(edit.vaddr)
            assertEquals(0xEBL, elf.word(edit.vaddr) ushr 24, "$at: the clip load is a bl")
            assertEquals(plan.cave, target(edit.vaddr, elf.word(edit.vaddr)), "$at: it reaches the cave")
            assertEquals(clipLoad.getValue(abi), elf.word(plan.cave), "$abi: the cave loads the real clip")
            assertEquals(zeroClip.getValue(abi), elf.word(plan.cave + 28), "$abi: and zeroes the display copy")

            // The two branches skip the zero write and skip to the return.
            assertEquals(plan.cave + 0x1C, target(plan.cave + 12, elf.word(plan.cave + 12)), "$abi: zero write")
            assertEquals(plan.cave + 0x20, target(plan.cave + 24, elf.word(plan.cave + 24)), "$abi: return")
            assertEquals(0xE12FFF1EL, elf.word(plan.cave + 32), "$abi: bx lr")
        }
    }

    private fun String.hex() = ByteArray(length / 2) { substring(it * 2, it * 2 + 2).toInt(16).toByte() }
}
