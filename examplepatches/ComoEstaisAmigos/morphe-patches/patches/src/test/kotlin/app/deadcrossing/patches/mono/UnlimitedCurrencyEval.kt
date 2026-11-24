package app.deadcrossing.patches.mono

import app.adebisi.patches.shared.toHex
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

/**
 * Origins-style grant plus ceiling. A fresh PlayerPrefs miss hits GetInt's default
 * (now 99,999,999). An update already has the keys, so the current balance stays.
 * Every later write goes through the stolen DataAnalysis caves, which clamp to the
 * same ceiling. Spending still subtracts.
 */
class UnlimitedCurrencyEval {
    @Test
    fun `grant is the GetInt default not a write on every load`() {
        assertTrue(DllEdits.CURRENCY_GRANT.any { it.offset == 0x140A9 })
        assertEquals("20e8030000", DllEdits.CURRENCY_GRANT[0].old.toHex())
        assertEquals("20ffe0f505", DllEdits.CURRENCY_GRANT[0].new.toHex())
        assertEquals(99_999_999, 0x05F5E0FF)
        assertFalse(DllEdits.CURRENCY_GRANT.any { "20ffc99a3b" in it.new.toHex() })
    }

    @Test
    fun `36 gold and glory writes are covered by caves plus the grant blob`() {
        val writes = DllEdits.CURRENCY_WRITES.size
        val blobWrite = 1
        assertEquals(36, writes + blobWrite)
        assertTrue(DllEdits.CURRENCY_GRANT[1].new.toHex().contains("284a000006"))
        assertEquals(2, DllEdits.CURRENCY_BODIES.size)
        assertEquals(2, DllEdits.CURRENCY_CALLERS.size)
    }

    @Test
    fun `clamp IL is 21 bytes and PassMission FailedMission stay out of HOSTS`() {
        val goldCave = DllEdits.CURRENCY_BODIES[0].new.toHex().drop(32)
        val meritCave = DllEdits.CURRENCY_BODIES[1].new.toHex().drop(32)
        assertEquals(42, goldCave.length)
        assertEquals(42, meritCave.length)
        assertTrue(goldCave.startsWith("022520ffe0f50531062620ffe0f50580"))
        assertTrue(meritCave.startsWith("022520ffe0f50531062620ffe0f50580"))
        assertTrue(goldCave.endsWith("e70700042a"))
        assertTrue(meritCave.endsWith("e80700042a"))
        assertFalse(DllEdits.HOSTS.any { it.offset == 0x4BF4 })
        assertFalse(DllEdits.HOSTS.any { it.offset == 0x4C28 })
    }
}
