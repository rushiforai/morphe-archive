/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.icon

import app.morphe.FixtureResources
import app.morphe.Fixtures
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.shared.compat.AppCompatibilities
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.w3c.dom.Document
import org.w3c.dom.Element
import javax.xml.parsers.DocumentBuilderFactory

/**
 * Custom launcher icon (#26) on a hand-written copy of 457's launcher icon, and on the icon every
 * declared build decodes to through the patcher's own coder. The fixture half reads the bundles
 * from HUSHTHREADS_FIXTURE_DIR and skips without them.
 */
class CustomLauncherIconFixtureTest {
    private fun xml(text: String): Document =
        DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(text.byteInputStream())

    /** 457's res/mipmap-anydpi/barcelona.xml as it decodes: the themed layer reuses the foreground. */
    private fun icon() = xml(
        """<?xml version="1.0" encoding="utf-8"?>
        <adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
            <background android:drawable="@mipmap/barcelona_background"/>
            <foreground android:drawable="@mipmap/barcelona_foreground"/>
            <monochrome android:drawable="@mipmap/barcelona_foreground"/>
        </adaptive-icon>""",
    )

    private fun Element.children(): List<Element> =
        (0 until childNodes.length).mapNotNull { childNodes.item(it) as? Element }

    private fun Document.layer(tag: String) = documentElement.children().single { it.tagName == tag }

    private fun Element.paths() = getElementsByTagName("path").let { list -> (0 until list.length).map { list.item(it) as Element } }

    /** Every point a path's lines end on, as x to y. The traced logo draws only straight lines. */
    private fun points(pathData: String): List<Pair<Double, Double>> {
        assertTrue("a path uses a command besides M, L and Z: ${pathData.take(80)}", pathData.all { !it.isLetter() || it in "MLZ" })
        return Regex("""[ML]([\d.]+),([\d.]+)""").findAll(pathData)
            .map { it.groupValues[1].toDouble() to it.groupValues[2].toDouble() }.toList()
    }

    /** HushThreads' logo in every layer, all of it inside the 66 unit circle no launcher shape cuts. */
    private fun assertHushThreads(icon: Document, where: String = "") {
        val background = icon.layer("background")
        assertEquals("$where background names a drawable", "", background.getAttribute("android:drawable"))
        assertEquals("$where background color", "#ff0261fc", background.children().single().getAttribute("android:color"))

        val foreground = icon.layer("foreground")
        assertEquals("$where foreground names a drawable", "", foreground.getAttribute("android:drawable"))
        val vector = foreground.children().single()
        assertEquals("$where foreground", "vector", vector.tagName)
        assertEquals("$where foreground size", "108", vector.getAttribute("android:viewportWidth"))
        // The H, the shadow above the ribbon, then the ribbon over both.
        val paths = vector.paths()
        assertEquals(
            "$where foreground colors, back to front",
            listOf("#fffcfcf8", "#ff014fce", "#ff1df8fd"),
            paths.map { it.getAttribute("android:fillColor") },
        )
        assertEquals("$where the H's hole isn't cut out", "evenOdd", paths[0].getAttribute("android:fillType"))
        val shadow = paths[1].parentNode as Element
        assertEquals("$where the shadow isn't clipped", "group", shadow.tagName)
        val clip = shadow.children().first()
        assertEquals("$where the shadow's clip comes first", "clip-path", clip.tagName)
        assertEquals("$where the shadow shows outside the H", HushThreadsLogo.H, clip.getAttribute("android:pathData"))

        val monochrome = icon.layer("monochrome")
        assertEquals("$where monochrome names a drawable", "", monochrome.getAttribute("android:drawable"))
        val shape = monochrome.children().single().paths().single()
        assertEquals("$where the ribbon isn't cut out", "evenOdd", shape.getAttribute("android:fillType"))
        // The H's outline, its hole and the ribbon.
        assertEquals("$where monochrome shapes", 3, shape.getAttribute("android:pathData").count { it == 'M' })

        for (path in paths + shape) {
            val corners = points(path.getAttribute("android:pathData"))
            assertTrue("$where a path has no points", corners.size >= 8)
            corners.forEach { (x, y) ->
                assertTrue("$where ($x, $y) is outside the safe circle", Math.hypot(x - 54, y - 54) <= 33.0)
            }
        }
    }

