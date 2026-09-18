package app.spicetify.patches.spotify.theme

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertThrows
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.ValueSource
import org.w3c.dom.Document
import org.w3c.dom.Element
import javax.xml.parsers.DocumentBuilderFactory

class ThemeColorsTest {
    private val colors = ThemeColors("#000000", "#FFabcdef", "#80123456")

    @Test
    fun `changes every intended resource and preserves unrelated content`() {
        val document = parse(fixture)

        applyThemeColors(document, colors)

        listOf(
            "gray_7", "gray_10", "dark_base_background_base", "dark_base_background_elevated_base",
            "bg_gradient_end_color", "sthlm_blk",
        ).forEach { assertEquals(colors.background, resource(document, it).textContent) }
        listOf("dark_brightaccent_background_base", "dark_base_text_brightaccent", "green_light")
            .forEach { assertEquals(colors.accent, resource(document, it).textContent) }
        assertEquals(colors.pressedAccent, resource(document, "dark_brightaccent_background_press").textContent)
        assertEquals("#FF123456", resource(document, "bg_gradient_start_color").textContent)
        assertEquals("#FF1ED760", resource(document, "spotify_green_157").textContent)
        assertEquals("#FF222222", resource(document, "gray_15").textContent)
        assertEquals("@color/gray_7", resource(document, "unrelated_alias").textContent)
        assertEquals("retained", resource(document, "gray_7").getAttribute("example"))
        assertEquals("not a color", document.getElementsByTagName("string").item(0).textContent)
    }

    @ParameterizedTest
    @ValueSource(strings = ["gray_7", "dark_brightaccent_background_base", "dark_brightaccent_background_press"])
    fun `missing required resource fails before changing any colors`(name: String) {
        val document = parse(fixture)
        val missing = resource(document, name)
        missing.parentNode.removeChild(missing)
        val before = document.documentElement.textContent

        val failure = assertThrows(IllegalArgumentException::class.java) { applyThemeColors(document, colors) }

        assertTrue(failure.message!!.contains(name))
        assertEquals(before, document.documentElement.textContent)
    }

    @Test
    fun `a non-color resource with the same name does not satisfy the guard`() {
        val document = parse(fixture.replace("<color name=\"gray_10\">#FF101010</color>",
            "<string name=\"gray_10\">not a color</string>"))

        assertThrows(IllegalArgumentException::class.java) { applyThemeColors(document, colors) }
        assertEquals("#FF777777", resource(document, "gray_7").textContent)
    }

    @Test
    fun `duplicate colors fail before mutation`() {
        val document = parse(fixture)
        document.documentElement.appendChild(resource(document, "gray_7").cloneNode(true))

        assertThrows(IllegalArgumentException::class.java) { applyThemeColors(document, colors) }
        assertEquals("#FF777777", resource(document, "gray_7").textContent)
    }

    @ParameterizedTest
    @ValueSource(strings = ["#123456", "#aBcDeF", "#8012ABcd", "#00000000"])
    fun `accepts RGB and ARGB colors`(value: String) {
        assertTrue(isThemeColor(value))
        ThemeColors(value, value, value)
    }

    @ParameterizedTest
    @ValueSource(strings = ["", "#FFF", "#1234567", "#123456789", "123456", "#GG0000", "red", "@android:color/black", " #123456", "#123456\n"])
    fun `rejects invalid colors for each option`(value: String) {
        assertFalse(isThemeColor(value))
        assertThrows(IllegalArgumentException::class.java) { colors.copy(background = value) }
        assertThrows(IllegalArgumentException::class.java) { colors.copy(accent = value) }
        assertThrows(IllegalArgumentException::class.java) { colors.copy(pressedAccent = value) }
    }

    @Test
    fun `rejects a missing color`() {
        assertFalse(isThemeColor(null))
    }

    @Test
    fun `applying the same colors twice preserves the result`() {
        val document = parse(fixture)
        applyThemeColors(document, colors)
        val before = document.documentElement.textContent

        applyThemeColors(document, colors)

        assertEquals(before, document.documentElement.textContent)
    }

    private fun parse(xml: String): Document = DocumentBuilderFactory.newInstance()
        .newDocumentBuilder().parse(xml.byteInputStream())

    private fun resource(document: Document, name: String): Element {
        val nodes = document.getElementsByTagName("color")
        return (0 until nodes.length).map { nodes.item(it) as Element }
            .first { it.getAttribute("name") == name }
    }

    private val fixture = """
        <resources>
            <!-- This comment and unknown resources must survive. -->
            <color name="gray_7" example="retained">#FF777777</color>
            <color name="gray_10">#FF101010</color>
            <color name="dark_base_background_base">#FF121212</color>
            <color name="dark_base_background_elevated_base">#FF242424</color>
            <color name="bg_gradient_end_color">@color/gray_7</color>
            <color name="sthlm_blk">#FF000000</color>
            <color name="dark_brightaccent_background_base">#FF1ED760</color>
            <color name="dark_base_text_brightaccent">#FF1ED760</color>
            <color name="green_light">#FF1ED760</color>
            <color name="dark_brightaccent_background_press">#FF1ABC54</color>
            <color name="bg_gradient_start_color">#FF123456</color>
            <color name="spotify_green_157">#FF1ED760</color>
            <color name="gray_15">#FF222222</color>
            <color name="unrelated_alias">@color/gray_7</color>
            <string name="gray_7">not a color</string>
        </resources>
    """.trimIndent()
}
