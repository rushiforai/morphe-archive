/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.RepoFiles
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Light mode's half of route two for the Light background color row (#214), on made-up style and
 * colour files shaped like the resource decoder's: which light style items get a surface resource
 * of their own, what's left as Facebook has it, and the list the extension reads.
 */
class AmoledLightSurfacesTest {
    private fun xml(text: String): Document =
        DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(text.byteInputStream())

    private fun Element.kids(): List<Element> = (0 until childNodes.length).mapNotNull { childNodes.item(it) as? Element }

    private fun Document.style(name: String): Element = documentElement.kids().single { it.getAttribute("name") == name }

    private fun Element.items(): Map<String, String> = kids().associate { it.getAttribute("name") to it.textContent }

    /** The real tokens these cases use, plus enough made-up ones for a style to count as a full theme. */
    private val tokens: Map<String, String> =
        listOf("CARD_BACKGROUND", "SURFACE_BACKGROUND", "COMMENT_BACKGROUND", "TEXT_INPUT_BAR_BACKGROUND",
            "BOTTOM_SHEET_INSET_BACKGROUND", "PRIMARY_BUTTON_TEXT", "NAV_BAR_BACKGROUND", "POPOVER_BACKGROUND",
            "LIST_CELL_BACKGROUND", "ENTITY_HEADER_BACKGROUND", "DEVICE_BACKGROUND")
            .plus((0 until 310).map { "FILLER_$it" })
            .withIndex().associate { (index, token) -> "attr_0x%08x".format(0x7f040000 + index) to token }

    private fun attribute(token: String) = tokens.entries.single { it.value == token }.key

    private fun fillers() = (0 until 310).joinToString("") { "<item name=\"${attribute("FILLER_$it")}\">#ff123456</item>" }

    private fun item(token: String, value: String) = "<item name=\"${attribute(token)}\">$value</item>"

    private val colours = mapOf(
        "white" to "#ffffffff",
        "grey" to "#fff0f2f5",
        "grey_alias" to "@color/grey",
        "pale_blue" to "#ffe7f3ff",
        "clear_white" to "#80ffffff",
        "night_white" to "#ffffffff",
        "dark_card" to "#ff242526",
    )

    /** night_white has a value of its own in another configuration, which a default-only entry wouldn't win. */
    private val configured = setOf("night_white")

    private val darkTokens = listOf("CARD_BACKGROUND", "SURFACE_BACKGROUND", "COMMENT_BACKGROUND", "TEXT_INPUT_BAR_BACKGROUND",
        "BOTTOM_SHEET_INSET_BACKGROUND", "PRIMARY_BUTTON_TEXT", "POPOVER_BACKGROUND", "LIST_CELL_BACKGROUND",
        "ENTITY_HEADER_BACKGROUND", "DEVICE_BACKGROUND")

    private fun styles() = xml(
        "<resources>" +
            "<style.2 name=\"light\">" + fillers() +
            item("CARD_BACKGROUND", "@color/white") +
            item("SURFACE_BACKGROUND", "@color/white") +
            item("COMMENT_BACKGROUND", "@color/grey_alias") +
            item("TEXT_INPUT_BAR_BACKGROUND", "@color/grey") +
            item("BOTTOM_SHEET_INSET_BACKGROUND", "#fff2f4f7") +
            // Text on the same white, a surface the dark style doesn't set, a pale blue, a clear
            // white, a white with a night value and an attribute: all left as Facebook has them.
            item("PRIMARY_BUTTON_TEXT", "@color/white") +
            item("NAV_BAR_BACKGROUND", "@color/white") +
            item("POPOVER_BACKGROUND", "@color/pale_blue") +
            item("LIST_CELL_BACKGROUND", "@color/clear_white") +
            item("ENTITY_HEADER_BACKGROUND", "@color/night_white") +
            item("DEVICE_BACKGROUND", "?attr/${attribute("CARD_BACKGROUND")}") +
            "</style.2>" +
            "<style.2 name=\"dark\" parent=\"@style.2/light\">" + fillers() +
            darkTokens.joinToString("") { item(it, "@color/dark_card") } +
            "</style.2>" +
            "<style.2 name=\"darker\" parent=\"@style.2/dark\">" + item("CARD_BACKGROUND", "@color/white") + "</style.2>" +
            "</resources>",
    )

    @Test
    fun `each light surface the dark style sets too points at a resource of its own for its colour`() {
        val document = styles()
        val added = repointLightSurfaces(document, tokens, colours, configured)
        assertEquals(
            mapOf(LIGHT_SURFACE + "f0f2f5" to 0xFFF0F2F5.toInt(), LIGHT_SURFACE + "f2f4f7" to 0xFFF2F4F7.toInt(),
                LIGHT_SURFACE + "ffffff" to -1),
            added,
        )
        val light = document.style("light").items()
        assertEquals("@color/${LIGHT_SURFACE}ffffff", light[attribute("CARD_BACKGROUND")])
        assertEquals("@color/${LIGHT_SURFACE}ffffff", light[attribute("SURFACE_BACKGROUND")])
        assertEquals("through an alias", "@color/${LIGHT_SURFACE}f0f2f5", light[attribute("COMMENT_BACKGROUND")])
        assertEquals("@color/${LIGHT_SURFACE}f0f2f5", light[attribute("TEXT_INPUT_BAR_BACKGROUND")])
        assertEquals("a literal", "@color/${LIGHT_SURFACE}f2f4f7", light[attribute("BOTTOM_SHEET_INSET_BACKGROUND")])
    }

