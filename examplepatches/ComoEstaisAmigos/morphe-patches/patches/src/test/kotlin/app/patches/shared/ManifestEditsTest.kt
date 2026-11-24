package app.adebisi.patches.shared

import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Element
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class ManifestEditsTest {
    @Test
    fun `unused named entries drop every copy and a miss is refused`() {
        val document = parseManifestXml(
            """
            <manifest>
              <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
              <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
              <uses-permission android:name="android.permission.INTERNET"/>
            </manifest>
            """,
        )
        removeUnusedNamedEntries(document, listOf("uses-permission" to "android.permission.READ_PHONE_STATE"))
        assertEquals(0, namedElements(document, "uses-permission", listOf("android.permission.READ_PHONE_STATE")).size)
        assertEquals(1, namedElements(document, "uses-permission", listOf("android.permission.INTERNET")).size)
        assertFailsWith<PatchException> {
            removeUnusedNamedEntries(document, listOf("uses-permission" to "android.permission.ACCESS_WIFI_STATE"))
        }
    }

    @Test
    fun `setTargetSdk creates uses-sdk when the manifest has none`() {
        val document = parseManifestXml("<manifest package='x'/>")
        setTargetSdk(document)
        val usesSdk = document.getElementsByTagName("uses-sdk").item(0)
        assertEquals(TARGET_SDK.toString(), (usesSdk as Element).getAttribute("android:targetSdkVersion"))
    }
}
