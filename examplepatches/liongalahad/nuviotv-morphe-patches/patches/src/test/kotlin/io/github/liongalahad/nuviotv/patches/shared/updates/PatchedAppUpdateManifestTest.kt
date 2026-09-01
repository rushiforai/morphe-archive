package io.github.liongalahad.nuviotv.patches.shared.updates

import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import org.w3c.dom.Element

class PatchedAppUpdateManifestTest {
    @Test
    fun `removes package installer permission and preserves unrelated permissions`() {
        val document = manifest(
            """
            <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.nuvio.tv">
              <uses-permission android:name="android.permission.INTERNET" />
              <uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES" />
              <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
              <application android:label="NuvioTV" />
            </manifest>
            """.trimIndent()
        )

        PatchedAppUpdateManifest.removeInstallPermission(document)

        val names = document.getElementsByTagName("uses-permission").let { nodes ->
            (0 until nodes.length).map { index ->
                (nodes.item(index) as Element).getAttribute("android:name")
            }
        }
        assertEquals(
            listOf("android.permission.INTERNET", "android.permission.ACCESS_NETWORK_STATE"),
            names
        )
    }

    @Test
    fun `rejects a target without the exact updater permission declaration`() {
        val document = manifest(
            """
            <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.nuvio.tv">
              <uses-permission android:name="android.permission.INTERNET" />
              <application android:label="NuvioTV" />
            </manifest>
            """.trimIndent()
        )

        assertFailsWith<IllegalStateException> {
            PatchedAppUpdateManifest.removeInstallPermission(document)
        }
    }

    private fun manifest(xml: String) = DocumentBuilderFactory.newInstance()
        .newDocumentBuilder()
        .parse(ByteArrayInputStream(xml.toByteArray()))
}
