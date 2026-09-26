package app.ckzombies.patches.nativelib

import java.nio.ByteBuffer
import java.nio.ByteOrder
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

class Elf32Test {
    /**
     * A 0x3000-byte ELF32 with two PT_LOAD segments and a section header table. The second
     * segment sits at file offset 0x2000 but virtual address 0x9000, the way a spliced page
     * shifts offsets but not addresses.
     *   LOAD1: vaddr 0x0000, offset 0x0000, filesz 0x1000
     *   LOAD2: vaddr 0x9000, offset 0x2000, filesz 0x0800, memsz 0x1000 (the rest is .bss)
     */
    private fun elf(): ByteArray {
        val b = ByteBuffer.allocate(0x3000).order(ByteOrder.LITTLE_ENDIAN)
        b.putInt(0, 0x464C457F)
        b.put(4, 1) // ELFCLASS32
        b.put(5, 1) // ELFDATA2LSB
        b.putInt(0x1C, 0x34) // e_phoff
        b.putShort(0x2A, 32) // e_phentsize
        b.putShort(0x2C, 3) // e_phnum
        b.putInt(0x20, 0x2800) // e_shoff, itself after the splice point the tests use
        b.putShort(0x2E, 40) // e_shentsize
        b.putShort(0x30, 2) // e_shnum
        fun ph(i: Int, type: Int, offset: Int, vaddr: Int, filesz: Int, memsz: Int) {
            val p = 0x34 + i * 32
            b.putInt(p, type); b.putInt(p + 4, offset); b.putInt(p + 8, vaddr)
            b.putInt(p + 16, filesz); b.putInt(p + 20, memsz)
        }
        ph(0, 1, 0x0000, 0x0000, 0x1000, 0x1000)
        ph(1, 6, 0x0034, 0x0034, 0x60, 0x60) // PT_PHDR, must be ignored by the loads
        ph(2, 1, 0x2000, 0x9000, 0x0800, 0x1000)
        fun sh(i: Int, type: Int, offset: Int) {
            val s = 0x2800 + i * 40
            b.putInt(s + 4, type); b.putInt(s + 0x10, offset)
        }
        sh(0, 1, 0x0400) // before a splice at 0x1000
        sh(1, 1, 0x2000) // at or after it
        b.putInt(0x0400, 0xE92D4030.toInt())
        b.putInt(0x2010, 0x00000016)
        b.putInt(0x2014, 0x11111111)
        return b.array()
    }

    @Test
    fun `maps virtual addresses through PT_LOAD, not file offsets`() {
        val e = Elf32(elf())
        assertEquals(0x0400, e.offsetOf(0x0400))
        assertEquals(0x2010, e.offsetOf(0x9010))
        assertEquals(0xE92D4030L, e.word(0x0400))
        assertEquals(0x16L, e.word(0x9010))
    }

    @Test
    fun `refuses addresses outside the file-backed part of a segment`() {
        val e = Elf32(elf())
        assertFailsWith<IllegalArgumentException> { e.offsetOf(0x9800) } // in .bss, memsz only
        assertFailsWith<IllegalArgumentException> { e.offsetOf(0x5000) } // between segments
        assertFailsWith<IllegalArgumentException> { e.offsetOf(0x0FFE) } // word would straddle the end
    }

    @Test
    fun `applies every edit when all old values match`() {
        val e = Elf32(elf())
        e.apply(listOf(WordEdit(0x0400, 0xE92D4030L, 0xE12FFF1EL), WordEdit(0x9010, 0x16L, 0x15L)))
        assertEquals(0xE12FFF1EL, e.word(0x0400))
        assertEquals(0x15L, e.word(0x9010))
    }

    @Test
    fun `writes nothing when any old value does not match`() {
        val original = elf()
        val e = Elf32(original.copyOf())
        val error = assertFailsWith<IllegalStateException> {
            e.apply(listOf(WordEdit(0x0400, 0xE92D4030L, 0xE12FFF1EL), WordEdit(0x9014, 0x22222222L, 0L)))
        }
        assertTrue("expected 0x22222222" in error.message!!)
        assertContentEquals(original, e.bytes())
    }

