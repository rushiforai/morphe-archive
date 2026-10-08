package app.morphe.patches.tiktok.misc.branding

import app.morphe.patcher.patch.PatchException
import java.io.File
import java.io.StringWriter
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * The launcher icon's restyle and its themed layer, on the decoded shape of TikTok's icon.
 *
 * <p>On 47.0.3, 47.1.3 and 47.1.4 the application's icon and round icon are both `@mipmap/c`,
 * whose mipmap-anydpi-v26 configuration is an adaptive icon with a background and a foreground
 * and no themed layer. The background (c24 on 47.0.3, c26 on 47.1.x) is one #161823 square, and
 * the foreground (c25, c27) is seven paths: three cyan and three red slivers and the white note.
 * Read off each fixture with `aapt2 dump xmltree`.
 */
class CustomLauncherIconTest {
    @get:Rule val folder = TemporaryFolder()

    @Test
    fun `TikTok colors keeps both layers and adds the white note as the themed layer`() {
        val icon = parse(ADAPTIVE_ICON)
        val foreground = parse(FOREGROUND).documentElement

        assertTrue(restyleAdaptiveIcon(icon, IconLayers(parse(BACKGROUND).documentElement, foreground), IconStyle.TIKTOK))

        val root = icon.documentElement
        assertEquals("@drawable/c26", layer(root, "background").getAttribute("android:drawable"))
        assertEquals("@drawable/c27", layer(root, "foreground").getAttribute("android:drawable"))
        val note = inlineVector(layer(root, "monochrome"))
        assertEquals("108.0dp", note.getAttribute("android:width"))
        assertEquals("108.0", note.getAttribute("android:viewportHeight"))
        assertFalse("the copy declares no namespace of its own", note.hasAttribute("xmlns:android"))
        assertEquals(listOf(WHITE_NOTE to GLYPH_FILL), paths(note))
        // TikTok's own drawable is read, never changed.
        assertEquals(7, foreground.getElementsByTagName("path").length)
    }

    @Test
    fun `each plain style recolors the background and draws only the note`() {
        for ((style, background, glyph) in listOf(
            Triple(IconStyle.WHITE_ON_BLACK, "#ff000000", "#ffffffff"),
            Triple(IconStyle.BLACK_ON_WHITE, "#ffffffff", "#ff000000"),
        )) {
            val icon = parse(ADAPTIVE_ICON)
            assertTrue(restyleAdaptiveIcon(icon, layers(), style))
            val root = icon.documentElement
            val back = layer(root, "background")
            assertFalse(back.hasAttribute("android:drawable"))
            assertEquals(listOf(SQUARE to background), paths(inlineVector(back)))
            val front = layer(root, "foreground")
            assertFalse(front.hasAttribute("android:drawable"))
            assertEquals(listOf(WHITE_NOTE to glyph), paths(inlineVector(front)))
            assertEquals(listOf(WHITE_NOTE to GLYPH_FILL), paths(inlineVector(layer(root, "monochrome"))))
            // c26 declares aapt, so the copy's prefix moves to the root, where it still resolves.
            assertEquals("http://schemas.android.com/aapt", root.getAttribute("xmlns:aapt"))

            // What the patcher writes back parses again, and only the root declares android.
            val written = serialize(icon)
            assertEquals(written, 1, Regex("xmlns:android=").findAll(written).count())
            val reread = parse(written).documentElement
            assertEquals(3, reread.getElementsByTagName("vector").length)
        }
    }

    @Test
    fun `black background keeps TikTok's colored note`() {
        val icon = parse(ADAPTIVE_ICON)
        restyleAdaptiveIcon(icon, layers(), IconStyle.BLACK)
        val root = icon.documentElement
        assertEquals(listOf(SQUARE to "#ff000000"), paths(inlineVector(layer(root, "background"))))
        assertEquals("@drawable/c27", layer(root, "foreground").getAttribute("android:drawable"))
        assertNotNull(layer(root, "monochrome"))
    }

