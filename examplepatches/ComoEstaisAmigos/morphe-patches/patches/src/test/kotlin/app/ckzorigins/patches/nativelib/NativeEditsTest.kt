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

    /**
     * 20.11.2026 20:27 BlueStacks: intro ends, libgwallet.so loads, AccountManager
     * logs GET_ACCOUNTS missing, GetFieldID `[I.name` (Account.name) runs with
     * SecurityException pending, Dalvik aborts at deadd00d.
     */
    @Test
    fun `gwallet JNI guards skip account name and device id`() {
        assertEquals(3, NativeEdits.JNI_GUARDS.size)
        assertEquals(0x21C94, NativeEdits.JNI_GUARDS[0].offset)
        assertEquals(0x21E6C, NativeEdits.JNI_GUARDS[1].offset)
        assertEquals(0x2307C, NativeEdits.JNI_GUARDS[2].offset)
        for (edit in NativeEdits.JNI_GUARDS) {
            assertEquals("48307047", edit.new.toHex(), "0x${edit.offset.toString(16)}")
            assertEquals(4, edit.old.size)
        }
        val data = ByteArray(0x23080)
        for (edit in NativeEdits.JNI_GUARDS) {
            edit.old.copyInto(data, edit.offset)
        }
        val patched = data.applyEdits(NativeEdits.JNI_GUARDS)
        for (edit in NativeEdits.JNI_GUARDS) {
            assertTrue(
                patched.copyOfRange(edit.offset, edit.offset + 4).contentEquals(edit.new),
            )
        }
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
