/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.branding

import app.morphe.Fixtures
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patches.telegram.misc.maps.ANDROID_NAMESPACE
import app.morphe.patches.telegram.misc.maps.assertResourceTreeUnchanged
import app.morphe.patches.telegram.misc.maps.resourceTree
import app.morphe.patches.telegram.misc.maps.resourceXmlDeclarations
import app.morphe.patches.telegram.misc.maps.readResourceXml
import app.morphe.patches.telegram.misc.maps.withAndroidResourceXmlFactory
import com.reandroid.apk.ApkModule
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node
import org.xmlpull.v1.XmlPullParserFactory
import java.io.File
import java.io.StringWriter
import javax.xml.parsers.DocumentBuilderFactory

/**
 * The optional icon patch on both builds' manifests, holding everything it doesn't change to the
 * original. Morphe decodes the resources before a resource patch runs, which a unit test can't do
 * on a small APK, so the files and the manifest are checked through the two steps the patch takes
 * once its checks pass; the CLI run on the real APKs covers the decode and rebuild around them.
 */
class HushTelegramIconFixtureTest {
    @Rule
    @JvmField
    val temporary = TemporaryFolder()

    @Test
    fun `the icon patch and its name are optional`() {
        assertFalse(hushTelegramIconPatch.default)
        assertEquals(setOf("appName", "iconStyle"), hushTelegramIconPatch.options.keys)
        assertFalse(hushTelegramIconPatch.options["appName"].required)
        assertNull(hushTelegramIconPatch.options["appName"].default)
        val style = hushTelegramIconPatch.options["iconStyle"]
        assertEquals("the badge unless another style is picked", IconStyle.HUSHTELEGRAM.key, style.default)
        assertEquals(IconStyle.entries.map { it.key }, style.values!!.values.toList())
    }

    @Test
    fun `a plain style tints the themed picture over one color`() {
        for (style in IconStyle.entries) {
            val res = temporary.newFolder()
            addIconFiles(res, bundledIconPictures(), style)
            val icon = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(res.resolve("mipmap-anydpi-v26/$ICON.xml")).documentElement
            val layers = (0 until icon.childNodes.length).map { icon.childNodes.item(it) }.filterIsInstance<Element>()
            assertEquals(listOf("background", "foreground", "monochrome"), layers.map { it.tagName })
            assertEquals(style.name, style.background, (layers[0].getElementsByTagName("color").item(0) as Element).getAttribute("android:color"))
            assertEquals("${style.name}: Android 13's themed icon stays", "@mipmap/${ICON}_monochrome", layers[2].getAttribute("android:drawable"))
            val bitmap = layers[1].getElementsByTagName("bitmap").item(0) as Element?
            if (style.glyph == null) {
                assertEquals("@mipmap/${ICON}_foreground", layers[1].getAttribute("android:drawable"))
                assertNull(bitmap)
            } else {
                // A layer with an inline drawable can't also name one, or Android uses the attribute.
                assertFalse(style.name, layers[1].hasAttribute("android:drawable"))
                assertEquals("@mipmap/${ICON}_monochrome", bitmap!!.getAttribute("android:src"))
                assertEquals(style.glyph, bitmap.getAttribute("android:tint"))
                assertNotEquals("${style.name}: the glyph shows", style.background, style.glyph)
            }
        }
        assertEquals("#FFFFFFFF", IconStyle.WHITE_ON_BLACK.glyph)
        assertEquals("#FF000000", IconStyle.WHITE_ON_BLACK.background)
        assertEquals("#FF000000", IconStyle.BLACK_ON_WHITE.glyph)
        assertEquals("#FFFFFFFF", IconStyle.BLACK_ON_WHITE.background)
    }

    @Test
    fun `a style is read by key or label, and an unknown one refuses before anything is read`() {
        for (style in IconStyle.entries) {
            assertEquals(style, checkedIconStyle(style.key))
            assertEquals(style, checkedIconStyle(" ${style.label.uppercase()} "))
        }
        assertEquals(IconStyle.HUSHTELEGRAM, checkedIconStyle(null))
        assertEquals(IconStyle.HUSHTELEGRAM, checkedIconStyle("  "))
        refusal(manifest(), style = "purple") { message -> assertTrue(message, message.contains("iconStyle") && message.contains("white-on-black")) }
    }

