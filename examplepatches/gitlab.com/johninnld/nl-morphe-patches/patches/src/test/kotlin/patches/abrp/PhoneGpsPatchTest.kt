package patches.abrp

import java.io.File
import java.security.MessageDigest
import java.util.zip.ZipFile
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import javax.xml.parsers.DocumentBuilderFactory

class PhoneGpsPatchTest {
    @Test fun pinsEmbeddedBundleWithoutChangingOtherManifestSettings() {
        val xml = """<manifest xmlns:android="http://schemas.android.com/apk/res/android">
            <application><meta-data android:name="expo.modules.updates.ENABLED" android:value="true"/>
            <meta-data android:name="expo.modules.updates.EXPO_UPDATE_URL" android:value="https://example.invalid"/>
            </application></manifest>"""
        val manifest = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
            .newDocumentBuilder().parse(xml.byteInputStream())
        keepPatchedLocationBundle(manifest)
        val nodes = manifest.getElementsByTagName("meta-data")
        val ns = "http://schemas.android.com/apk/res/android"
        assertEquals("false", (nodes.item(0) as org.w3c.dom.Element).getAttributeNS(ns, "value"))
        assertEquals("https://example.invalid", (nodes.item(1) as org.w3c.dom.Element).getAttributeNS(ns, "value"))
        assertThrows(IllegalStateException::class.java) { keepPatchedLocationBundle(manifest) }
    }

    @Test fun transformsPublisherBundleAndRejectsCorruption() {
        val path = System.getenv("ABRP_ORIGINAL_APK")
        assumeNotNull(path)
        val original = ZipFile(File(path!!)).use { apk ->
            apk.getInputStream(apk.getEntry("assets/index.android.bundle")).readBytes()
        }
        val result = restorePhoneGps(original)
        assertArrayEquals(byteArrayOf(0x10, 0, 0, 0x10, 0, 0), result.copyOfRange(0x010afb31, 0x010afb37))
        assertArrayEquals(byteArrayOf(0x08, 10, 0, 0, 0xae.toByte(), 2), result.copyOfRange(0xc04c78, 0xc04c7e))
        for (offset in listOf(0xec170b + 0x97, 0xec170b + 0x11f)) {
            assertArrayEquals(byteArrayOf(0x10, 3, 3, 0xae.toByte(), 2), result.copyOfRange(offset, offset + 5))
        }
        for ((offset, register) in mapOf(0xe867f9 to 10, 0xec7f29 to 5, 0x105f7f5 to 4, 0x108ab5c to 4)) {
            assertArrayEquals(
                byteArrayOf(0x91.toByte(), register.toByte(), 0xf8.toByte(), 0x91.toByte(), 0, 0),
                result.copyOfRange(offset, offset + 6),
            )
        }
        assertArrayEquals(
            byteArrayOf(0x91.toByte(), 4, 0x7d, 0x69, 1, 0),
            result.copyOfRange(0x108f654, 0x108f65a),
        )
        val digest = MessageDigest.getInstance("SHA-1").digest(result.copyOfRange(0, result.size - 20))
        assertArrayEquals(digest, result.copyOfRange(result.size - 20, result.size))
        assertThrows(IllegalStateException::class.java) { restorePhoneGps(original.copyOf(original.size - 1)) }
        val corrupted = original.copyOf()
        corrupted[0x010afb31] = 0
        assertThrows(IllegalStateException::class.java) { restorePhoneGps(corrupted) }
        val invalidHeader = original.copyOf()
        invalidHeader[8] = 0
        assertEquals("Unsupported ABRP Hermes header", assertThrows(IllegalStateException::class.java) {
            restorePhoneGps(invalidHeader)
        }.message)
        val changedBundle = original.copyOf()
        changedBundle[0x010afb31] = 0
        MessageDigest.getInstance("SHA-1").digest(changedBundle.copyOfRange(0, changedBundle.size - 20))
            .copyInto(changedBundle, changedBundle.size - 20)
        assertEquals("Unsupported ABRP Hermes bundle", assertThrows(IllegalStateException::class.java) {
            restorePhoneGps(changedBundle)
        }.message)
        assertThrows(IllegalStateException::class.java) { restorePhoneGps(result) }
    }
}
