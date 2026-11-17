/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.resource.ResourceMode
import com.reandroid.apk.ApkModule
import com.reandroid.arsc.chunk.TableBlock
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.awt.image.BufferedImage
import java.io.ByteArrayInputStream
import java.io.ByteArrayOutputStream
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder
import javax.imageio.ImageIO
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.math.sqrt

class CustomSplashLogoPatchTest {
    @Rule
    @JvmField
    val temporary = TemporaryFolder()

    private fun picture(format: String, width: Int, height: Int, type: Int = BufferedImage.TYPE_INT_RGB): ByteArray =
        ByteArrayOutputStream().also { out ->
            check(ImageIO.write(BufferedImage(width, height, type), format, out)) { "no $format writer" }
        }.toByteArray()

    /** A RIFF WebP holding one chunk of [kind] with [body], laid out as the WebP container spec has it. */
    private fun webp(kind: String, body: ByteArray): ByteArray {
        val chunk = ByteBuffer.allocate(8 + body.size + body.size % 2).order(ByteOrder.LITTLE_ENDIAN)
            .put(kind.toByteArray(Charsets.US_ASCII)).putInt(body.size).put(body).array()
        return ByteBuffer.allocate(12 + chunk.size).order(ByteOrder.LITTLE_ENDIAN)
            .put("RIFF".toByteArray(Charsets.US_ASCII)).putInt(4 + chunk.size)
            .put("WEBP".toByteArray(Charsets.US_ASCII)).put(chunk).array()
    }

    private fun bytes(vararg values: Int) = ByteArray(values.size) { values[it].toByte() }

    @Test
    fun `PNG and JPEG sizes come from the header Java's own writers produce`() {
        assertEquals(LogoPicture("png", 300, 200), readLogoPicture(picture("png", 300, 200, BufferedImage.TYPE_INT_ARGB)))
        assertEquals(LogoPicture("png", 1, 4096), readLogoPicture(picture("png", 1, 4096)))
        // Java's JPEG starts with a JFIF segment and its quantization tables before the frame.
        assertEquals(LogoPicture("jpg", 640, 480), readLogoPicture(picture("jpg", 640, 480)))
        assertEquals(LogoPicture("jpg", 17, 1023), readLogoPicture(picture("jpg", 17, 1023)))
    }

    @Test
    fun `a progressive JPEG and one with fill bytes and a Huffman table ahead of the frame are read`() {
        val baseline = picture("jpg", 320, 240)
        val sof = (2 until baseline.size - 1).first { baseline[it] == 0xFF.toByte() && baseline[it + 1] == 0xC0.toByte() }
        val progressive = baseline.copyOf().also { it[sof + 1] = 0xC2.toByte() }
        assertEquals(LogoPicture("jpg", 320, 240), readLogoPicture(progressive))

        val crafted = bytes(
            0xFF, 0xD8,
            // A Huffman table (C4) shares the frame markers' range and carries no size.
            0xFF, 0xC4, 0x00, 0x05, 0x01, 0x02, 0x03,
            // Fill bytes before the next marker.
            0xFF, 0xFF, 0xFF,
            0xC0, 0x00, 0x11, 0x08, 0x00, 0x64, 0x00, 0xC8, 0x03,
            0x01, 0x22, 0x00, 0x02, 0x11, 0x01, 0x03, 0x11, 0x01,
            0xFF, 0xD9,
        )
        assertEquals(LogoPicture("jpg", 200, 100), readLogoPicture(crafted))
    }