    @Test
    fun `every declared build gets the icon and name with Android's DOM factory`() = withAndroidResourceXmlFactory {
        for (build in Fixtures.declaredBuilds()) {
            val original = document(fixtureManifest(build))
            val (stockApplication, stockDefault) = resolveLaunchers(original)
            assertFalse("${build.name}: Telegram's default entry shows the application's icon", stockDefault.hasAttribute("android:icon"))
            val stockLabel = stockApplication.getAttribute("android:label")
            val result = readResourceXml(temporary.newFile().apply { writeText(fixtureManifest(build)) }, "icon")
            showIcon(result, checkedAppName("  Hush  "))

            val (application, defaultIcon) = resolveLaunchers(result)
            assertEquals(ICON_REFERENCE, application.getAttribute("android:icon"))
            assertEquals(ICON_REFERENCE, application.getAttribute("android:roundIcon"))
            assertEquals("${build.name}: trimmed", "Hush", application.getAttribute("android:label"))
            assertFalse(defaultIcon.hasAttribute("android:icon"))
            // With the three changed values set back, the two manifests are the same.
            for (element in listOf(application, stockApplication)) {
                element.setAttribute("android:icon", "")
                element.setAttribute("android:roundIcon", "")
            }
            application.setAttribute("android:label", stockLabel)
            assertEquals("${build.name}: every other attribute and element survives", state(original.documentElement), state(result.documentElement))
        }
    }

    @Test
    fun `a DTD refuses before the manifest or icon files change`() = withAndroidResourceXmlFactory {
        for (declaration in resourceXmlDeclarations("manifest")) {
            refusal(declaration + manifest()) { assertTrue(it.contains("resource XML")) }
        }
    }

    @Test
    fun `no name keeps Telegram's`() {
        for (name in listOf(null, "", "   ")) {
            val manifest = document(manifest())
            showIcon(manifest, checkedAppName(name))
            val (application, _) = resolveLaunchers(manifest)
            assertEquals("Telegram", application.getAttribute("android:label"))
            assertEquals(ICON_REFERENCE, application.getAttribute("android:icon"))
        }
    }

    @Test
    fun `a default entry with its own icon and name gets the new ones`() {
        val manifest = document(manifest(alias = "android:icon=\"@mipmap/ic_launcher\" android:roundIcon=\"@mipmap/ic_launcher_round\" " +
            "android:label=\"@string/AppName\""))
        showIcon(manifest, checkedAppName("Hush & Co"))
        val (application, defaultIcon) = resolveLaunchers(manifest)
        for (element in listOf(application, defaultIcon)) {
            assertEquals(ICON_REFERENCE, element.getAttribute("android:icon"))
            assertEquals(ICON_REFERENCE, element.getAttribute("android:roundIcon"))
            assertEquals("Hush & Co", element.getAttribute("android:label"))
        }
        val alternate = manifest.getElementsByTagName("activity-alias").item(1) as Element
        assertEquals("an alternate icon keeps its own", "@mipmap/icon_2_launcher", alternate.getAttribute("android:icon"))
    }

    @Test
    fun `the pictures and the adaptive icon go in as mipmaps`() {
        val res = temporary.newFolder("res")
        res.resolve("mipmap-xxhdpi/ic_launcher.png").apply { parentFile.mkdirs() }.writeText("stock")
        addIconFiles(res, bundledIconPictures())
        assertEquals("Telegram's own icon stays", "stock", res.resolve("mipmap-xxhdpi/ic_launcher.png").readText())
        for (density in ICON_DENSITIES) for (picture in ICON_PICTURES) {
            val file = res.resolve("mipmap-$density/$picture.png")
            assertArrayEquals("$file", bundledIconPictures().getValue("mipmap-$density/$picture.png"), file.readBytes())
        }
        val icon = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(res.resolve("mipmap-anydpi-v26/$ICON.xml")).documentElement
        assertEquals("adaptive-icon", icon.tagName)
        assertEquals(ANDROID_NAMESPACE, icon.getAttribute("xmlns:android"))
        val layers = (0 until icon.childNodes.length).map { icon.childNodes.item(it) }.filterIsInstance<Element>()
        assertEquals(listOf("background", "foreground", "monochrome"), layers.map { it.tagName })
        val color = layers[0].getElementsByTagName("color").item(0) as Element
        assertEquals(ICON_BACKGROUND, color.getAttribute("android:color"))
        assertEquals("@mipmap/${ICON}_foreground", layers[1].getAttribute("android:drawable"))
        assertEquals("@mipmap/${ICON}_monochrome", layers[2].getAttribute("android:drawable"))
    }