    @Test
    fun `an icon that already has a themed layer keeps it`() {
        val icon = parse(ADAPTIVE_ICON.replace("</adaptive-icon>", "<monochrome android:drawable=\"@drawable/own\"/></adaptive-icon>"))
        assertFalse(restyleAdaptiveIcon(icon, layers(), IconStyle.TIKTOK))
        val themed = icon.documentElement.getElementsByTagName("monochrome")
        assertEquals(1, themed.length)
        assertEquals("@drawable/own", (themed.item(0) as Element).getAttribute("android:drawable"))
    }

    @Test
    fun `a style that can't be drawn is refused before anything changes`() {
        assertEquals(IconStyle.WHITE_ON_BLACK, iconStyle("White on black"))
        assertEquals(IconStyle.BLACK, iconStyle(" black "))
        assertThrows(PatchException::class.java) { iconStyle("purple") }
        assertThrows(PatchException::class.java) { iconStyle(null) }

        val noNote = parse(FOREGROUND.replace("#ffffffff", "#ff25f4ee")).documentElement
        val icon = parse(ADAPTIVE_ICON)
        assertThrows(PatchException::class.java) {
            restyleAdaptiveIcon(icon, IconLayers(parse(BACKGROUND).documentElement, noNote), IconStyle.TIKTOK)
        }
        // A background that isn't a vector can't be recolored, and nothing was touched.
        assertThrows(PatchException::class.java) {
            restyleAdaptiveIcon(icon, IconLayers(null, parse(FOREGROUND).documentElement), IconStyle.BLACK)
        }
        assertEquals(serialize(parse(ADAPTIVE_ICON)), serialize(icon))
    }

    @Test
    fun `the launcher's icons are the application's and its launcher entries'`() {
        val manifest = parse(
            """
            <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.zhiliaoapp.musically">
                <application android:icon="@mipmap/c" android:roundIcon="@mipmap/c" android:label="@string/app_name">
                    <activity-alias android:name="com.ss.android.ugc.aweme.splash.SplashActivity"
                            android:targetActivity="com.ss.android.ugc.aweme.main.MainActivity">
                        <intent-filter>
                            <action android:name="android.intent.action.MAIN"/>
                            <category android:name="android.intent.category.LAUNCHER"/>
                        </intent-filter>
                    </activity-alias>
                    <activity-alias android:name="com.ss.android.ugc.aweme.splash.SeasonalIcon" android:icon="@mipmap/e"
                            android:targetActivity="com.ss.android.ugc.aweme.main.MainActivity">
                        <intent-filter>
                            <action android:name="android.intent.action.MAIN"/>
                            <category android:name="android.intent.category.LAUNCHER"/>
                        </intent-filter>
                    </activity-alias>
                    <service android:name="com.ss.android.ugc.aweme.tile.PublishTileService" android:icon="@drawable/d78"/>
                </application>
            </manifest>
            """,
        )
        assertEquals(setOf("@mipmap/c", "@mipmap/e"), launcherIconReferences(manifest))
    }

    @Test
    fun `the icon and its layers are found in the decoded resources`() {
        val res = folder.newFolder("res")
        write(res, "mipmap-anydpi-v26/c.xml", ADAPTIVE_ICON)
        write(res, "mipmap-xxhdpi/c.png", "not xml")
        write(res, "drawable/c26.xml", BACKGROUND)
        write(res, "drawable/c27.xml", FOREGROUND)
        write(res, "drawable-night/unrelated.xml", BACKGROUND)

        assertEquals("mipmap" to "c", appResource("@com.zhiliaoapp.musically:mipmap/c"))
        assertNull(appResource("@android:color/black"))
        assertNull(appResource("#ff000000"))
        val adaptive = adaptiveIconFiles(res, "@mipmap/c")
        assertEquals(listOf("mipmap-anydpi-v26"), adaptive.map { it.parentFile.name })
        assertNull(layerVector(res, "@android:color/black"))

        val layers = IconLayers.of(res, readXml(adaptive.single()))
        assertEquals(1, layers.background!!.getElementsByTagName("path").length)
        assertEquals(7, layers.foreground.getElementsByTagName("path").length)

        // A foreground drawn inline is read from the icon itself.
        val inline = parse(ADAPTIVE_ICON.replace("<foreground android:drawable=\"@drawable/c27\"/>", "<foreground>$FOREGROUND_BODY</foreground>"))
        assertEquals(7, IconLayers.of(res, inline).foreground.getElementsByTagName("path").length)
        // A foreground that isn't a vector is refused.
        write(res, "drawable/c27.xml", "<bitmap xmlns:android=\"http://schemas.android.com/apk/res/android\" android:src=\"@drawable/x\"/>")
        assertThrows(PatchException::class.java) { IconLayers.of(res, readXml(adaptive.single())) }
    }

