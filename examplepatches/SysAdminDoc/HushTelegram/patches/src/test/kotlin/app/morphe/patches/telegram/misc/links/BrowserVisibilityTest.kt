/* Copyright 2026 HushTelegram contributors. SPDX-License-Identifier: GPL-3.0-only */
package app.morphe.patches.telegram.misc.links

import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import com.reandroid.apk.ApkModule
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.ByteArrayInputStream
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

/** The browser hook's Android 11+ visibility contract runs through the actual resource patch. */
class BrowserVisibilityTest {
    @Rule @JvmField val temporary = TemporaryFolder()

    @Test fun `missing queries gain only the two general browser intents`() {
        val manifest = patch("")
        assertBrowserQueries(manifest)
        assertEquals(0, manifest.getElementsByTagName("uses-permission").length)
        assertEquals(0, manifest.getElementsByTagName("package").length)
    }

    @Test fun `existing declarations and component visibility stay untouched`() {
        val manifest = patch("<queries><package android:name=\"org.example.stock\" /><intent><action android:name=\"org.example.ACTION\" /></intent></queries>")
        assertBrowserQueries(manifest)
        assertEquals("org.example.stock", (manifest.getElementsByTagName("package").item(0) as Element).getAttribute("android:name"))
        assertEquals(3, manifest.getElementsByTagName("intent").length)
        assertEquals("false", (manifest.getElementsByTagName("application").item(0) as Element).getAttribute("android:enabled"))
        assertEquals("36", (manifest.getElementsByTagName("uses-sdk").item(0) as Element).getAttribute("android:targetSdkVersion"))
    }

    @Test fun `an already declared browser query is reused`() {
        val manifest = patch("<queries><intent><action android:name=\"android.intent.action.VIEW\" /><category android:name=\"android.intent.category.BROWSABLE\" /><data android:scheme=\"https\" /></intent></queries>")
        assertBrowserQueries(manifest)
        assertEquals(2, manifest.getElementsByTagName("intent").length)
    }

    @Test fun `ambiguous query containers refuse before saving a manifest change`() {
        val input = "<queries/><queries/>"
        val failure = assertThrows(PatchException::class.java) { patch(input) }
        assertTrue(failure.message.orEmpty().contains("ambiguous package-visibility"))
    }

    private fun assertBrowserQueries(manifest: Document) {
        assertEquals(1, manifest.getElementsByTagName("queries").length)
        val intents = manifest.getElementsByTagName("intent")
        val views = (0 until intents.length).map { intents.item(it) as Element }.filter {
            (it.getElementsByTagName("action").item(0) as Element).getAttribute("android:name") == "android.intent.action.VIEW"
        }
        assertEquals(2, views.size)
        assertEquals(setOf("http", "https"), views.map {
            assertEquals("android.intent.category.BROWSABLE", (it.getElementsByTagName("category").item(0) as Element).getAttribute("android:name"))
            val data = it.getElementsByTagName("data").item(0) as Element
            assertEquals(1, data.attributes.length)
            data.getAttribute("android:scheme")
        }.toSet())
    }

    private fun patch(queries: String): Document {
        val work = temporary.newFolder()
        val apk = File(work, "input.apk")
        ApkModule().use { module ->
            module.setManifest(AndroidManifestBlock.empty().apply {
                setPackageName("org.telegram.messenger.web")
                setVersionName("12.10.6")
                setVersionCode(71129)
            })
            module.writeApk(apk)
        }
        val config = PatcherConfig(apkFile = apk, temporaryFilesPath = File(work, "patcher"))
        ResourcePatchContext::class.java.getConstructor(PatcherConfig::class.java).newInstance(config).use { context ->
            val manifest = context["AndroidManifest.xml"]
            manifest.parentFile.mkdirs()
            val source = "<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\" package=\"org.telegram.messenger.web\"><uses-sdk android:minSdkVersion=\"28\" android:targetSdkVersion=\"36\" />$queries<application android:enabled=\"false\" /></manifest>"
            manifest.writeText(source)
            try {
                browserVisibilityPatch.execute(context)
            } catch (failure: PatchException) {
                val parser = DocumentBuilderFactory.newInstance().newDocumentBuilder()
                val before = parser.parse(ByteArrayInputStream(source.toByteArray())).documentElement
                val after = parser.parse(manifest).documentElement
                assertTrue("refusal preserves every manifest element and attribute", before.isEqualNode(after))
                throw failure
            }
            return DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(manifest)
        }
    }
}
