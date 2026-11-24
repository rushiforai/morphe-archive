package patches.shared

import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test
import org.w3c.dom.Document
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory

class GameTrackingManifestTest {
    private fun document(xml: String): Document =
        DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
            .newDocumentBuilder().parse(ByteArrayInputStream(xml.toByteArray()))

    private fun permissions(document: Document): List<String> {
        val android = "http://schemas.android.com/apk/res/android"
        val nodes = document.getElementsByTagName("uses-permission")
        return (0 until nodes.length).map {
            (nodes.item(it) as org.w3c.dom.Element).getAttributeNS(android, "name")
        }
    }

    private val manifest = """
        <manifest xmlns:android="http://schemas.android.com/apk/res/android">
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="com.google.android.gms.permission.AD_ID"/>
            <uses-permission android:name="com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE"/>
            <uses-permission android:name="android.permission.ACCESS_ADSERVICES_AD_ID"/>
            <uses-permission android:name="android.permission.ACCESS_ADSERVICES_ATTRIBUTION"/>
            <uses-permission android:name="android.permission.ACCESS_ADSERVICES_TOPICS"/>
            <uses-permission android:name="android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE"/>
            <application android:label="Game"/>
        </manifest>
    """

    @Test fun advertisingPermissionsAreRemovedOnlyWhenDeclared() {
        val document = document(manifest)
        assertEquals(2, removePermissions(
            document,
            "com.google.android.gms.permission.AD_ID",
            "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
        ))
        assertEquals(listOf("android.permission.INTERNET"), permissions(document).take(1))
        assertEquals(5, permissions(document).size)

        // A second run has nothing left to remove, which must be loud rather than silent.
        assertThrows(IllegalStateException::class.java) {
            removePermissions(document, "com.google.android.gms.permission.AD_ID")
        }
    }

    @Test fun adServicesPermissionsAreOptional() {
        val document = document(manifest)
        assertEquals(4, removeAdServicesPermissions(document))
        assertEquals(
            listOf(
                "android.permission.INTERNET",
                "com.google.android.gms.permission.AD_ID",
                "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
            ),
            permissions(document),
        )

        val withoutAdServices = document("""
            <manifest xmlns:android="http://schemas.android.com/apk/res/android">
                <uses-permission android:name="android.permission.INTERNET"/>
            </manifest>
        """)
        assertEquals(0, removeAdServicesPermissions(withoutAdServices))
        assertEquals(listOf("android.permission.INTERNET"), permissions(withoutAdServices))
    }
}
