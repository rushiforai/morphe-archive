package app.ckzorigins.patches.mono

import app.ckzorigins.patches.shared.ByteEdit
import app.ckzorigins.patches.shared.hexToBytes
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals

class DllEditsFromCsvTest {
    @Test
    fun `DllEdits is findings csv in order, ammo first`() {
        val rows = readFindings()
        assertEquals(194, rows.size)
        match(DllEdits.AMMO, rows.take(10))
        match(DllEdits.CURRENCY_BODIES, rows.drop(10).dropLast(10))
        match(DllEdits.CURRENCY_RVA, rows.takeLast(10))
    }

    private fun match(edits: List<ByteEdit>, rows: List<Row>) {
        assertEquals(rows.size, edits.size)
        for (i in rows.indices) {
            assertEquals(rows[i].offset, edits[i].offset, "row $i offset")
            assertContentEquals(rows[i].old, edits[i].old, "row $i old")
            assertContentEquals(rows[i].new, edits[i].new, "row $i new")
        }
    }

    private fun readFindings(): List<Row> {
        val stream = javaClass.getResourceAsStream("findings.csv")
            ?: error("missing findings.csv on the test classpath")
        return stream.bufferedReader().use { reader ->
            reader.lineSequence()
                .drop(1)
                .filter { it.isNotBlank() }
                .map { line ->
                    val cols = line.split(',')
                    Row(
                        offset = cols[0].removePrefix("0x").toInt(16),
                        old = cols[2].hexToBytes(),
                        new = cols[3].hexToBytes(),
                    )
                }
                .toList()
        }
    }

    private class Row(val offset: Int, val old: ByteArray, val new: ByteArray)
}
