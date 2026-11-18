package app.ckzorigins.patches.nativelib

import app.ckzorigins.patches.shared.applyEdits
import app.ckzorigins.patches.shared.toHex
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class NativeEditsTest {
    @Test
    fun `textrel edits are the five hand-packaged runs`() {
        assertEquals(5, NativeEdits.TEXTREL.size)
        assertEquals(0x1DC64, NativeEdits.TEXTREL[0].offset)
        assertEquals(0x67D020, NativeEdits.TEXTREL.last().offset)
        assertEquals(64, NativeEdits.UNITY_SHA256.length)
    }

    @Test
    fun `gwallet serial id is the one hand-packaged four byte run`() {
        assertEquals(1, NativeEdits.SERIAL_ID.size)
        assertEquals(0x231E8, NativeEdits.SERIAL_ID[0].offset)
        assertEquals("f0b55746", NativeEdits.SERIAL_ID[0].old.toHex())
        assertEquals("48307047", NativeEdits.SERIAL_ID[0].new.toHex())
        assertEquals(64, NativeEdits.GWALLET_SHA256.length)
        val data = ByteArray(0x231E8 + 4)
        NativeEdits.SERIAL_ID[0].old.copyInto(data, 0x231E8)
        val patched = data.applyEdits(NativeEdits.SERIAL_ID)
        assertTrue(patched.copyOfRange(0x231E8, 0x231EC).contentEquals(NativeEdits.SERIAL_ID[0].new))
    }

    @Test
    fun `textrel applyEdits matches the five file-offset runs`() {
        val data = ByteArray(0x67D021)
        for (edit in NativeEdits.TEXTREL) {
            edit.old.copyInto(data, edit.offset)
        }
        val patched = data.applyEdits(NativeEdits.TEXTREL)
        for (edit in NativeEdits.TEXTREL) {
            assertTrue(
                patched.copyOfRange(edit.offset, edit.offset + edit.new.size).contentEquals(edit.new),
            )
        }
        assertFalse(data.contentEquals(patched))
    }
}
