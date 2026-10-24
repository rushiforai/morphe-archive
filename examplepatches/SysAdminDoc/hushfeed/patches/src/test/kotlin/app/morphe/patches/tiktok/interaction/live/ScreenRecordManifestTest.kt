package app.morphe.patches.tiktok.interaction.live

import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * #37: recording the screen needs a foreground service of type mediaProjection, the consent screen
 * and the two foreground service permissions in the manifest.
 */
class ScreenRecordManifestTest {
    private fun manifest(vararg permissions: String): Document {
        val xml = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument()
        val root = xml.createElement("manifest")
        xml.appendChild(root)
        permissions.forEach { name ->
            val element = xml.createElement("uses-permission")
            element.setAttribute("android:name", name)
            root.appendChild(element)
        }
        root.appendChild(xml.createElement("application"))
        return xml
    }

    private fun Document.named(tag: String): List<Element> =
        (0 until getElementsByTagName(tag).length).map { getElementsByTagName(tag).item(it) as Element }

    @Test
    fun `the service, the consent screen and both permissions land`() {
        val xml = manifest()
        declareScreenRecording(xml)
        val service = xml.named("service").single()
        assertEquals(SCREEN_RECORD_SERVICE, service.getAttribute("android:name"))
        assertEquals("mediaProjection", service.getAttribute("android:foregroundServiceType"))
        assertEquals("false", service.getAttribute("android:exported"))
        val activity = xml.named("activity").single()
        assertEquals(SCREEN_RECORD_CONSENT, activity.getAttribute("android:name"))
        assertEquals("false", activity.getAttribute("android:exported"))
        val permissions = xml.named("uses-permission").map { it.getAttribute("android:name") }.toSet()
        assertTrue(permissions.contains("android.permission.FOREGROUND_SERVICE"))
        assertTrue(permissions.contains("android.permission.FOREGROUND_SERVICE_MEDIA_PROJECTION"))
    }

    @Test
    fun `a permission the app already declares is not declared twice`() {
        val xml = manifest("android.permission.FOREGROUND_SERVICE_MEDIA_PROJECTION")
        declareScreenRecording(xml)
        val names = xml.named("uses-permission").map { it.getAttribute("android:name") }
        assertEquals(1, names.count { it == "android.permission.FOREGROUND_SERVICE_MEDIA_PROJECTION" })
        assertEquals(1, names.count { it == "android.permission.FOREGROUND_SERVICE" })
    }

    @Test
    fun `running it twice leaves one service and one consent screen`() {
        val xml = manifest()
        declareScreenRecording(xml)
        declareScreenRecording(xml)
        assertEquals(1, xml.named("service").size)
        assertEquals(1, xml.named("activity").size)
    }

    @Test
    fun `the declared names are the extension classes`() {
        assertEquals("app.morphe.extension.tiktok.live.ScreenRecordService", SCREEN_RECORD_SERVICE)
        assertEquals("app.morphe.extension.tiktok.live.ScreenRecordConsentActivity", SCREEN_RECORD_CONSENT)
    }
}
