package io.github.liongalahad.nuviotv.patches.shared

import org.w3c.dom.Element
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals

class SegmentedMediaManifestTest {
    @Test
    fun `segmented provider registration is private and idempotent`() {
        val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
            ByteArrayInputStream(
                """<manifest xmlns:android="http://schemas.android.com/apk/res/android"
                    package="com.nuvio.tv"><application /></manifest>""".toByteArray()
            )
        )
        val application = document.getElementsByTagName("application").item(0) as Element

        registerSegmentedMediaProvider(document, application)
        registerSegmentedMediaProvider(document, application)

        assertEquals(1, application.getElementsByTagName("provider").length)
        val provider = application.getElementsByTagName("provider").item(0) as Element
        assertEquals(
            "io.github.liongalahad.nuviotv.extension.storage.segmented.SegmentedMediaProvider",
            provider.getAttribute("android:name")
        )
        assertEquals("com.nuvio.tv.morphe.segmented", provider.getAttribute("android:authorities"))
        assertEquals("false", provider.getAttribute("android:exported"))
        assertEquals("false", provider.getAttribute("android:grantUriPermissions"))
    }
}