    @Test
    fun `refuses a file that is already patched`() {
        val e = Elf32(elf())
        val edits = listOf(WordEdit(0x9010, 0x16L, 0x15L))
        e.apply(edits)
        val error = assertFailsWith<IllegalStateException> { e.apply(edits) }
        assertTrue("already patched" in error.message!!)
    }

    @Test
    fun `rejects files that are not little-endian ELF32`() {
        assertFailsWith<IllegalArgumentException> { Elf32(ByteArray(64)) }
        val big = elf().also { it[5] = 2 }
        assertFailsWith<IllegalArgumentException> { Elf32(big) }
    }

    @Test
    fun `a splice moves every file offset after it and no virtual address`() {
        val e = Elf32(elf())
        e.splice(0x1000, 0x1000)
        val after = e.bytes()
        val b = ByteBuffer.wrap(after).order(ByteOrder.LITTLE_ENDIAN)
        assertEquals(0x4000, after.size)
        assertEquals(0x3800, b.getInt(0x20), "section header table moved")
        assertEquals(0x0400, b.getInt(0x3800 + 0x10), "section before the splice stayed")
        assertEquals(0x3000, b.getInt(0x3800 + 40 + 0x10), "section after it moved")
        assertEquals(0x0000, b.getInt(0x34 + 4), "the first segment starts at 0 and stays")
        assertEquals(0x3000, b.getInt(0x34 + 64 + 4), "the second segment moved")
        assertEquals(0x9000, b.getInt(0x34 + 64 + 8), "its virtual address did not")
        // The word still reads at the same address, from its new offset.
        assertEquals(0x16L, e.word(0x9010))
        assertEquals(0x3010, e.offsetOf(0x9010))
    }

    @Test
    fun `a splice of less than a page is refused`() {
        val e = Elf32(elf())
        assertFailsWith<IllegalStateException> { e.splice(0x1000, 8) }
    }

    @Test
    fun `growing the first segment makes the space after it file-backed`() {
        val e = Elf32(elf())
        e.splice(0x1000, 0x1000)
        assertFailsWith<IllegalArgumentException> { e.offsetOf(0x1004) }

        e.growFirstLoadTo(0x2000)

        assertEquals(0x1004, e.offsetOf(0x1004))
        val b = ByteBuffer.wrap(e.bytes()).order(ByteOrder.LITTLE_ENDIAN)
        assertEquals(0x2000, b.getInt(0x34 + 16), "p_filesz")
        assertEquals(0x2000, b.getInt(0x34 + 20), "p_memsz")
    }

    @Test
    fun `growing to something other than a page boundary is refused`() {
        val e = Elf32(elf())
        assertFailsWith<IllegalStateException> { e.growFirstLoadTo(0x1800) }
        assertFailsWith<IllegalStateException> { e.growFirstLoadTo(0x0800) } // not past the segment
    }

    @Test
    fun `claiming memory past the last segment returns its end`() {
        val e = Elf32(elf())
        val flag = e.extendLastLoadMemory(8)
        assertEquals(0xA000, flag, "vaddr 0x9000 plus memsz 0x1000")
        val b = ByteBuffer.wrap(e.bytes()).order(ByteOrder.LITTLE_ENDIAN)
        assertEquals(0x1008, b.getInt(0x34 + 64 + 20), "p_memsz grew by 8")
    }

    @Test
    fun `writes into free space and refuses anything else`() {
        val e = Elf32(elf())
        e.splice(0x1000, 0x1000)
        e.growFirstLoadTo(0x2000)
        val cave = byteArrayOf(0x1e, 0x50, 0x2d, 0xE9.toByte())

        e.writeIntoZeros(0x1000, cave)
        assertContentEquals(cave, e.bytes().copyOfRange(0x1000, 0x1004))

        val error = assertFailsWith<IllegalStateException> { e.writeIntoZeros(0x1000, cave) }
        assertTrue("not free" in error.message!!)
        assertFailsWith<IllegalStateException> { e.writeIntoZeros(0x0400, cave) } // real code
    }