    @Test
    fun `the icon is drawn as the HushThreads H on HushThreads blue and themes too`() {
        val icon = icon()
        drawHushThreadsIcon(icon)
        assertHushThreads(icon)
        // Threads' own layer drawables stay for whatever else draws them.
        assertEquals(3, icon.documentElement.children().size)
    }

    @Test
    fun `an icon without a themed layer gets one`() {
        val icon = xml(
            """<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
                <background android:drawable="@mipmap/barcelona_background"/>
                <foreground android:drawable="@mipmap/barcelona_foreground"/>
            </adaptive-icon>""",
        )
        drawHushThreadsIcon(icon)
        assertHushThreads(icon)
    }

    @Test
    fun `a plain picture is refused untouched`() {
        val icon = xml("""<bitmap xmlns:android="http://schemas.android.com/apk/res/android" android:src="@mipmap/barcelona_foreground"/>""")
        assertThrows(PatchException::class.java) { drawHushThreadsIcon(icon) }
        assertEquals("@mipmap/barcelona_foreground", icon.documentElement.getAttribute("android:src"))
        assertTrue(icon.documentElement.children().isEmpty())
    }

    @Test
    fun `an adaptive icon missing a layer is refused untouched`() {
        val icon = xml(
            """<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
                <background android:drawable="@mipmap/barcelona_background"/>
            </adaptive-icon>""",
        )
        assertThrows(PatchException::class.java) { drawHushThreadsIcon(icon) }
        assertEquals("@mipmap/barcelona_background", icon.layer("background").getAttribute("android:drawable"))
        assertEquals(1, icon.documentElement.children().size)
    }

    @Test
    fun `a separate round icon is refused and only the app's own icon is read`() {
        val manifest = xml(
            """<manifest xmlns:android="http://schemas.android.com/apk/res/android">
                <application android:icon="@mipmap/barcelona" android:roundIcon="@mipmap/barcelona_round"/>
            </manifest>""",
        )
        assertThrows(PatchException::class.java) { applicationIcon(manifest) }
        assertEquals("mipmap" to "barcelona", appResource("@com.instagram.barcelona:mipmap/barcelona"))
        assertEquals("mipmap" to "barcelona", appResource("@mipmap/barcelona"))
        assertNull(appResource("@android:drawable/sym_def_app_icon"))
        assertNull(appResource("?attr/appIcon"))
    }

    @Test
    fun `only one adaptive icon may answer`() {
        val docs = mapOf(
            "res/mipmap-anydpi/barcelona.xml" to icon(),
            "res/mipmap-anydpi-v33/barcelona.xml" to icon(),
            "res/mipmap-anydpi/barcelona_internal.xml" to icon(),
        )
        val error = assertThrows(PatchException::class.java) {
            singleXml(docs.keys.toList(), "mipmap" to "barcelona", ADAPTIVE_ICON) { docs.getValue(it) }
        }
        assertTrue(error.message, error.message!!.contains("2 <adaptive-icon> versions"))
        assertEquals(
            "res/mipmap-anydpi/barcelona.xml",
            singleXml(docs.keys.take(1) + docs.keys.last(), "mipmap" to "barcelona", ADAPTIVE_ICON) { docs.getValue(it) },
        )
    }

    // ------------------------------------------------------------------ the declared builds

    @Test
    fun `each declared build's own icon is redrawn`() {
        val builds = Fixtures.declaredBuilds()
        for (build in builds) FixtureResources.of(build).use { resources ->
            val name = build.name
            val icon = checkNotNull(appResource(applicationIcon(resources.document("AndroidManifest.xml")))) { "$name: icon" }
            assertEquals("$name: the app icon", "mipmap" to "barcelona", icon)
            // The PNG configurations decode to no XML, so the one adaptive icon is found among the rest.
            val decoded = resources.decode(resourceGlob(icon))
            val iconPath = singleXml(decoded, icon, ADAPTIVE_ICON, resources::document)
            val document = resources.document(iconPath)
            assertEquals("$name: stock layers", listOf("background", "foreground", "monochrome"),
                document.documentElement.children().map { it.tagName })
            drawHushThreadsIcon(document)
            assertHushThreads(document, name)
        }
        assertEquals("one build of each declared version and ABI", AppCompatibilities.THREADS_TARGET_VERSION_CODES.size, builds.size)
    }
}
