/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.patcher.patch.PatchException
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.w3c.dom.Document
import org.w3c.dom.Element

/** The Background color option's colors and the style Dark background color adds to Tumblr's styles. */
class DarkBackgroundStyleTest {
    @Test
    fun `blank is black and a dark color is taken as written`() {
        assertEquals(0xFF000000.toInt(), darkBackgroundColor(""))
        assertEquals(0xFF000000.toInt(), darkBackgroundColor(null))
        assertEquals(0xFF000000.toInt(), darkBackgroundColor("#000000"))
        assertEquals(0xFF121212.toInt(), darkBackgroundColor("#121212"))
        assertEquals("a color picker's #FFRRGGBB", 0xFF0D1117.toInt(), darkBackgroundColor("#FF0D1117"))
        assertEquals("without the hash", 0xFF0D1117.toInt(), darkBackgroundColor("0d1117"))
    }

    @Test
    fun `see-through, light and broken colors are refused with a reason`() {
        for (value in listOf("#80000000", "#404040", "#FFFFFF", "#0000FF", "black", "#12345")) {
            assertNull(value, darkBackgroundColor(value))
            assertNotNull(value, darkBackgroundProblem(value))
        }
        assertTrue(darkBackgroundProblem("#80000000")!!.contains("see-through"))
        assertTrue(darkBackgroundProblem("#FFFFFF")!!.contains("too light"))
        assertTrue(darkBackgroundProblem("black")!!.contains("isn't a color"))
        assertNull(darkBackgroundProblem("#121212"))
    }

    /** The advice names the lightest gray the option takes, and the next one up is refused. */
    @Test
    fun `the lightest gray in the advice is the lightest one taken`() {
        assertNotNull(darkBackgroundColor(LIGHTEST_ADMITTED_GRAY))
        val next = (LIGHTEST_ADMITTED_GRAY.removePrefix("#").take(2).toInt(16) + 1).let { "#%02X%02X%02X".format(it, it, it) }
        assertNull(next, darkBackgroundColor(next))
    }

    @Test
    fun `the style sets each background the way Tumblr's styles name it`() {
        val styles = styles(
            "themePrimaryColor", "themePrimaryColorDark", "themeMainContentBackgroundColor",
            "themeSecondaryMainContentBackgroundColor", "themeHighlightedContentBackgroundColor",
            "themeNavigationBarColor", "android:colorBackground",
        )
        styles.addDarkBackgroundStyle(0xFF000000.toInt())

        val items = itemsOf(styles)
        for (attribute in DARK_BACKGROUND_ATTRIBUTES) assertEquals(attribute, "#ff000000", items[attribute])
        assertEquals("a highlighted surface stays apart", "#ff0d0d0d", items[HIGHLIGHTED_ATTRIBUTE])
        assertEquals("#ff000000", items[WINDOW_BACKGROUND_ATTRIBUTE])
        assertEquals(DARK_BACKGROUND_ATTRIBUTES.size + 2, items.size)
        assertThrows(PatchException::class.java) { styles.addDarkBackgroundStyle(0xFF000000.toInt()) }
    }

    @Test
    fun `an attribute the decoder writes with its package keeps it, and a missing optional one is left out`() {
        val styles = styles("com.tumblr:themePrimaryColor", "com.tumblr:themeMainContentBackgroundColor")
        styles.addDarkBackgroundStyle(0xFF121212.toInt())

        val items = itemsOf(styles)
        assertEquals(
            mapOf("com.tumblr:themePrimaryColor" to "#ff121212", "com.tumblr:themeMainContentBackgroundColor" to "#ff121212"),
            items,
        )
    }

    /**
     * Tumblr's newer layouts, the redesigned post card among them, read the design system's surfaces
     * and not the palette's, so a style without them leaves those gray.
     */
    @Test
    fun `the design system's pages take the color and its bars and panels a step up`() {
        val styles = styles(
            "themePrimaryColor", "themeMainContentBackgroundColor", "themeHighlightedContentBackgroundColor",
            *DARK_FLAT_SURFACES.toTypedArray(), *DARK_RAISED_SURFACES.toTypedArray(),
        )
        styles.addDarkBackgroundStyle(0xFF121212.toInt())

        val items = itemsOf(styles)
        for (surface in DARK_FLAT_SURFACES) assertEquals(surface, "#ff121212", items[surface])
        for (surface in DARK_RAISED_SURFACES) assertEquals(surface, "#ff1f1f1f", items[surface])
        assertEquals("a panel is as far from the page as a highlighted surface", items[HIGHLIGHTED_ATTRIBUTE], items["st_chrome_panel"])
        assertEquals(3 + DARK_FLAT_SURFACES.size + DARK_RAISED_SURFACES.size, items.size)
    }