    @Test
    fun `text, light-only surfaces, other colours and every other style keep Facebook's values`() {
        val before = styles()
        val document = styles()
        repointLightSurfaces(document, tokens, colours, configured)
        val light = document.style("light").items()
        val stock = before.style("light").items()
        for (token in listOf("PRIMARY_BUTTON_TEXT", "NAV_BAR_BACKGROUND", "POPOVER_BACKGROUND", "LIST_CELL_BACKGROUND",
            "ENTITY_HEADER_BACKGROUND", "DEVICE_BACKGROUND", "FILLER_0")) {
            assertEquals(token, stock[attribute(token)], light[attribute(token)])
        }
        for (name in listOf("dark", "darker")) {
            assertEquals("the $name style", before.style(name).items(), document.style(name).items())
        }
    }

    @Test
    fun `a file without Facebook's light and dark themes is left alone`() {
        val lightOnly = xml("<resources><style.2 name=\"light\">${fillers()}${item("CARD_BACKGROUND", "@color/white")}</style.2></resources>")
        assertEquals(emptyMap<String, Int>(), repointLightSurfaces(lightOnly, tokens, colours, configured))
        assertEquals("@color/white", lightOnly.style("light").items()[attribute("CARD_BACKGROUND")])
        assertEquals(emptyMap<String, Int>(), repointLightSurfaces(xml("<resources/>"), tokens, colours, configured))
    }

    @Test
    fun `the new resources hold Facebook's colours and the list gives each once`() {
        val surfaces = repointLightSurfaces(styles(), tokens, colours, configured)
        val document = xml("<resources><color name=\"white\">#ffffffff</color></resources>")
        addLightSurfaceColours(document, surfaces)
        val added = document.documentElement.kids().drop(1).associate { it.getAttribute("name") to it.textContent }
        assertEquals(
            mapOf(LIGHT_SURFACE + "f0f2f5" to "#fff0f2f5", LIGHT_SURFACE + "f2f4f7" to "#fff2f4f7", LIGHT_SURFACE + "ffffff" to "#ffffffff"),
            added,
        )
        assertEquals("f0f2f5;f2f4f7;ffffff", lightSurfacesTable(surfaces))
        assertEquals("f0f2f5;ffffff", lightSurfacesTable(mapOf("a" to -1, "b" to 0xFFF0F2F5.toInt(), "c" to -1)))
        assertEquals("", lightSurfacesTable(emptyMap()))
    }

    @Test
    fun `a light surface is an opaque white or light grey`() {
        assertTrue(isLightSurface(-1))
        assertTrue(isLightSurface(0xFFC0C0C0.toInt()))
        assertTrue(isLightSurface(0xFFC9CCD1.toInt()))
        assertFalse("one step darker", isLightSurface(0xFFBFBFBF.toInt()))
        assertFalse("a pale blue", isLightSurface(0xFFE7F3FF.toInt()))
        assertFalse("a clear white", isLightSurface(0x80FFFFFF.toInt()))
        assertFalse("a dark grey", isLightSurface(0xFF242526.toInt()))
    }

    private val extension = File(RepoFiles.root, "extensions/facebook/src/main/java/app/morphe/extension/facebook/theme")

    /** The names in the Java set [constant] of [source], up to the end of its declaration. */
    private fun javaSet(source: String, constant: String): Set<String> {
        val start = source.indexOf("$constant =")
        check(start >= 0) { "no $constant" }
        return Regex(""""([A-Z_]+)"""").findAll(source.substring(start, source.indexOf(")));", start)))
            .map { it.groupValues[1] }.toSet()
    }

    /** The patch's lists and names are the extension's, so the surfaces it repoints are the ones route one moves. */
    @Test
    fun `the patch's light surface tokens and names are the extension's`() {
        val amoled = File(extension, "AmoledTheme.java").readText()
        val resources = File(extension, "AmoledResources.java").readText()
        assertEquals(javaSet(amoled, "BACKGROUND_TOKENS") + javaSet(amoled, "LIGHT_BACKGROUND_TOKENS"), LIGHT_SURFACE_TOKENS)
        assertTrue(resources.contains("static final String LIGHT_SURFACE = \"$LIGHT_SURFACE\";"))
        val floor = Regex("""static final int LIGHT_MIN_CHANNEL = 0x([0-9A-F]+);""").find(amoled)?.groupValues?.get(1)?.toInt(16)
        assertEquals("AmoledTheme's LIGHT_MIN_CHANNEL", 0xC0, floor)
    }
}
