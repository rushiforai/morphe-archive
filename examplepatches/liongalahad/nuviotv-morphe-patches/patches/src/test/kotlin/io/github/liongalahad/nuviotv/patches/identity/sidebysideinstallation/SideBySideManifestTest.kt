package io.github.liongalahad.nuviotv.patches.identity.sidebysideinstallation

import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import org.w3c.dom.Element

class SideBySideManifestTest {
    @Test
    fun `every selectable launcher icon retains Morphe branding`() {
        val document = manifest("""<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.nuvio.tv"><application>
          <activity android:name="com.nuvio.tv.launcher.AppIconDefault" android:label="@string/app_name"><intent-filter><category android:name="android.intent.category.LEANBACK_LAUNCHER" /></intent-filter></activity>
          <activity android:name="com.nuvio.tv.launcher.AppIconCopper" android:enabled="false" android:label="@string/app_name"><intent-filter><category android:name="android.intent.category.LAUNCHER" /></intent-filter></activity>
          <activity android:name="example.Other" android:label="Unchanged" />
        </application></manifest>""")
        SideBySideManifest.transform(document)
        val activities = document.getElementsByTagName("activity")
        assertEquals("Nuvio Morphe", (activities.item(0) as Element).getAttribute("android:label"))
        assertEquals("Nuvio Morphe", (activities.item(1) as Element).getAttribute("android:label"))
        assertEquals("false", (activities.item(1) as Element).getAttribute("android:enabled"))
        assertEquals("Unchanged", (activities.item(2) as Element).getAttribute("android:label"))
    }

    @Test
    fun `renames install identity while preserving component class names`() {
        val document = manifest(
            """
            <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.nuvio.tv">
              <permission android:name="com.nuvio.tv.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION" />
              <uses-permission android:name="android.permission.INTERNET" />
              <uses-permission android:name="com.nuvio.tv.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION" />
              <application android:name="com.nuvio.tv.NuvioApplication" android:label="NuvioTV">
                <activity android:name="com.nuvio.tv.MainActivity" />
                <provider android:name="example.Provider" android:authorities="com.nuvio.tv.fileprovider" />
                <provider android:name="example.Second" android:authorities="com.nuvio.tv.one;com.nuvio.tv.two" />
              </application>
            </manifest>
            """.trimIndent()
        )

        SideBySideManifest.transform(document)

        assertEquals("com.nuvio.morphe", document.documentElement.getAttribute("package"))
        val application = document.getElementsByTagName("application").item(0) as Element
        assertEquals("Nuvio Morphe", application.getAttribute("android:label"))
        assertEquals("com.nuvio.tv.NuvioApplication", application.getAttribute("android:name"))
        val activity = document.getElementsByTagName("activity").item(0) as Element
        assertEquals("com.nuvio.tv.MainActivity", activity.getAttribute("android:name"))
        assertEquals(
            "com.nuvio.morphe.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION",
            (document.getElementsByTagName("permission").item(0) as Element)
                .getAttribute("android:name")
        )
        assertEquals(
            "android.permission.INTERNET",
            (document.getElementsByTagName("uses-permission").item(0) as Element)
                .getAttribute("android:name")
        )
        assertEquals(
            "com.nuvio.morphe.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION",
            (document.getElementsByTagName("uses-permission").item(1) as Element)
                .getAttribute("android:name")
        )
        assertEquals(
            "com.nuvio.morphe.fileprovider",
            (document.getElementsByTagName("provider").item(0) as Element)
                .getAttribute("android:authorities")
        )
        assertEquals(
            "com.nuvio.morphe.one;com.nuvio.morphe.two",
            (document.getElementsByTagName("provider").item(1) as Element)
                .getAttribute("android:authorities")
        )
    }

    @Test
    fun `rejects a manifest for another application`() {
        val document = manifest(
            """
            <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="example.app">
              <application android:label="Example" />
            </manifest>
            """.trimIndent()
        )

        assertFailsWith<IllegalStateException> { SideBySideManifest.transform(document) }
    }

    @Test
    fun `rejects a provider authority that could still collide`() {
        val document = manifest(
            """
            <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.nuvio.tv">
              <application android:label="NuvioTV">
                <provider android:name="example.Provider" android:authorities="shared.authority" />
              </application>
            </manifest>
            """.trimIndent()
        )

        assertFailsWith<IllegalStateException> { SideBySideManifest.transform(document) }
    }

    private fun manifest(xml: String) = DocumentBuilderFactory.newInstance()
        .newDocumentBuilder()
        .parse(ByteArrayInputStream(xml.toByteArray()))
}