    /** Cards cover most of a feed, so the redesigned card gets the color itself, as the older card does. */
    @Test
    fun `the redesigned post card takes the color and a surface no style sets is left out`() {
        val styles = styles(
            "themePrimaryColor", "themeMainContentBackgroundColor", "st_chrome", "st_content_panel", "st_chrome_panel",
        )
        styles.addDarkBackgroundStyle(0xFF000000.toInt())

        val items = itemsOf(styles)
        assertEquals(items["themeMainContentBackgroundColor"], items["st_content_panel"])
        assertEquals("#ff000000", items["st_content_panel"])
        assertEquals("#ff000000", items["st_chrome"])
        assertEquals("#ff0d0d0d", items["st_chrome_panel"])
        assertEquals(5, items.size)
    }

    @Test
    fun `no surface is named twice`() {
        val named = DARK_BACKGROUND_ATTRIBUTES + HIGHLIGHTED_ATTRIBUTE + DARK_FLAT_SURFACES + DARK_RAISED_SURFACES
        assertEquals(named.size, named.toSet().size)
    }

    @Test
    fun `styles that never set the screen color are refused`() {
        val styles = styles("themeMainContentBackgroundColor")
        assertThrows(PatchException::class.java) { styles.addDarkBackgroundStyle(0xFF000000.toInt()) }
    }

    /** The wallpaper's style sets exactly what the picked color's does, in Android's own tones. */
    @Test
    fun `the wallpaper style sets the same surfaces to the wallpaper's two tones`() {
        val styles = styles(
            "themePrimaryColor", "themePrimaryColorDark", "themeMainContentBackgroundColor",
            "themeSecondaryMainContentBackgroundColor", "themeHighlightedContentBackgroundColor",
            "themeNavigationBarColor", "android:colorBackground", "st_chrome", "st_chrome_panel",
        )
        styles.addDarkBackgroundStyle(0xFF121212.toInt())

        val picked = itemsOf(styles)
        val wallpaper = itemsOf(styles, DARK_WALLPAPER_STYLE)
        assertEquals(picked.keys, wallpaper.keys)
        for (attribute in DARK_BACKGROUND_ATTRIBUTES) assertEquals(attribute, WALLPAPER_PAGE_COLOR, wallpaper[attribute])
        assertEquals(WALLPAPER_PAGE_COLOR, wallpaper[WINDOW_BACKGROUND_ATTRIBUTE])
        assertEquals(WALLPAPER_PAGE_COLOR, wallpaper["st_chrome"])
        assertEquals("a highlighted surface stays apart", WALLPAPER_RAISED_COLOR, wallpaper[HIGHLIGHTED_ATTRIBUTE])
        assertEquals(WALLPAPER_RAISED_COLOR, wallpaper["st_chrome_panel"])
    }

    /** A styles file with one style, BaseTumblrTheme.Dark, setting each of [items] to a dark gray. */
    private fun styles(vararg items: String): Document {
        val body = items.joinToString("") { "<item name=\"$it\">#ff222222</item>" }
        val xml = "<resources><style name=\"BaseTumblrTheme.Dark\" parent=\"@style/BaseTumblrTheme\">$body</style></resources>"
        return DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(xml.byteInputStream())
    }

    /** The added style's items, by name. */
    private fun itemsOf(document: Document, style: String = DARK_BACKGROUND_STYLE): Map<String, String> {
        val styles = document.getElementsByTagName("style")
        val added = (0 until styles.length).map { styles.item(it) as Element }
            .single { it.getAttribute("name") == style }
        assertEquals("no parent: it goes over a whole theme", "", added.getAttribute("parent"))
        val items = added.getElementsByTagName("item")
        return (0 until items.length).map { items.item(it) as Element }.associate { it.getAttribute("name") to it.textContent }
    }
}