    @Test
    fun `undecoded resources or an icon already there refuse before anything is written`() {
        val missing = File(temporary.root, "not-decoded")
        refusesFiles(missing, "weren't decoded")
        assertFalse(missing.exists())
        for (existing in listOf("mipmap-xxhdpi/${ICON}_foreground.png", "mipmap-anydpi-v26/$ICON.xml")) {
            val res = temporary.newFolder()
            res.resolve(existing).apply { parentFile.mkdirs() }.writeText("stock")
            refusesFiles(res, "already has")
            assertEquals(listOf(existing), res.walkTopDown().filter { it.isFile }.map { it.relativeTo(res).invariantSeparatorsPath }.toList())
        }
    }

    /**
     * Patcher 2.0 leaves a file undecoded until a patch asks for it, so here a file Telegram ships
     * reaches res only when it's asked for. Every path the icon writes is asked for before the
     * check, so one already there is found.
     */
    @Test
    fun `every icon path is asked for before the check that nothing is there`() {
        val pictures = bundledIconPictures()
        val asked = mutableListOf<String>()
        addIconFiles(temporary.newFolder(), pictures) { asked += it }
        assertEquals(pictures.keys + "mipmap-anydpi-v26/$ICON.xml", asked.toSet())
        assertEquals("each once", asked.size, asked.toSet().size)

        for (existing in listOf("mipmap-xxhdpi/${ICON}_foreground.png", "mipmap-anydpi-v26/$ICON.xml")) {
            val apk = temporary.newFolder().apply { resolve(existing).apply { parentFile.mkdirs() }.writeText("stock") }
            val res = temporary.newFolder()
            try {
                addIconFiles(res, pictures) { path -> apk.resolve(path).takeIf { it.isFile }?.copyTo(res.resolve(path)) }
                fail("accepted")
            } catch (expected: PatchException) {
                assertTrue(expected.message.orEmpty(), expected.message.orEmpty().contains("already has $existing"))
            }
            assertEquals(listOf(existing), res.walkTopDown().filter { it.isFile }.map { it.relativeTo(res).invariantSeparatorsPath }.toList())
        }
    }

    @Test
    fun `a name that can't be used refuses before anything is read`() {
        for (name in listOf("x".repeat(MAX_APP_NAME + 1), "@string/app_name", "?attr/name", "Hush \"TG\"", "Hush's", "a\\b", "line\nbreak")) {
            refusal(manifest(), name) { message -> assertTrue("$name: $message", message.contains("appName")) }
        }
        assertEquals("x".repeat(MAX_APP_NAME), checkedAppName("x".repeat(MAX_APP_NAME)))
    }

    /**
     * Right-to-left override, the isolates, zero-width space, right-to-left mark, word joiner,
     * byte order mark, line separator, and two past U+FFFF: a language tag and a shorthand format
     * control. Written as escapes, so the test file holds no hidden text of its own.
     */
    @Test
    fun `a name with invisible characters refuses`() {
        val hidden = listOf("\u202E", "\u2067", "\u200B", "\u200F", "\u2060", "\uFEFF", "\u2028",
            "\uDB40\uDC01", "\uD82F\uDCA0")
        for (mark in hidden) {
            refusal(manifest(), "Hush${mark}gram") { message ->
                assertTrue("U+%04X: $message".format(mark.codePointAt(0)), message.contains("invisible characters"))
            }
        }
        // The family emoji is three faces held together with zero-width joiners.
        val family = "Hush \uD83D\uDC68\u200D\uD83D\uDC69\u200D\uD83D\uDC67"
        assertEquals(family, checkedAppName(family))
        // Persian writes some words with a zero-width non-joiner: "Mikhaham", I want.
        val persian = "\u0645\u06CC\u200C\u062E\u0648\u0627\u0647\u0645"
        assertEquals(persian, checkedAppName(persian))
    }

    @Test
    fun `a manifest of another shape refuses before anything is written`() {
        refusal(manifest().replace(ANDROID_NAMESPACE, "https://example.invalid/android"))
        refusal(manifest().replace("</manifest>", "<application /></manifest>"))
        refusal(manifest().replace(DEFAULT_ICON, "org.telegram.messenger.OtherIcon"))
        refusal(manifest().replace("</application>", "<activity-alias android:name=\"$DEFAULT_ICON\" /></application>"))
        refusal(manifest().replace("android:icon=\"@mipmap/ic_launcher\" ", ""))
    }

    @Test
    fun `each bundled picture is the size its density needs`() {
        val factors = mapOf("mdpi" to 1.0, "hdpi" to 1.5, "xhdpi" to 2.0, "xxhdpi" to 3.0, "xxxhdpi" to 4.0)
        val pictures = bundledIconPictures()
        assertEquals(ICON_DENSITIES.size * ICON_PICTURES.size, pictures.size)
        for ((path, bytes) in pictures) {
            val density = path.substringAfter("mipmap-").substringBefore('/')
            val side = Math.round((if (path.endsWith("/$ICON.png")) 48 else 108) * factors.getValue(density)).toInt()
            assertEquals(path, side to side, pngSize(bytes))
        }
    }

