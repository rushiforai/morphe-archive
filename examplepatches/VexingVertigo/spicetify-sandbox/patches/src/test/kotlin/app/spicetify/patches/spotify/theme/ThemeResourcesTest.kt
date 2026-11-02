package app.spicetify.patches.spotify.theme

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertThrows
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test
import org.w3c.dom.Document
import javax.xml.parsers.DocumentBuilderFactory

class ThemeResourcesTest {
    private val roleMap = loadRoleMap()

    @Test
    fun `the role map covers every role and names each color once`() {
        assertEquals(ROLE_KEYS, roleMap.keys.toList())
        val names = roleMap.values.flatten()
        assertEquals(62, names.size)
        assertEquals(names.size, names.toSet().size)
    }

    @Test
    fun `the role table keeps the stock alpha of translucent colors`() {
        val table = roleTable(parse(fixture()), roleMap)
        assertTrue(table.startsWith("main:gray_7,gray_10,dark_base_background_base,bg_gradient_end_color,sthlm_blk|"))
        assertTrue(
            "|selected-row:dark_base_background_tinted_base@1A,dark_base_background_tinted_highlight@24," +
                "dark_base_background_tinted_press@36,opacity_white_10@1A|" in table,
        )
        assertTrue(table.endsWith("|shadow:artwork_shadow@75,bottom_sheet_background_color@B3"))
    }

    @Test
    fun `a missing or duplicated color fails with its name`() {
        val missing = parse(fixture().replace("<color name=\"gray_20\">#FF333333</color>", ""))
        val failure = assertThrows(IllegalArgumentException::class.java) { roleTable(missing, roleMap) }
        assertTrue(failure.message!!.contains("missing gray_20"))
        // A resource of another type with the same name doesn't count.
        val notAColor = parse(fixture().replace("<color name=\"gray_20\">#FF333333</color>", "<string name=\"gray_20\">#FF333333</string>"))
        assertThrows(IllegalArgumentException::class.java) { roleTable(notAColor, roleMap) }
        val duplicated = parse(fixture().replace("</resources>", "<color name=\"gray_7\">#FF121212</color></resources>"))
        assertThrows(IllegalArgumentException::class.java) { roleTable(duplicated, roleMap) }
    }

    @Test
    fun `the Compose table gives each field path its color's stock value`() {
        val paths = loadComposePaths()
        assertEquals(listOf(83, 8), paths.map { it.size })
        val (palette, raw) = composeTable(parse(fixture()), roleMap, paths).split(';')
        assertEquals(83, palette.split(',').size)
        assertTrue("a.a.b.a=dark_base_background_tinted_base@1AFFFFFF" in palette.split(','))
        assertTrue(raw.startsWith("b.c=gray_7@FF121212,"))
        assertTrue("d.d=gray_20@FF333333" in raw.split(','))
        // The page background, raw gray7 and raw gray30 turn see-through behind a background image.
        assertEquals(
            listOf("a.a.c=dark_base_background_base@FF121212*", "d.a=gray_7@FF121212*", "d.e=gray_30@FF121212*"),
            (palette.split(',') + raw.split(',')).filter { it.endsWith("*") },
        )
    }

    @Test
    fun `a Compose path following an unmapped color fails with its name`() {
        val paths = listOf(mapOf("a.a.e" to "dark_base_background_press*"), emptyMap())
        val declared = parse(fixture().replace("</resources>", "<color name=\"dark_base_background_press\">#FF191919</color></resources>"))
        val failure = assertThrows(IllegalArgumentException::class.java) { composeTable(declared, roleMap, paths) }
        assertTrue(failure.message!!.contains("follows dark_base_background_press,"))
    }

    @Test
    fun `the overlayable declaration lists every mapped color under one public policy`() {
        val xml = overlayableXml(listOf("gray_7", "gray_10"))
        assertTrue("<overlayable name=\"SpicetifyTheme\">" in xml)
        assertTrue("<policy type=\"public\">" in xml)
        assertTrue("<item type=\"color\" name=\"gray_7\" />" in xml)
        assertTrue("<item type=\"color\" name=\"gray_10\" />" in xml)
    }

    /** Every mapped color. The alias and the translucent colors carry their 9.1.80.2221 stock values; the rest are opaque. */
    private fun fixture(): String {
        val stock = mapOf(
            "gray_20" to "#FF333333",
            "bg_gradient_end_color" to "@color/gray_7",
            "dark_base_background_tinted_base" to "#1AFFFFFF",
            "dark_base_background_tinted_highlight" to "#24FFFFFF",
            "dark_base_background_tinted_press" to "#36FFFFFF",
            "opacity_white_10" to "#1AFFFFFF",
            "artwork_shadow" to "#75000000",
            "bottom_sheet_background_color" to "#B3000000",
        )
        val colors = roleMap.values.flatten().joinToString("\n") { "<color name=\"$it\">${stock[it] ?: "#FF121212"}</color>" }
        return "<resources>\n$colors\n<string name=\"gray_7\">not a color</string>\n</resources>"
    }

    private fun parse(xml: String): Document =
        DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(xml.byteInputStream())
}