    @Test
    fun `each kind of WebP gives its size`() {
        // Lossy: a three-byte frame tag, the start code, then width and height in 14 bits each.
        val lossy = webp("VP8 ", bytes(0x30, 0x01, 0x00, 0x9D, 0x01, 0x2A, 0x00, 0x02, 0xC8, 0x00, 0, 0))
        assertEquals(LogoPicture("webp", 512, 200), readLogoPicture(lossy))
        // The top two bits of each are the scale, which isn't part of the size.
        val scaled = webp("VP8 ", bytes(0x30, 0x01, 0x00, 0x9D, 0x01, 0x2A, 0x00, 0x42, 0xC8, 0x80, 0, 0))
        assertEquals(LogoPicture("webp", 512, 200), readLogoPicture(scaled))

        // Lossless: the signature, then width less one and height less one in 14 bits each.
        val bits = (640 - 1) or ((480 - 1) shl 14)
        val lossless = webp("VP8L", byteArrayOf(0x2F) + ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putInt(bits).array())
        assertEquals(LogoPicture("webp", 640, 480), readLogoPicture(lossless))

        // Extended: flags, three reserved bytes, then the canvas less one in 24 bits each.
        val extended = webp("VP8X", bytes(0x10, 0, 0, 0, 0xFF, 0x0F, 0x00, 0x2B, 0x01, 0x00))
        assertEquals(LogoPicture("webp", 4096, 300), readLogoPicture(extended))
    }

    @Test
    fun `anything else is no picture`() {
        assertNull(readLogoPicture(ByteArray(0)))
        assertNull(readLogoPicture("not a picture at all, just some text".toByteArray()))
        assertNull("a cut-off PNG", readLogoPicture(picture("png", 10, 10).copyOf(20)))
        assertNull("a cut-off JPEG", readLogoPicture(picture("jpg", 10, 10).copyOf(30)))
        assertNull("a JPEG with no frame before its data", readLogoPicture(bytes(0xFF, 0xD8, 0xFF, 0xDA, 0x00, 0x02, 0xFF, 0xD9)))
        assertNull("a GIF", readLogoPicture(picture("gif", 10, 10)))
        assertNull("a WebP with no image", readLogoPicture(webp("ALPH", bytes(1, 2, 3, 4))))
        val empty = picture("png", 10, 10).copyOf().also { for (i in 16 until 24) it[i] = 0 }
        assertNull("a PNG of no pixels", readLogoPicture(empty))
    }

    @Test
    fun `a picture fits inside the circle Android shows, corners on it`() {
        // A square's diagonal spans the circle, two thirds of the icon across: 1/2 - sqrt(2)/6 in from each side.
        val (side, top) = logoInsets(512, 512, round = false)
        assertEquals(0.5 - sqrt(2.0) / 6, side, 1e-9)
        assertEquals(side, top, 1e-12)
        assertEquals(0.264298, side, 1e-6)

        // A round mark fills its square, so its side spans the circle: one sixth in from each side.
        val (roundSide, roundTop) = logoInsets(512, 512, round = true)
        assertEquals(1.0 / 6, roundSide, 1e-12)
        assertEquals(1.0 / 6, roundTop, 1e-12)

        for ((width, height) in listOf(200 to 100, 100 to 300, 2048 to 1, 7 to 5)) {
            val (x, y) = logoInsets(width, height, round = false)
            val a = 1 - 2 * x
            val b = 1 - 2 * y
            assertEquals("$width by $height: corners on the circle", 4.0 / 9, a * a + b * b, 1e-9)
            assertEquals("$width by $height: keeps its shape", width.toDouble() / height, a / b, 1e-9)
        }
    }

