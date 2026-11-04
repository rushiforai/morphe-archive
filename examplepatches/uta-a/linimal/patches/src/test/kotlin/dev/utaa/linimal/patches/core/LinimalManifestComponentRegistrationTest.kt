package dev.utaa.linimal.patches.core

import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class LinimalManifestComponentRegistrationTest {
    @Test
    fun `Settings Activity is registered with internal attributes`() {
        val document = manifestDocument("<application />")

        LinimalManifestComponentRegistration.register(document)

        val application = document.getElementsByTagName("application").item(0) as org.w3c.dom.Element
        val activity = application.getElementsByTagName("activity").item(0) as org.w3c.dom.Element
        assertEquals(
            "dev.utaa.linimal.extension.settings.LinimalSettingsActivity",
            activity.getAttribute("android:name"),
        )
        assertEquals("false", activity.getAttribute("android:exported"))
        assertEquals("true", activity.getAttribute("android:excludeFromRecents"))
        assertEquals("Linimal", activity.getAttribute("android:label"))
        assertEquals(
            "@android:style/Theme.DeviceDefault.Light.NoActionBar",
            activity.getAttribute("android:theme"),
        )
    }

    @Test
    fun `Restart Activity runs in its own process and task without external entry`() {
        val document = manifestDocument("<application />")

        LinimalManifestComponentRegistration.register(document)

        val activities = document.getElementsByTagName("activity")
        val restart = (0 until activities.length).map { activities.item(it) as org.w3c.dom.Element }
            .single { it.getAttribute("android:name") == LinimalManifestComponentRegistration.RESTART_ACTIVITY }
        assertEquals("false", restart.getAttribute("android:exported"))
        assertEquals(LinimalManifestComponentRegistration.RESTART_PROCESS, restart.getAttribute("android:process"))
        assertEquals("dev.utaa.linimal.restart", restart.getAttribute("android:taskAffinity"))
        assertEquals("true", restart.getAttribute("android:noHistory"))
        assertEquals(0, restart.getElementsByTagName("intent-filter").length)
    }

    @Test
    fun `Settings Activity theme has no system ActionBar`() {
        val document = manifestDocument("<application />")

        LinimalManifestComponentRegistration.register(document)

        // ActionBar 付きのテーマだと android:label が自前ヘッダーへ重なるため、NoActionBar を必須にします。
        val activity = document.getElementsByTagName("activity").item(0) as org.w3c.dom.Element
        assertTrue(activity.getAttribute("android:theme").endsWith(".NoActionBar"))
    }

    @Test
    fun `Settings Activity has no external intent filter`() {
        val document = manifestDocument("<application />")

        LinimalManifestComponentRegistration.register(document)

        val activity = document.getElementsByTagName("activity").item(0) as org.w3c.dom.Element
        assertEquals(0, activity.getElementsByTagName("intent-filter").length)
        assertFalse(activity.hasAttribute("intent-filter"))
    }

    @Test
    fun `missing application is rejected`() {
        val document = manifestDocument("")

        assertFailsWith<ManifestComponentRegistrationException> {
            LinimalManifestComponentRegistration.register(document)
        }
    }

    @Test
    fun `multiple applications are rejected`() {
        val document = manifestDocument("<application /><application />")

        assertFailsWith<ManifestComponentRegistrationException> {
            LinimalManifestComponentRegistration.register(document)
        }
    }

    @Test
    fun `already registered Settings Activity is rejected without duplication`() {
        val document = manifestDocument(
            """
            <application>
                <activity android:name="dev.utaa.linimal.extension.settings.LinimalSettingsActivity" />
            </application>
            """.trimIndent(),
        )

        assertFailsWith<ManifestComponentRegistrationException> {
            LinimalManifestComponentRegistration.register(document)
        }

        assertEquals(1, document.getElementsByTagName("activity").length)
    }

    @Test
    fun `android namespace is required for safe registration`() {
        val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument()
        document.appendChild(document.createElement("manifest"))
        document.documentElement.appendChild(document.createElement("application"))

        val error = assertFailsWith<ManifestComponentRegistrationException> {
            LinimalManifestComponentRegistration.register(document)
        }

        assertTrue(error.message!!.contains("AndroidNamespaceMissing"))
    }

    private fun manifestDocument(applicationContents: String) =
        DocumentBuilderFactory.newInstance().run {
            newDocumentBuilder().parse(
                """
                <manifest xmlns:android="$ANDROID_NAMESPACE">
                    $applicationContents
                </manifest>
                """.trimIndent().byteInputStream(),
            )
        }

    private companion object {
        const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
    }
}
