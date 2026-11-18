package app.ckzorigins.patches.compat

import org.w3c.dom.Document
import org.w3c.dom.Element
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class GluBackupManifestTest {
    @Test
    fun `stock glu backup nodes are removed and nothing is added`() {
        val document = parse(STOCK)
        GluBackupManifest.strip(document)
        val app = document.getElementsByTagName("application").item(0) as Element
        assertFalse(app.hasAttribute("android:backupAgent"))
        assertFalse(app.hasAttribute("android:restoreAnyVersion"))
        assertFalse(app.hasAttribute("android:fullBackupOnly"))
        assertEquals(0, named(document, "uses-permission", GluBackupManifest.BACKUP_PERMISSION).size)
        assertEquals(0, named(document, "meta-data", GluBackupManifest.BACKUP_API_KEY).size)
        assertEquals(1, named(document, "uses-permission", "android.permission.INTERNET").size)
        assertTrue(app.hasAttribute("android:label"))
    }

    @Test
    fun `a manifest without the glu agent is refused`() {
        assertFailsWith<app.morphe.patcher.patch.PatchException> {
            GluBackupManifest.strip(parse(NO_AGENT))
        }
    }

    @Test
    fun `a missing backup permission is refused`() {
        assertFailsWith<app.morphe.patcher.patch.PatchException> {
            GluBackupManifest.strip(parse(NO_PERMISSION))
        }
    }

    private fun named(document: Document, tag: String, name: String): List<Element> {
        val list = document.getElementsByTagName(tag)
        return (0 until list.length).map { list.item(it) as Element }
            .filter { it.getAttribute("android:name") == name }
    }

    private fun parse(xml: String): Document {
        val factory = DocumentBuilderFactory.newInstance()
        factory.isNamespaceAware = false
        return factory.newDocumentBuilder().parse(xml.byteInputStream())
    }

    private companion object {
        const val STOCK = """
            <manifest package="com.glu.ckzombies2">
              <application android:label="@string/app_name"
                  android:backupAgent="com.glu.plugins.GluBackupAgent"
                  android:restoreAnyVersion="true">
                <meta-data android:name="com.google.android.backup.api_key" android:value="key"/>
              </application>
              <uses-permission android:name="android.permission.BACKUP"/>
              <uses-permission android:name="android.permission.INTERNET"/>
            </manifest>
        """
        const val NO_AGENT = """
            <manifest package="com.glu.ckzombies2">
              <application android:label="@string/app_name" android:restoreAnyVersion="true">
                <meta-data android:name="com.google.android.backup.api_key" android:value="key"/>
              </application>
              <uses-permission android:name="android.permission.BACKUP"/>
            </manifest>
        """
        const val NO_PERMISSION = """
            <manifest package="com.glu.ckzombies2">
              <application android:label="@string/app_name"
                  android:backupAgent="com.glu.plugins.GluBackupAgent"
                  android:restoreAnyVersion="true">
                <meta-data android:name="com.google.android.backup.api_key" android:value="key"/>
              </application>
            </manifest>
        """
    }
}
