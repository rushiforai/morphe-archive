package app.pablobaro.patches.spotify.layout.theme

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertNull

class ThemeColorsTest {
    private val amoled = ThemeColors(
        background = 0xFF000000.toInt(),
        backgroundSecondary = 0xFF121212.toInt(),
        accent = 0xFF1ED760.toInt(),
        accentPressed = 0xFF1ABC54.toInt(),
    )

    @Test
    fun `parses colors with and without alpha`() {
        assertEquals(0xFF000000.toInt(), parseColor("#000000"))
        assertEquals(0x80121212.toInt(), parseColor("#80121212"))
        assertEquals(0xFF1ED760.toInt(), parseColor("#ff1ed760"))
    }

    @Test
    fun `rejects invalid colors`() {
        listOf(null, "", "000000", "#12345", "#GGGGGG", "@android:color/black").forEach {
            assertFalse(isValidColor(it), "$it")
        }
        assertFailsWith<IllegalArgumentException> { parseColor("black") }
    }

    @Test
    fun `replaces the stock backgrounds`() {
        assertEquals(0xFF000000.toInt(), amoled.replace(0xFF121212.toInt()))
        assertEquals(0xFF000000.toInt(), amoled.replace(0xFF181818.toInt()))
        assertEquals(0xFF121212.toInt(), amoled.replace(0xFF1F1F1F.toInt()))
    }

    @Test
    fun `keeps the alpha of translucent colors`() {
        assertEquals(0x4D000000, amoled.replace(0x4D121212))
    }

    @Test
    fun `ignores colors outside the palette and unchanged accents`() {
        assertNull(amoled.replace(0xFFFFFFFF.toInt()))
        assertNull(amoled.replace(0xFF1ED760.toInt()))
    }

    @Test
    fun `only replaces opaque literals in code`() {
        assertNull(amoled.replaceOpaque(0x4D121212))
        assertEquals(0xFF000000.toInt(), amoled.replaceOpaque(0xFF121212.toInt()))
    }

    @Test
    fun `replaces resource values but keeps references`() {
        assertEquals("#FF000000", amoled.replaceResourceValue("#ff121212"))
        assertEquals("#4D000000", amoled.replaceResourceValue(" #4d121212 "))
        assertNull(amoled.replaceResourceValue("@color/gray_7"))
        assertNull(amoled.replaceResourceValue("#ffffffff"))
    }

    @Test
    fun `stock colors replace nothing`() {
        val stock = ThemeColors(
            background = 0xFF121212.toInt(),
            backgroundSecondary = 0xFF1F1F1F.toInt(),
            accent = 0xFF1ED760.toInt(),
            accentPressed = 0xFF1ABC54.toInt(),
        )
        assertNull(stock.replace(0xFF121212.toInt()))
        assertEquals(emptyList(), stock.missingGroups(emptySet()))
    }

    private val custom = ThemeColors(
        background = 0xFF000001.toInt(),
        backgroundSecondary = 0xFF000002.toInt(),
        accent = 0xFF000003.toInt(),
        accentPressed = 0xFF000004.toInt(),
    )

    @Test
    fun `no group is missing when all are matched`() {
        val matched = setOf(0xFF121212, 0xFF1F1F1F, 0xFF1ED760, 0xFF1ABC54).map { it.toInt() }
        assertEquals(emptyList(), custom.missingGroups(matched))
    }

    @Test
    fun `any original or alpha matches its group`() {
        val matched = setOf(0xFF181818, 0xFF1F1F1F, 0x801ED760, 0xFF1ABC54).map { it.toInt() }
        assertEquals(emptyList(), custom.missingGroups(matched))
    }

    @Test
    fun `names the missing groups`() {
        val matched = setOf(0xFF121212, 0xFF1F1F1F, 0xFF1ABC54).map { it.toInt() }
        assertEquals(listOf("accent"), custom.missingGroups(matched))
        assertEquals(
            listOf("background", "secondary background", "accent", "pressed accent"),
            custom.missingGroups(emptySet()),
        )
    }

    @Test
    fun `groups with stock colors are not required`() {
        // The accents of the AMOLED theme are the stock ones.
        assertEquals(emptyList(), amoled.missingGroups(listOf(0xFF121212.toInt(), 0xFF1F1F1F.toInt())))
        assertEquals(listOf("secondary background"), amoled.missingGroups(listOf(0xFF181818.toInt())))
    }
}
