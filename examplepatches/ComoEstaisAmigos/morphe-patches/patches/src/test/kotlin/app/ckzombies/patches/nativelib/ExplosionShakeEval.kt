package app.ckzombies.patches.nativelib

import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * Would this patch have caught a nop that also silenced gun recoil, or a bl that missed
 * `SetShake`? These checks apply the two Blast edits and assert that explosions no longer
 * call `SetShake` while MakeShot, OnShooterAttacked, and the Lua helper still do.
 */
class ExplosionShakeEval {
    private val setShake = mapOf(
        "armeabi" to 0x00473D84L,
        "armeabi-v7a" to 0x00456AC4L,
    )
    private val keepSites = mapOf(
        "armeabi" to listOf(0x004BC0A8L, 0x0030AE34L, 0x003B7658L),
        "armeabi-v7a" to listOf(0x00493FA4L, 0x002F2118L, 0x0039AFC0L),
    )

    private fun target(at: Long, word: Long): Long {
        val imm = word and 0xFFFFFFL
        return at + 8 + 4 * (if (imm and 0x800000L != 0L) imm - 0x1000000L else imm)
    }

    @Test
    fun `blasts no longer call SetShake and the other three sites still do`() {
        val root = File(System.getProperty("java.io.tmpdir"), "ckz-libs")
        if (!root.isDirectory) return
        for (abi in ABIS) {
            val stock = File(root, "$abi/${NativeEdits.LIBRARY}")
            if (!stock.isFile) return
            assertEquals(NativeEdits.STOCK_SHA256.getValue(abi), Elf32.sha256(stock.readBytes()), abi)

            val elf = Elf32(stock.readBytes())
            val shake = setShake.getValue(abi)
            elf.apply(NativeEdits.EXPLOSION_SHAKE.getValue(abi))

            for (edit in NativeEdits.EXPLOSION_SHAKE.getValue(abi)) {
                assertEquals(0xE1A00000L, elf.word(edit.vaddr), "$abi at 0x%X: the blast bl is a nop".format(edit.vaddr))
                assertEquals(shake, target(edit.vaddr, edit.old), "$abi at 0x%X: stock bl reached SetShake".format(edit.vaddr))
            }
            assertTrue(
                elf.word(shake) and 0xFFFFC000L == 0xE92D4000L,
                "$abi: SetShake still begins with a push",
            )
            for (site in keepSites.getValue(abi)) {
                val word = elf.word(site)
                val kind = word ushr 24
                assertTrue(kind == 0xEBL || kind == 0xEAL, "$abi at 0x%X: still a bl or b".format(site))
                assertEquals(shake, target(site, word), "$abi at 0x%X: still reaches SetShake".format(site))
            }
        }
    }
}
