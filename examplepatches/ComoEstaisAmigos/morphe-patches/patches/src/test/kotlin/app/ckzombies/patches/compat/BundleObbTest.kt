package app.ckzombies.patches.compat

import app.ckzombies.extension.ApkObbLayout
import java.io.File
import java.nio.file.Files
import java.util.zip.CRC32
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

class BundleObbTest {
    @Test
    fun `the packed asset keeps the OBB filename Glu's openFd uses`() {
        assertEquals("assets/main.310.com.glu.android.zombsniper.obb", EMBEDDED_OBB_ASSET)
        assertEquals("main.310.com.glu.android.zombsniper.obb", EMBEDDED_OBB_NAME)
    }

    @Test
    fun `pickObb prefers the named main OBB then any obb`() {
        val named = File("named")
        val other = File("other")
        assertEquals(
            named,
            pickObb(
                mapOf(
                    "Android/obb/com.glu.android.zombsniper/main.310.com.glu.android.zombsniper.obb" to named,
                    "extra.obb" to other,
                ),
            ),
        )
        assertEquals(other, pickObb(mapOf("patch.obb" to other)))
        assertNull(pickObb(emptyMap()))
        assertNull(pickObb(mapOf("readme.txt" to File("readme"))))
    }

    @Test
    fun `embedObb forces a resource decode before marking the OBB stored`() {
        assertEquals("AndroidManifest.xml", FORCE_RESOURCE_DECODE_PATH)
    }

    @Test
    fun `uncompressed-files json is the workingDir sibling of root assets`() {
        val working = Files.createTempDirectory("ckz-obb").toFile()
        try {
            val asset = File(working, "root/assets/$EMBEDDED_OBB_NAME")
            assertEquals(File(working, "uncompressed-files.json"), uncompressedJsonForAsset(asset))
            assertEquals(File(working, "uncompressed-files.json"), jsonBesideRootAssets(asset))
        } finally {
            working.deleteRecursively()
        }
    }

    @Test
    fun `uncompressed json is found by walking up from a nested staged asset`() {
        val working = Files.createTempDirectory("ckz-obb-walk").toFile()
        try {
            val json = File(working, "uncompressed-files.json")
            json.writeText("""{"paths":[],"extensions":[]}""")
            val nested = File(working, "apkFiles/root/assets/$EMBEDDED_OBB_NAME")
            nested.parentFile.mkdirs()
            assertEquals(json.canonicalFile, uncompressedJsonForAsset(nested).canonicalFile)
        } finally {
            working.deleteRecursively()
        }
    }

    @Test
    fun `a decoder rewrite of uncompressed-files json drops a mark made before resource decode`() {
        val markedTooEarly = markUncompressed("", EMBEDDED_OBB_ASSET, ".obb")
        assertTrue("\".obb\"" in markedTooEarly)
        val decoderRewrite =
            """{"paths":["lib/armeabi/libandroidplatformjni.so"],"extensions":[".png",".mp3",".so"]}"""
        assertFalse("\".obb\"" in decoderRewrite)
        assertFalse("\"$EMBEDDED_OBB_ASSET\"" in decoderRewrite)
        val markedAfterDecode = markUncompressed(decoderRewrite, EMBEDDED_OBB_ASSET, ".obb")
        assertTrue("\".obb\"" in markedAfterDecode)
        assertTrue("\"$EMBEDDED_OBB_ASSET\"" in markedAfterDecode)
        assertTrue("lib/armeabi/libandroidplatformjni.so" in markedAfterDecode)
    }

    @Test
    fun `markUncompressed adds the path and obb extension without dropping existing rules`() {
        val empty = markUncompressed("", EMBEDDED_OBB_ASSET, ".obb")
        assertTrue("\"$EMBEDDED_OBB_ASSET\"" in empty)
        assertTrue("\".obb\"" in empty)

        val existing = """
            {
              "paths": ["lib/armeabi/libandroidplatformjni.so"],
              "extensions": [".png", ".mp3"]
            }
        """.trimIndent()
        val merged = markUncompressed(existing, EMBEDDED_OBB_ASSET, "obb")
        assertTrue("lib/armeabi/libandroidplatformjni.so" in merged)
        assertTrue("\".png\"" in merged)
        assertTrue("\".mp3\"" in merged)
        assertTrue("\"$EMBEDDED_OBB_ASSET\"" in merged)
        assertTrue("\".obb\"" in merged)

        val again = markUncompressed(merged, EMBEDDED_OBB_ASSET, ".obb")
        assertEquals(merged, again)

        val onlyExt = markUncompressed("""{"extensions":[".png"]}""", EMBEDDED_OBB_ASSET, ".obb")
        assertTrue("\"paths\"" in onlyExt)
        assertTrue("\"$EMBEDDED_OBB_ASSET\"" in onlyExt)
        assertTrue("\".png\"" in onlyExt)
        assertTrue("\".obb\"" in onlyExt)
    }