    private fun layers() = IconLayers(parse(BACKGROUND).documentElement, parse(FOREGROUND).documentElement)

    private fun layer(root: Element, tag: String): Element =
        root.childNodes.elements().single { it.tagName == tag }

    private fun inlineVector(layer: Element): Element = layer.childNodes.elements().single().also {
        assertEquals("vector", it.tagName)
    }

    private fun paths(vector: Element): List<Pair<String, String>> =
        vector.getElementsByTagName("path").elements().map { it.getAttribute("android:pathData") to it.getAttribute("android:fillColor") }

    private fun write(res: File, path: String, text: String) {
        res.resolve(path).apply { parentFile.mkdirs() }.writeText(text)
    }

    private fun parse(xml: String): Document =
        DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(xml.trim().byteInputStream())

    private fun serialize(document: Document): String = StringWriter().also {
        TransformerFactory.newInstance().newTransformer().transform(DOMSource(document), StreamResult(it))
    }.toString()

    private companion object {
        const val SQUARE = "M 0 0 H 108 V 108 H 0 V 0 Z"
        const val WHITE_NOTE = "M61.1,45.3C64.3,47.62 68.1,48.93 72.2,48.9L72.2,42.9L55.7,63.6Z"

        val ADAPTIVE_ICON = """
            <?xml version="1.0" encoding="utf-8"?>
            <adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
              <background android:drawable="@drawable/c26"/>
              <foreground android:drawable="@drawable/c27"/>
            </adaptive-icon>
        """.trimIndent()

        val BACKGROUND = """
            <?xml version="1.0" encoding="utf-8"?>
            <vector xmlns:android="http://schemas.android.com/apk/res/android" xmlns:aapt="http://schemas.android.com/aapt"
                android:height="108.0dp" android:width="108.0dp" android:viewportWidth="108.0" android:viewportHeight="108.0">
              <path android:fillColor="#ff161823" android:pathData="$SQUARE" android:strokeWidth="1.0" android:fillType="evenOdd"/>
            </vector>
        """.trimIndent()

        val FOREGROUND_BODY = """
            <vector xmlns:android="http://schemas.android.com/apk/res/android"
                android:height="108.0dp" android:width="108.0dp" android:viewportWidth="108.0" android:viewportHeight="108.0">
              <path android:fillColor="#ff25f4ee" android:pathData="M48.8,48.9L48.8,46.8Z" android:strokeColor="#00000000"/>
              <path android:fillColor="#ff25f4ee" android:pathData="M49.75,69.9C53.26,69.9 55.51,67.07 55.7,63.6Z" android:strokeColor="#00000000"/>
              <path android:fillColor="#ff25f4ee" android:pathData="M72.2,42.9L72.2,41.1Z" android:strokeColor="#00000000"/>
              <path android:fillColor="#fffe2c55" android:pathData="M66.2,39.3C64.53,37.37 63.51,34.85 63.5,32.1Z" android:strokeColor="#00000000"/>
              <path android:fillColor="#fffe2c55" android:pathData="M46.4,54.9C42.75,54.76 39.8,57.72 39.8,61.5Z" android:strokeColor="#00000000"/>
              <path android:fillColor="#fffe2c55" android:pathData="M72.2,48.6C68.18,48.72 64.07,47.42 61.1,45.3Z" android:strokeColor="#00000000"/>
              <path android:fillColor="#ffffffff" android:pathData="$WHITE_NOTE" android:strokeColor="#00000000"/>
            </vector>
        """.trimIndent()

        val FOREGROUND = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n$FOREGROUND_BODY"
    }
}
