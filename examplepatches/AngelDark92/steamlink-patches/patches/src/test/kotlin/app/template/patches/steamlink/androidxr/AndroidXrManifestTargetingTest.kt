package app.template.patches.steamlink.androidxr

import org.w3c.dom.Element
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals

class AndroidXrManifestTargetingTest {
    @Test
    fun `existing 5002313 features are normalized instead of skipped`() {
        val doc = parse(
            """
            <manifest xmlns:android="http://schemas.android.com/apk/res/android">
              <uses-feature android:name="android.software.xr.api.openxr" android:version="0x10000" android:required="false"/>
              <uses-feature android:name="android.hardware.xr.input.controller" android:required="true"/>
              <application/>
            </manifest>
            """.trimIndent(),
        )
        val manifest = doc.documentElement
        val app = manifest.getElementsByTagName("application").item(0) as Element

        upsertManifestFeature(
            doc,
            manifest,
            app,
            "android.software.xr.api.openxr",
            required = true,
            version = "0x10001",
        )
        upsertManifestFeature(
            doc,
            manifest,
            app,
            "android.hardware.xr.input.controller",
            required = false,
            version = null,
        )

        val features = doc.getElementsByTagName("uses-feature")
        val openXr = features.item(0) as Element
        val controller = features.item(1) as Element
        assertEquals("0x10001", openXr.getAttribute("android:version"))
        assertEquals("true", openXr.getAttribute("android:required"))
        assertEquals("false", controller.getAttribute("android:required"))
        assertEquals(false, controller.hasAttribute("android:version"))
    }

    @Test
    fun `5002313 application start mode is removed without removing activity modes`() {
        val propertyName = "android.window.PROPERTY_XR_ACTIVITY_START_MODE"
        val doc = parse(
            """
            <manifest xmlns:android="http://schemas.android.com/apk/res/android">
              <application>
                <property android:name="$propertyName" android:value="XR_ACTIVITY_START_MODE_FULL_SPACE_UNMANAGED"/>
                <activity android:name="VRLink">
                  <property android:name="$propertyName" android:value="XR_ACTIVITY_START_MODE_FULL_SPACE_UNMANAGED"/>
                </activity>
              </application>
            </manifest>
            """.trimIndent(),
        )
        val app = doc.getElementsByTagName("application").item(0) as Element

        removeDirectApplicationProperty(app, propertyName)

        assertEquals(1, app.getElementsByTagName("property").length)
        val remaining = app.getElementsByTagName("property").item(0) as Element
        assertEquals(propertyName, remaining.getAttribute("android:name"))
        assertEquals("activity", remaining.parentNode.nodeName)
    }

    private fun parse(xml: String) = DocumentBuilderFactory.newInstance()
        .newDocumentBuilder()
        .parse(ByteArrayInputStream(xml.toByteArray()))
}
