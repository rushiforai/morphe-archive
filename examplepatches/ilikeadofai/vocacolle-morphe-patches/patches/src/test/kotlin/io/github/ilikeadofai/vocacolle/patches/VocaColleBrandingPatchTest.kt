package io.github.ilikeadofai.vocacolle.patches

import java.awt.Color
import java.awt.image.BufferedImage
import java.io.DataOutputStream
import java.io.FileOutputStream
import java.io.RandomAccessFile
import java.nio.file.Files
import java.util.zip.CRC32
import javax.imageio.ImageIO
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertTrue
import javax.xml.parsers.DocumentBuilderFactory

class VocaColleBrandingPatchTest {
    @Test
    fun `branding defaults preserve the original Japanese name and icon`() {
        val patch = vocacolleBrandingPatch

        assertEquals("Customize VocaColle branding", patch.name)
        assertFalse(patch.default)
        assertEquals("ボカコレ", assertNotNull(patch.options["vocacolleAppName"]).default)
        assertEquals("", assertNotNull(patch.options["vocacolleAppIconPath"]).default)

        val compatibility = assertNotNull(patch.compatibility).single()
        assertEquals("jp.nicovideo.nicobox", compatibility.packageName)
        assertEquals(listOf("7.40.0"), compatibility.targets.map { it.version })
    }

    @Test
    fun `app name is a no-op for the original and trims custom names`() {
        assertNull(customAppNameOrNull("ボカコレ"))
        assertEquals("VocaColle Morphe", customAppNameOrNull("  VocaColle Morphe  "))
        assertFailsWith<IllegalArgumentException> { customAppNameOrNull("   ") }
    }

    @Test
    fun `app name editor changes only the app_name resource`() {
        val valuesFile = Files.createTempFile("vocacolle-values", ".xml").toFile()
        valuesFile.writeText(
            """
                <resources>
                    <string name="app_name">ボカコレ</string>
                    <string name="other">keep me</string>
                </resources>
            """.trimIndent()
        )

        BrandingResourceEditor.updateAppName(valuesFile, "VocaColle Morphe")

        val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(valuesFile)
        val strings = document.getElementsByTagName("string")
        assertEquals("VocaColle Morphe", strings.item(0).textContent)
        assertEquals("keep me", strings.item(1).textContent)
        assertTrue(valuesFile.delete())
    }

    @Test
    fun `app name editor escapes Android string syntax`() {
        val valuesFile = Files.createTempFile("vocacolle-values", ".xml").toFile()
        valuesFile.writeText("<resources><string name=\"app_name\">ボカコレ</string></resources>")

        BrandingResourceEditor.updateAppName(valuesFile, "Matt's \"VocaColle\"")

        val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(valuesFile)
        assertEquals(
            "Matt\\'s \\\"VocaColle\\\"",
            document.getElementsByTagName("string").item(0).textContent
        )
        assertTrue(valuesFile.delete())
    }

    @Test
    fun `icon path is a no-op when empty and rejects non-square images`() {
        assertNull(customIconFileOrNull(""))

        val nonSquare = Files.createTempFile("vocacolle-icon", ".png").toFile()
        ImageIO.write(BufferedImage(256, 128, BufferedImage.TYPE_INT_ARGB), "png", nonSquare)
        assertFailsWith<IllegalArgumentException> {
            customIconFileOrNull(nonSquare.absolutePath)
        }
        assertTrue(nonSquare.delete())
    }

    @Test
    fun `icon validation rejects oversized files and dimensions before decoding pixels`() {
        val oversizedFile = Files.createTempFile("vocacolle-icon-large", ".png").toFile()
        RandomAccessFile(oversizedFile, "rw").use { file ->
            file.setLength(MAX_ICON_FILE_BYTES + 1)
        }
        assertFailsWith<IllegalArgumentException> {
            customIconFileOrNull(oversizedFile.absolutePath)
        }

        val oversizedDimensions = Files.createTempFile("vocacolle-icon-dimensions", ".png").toFile()
        writePngHeader(oversizedDimensions, MAX_ICON_DIMENSION + 1, MAX_ICON_DIMENSION + 1)
        assertFailsWith<IllegalArgumentException> {
            customIconFileOrNull(oversizedDimensions.absolutePath)
        }

        assertTrue(oversizedFile.delete())
        assertTrue(oversizedDimensions.delete())
    }

    @Test
    fun `icon renderer writes legacy and adaptive launcher assets`() {
        val sourceFile = Files.createTempFile("vocacolle-icon", ".png").toFile()
        val source = BufferedImage(256, 256, BufferedImage.TYPE_INT_ARGB)
        val graphics = source.createGraphics()
        graphics.color = Color(0x33, 0x66, 0x99)
        graphics.fillRect(0, 0, source.width, source.height)
        graphics.dispose()
        ImageIO.write(source, "png", sourceFile)

        val outputRoot = Files.createTempDirectory("vocacolle-icon-output").toFile()
        LauncherIconRenderer.render(checkNotNull(customIconFileOrNull(sourceFile.absolutePath))) { path ->
            outputRoot.resolve(path).apply { parentFile.mkdirs() }
        }

        val legacy = ImageIO.read(outputRoot.resolve("res/mipmap-mdpi-v4/ic_launcher.png"))
        assertEquals(48, legacy.width)
        assertEquals(48, legacy.height)

        val foreground = ImageIO.read(
            outputRoot.resolve("res/mipmap-mdpi-v4/ic_launcher_foreground.png")
        )
        assertEquals(108, foreground.width)
        assertEquals(108, foreground.height)
        assertEquals(0, Color(foreground.getRGB(0, 0), true).alpha)
        assertEquals(Color(0x33, 0x66, 0x99).rgb, foreground.getRGB(54, 54))

        val background = ImageIO.read(
            outputRoot.resolve("res/mipmap-mdpi-v4/ic_launcher_background.png")
        )
        assertEquals(108, background.width)
        assertEquals(108, background.height)
        assertEquals(Color(0x33, 0x66, 0x99).rgb, background.getRGB(0, 0))

        assertTrue(sourceFile.delete())
        assertTrue(outputRoot.deleteRecursively())
    }

    @Test
    fun `branding metadata reflection does not resolve desktop image types`() {
        val classes = listOf(
            Class.forName("io.github.ilikeadofai.vocacolle.patches.VocaColleBrandingPatchKt"),
            LauncherIconRenderer::class.java
        )

        val desktopTypes = classes
            .flatMap { type -> type.declaredMethods.asList() }
            .flatMap { method -> method.parameterTypes.asList() + method.returnType }
            .map { type -> type.name }
            .filter { name -> name.startsWith("java.awt.") || name.startsWith("javax.imageio.") }

        assertEquals(emptyList(), desktopTypes)
    }

    private fun writePngHeader(file: java.io.File, width: Int, height: Int) {
        DataOutputStream(FileOutputStream(file)).use { output ->
            output.write(byteArrayOf(0x89.toByte(), 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a))
            val data = java.io.ByteArrayOutputStream().also { bytes ->
                DataOutputStream(bytes).use { chunk ->
                    chunk.writeInt(width)
                    chunk.writeInt(height)
                    chunk.writeByte(8)
                    chunk.writeByte(6)
                    chunk.writeByte(0)
                    chunk.writeByte(0)
                    chunk.writeByte(0)
                }
            }.toByteArray()
            val type = "IHDR".toByteArray(Charsets.US_ASCII)
            val crc = CRC32().apply {
                update(type)
                update(data)
            }
            output.writeInt(data.size)
            output.write(type)
            output.write(data)
            output.writeInt(crc.value.toInt())
        }
    }
}
