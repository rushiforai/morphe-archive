package app.deadcrossing.patches.mono

import app.adebisi.patches.shared.applyEdits
import app.adebisi.patches.shared.toHex
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class DllEditsTest {
    @Test
    fun `currency lists partition the 41 ranges and do not overlap`() {
        assertEquals(2, DllEdits.CURRENCY_BODIES.size)
        assertEquals(2, DllEdits.CURRENCY_GRANT.size)
        assertEquals(35, DllEdits.CURRENCY_WRITES.size)
        assertEquals(2, DllEdits.CURRENCY_CALLERS.size)
        assertEquals(41, DllEdits.CURRENCY.size)
        assertEquals(
            DllEdits.CURRENCY_BODIES + DllEdits.CURRENCY_GRANT +
                DllEdits.CURRENCY_WRITES + DllEdits.CURRENCY_CALLERS,
            DllEdits.CURRENCY,
        )
        val ordered = DllEdits.CURRENCY.sortedBy { it.offset }
        for (i in 0 until ordered.lastIndex) {
            val a = ordered[i]
            val b = ordered[i + 1]
            assertTrue(
                a.offset + a.old.size <= b.offset,
                "0x${a.offset.toString(16)} overlaps 0x${b.offset.toString(16)}",
            )
        }
        assertFalse(DllEdits.CURRENCY_WRITES.any { it.offset == 0x140C4 })
        assertEquals(
            "assets/bin/Data/Managed/Assembly-CSharp-firstpass.dll",
            DllEdits.FIRSTPASS_PATH,
        )
    }

    @Test
    fun `grant expands glory with bge s and leaves gold as ldc i4`() {
        assertEquals(listOf(0x140A9, 0x140BE), DllEdits.CURRENCY_GRANT.map { it.offset })
        assertEquals("20e8030000", DllEdits.CURRENCY_GRANT[0].old.toHex())
        assertEquals("20ffe0f505", DllEdits.CURRENCY_GRANT[0].new.toHex())
        assertEquals("3c060000001680e707000472128000701f0a", DllEdits.CURRENCY_GRANT[1].old.toHex())
        assertEquals("2f0616284a000006721280007020ffe0f505", DllEdits.CURRENCY_GRANT[1].new.toHex())
        assertTrue(DllEdits.CURRENCY_GRANT[1].new.toHex().startsWith("2f06"))
        assertTrue("1f0a" in DllEdits.CURRENCY_GRANT[1].old.toHex())
        assertFalse("1f0a" in DllEdits.CURRENCY_GRANT[1].new.toHex())
    }

    @Test
    fun `caves are 16 nop then 21 byte clamp and writes are stsfld to call`() {
        for (edit in DllEdits.CURRENCY_BODIES) {
            assertEquals(37, edit.old.size)
            assertEquals("00".repeat(16), edit.new.toHex().take(32))
            assertTrue(edit.new.toHex().endsWith("2a"))
            assertTrue("20ffe0f505" in edit.new.toHex())
        }
        val gold = DllEdits.CURRENCY_WRITES.filter { it.old.toHex() == "80e7070004" }
        val merit = DllEdits.CURRENCY_WRITES.filter { it.old.toHex() == "80e8070004" }
        assertEquals(14, gold.size)
        assertEquals(21, merit.size)
        assertTrue(gold.all { it.new.toHex() == "284a000006" })
        assertTrue(merit.all { it.new.toHex() == "284b000006" })
    }

    @Test
    fun `callers pop the mission index instead of nop only`() {
        assertEquals("284a000006", DllEdits.CURRENCY_CALLERS[0].old.toHex())
        assertEquals("284b000006", DllEdits.CURRENCY_CALLERS[1].old.toHex())
        assertTrue(DllEdits.CURRENCY_CALLERS.all { it.new.toHex() == "2600000000" })
    }

    @Test
    fun `hosts ret firstpass Apsalar Flurry and Aarki entry points`() {
        assertEquals(listOf(0x34D, 0x520, 0x5F8, 0x650, 0x715, 0x797C), DllEdits.HOSTS.map { it.offset })
        assertTrue(DllEdits.HOSTS.all { it.old.toHex() == "72" && it.new.toHex() == "2a" })
        val data = ByteArray(DllEdits.HOSTS.maxOf { it.offset + it.old.size })
        for (edit in DllEdits.HOSTS) {
            edit.old.copyInto(data, edit.offset)
        }
        val patched = data.applyEdits(DllEdits.HOSTS)
        for (edit in DllEdits.HOSTS) {
            assertTrue(
                patched.copyOfRange(edit.offset, edit.offset + edit.new.size).contentEquals(edit.new),
            )
        }
    }

    @Test
    fun `firstpass URLs keep length and drop the feelingtouch hosts`() {
        assertEquals(6, DllEdits.FIRSTPASS_URLS.size)
        assertEquals(
            listOf(0x14088, 0x14D84, 0x14DDE, 0x15915, 0x15C01, 0x15C5A),
            DllEdits.FIRSTPASS_URLS.map { it.offset },
        )
        val ads = "ads.feelingtouch.com".toByteArray(Charsets.UTF_16LE).toHex()
        val gamebox = "gamebox.feelingtouch.com".toByteArray(Charsets.UTF_16LE).toHex()
        val loopback = "http://127.0.0.1:1/".toByteArray(Charsets.UTF_16LE).toHex()
        var adsCount = 0
        var gameboxCount = 0
        val ordered = DllEdits.FIRSTPASS_URLS.sortedBy { it.offset }
        for (i in 0 until ordered.lastIndex) {
            val a = ordered[i]
            val b = ordered[i + 1]
            assertTrue(
                a.offset + a.old.size <= b.offset,
                "0x${a.offset.toString(16)} overlaps 0x${b.offset.toString(16)}",
            )
        }
        for (edit in DllEdits.FIRSTPASS_URLS) {
            assertEquals(edit.old.size, edit.new.size)
            assertTrue(edit.old.size % 2 == 0)
            assertTrue(loopback in edit.new.toHex())
            assertFalse(ads in edit.new.toHex())
            assertFalse(gamebox in edit.new.toHex())
            if (ads in edit.old.toHex()) adsCount++
            if (gamebox in edit.old.toHex()) gameboxCount++
        }
        assertEquals(4, adsCount)
        assertEquals(2, gameboxCount)
        assertTrue(DllEdits.HOSTS.all { it.offset + it.old.size <= DllEdits.FIRSTPASS_URLS.minOf { u -> u.offset } })
        val data = ByteArray(DllEdits.FIRSTPASS_URLS.maxOf { it.offset + it.old.size })
        for (edit in DllEdits.FIRSTPASS_URLS) {
            edit.old.copyInto(data, edit.offset)
        }
        val patched = data.applyEdits(DllEdits.FIRSTPASS_URLS)
        assertFalse(ads in patched.toHex())
        assertFalse(gamebox in patched.toHex())
    }

    @Test
    fun `currency applyEdits matches every file-offset run`() {
        val data = ByteArray(DllEdits.CURRENCY.maxOf { it.offset + it.old.size })
        for (edit in DllEdits.CURRENCY) {
            edit.old.copyInto(data, edit.offset)
        }
        val patched = data.applyEdits(DllEdits.CURRENCY)
        for (edit in DllEdits.CURRENCY) {
            assertTrue(
                patched.copyOfRange(edit.offset, edit.offset + edit.new.size).contentEquals(edit.new),
            )
        }
        assertFalse(data.contentEquals(patched))
    }
}
