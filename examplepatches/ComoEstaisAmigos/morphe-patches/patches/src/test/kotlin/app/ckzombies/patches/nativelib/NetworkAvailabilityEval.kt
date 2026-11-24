package app.ckzombies.patches.nativelib

import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals

/**
 * Would this patch have caught a bare `bx lr`? That returns whatever r0 the caller passed, the
 * CNetworkAvailability object, which every caller reads as true, so the wait would stay. These
 * checks apply the edits and assert the stub sets r0, returns at once, and that both call sites
 * test for zero and fall through to the offline path when they see it.
 */
class NetworkAvailabilityEval {
    private val callSites = mapOf(
        "armeabi" to listOf(0x004BE508L, 0x004BE548L),
        "armeabi-v7a" to listOf(0x00496420L, 0x00496460L),
    )

    @Test
    fun `the availability answer is false and both callers take the offline path`() {
        val root = File(System.getProperty("java.io.tmpdir"), "ckz-libs")
        if (!root.isDirectory) return
        for (abi in ABIS) {
            val stock = File(root, "$abi/${NativeEdits.LIBRARY}")
            if (!stock.isFile) return
            assertEquals(NativeEdits.STOCK_SHA256.getValue(abi), Elf32.sha256(stock.readBytes()), abi)

            val elf = Elf32(stock.readBytes())
            val edits = NativeEdits.NETWORK_AVAILABILITY.getValue(abi).sortedBy { it.vaddr }
            elf.apply(edits)

            val entry = edits[0].vaddr
            assertEquals(0xE3A00000L, elf.word(entry), "$abi: mov r0, #0, the only false answer a bool has")
            assertEquals(0xE12FFF1EL, elf.word(entry + 4), "$abi: bx lr, with no frame pushed or popped")
            assertEquals(4L, edits[1].vaddr - entry, "$abi: two words are the whole stub")

            for (site in callSites.getValue(abi)) {
                val call = elf.word(site)
                assertEquals(0xEBL, call ushr 24, "$abi at 0x%X: a bl".format(site))
                val imm = call and 0xFFFFFFL
                val delta = if (imm and 0x800000L != 0L) imm - 0x1000000L else imm
                assertEquals(entry, site + 8 + 4 * delta, "$abi at 0x%X: the call reaches IsAvailable".format(site))
                assertEquals(0xE3500000L, elf.word(site + 4), "$abi at 0x%X: cmp r0, #0".format(site))
                assertEquals(0x1L, elf.word(site + 8) ushr 28, "$abi at 0x%X: bne to the online path".format(site))
            }
        }
    }
}