    @Test
    fun `sha256 matches a known vector`() {
        assertEquals(
            "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad",
            Elf32.sha256("abc".toByteArray()),
        )
    }

    @Test
    fun `generated tables are well formed`() {
        val tables = listOf(
            "TEXT_RELOCATION" to NativeEdits.TEXT_RELOCATION,
            "GSERVE_STALL" to NativeEdits.GSERVE_STALL,
            "DEAD_SERVERS" to NativeEdits.DEAD_SERVERS,
            "JNI_GUARDS" to NativeEdits.JNI_GUARDS,
            "CURRENCY" to NativeEdits.CURRENCY.mapValues { (_, plan) -> plan.edits },
        )
        for ((name, table) in tables) {
            assertEquals(ABIS.toSet(), table.keys, "$name covers both ABIs")
            for ((abi, edits) in table) {
                assertTrue(edits.all { it.vaddr % 4 == 0L && it.old != it.new }, "$name/$abi: aligned, real changes")
                assertEquals(edits.size, edits.map { it.vaddr }.toSet().size, "$name/$abi: no address twice")
            }
        }
        assertEquals(5, NativeEdits.TEXT_RELOCATION.getValue("armeabi").size)
        assertEquals(5, NativeEdits.JNI_GUARDS.getValue("armeabi").size)
        assertEquals(ABIS.toSet(), NativeEdits.STOCK_SHA256.keys)
        for (abi in ABIS) {
            val addresses = tables.flatMap { (_, table) -> table.getValue(abi).map { it.vaddr } }
            assertEquals(addresses.size, addresses.toSet().size, "$abi: no two patches edit the same word")

            val plan = NativeEdits.CURRENCY.getValue(abi)
            assertTrue(plan.caveBytes.length % 2 == 0 && plan.caveBytes.isNotEmpty(), "$abi: cave bytes")
            assertTrue(plan.caveBytes.length / 2 <= plan.load1End - plan.cave, "$abi: the cave fits")
            assertTrue(plan.load1End % 4096 == 0L, "$abi: the segment ends on a page boundary")
            assertTrue(plan.edits.none { it.vaddr >= plan.cave && it.vaddr < plan.load1End },
                "$abi: no word edit lands inside the cave")
        }
        assertEquals(0x1000, NativeEdits.CURRENCY.getValue("armeabi").spliceSize, "armeabi splices one page")
        assertEquals(null, NativeEdits.CURRENCY.getValue("armeabi-v7a").spliceAtOffset, "v7a has room already")
    }

    @Test
    fun `the dead server edits silence one call, return from one function and shorten one menu`() {
        for (abi in ABIS) {
            // The generator sorts edits by address, so each is picked by what it replaces.
            val edits = NativeEdits.DEAD_SERVERS.getValue(abi)
            assertEquals(3, edits.size, "$abi: three edits")
            val call = edits.single { it.old ushr 24 == 0xEBL }
            assertEquals(0xE1A00000L, call.new, "$abi: the BL becomes mov r0, r0")
            val entry = edits.single { it.old and 0xFFFFC000L == 0xE92D4000L }
            assertEquals(0xE12FFF1EL, entry.new, "$abi: the push of lr becomes bx lr")

            // add r3, r5, #imm: the menu table's end, first entry + four 20-byte entries, becomes
            // first entry + two, so Boards and Games are left out.
            val menu = edits.single { it.old and 0xFFFFFF00L == 0xE2853000L }
            assertEquals(0xE2853000L or 8L + 4 * 0x14, menu.old, "$abi: the table end covers four entries")
            assertEquals(0xE2853000L or 8L + 2 * 0x14, menu.new, "$abi: and then two")
        }
    }
}
