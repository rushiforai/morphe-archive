package app.spicetify.patches.spotify.theme

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertThrows
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.ValueSource
import org.w3c.dom.Document
import org.w3c.dom.Element
import javax.xml.parsers.DocumentBuilderFactory

class ThemeColorsTest {
    @Test
    fun `accepts the supported resources without changing them`() {
        val document = parse(fixture)
        val before = document.documentElement.textContent

        requireThemeColorResources(document)

        assertEquals(before, document.documentElement.textContent)
    }

    @ParameterizedTest
    @ValueSource(strings = ["gray_7", "dark_brightaccent_background_base", "dark_brightaccent_background_press"])
    fun `missing required resource fails`(name: String) {
        val document = parse(fixture)
        val missing = resource(document, name)
        missing.parentNode.removeChild(missing)

        val failure = assertThrows(IllegalArgumentException::class.java) { requireThemeColorResources(document) }

        assertTrue(failure.message!!.contains(name))
    }

    @Test
    fun `a non-color resource with the same name does not satisfy the guard`() {
        val document = parse(fixture.replace("<color name=\"gray_10\">#FF101010</color>",
            "<string name=\"gray_10\">not a color</string>"))

        assertThrows(IllegalArgumentException::class.java) { requireThemeColorResources(document) }
    }

    @Test
    fun `duplicate colors fail`() {
        val document = parse(fixture)
        document.documentElement.appendChild(resource(document, "gray_7").cloneNode(true))

        assertThrows(IllegalArgumentException::class.java) { requireThemeColorResources(document) }
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
            <color name="gray_7">#FF777777</color>
            <color name="gray_10">#FF101010</color>
            <color name="dark_base_background_base">#FF121212</color>
            <color name="dark_base_background_elevated_base">#FF242424</color>
            <color name="bg_gradient_end_color">@color/gray_7</color>
            <color name="sthlm_blk">#FF000000</color>
            <color name="dark_brightaccent_background_base">#FF1ED760</color>
            <color name="dark_base_text_brightaccent">#FF1ED760</color>
            <color name="green_light">#FF1ED760</color>
            <color name="dark_brightaccent_background_press">#FF1ABC54</color>
            <color name="gray_15">#FF222222</color>
        </resources>
    """.trimIndent()
}
