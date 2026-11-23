package app.ckzombies.patches.nativelib

import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * Would this patch have caught a stub that still took a round, or a reload gate that still
 * refused a full clip? These checks read the stock library, apply the edits, and assert that
 * every remaining store to the clip writes back the value that was loaded and that the forced
 * reload call is now reached.
 */
class UnlimitedAmmoEval {
    private val makeShot = mapOf("armeabi" to 0x004BBE78L, "armeabi-v7a" to 0x00493D8CL)
    private val checkForReload = mapOf("armeabi" to 0x004BC2E4L, "armeabi-v7a" to 0x004941F8L)

    /** `v7a` puts the `cmp` before the subtraction, so the store is the next word; `armeabi` puts it after. */
    private fun storeAfter(elf: Elf32, subtract: WordEdit): Long =
        listOf(4L, 8L).map { elf.word(subtract.vaddr + it) }.firstOrNull { it == 0xE584319CL } ?: 0L

    private fun target(at: Long, word: Long): Long {
        val imm = word and 0xFFFFFFL
        return at + 8 + 4 * (if (imm and 0x800000L != 0L) imm - 0x1000000L else imm)
    }

    @Test
    fun `no shot can lower the clip and a full clip still reloads`() {
        val root = File(System.getProperty("java.io.tmpdir"), "ckz-libs")
        if (!root.isDirectory) return
        for (abi in ABIS) {
            val stock = File(root, "$abi/${NativeEdits.LIBRARY}")
            if (!stock.isFile) return
            assertEquals(NativeEdits.STOCK_SHA256.getValue(abi), Elf32.sha256(stock.readBytes()), abi)

            val elf = Elf32(stock.readBytes())
            val edits = NativeEdits.UNLIMITED_AMMO.getValue(abi)
            elf.apply(edits)

            val subtractions = edits.filter { it.old == 0xE2433001L }
            assertEquals(2, subtractions.size, "$abi: two rounds at a time at most")
            for (sub in subtractions) {
                assertEquals(0xE1A00000L, elf.word(sub.vaddr), "$abi: the subtraction is gone")
                assertEquals(
                    0xE584319CL,
                    storeAfter(elf, sub),
                    "$abi at 0x%X: the store still runs, writing back r3".format(sub.vaddr),
                )
            }
            assertEquals(
                0xE594319CL,
                elf.word(subtractions.minBy { it.vaddr }.vaddr - 8),
                "$abi: r3 holds the clip, loaded from [r4, #0x19c]",
            )

            // Every store to the clip in MakeShot now stores a value no subtraction touched.
            var stores = 0
            var at = makeShot.getValue(abi)
            while (at < makeShot.getValue(abi) + 0x46C) {
                val word = elf.word(at)
                if (word ushr 20 == 0xE58L && word and 0xFFFL == 0x19CL) {
                    stores++
                    assertTrue(
                        (4L..8L step 4).any { elf.word(at - it) == 0xE1A00000L },
                        "$abi at 0x%X: a live decrement feeds the store".format(at),
                    )
                }
                at += 4
            }
            assertEquals(2, stores, "$abi: MakeShot has two stores to the clip")

            val gate = edits.single { it.old ushr 28 == 0xAL }
            assertEquals(0xE1A00000L, elf.word(gate.vaddr), "$abi: the full clip no longer returns early")
            assertEquals(0xE1A00004L, elf.word(gate.vaddr + 4), "$abi: r0 is the weapon")
            assertEquals(0xE3A01001L, elf.word(gate.vaddr + 8), "$abi: the reload is forced")
            val call = elf.word(gate.vaddr + 12)
            assertEquals(0xEBL, call ushr 24, "$abi: a bl follows")
            assertEquals(
                checkForReload.getValue(abi),
                target(gate.vaddr + 12, call),
                "$abi: and it is CheckForReload",
            )

            // In the stock library the same branch returned above the forced call.
            assertEquals(0xE3A00001L, elf.word(target(gate.vaddr, gate.old)), "$abi: stock returned 1")
            assertEquals(0xE8BD87F0L, elf.word(target(gate.vaddr, gate.old) + 4), "$abi: and left the frame")
        }
    }
}