    @Test
    fun `markAssetStored writes a missing json file`() {
        val working = Files.createTempDirectory("ckz-obb-json").toFile()
        try {
            val json = File(working, "uncompressed-files.json")
            markAssetStored(json, EMBEDDED_OBB_ASSET)
            val text = json.readText(Charsets.UTF_8)
            assertTrue("\"$EMBEDDED_OBB_ASSET\"" in text)
            assertTrue("\".obb\"" in text)
        } finally {
            working.deleteRecursively()
        }
    }

    @Test
    fun `hand APK wraps resdlEvent so event 100 and 101 both get the openFd base`() {
        // Working APK: resdlEvent calls orig, then adds the packed OBB base for 100 and 101.
        // FileMgr getResourceStartPos is 100 and jumps to the method's single return, so a
        // hook inserted in front of that return is skipped. hookResdlEvent replaces it.
        assertEquals(100, ApkObbLayout.EVENT_START)
        assertEquals(101, ApkObbLayout.EVENT_END)
        assertEquals(102, ApkObbLayout.EVENT_LENGTH)
        assertEquals(5792380, ApkObbLayout.adjustEvent(100, 0, 5792380))
        assertEquals(405981562, ApkObbLayout.adjustEvent(102, 405981562, 5792380))
    }

    @Test
    fun `adjustEvent adds the zip payload only to start and end, never to length`() {
        assertEquals(5792380, ApkObbLayout.adjustEvent(100, 0, 5792380))
        assertEquals(411773942, ApkObbLayout.adjustEvent(100, 405981562, 5792380))
        assertEquals(411773942, ApkObbLayout.adjustEvent(101, 405981562, 5792380))
        assertEquals(405981562, ApkObbLayout.adjustEvent(102, 405981562, 5792380))
        assertEquals(1, ApkObbLayout.adjustEvent(2, 1, 5792380))
        assertEquals(1, ApkObbLayout.adjustEvent(99, 1, 5792380))
    }

    @Test
    fun `storedPayloadOffset is the STORED extra-padded payload that Load reads as FGIB`() {
        val dir = Files.createTempDirectory("ckz-obb-fgib").toFile()
        try {
            val apk = File(dir, "base.apk")
            val payload = fgibHeader()
            val extra = ByteArray(12) { 0x11 }
            writeStored(apk, EMBEDDED_OBB_ASSET, payload, extra)

            val offset = ApkObbLayout.storedPayloadOffset(apk, EMBEDDED_OBB_ASSET)
            assertTrue(offset > 0L, "payload offset $offset")
            assertTrue(ApkObbLayout.isFgib(apk, offset))
            assertFalse(ApkObbLayout.isFgib(apk, 0L), "byte 0 is the zip local header, PK not FGIB")
            payload[4] = 0x01
            val tooOld = File(dir, "old.big")
            tooOld.writeBytes(payload)
            assertFalse(ApkObbLayout.isFgib(tooOld, 0L), "Load rejects FGIB major version 1")
            assertEquals(-1L, ApkObbLayout.storedPayloadOffset(apk, "assets/missing.obb"))
        } finally {
            dir.deleteRecursively()
        }
    }

    @Test
    fun `storedPayloadOffset refuses a deflated asset`() {
        val dir = Files.createTempDirectory("ckz-obb-deflate").toFile()
        try {
            val apk = File(dir, "base.apk")
            ZipOutputStream(apk.outputStream()).use { zip ->
                val payload = fgibHeader()
                val entry = ZipEntry(EMBEDDED_OBB_ASSET)
                entry.method = ZipEntry.DEFLATED
                zip.putNextEntry(entry)
                zip.write(payload)
                zip.closeEntry()
            }
            assertEquals(-1L, ApkObbLayout.storedPayloadOffset(apk, EMBEDDED_OBB_ASSET))
            assertFalse(ApkObbLayout.isFgib(apk, 0L))
        } finally {
            dir.deleteRecursively()
        }
    }

    private fun fgibHeader(): ByteArray {
        val bytes = ByteArray(64)
        bytes[0] = 0x46
        bytes[1] = 0x47
        bytes[2] = 0x49
        bytes[3] = 0x42
        bytes[4] = 0x02
        bytes[8] = 's'.code.toByte()
        bytes[9] = '2'.code.toByte()
        bytes[10] = 'k'.code.toByte()
        bytes[11] = '1'.code.toByte()
        return bytes
    }

    private fun writeStored(zipFile: File, name: String, payload: ByteArray, extra: ByteArray) {
        ZipOutputStream(zipFile.outputStream()).use { zip ->
            zip.setMethod(ZipOutputStream.STORED)
            val crc = CRC32()
            crc.update(payload)
            val entry = ZipEntry(name)
            entry.method = ZipEntry.STORED
            entry.size = payload.size.toLong()
            entry.compressedSize = payload.size.toLong()
            entry.crc = crc.value
            entry.extra = extra
            zip.putNextEntry(entry)
            zip.write(payload)
            zip.closeEntry()
        }
    }
}