    @Test
    fun `the mark is an inset drawable in fractions of the icon`() {
        val xml = splashMarkXml(SPLASH_LOGO, logoInsets(200, 100, round = false))
        val inset = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }.newDocumentBuilder()
            .parse(ByteArrayInputStream(xml.toByteArray())).documentElement
        val android = "http://schemas.android.com/apk/res/android"
        assertEquals("inset", inset.tagName)
        assertEquals("@drawable/$SPLASH_LOGO", inset.getAttributeNS(android, "drawable"))
        assertEquals("20.1858%", inset.getAttributeNS(android, "insetLeft"))
        assertEquals("20.1858%", inset.getAttributeNS(android, "insetRight"))
        assertEquals("35.0929%", inset.getAttributeNS(android, "insetTop"))
        assertEquals("35.0929%", inset.getAttributeNS(android, "insetBottom"))
    }

    private fun styles(body: String): Document = DocumentBuilderFactory.newInstance().newDocumentBuilder()
        .parse(ByteArrayInputStream("<resources>$body</resources>".toByteArray()))

    private val launchTheme = """
        <style name="$PINTEREST_LAUNCH_THEME" parent="@style/Theme.SplashScreen">
            <item name="windowSplashScreenAnimatedIcon">@mipmap/unthemed_app_splash_screen_icon</item>
            <item name="postSplashScreenTheme">@style/Theme.Pinterest</item>
        </style>
    """

    private fun style(document: Document, name: String): Element? {
        val list = document.getElementsByTagName("style")
        return (0 until list.length).map { list.item(it) as Element }.singleOrNull { it.getAttribute("name") == name }
    }

    @Test
    fun `the logo theme is Pinterest's launch theme with the mark as both icons`() {
        val document = styles(launchTheme)
        addSplashTheme(document)

        val theme = style(document, SPLASH_LOGO_THEME)!!
        assertEquals("@style/$PINTEREST_LAUNCH_THEME", theme.getAttribute("parent"))
        val items = theme.getElementsByTagName("item")
        assertEquals(2, items.length)
        assertEquals(
            mapOf(SPLASH_ICON to "@drawable/$SPLASH_MARK", "android:$SPLASH_ICON" to "@drawable/$SPLASH_MARK"),
            (0 until items.length).associate { (items.item(it) as Element).getAttribute("name") to items.item(it).textContent },
        )
        val launch = style(document, PINTEREST_LAUNCH_THEME)!!
        assertEquals("Pinterest's theme is left as it was", 2, launch.getElementsByTagName("item").length)
    }

    @Test
    fun `a build drawing its launch screen another way is refused`() {
        assertThrows(PatchException::class.java) { addSplashTheme(styles("""<style name="Theme.Pinterest" />""")) }
        assertThrows(PatchException::class.java) {
            addSplashTheme(styles("""<style name="$PINTEREST_LAUNCH_THEME"><item name="windowBackground">@null</item></style>"""))
        }
        assertThrows(PatchException::class.java) {
            addSplashTheme(styles(launchTheme + """<style name="$SPLASH_LOGO_THEME" />"""))
        }
        // An icon named with its package prefix is the same attribute.
        val prefixed = styles(launchTheme.replace("\"windowSplashScreenAnimatedIcon\"", "\"app:windowSplashScreenAnimatedIcon\""))
        addSplashTheme(prefixed)
        assertTrue(style(prefixed, SPLASH_LOGO_THEME) != null)
    }

    /** A decoded resource folder like Pinterest's, holding only the launch theme. */
    private fun withResources(body: (ResourcePatchContext, File) -> Unit) {
        val work = temporary.newFolder()
        val apk = File(work, "input.apk")
        ApkModule().use { module ->
            module.setTableBlock(TableBlock().apply {
                getOrCreatePackage(0x7f, "com.pinterest").getOrCreate("", "string", "app_name").setDataAsString("Pinterest")
                refreshFull()
            })
            module.setManifest(AndroidManifestBlock.empty().apply {
                setPackageName("com.pinterest")
                setVersionName("14.44.0")
                setVersionCode(14448030)
            })
            module.writeApk(apk)
        }
        val config = PatcherConfig(apkFile = apk, temporaryFilesPath = File(work, "patcher"))
        ResourcePatchContext::class.java.getConstructor(PatcherConfig::class.java).newInstance(config).use { context ->
            ResourcePatchContext::class.java.getMethod("decodeResources\$morphe_patcher", ResourceMode::class.java)
                .invoke(context, ResourceMode.FULL)
            val res = context.get("res", false)
            File(res, "values").mkdirs()
            File(res, "values/styles.xml").writeText("<resources>$launchTheme</resources>")
            body(context, res)
        }
    }

    private fun insets(mark: File): List<String> {
        val inset = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(mark).documentElement
        return listOf("Left", "Right", "Top", "Bottom").map { inset.getAttribute("android:inset$it") }
    }

    @Test
    fun `with nothing picked HushPinterest's round mark fills the circle`() = withResources { context, res ->
        context.addSplashLogo(null)

        val logo = File(res, "drawable-nodpi/$SPLASH_LOGO.png")
        assertArrayEquals(
            "the bundled mark, copied as it is",
            javaClass.classLoader.getResourceAsStream(BUNDLED_LOGO)!!.readBytes(),
            logo.readBytes(),
        )
        assertEquals(List(4) { "16.6667%" }, insets(File(res, "drawable/$SPLASH_MARK.xml")))
        val styles = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(File(res, "values/styles.xml"))
        assertTrue(style(styles, SPLASH_LOGO_THEME) != null)
    }

    @Test
    fun `a picked picture is copied with its own kind and fitted by its corners`() = withResources { context, res ->
        val picked = temporary.newFile("my logo.jpeg")
        picked.writeBytes(picture("jpg", 400, 200))
        context.addSplashLogo("  ${picked.absolutePath} ")

        assertArrayEquals(picked.readBytes(), File(res, "drawable-nodpi/$SPLASH_LOGO.jpg").readBytes())
        assertFalse(File(res, "drawable-nodpi/$SPLASH_LOGO.png").exists())
        val (x, y) = logoInsets(400, 200, round = false)
        assertEquals(
            listOf(x, x, y, y).map { String.format(java.util.Locale.US, "%.4f%%", it * 100) },
            insets(File(res, "drawable/$SPLASH_MARK.xml")),
        )
    }

    @Test
    fun `a picked file that isn't a usable picture is refused before anything changes`() = withResources { context, res ->
        val styles = File(res, "values/styles.xml")
        val before = styles.readText()
        val text = temporary.newFile("logo.png").apply { writeText("not a picture") }
        val huge = temporary.newFile("huge.png").apply {
            // Only the header is read, so a header saying 4096 by 16 stands for the whole file.
            writeBytes(picture("png", 1, 1).also { header ->
                ByteBuffer.wrap(header, 16, 8).putInt(4096).putInt(16)
            })
        }
        for (path in listOf(File(res, "missing.png").absolutePath, text.absolutePath, huge.absolutePath)) {
            val failure = assertThrows(PatchException::class.java) { context.addSplashLogo(path) }
            assertTrue(failure.message, failure.message!!.startsWith("Custom splash logo: "))
        }
        assertEquals(before, styles.readText())
        assertFalse(File(res, "drawable/$SPLASH_MARK.xml").exists())
        assertFalse(File(res, "drawable-nodpi").exists())
    }

    @Test
    fun `a build that already has either name is refused`() {
        for (taken in listOf("drawable/$SPLASH_MARK.png", "drawable-xxhdpi/$SPLASH_LOGO.webp")) withResources { context, res ->
            File(res, taken).apply { parentFile.mkdirs() }.writeBytes(picture("png", 2, 2))
            val failure = assertThrows(PatchException::class.java) { context.addSplashLogo(null) }
            assertTrue(failure.message, failure.message!!.contains(taken))
            assertTrue(style(DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(File(res, "values/styles.xml")), SPLASH_LOGO_THEME) == null)
        }
    }

    @Test
    fun `the patch offers a picture option and starts off`() {
        val option = customSplashLogoPatch.options[LOGO_OPTION]
        assertEquals("Logo", option.title)
        assertFalse(option.required)
        assertNull(option.default)
        assertTrue("in the default selection, with its switch off", customSplashLogoPatch.default)
    }
}
