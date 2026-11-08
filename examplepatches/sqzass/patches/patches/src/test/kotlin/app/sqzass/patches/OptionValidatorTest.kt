package app.sqzass.patches

import app.sqzass.patches.all.heavy.resolveNewPackageName
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class OptionValidatorTest {

    @Test
    fun testAdvertisingIdValidator() {
        val uuidRegex = Regex("^[0-9a-fA-F-]{36}$")
        assertTrue(uuidRegex.matches("123e4567-e89b-12d3-a456-426614174000"))
        assertTrue(uuidRegex.matches("00000000-0000-0000-0000-000000000000"))
        assertFalse(uuidRegex.matches("invalid-uuid"))
        assertFalse(uuidRegex.matches("123e4567-e89b-12d3-a456-42661417400")) // 35 chars
    }

    @Test
    fun testMacAddressValidator() {
        val macRegex = Regex("^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$")
        assertTrue(macRegex.matches("02:1A:2B:3C:4D:5E"))
        assertTrue(macRegex.matches("00:00:00:00:00:00"))
        assertTrue(macRegex.matches("ff:ff:ff:ff:ff:ff"))
        assertFalse(macRegex.matches("02:1A:2B:3C:4D"))
        assertFalse(macRegex.matches("02-1A-2B-3C-4D-5E"))
        assertFalse(macRegex.matches("02:1A:2B:3C:4D:5E:6F"))
    }

    @Test
    fun testBatteryLevelValidator() {
        val validator = { value: String? ->
            value.isNullOrBlank() || value.toIntOrNull()?.let { it in 0..100 } == true
        }
        assertTrue(validator(null))
        assertTrue(validator(""))
        assertTrue(validator("0"))
        assertTrue(validator("50"))
        assertTrue(validator("100"))
        assertFalse(validator("-1"))
        assertFalse(validator("101"))
        assertFalse(validator("abc"))
    }

    @Test
    fun testColorHexValidator() {
        val colorRegex = Regex("#[0-9a-fA-F]{6,8}")
        assertTrue(colorRegex.matches("#000000"))
        assertTrue(colorRegex.matches("#212121"))
        assertTrue(colorRegex.matches("#FF000000"))
        assertFalse(colorRegex.matches("000000"))
        assertFalse(colorRegex.matches("#12345"))
        assertFalse(colorRegex.matches("#123456789"))
    }

    @Test
    fun testPackageNameResolution() {
        val original = "com.spotify.music"
        // Blank input is autofilled to the current package name (no longer merely appends .sqz).
        assertEquals(original, resolveNewPackageName(null, original))
        assertEquals(original, resolveNewPackageName("", original))
        assertEquals(original, resolveNewPackageName("  ", original))
        assertEquals("com.spotify.music.sqz", resolveNewPackageName(".sqz", original))
        assertEquals("com.spotify.music.clone", resolveNewPackageName(".clone", original))
        assertEquals("com.spotify.music.custom", resolveNewPackageName("+custom", original))
        assertEquals("org.mycustom.app", resolveNewPackageName("org.mycustom.app", original))
    }
}

