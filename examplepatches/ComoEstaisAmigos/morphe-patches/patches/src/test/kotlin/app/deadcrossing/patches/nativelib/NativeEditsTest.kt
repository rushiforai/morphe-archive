package app.deadcrossing.patches.nativelib

import app.adebisi.patches.shared.ByteEdit
import app.adebisi.patches.shared.applyEdits
import app.adebisi.patches.shared.toHex
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class NativeEditsTest {
    @Test
    fun `each library has the on dlclose runs and stock hashes`() {
        val fiveRun = listOf(
            NativeEdits.FXS1_TEXTREL,
            NativeEdits.MONO_TEXTREL,
        )
        val sevenRun = listOf(
            NativeEdits.MAIN_TEXTREL,
            NativeEdits.UNITY_TEXTREL,
        )
        for (edits in fiveRun) {
            assertEquals(5, edits.size)
            assertOnDlclose(edits)
        }
        for (edits in sevenRun) {
            assertEquals(7, edits.size)
            assertOnDlclose(edits.take(5))
            assertEquals("024b9847", edits[5].old.toHex())
            assertEquals("02", edits[6].old.toHex())
            assertEquals("00", edits[6].new.toHex())
        }
        assertEquals("fff7a7ff", NativeEdits.MAIN_TEXTREL[5].new.toHex())
        assertEquals(0x3152, NativeEdits.MAIN_TEXTREL[5].offset)
        assertEquals(0x2E98, NativeEdits.MAIN_TEXTREL[6].offset)
        assertEquals("fff753fb", NativeEdits.UNITY_TEXTREL[5].new.toHex())
        assertEquals(0x68A8A, NativeEdits.UNITY_TEXTREL[5].offset)
        assertEquals(0x62B58, NativeEdits.UNITY_TEXTREL[6].offset)
        assertEquals(64, NativeEdits.FXS1_SHA256.length)
        assertEquals(64, NativeEdits.MAIN_SHA256.length)
        assertEquals(64, NativeEdits.MONO_REAL_SHA256.length)
        assertEquals(64, NativeEdits.UNITY_REAL_SHA256.length)
        assertEquals("lib/armeabi-v7a/libfXs1.so", NativeEdits.FXS1)
        assertEquals("assets/libs/armeabi-v7a/libmono.so", NativeEdits.MONO_REAL)
        assertEquals("lib/armeabi-v7a/libmono.so", NativeEdits.MONO_PROXY)
        assertEquals(
            listOf(
                "assets/libs/armeabi-v7a/libmono.so",
                "assets/libs/armeabi-v7a/libunity.so",
            ),
            NativeEdits.DROPPED_ASSET_LIBS,
        )
        assertEquals(2, NativeEdits.DROPPED_ASSET_LIBS.size)
        assertTrue(NativeEdits.DROPPED_ASSET_LIBS.all { it.startsWith("assets/libs/") })
        assertFalse(NativeEdits.MONO_PROXY in NativeEdits.DROPPED_ASSET_LIBS)
        assertFalse(NativeEdits.UNITY_PROXY in NativeEdits.DROPPED_ASSET_LIBS)
    }

    @Test
    fun `textrel applyEdits matches the file-offset runs per library`() {
        for (edits in listOf(
            NativeEdits.FXS1_TEXTREL,
            NativeEdits.MAIN_TEXTREL,
            NativeEdits.MONO_TEXTREL,
            NativeEdits.UNITY_TEXTREL,
        )) {
            val data = ByteArray(edits.maxOf { it.offset + it.old.size })
            for (edit in edits) {
                edit.old.copyInto(data, edit.offset)
            }
            val patched = data.applyEdits(edits)
            for (edit in edits) {
                assertTrue(
                    patched.copyOfRange(edit.offset, edit.offset + edit.new.size).contentEquals(edit.new),
                )
            }
            assertFalse(data.contentEquals(patched))
        }
    }

    @Test
    fun `unity and main keep the on dlclose prologue`() {
        assertEquals("00309100", NativeEdits.UNITY_TEXTREL[3].old.toHex())
        assertEquals("84a58a00", NativeEdits.UNITY_TEXTREL[3].new.toHex())
        assertEquals("00b00000", NativeEdits.MAIN_TEXTREL[3].old.toHex())
        assertEquals("bc7e0000", NativeEdits.MAIN_TEXTREL[3].new.toHex())
        assertFalse("00207047" in NativeEdits.UNITY_TEXTREL[3].new.toHex())
        assertFalse("00207047" in NativeEdits.MAIN_TEXTREL[3].new.toHex())
    }

    @Test
    fun `unity hwstats zeros the first-launch stats host`() {
        assertEquals(1, NativeEdits.UNITY_HWSTATS.size)
        assertEquals(0x8742A4, NativeEdits.UNITY_HWSTATS[0].offset)
        assertEquals(
            "687474703a2f2f73746174732e756e69747933642e636f6d2f485753746174732e636769",
            NativeEdits.UNITY_HWSTATS[0].old.toHex(),
        )
        assertEquals(36, NativeEdits.UNITY_HWSTATS[0].old.size)
        assertEquals(36, NativeEdits.UNITY_HWSTATS[0].new.size)
        assertTrue(NativeEdits.UNITY_HWSTATS[0].new.all { it == 0.toByte() })
        assertTrue("stats.unity3d.com".toByteArray().toHex() in NativeEdits.UNITY_HWSTATS[0].old.toHex())
        val data = ByteArray(NativeEdits.UNITY_HWSTATS[0].offset + 36)
        NativeEdits.UNITY_HWSTATS[0].old.copyInto(data, NativeEdits.UNITY_HWSTATS[0].offset)
        val patched = data.applyEdits(NativeEdits.UNITY_HWSTATS)
        assertTrue(
            patched.copyOfRange(0x8742A4, 0x8742A4 + 36).contentEquals(ByteArray(36)),
        )
    }

    private fun assertOnDlclose(edits: List<ByteEdit>) {
        assertEquals("17", edits.first().old.toHex())
        assertEquals("00", edits.first().new.toHex())
        assertEquals("16", edits.last().old.toHex())
        assertEquals("15", edits.last().new.toHex())
        assertEquals("8fe2", edits[1].old.toHex())
        assertEquals("9fe5", edits[1].new.toHex())
        assertEquals("90e5", edits[2].old.toHex())
        assertEquals("8fe0", edits[2].new.toHex())
    }
}
