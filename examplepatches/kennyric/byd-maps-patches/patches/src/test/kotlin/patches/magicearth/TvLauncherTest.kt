package patches.magicearth

import org.junit.Assert.*
import org.junit.Test
import javax.xml.parsers.DocumentBuilderFactory

class TvLauncherTest {
    private fun manifest(extra: String = "") = DocumentBuilderFactory.newInstance().apply {
        isNamespaceAware = true
    }.newDocumentBuilder().parse(("""
        <manifest xmlns:android="http://schemas.android.com/apk/res/android">
          <uses-feature android:glEsVersion="0x30001" android:required="true"/>
          $extra
          <application><activity android:name="com.generalmagic.magicearth.MainActivity" android:exported="true">
            <intent-filter><action android:name="android.intent.action.MAIN"/>
              <category android:name="android.intent.category.LAUNCHER"/></intent-filter>
            <intent-filter><action android:name="android.intent.action.VIEW"/></intent-filter>
          </activity></application>
        </manifest>
    """).trimIndent().byteInputStream())

    @Test fun addsTvDiscoveryWithoutChangingGraphicsOrDeepLinks() {
        val doc = manifest("<uses-feature android:name=\"android.hardware.touchscreen\" android:required=\"true\"/>")
        enableTvDiscovery(doc)
        val ns = "http://schemas.android.com/apk/res/android"
        val categories = doc.getElementsByTagName("category")
        assertEquals(2, categories.length)
        assertEquals("android.intent.category.LEANBACK_LAUNCHER",
            (categories.item(1) as org.w3c.dom.Element).getAttributeNS(ns, "name"))
        assertEquals(2, doc.getElementsByTagName("intent-filter").length)
        val features = doc.getElementsByTagName("uses-feature")
        assertEquals(4, features.length)
        assertEquals("true", (features.item(0) as org.w3c.dom.Element).getAttributeNS(ns, "required"))
        for (i in 1 until features.length) {
            assertEquals("false", (features.item(i) as org.w3c.dom.Element).getAttributeNS(ns, "required"))
        }
        assertThrows(IllegalStateException::class.java) { enableTvDiscovery(doc) }
    }

    @Test fun duplicateFeaturesFailBeforeMutation() {
        val feature = "<uses-feature android:name=\"android.software.leanback\"/>"
        val doc = manifest(feature + feature)
        assertThrows(IllegalStateException::class.java) { enableTvDiscovery(doc) }
        assertEquals(1, doc.getElementsByTagName("category").length)
    }
}