    private fun refusesFiles(res: File, reason: String) {
        try {
            addIconFiles(res, bundledIconPictures())
            fail("accepted")
        } catch (expected: PatchException) {
            assertTrue(expected.message.orEmpty(), expected.message.orEmpty().contains(reason))
            assertTrue(expected.message.orEmpty().contains("Nothing was changed"))
        }
    }

    /** Runs the patch itself, which has to refuse while it's still checking, before it reads the resources. */
    private fun refusal(xml: String, name: String? = "Hush", style: String? = null, check: (String) -> Unit = {}) = withManifest(xml) { context, manifest ->
        val before = resourceTree(manifest.parentFile)
        hushTelegramIconPatch.options["appName"] = name
        if (style != null) hushTelegramIconPatch.options["iconStyle"] = style
        try {
            hushTelegramIconPatch.execute(context)
            fail("accepted")
        } catch (expected: PatchException) {
            assertTrue(expected.message.orEmpty(), expected.message.orEmpty().contains("Nothing was changed"))
            check(expected.message.orEmpty())
        } finally {
            hushTelegramIconPatch.options.values.forEach { it.reset() }
        }
        assertResourceTreeUnchanged(before, manifest.parentFile)
    }

    private fun withManifest(xml: String, action: (ResourcePatchContext, File) -> Unit) {
        val work = temporary.newFolder()
        val apk = File(work, "input.apk")
        ApkModule().use { module ->
            module.setManifest(AndroidManifestBlock.empty().apply {
                setPackageName("org.telegram.messenger.web")
                setVersionName("13.0.1")
                setVersionCode(71679)
            })
            module.writeApk(apk)
        }
        val config = PatcherConfig(apkFile = apk, temporaryFilesPath = File(work, "patcher"))
        ResourcePatchContext::class.java.getConstructor(PatcherConfig::class.java).newInstance(config).use { context ->
            val manifest = context["AndroidManifest.xml"]
            manifest.parentFile.mkdirs()
            manifest.writeText(xml)
            manifest.parentFile.resolve("res").apply { mkdirs() }.resolve("unrelated.txt").writeText("unchanged")
            action(context, manifest)
        }
    }

    private fun fixtureManifest(build: File): String = ApkModule.loadApkFile(build).use { module ->
        module.tableBlock // Attach the resource package the manifest decoder names references with.
        val xml = StringWriter()
        val serializer = XmlPullParserFactory.newInstance().newSerializer().apply { setOutput(xml) }
        module.androidManifest.serialize(serializer)
        xml.toString()
    }

    private fun document(xml: String): Document =
        DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(xml.byteInputStream())

    private fun manifest(alias: String = "") = "<manifest xmlns:android=\"$ANDROID_NAMESPACE\" package=\"org.telegram.messenger.web\">" +
        "<application android:label=\"Telegram\" android:icon=\"@mipmap/ic_launcher\" android:roundIcon=\"@mipmap/ic_launcher_round\">" +
        "<activity android:name=\"org.telegram.ui.LaunchActivity\" />" +
        "<activity-alias android:name=\"$DEFAULT_ICON\" android:targetActivity=\"org.telegram.ui.LaunchActivity\" $alias />" +
        "<activity-alias android:name=\"org.telegram.messenger.VintageIcon\" android:icon=\"@mipmap/icon_2_launcher\" " +
        "android:targetActivity=\"org.telegram.ui.LaunchActivity\" />" +
        "</application></manifest>"

    private fun state(node: Node): List<Any?> {
        val attributes = (0 until (node.attributes?.length ?: 0)).map { node.attributes.item(it) }
            .map { it.nodeName to it.nodeValue }.sortedBy { it.first }
        val children = (0 until node.childNodes.length).map { node.childNodes.item(it) }.filter { it.nodeType == Node.ELEMENT_NODE }
        return listOf(node.nodeName, attributes, children.map { state(it) })
    }

    /** The width and height a PNG's header gives. */
    private fun pngSize(bytes: ByteArray): Pair<Int, Int> {
        fun int(at: Int) = ((bytes[at].toInt() and 0xff) shl 24) or ((bytes[at + 1].toInt() and 0xff) shl 16) or
            ((bytes[at + 2].toInt() and 0xff) shl 8) or (bytes[at + 3].toInt() and 0xff)
        assertEquals("IHDR", String(bytes, 12, 4, Charsets.ISO_8859_1))
        return int(16) to int(20)
    }
}
