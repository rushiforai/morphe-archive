/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.actions

import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.ResourcePatchContext
import com.reandroid.apk.ApkModule
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock
import org.junit.Assert.*
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

class BrowserQueriesTest {
    @Rule @JvmField val temporary = TemporaryFolder()

    @Test
    fun `browser discovery adds only web intent queries preserving components permissions and existing queries`() {
        val document = patchManifest("<queries><package android:name=\"com.existing.package\" /></queries>")
        assertEquals(1, document.getElementsByTagName("queries").length)
        assertEquals(1, document.getElementsByTagName("uses-permission").length)
        assertEquals("android.permission.INTERNET", (document.getElementsByTagName("uses-permission").item(0) as Element).getAttribute("android:name"))
        assertEquals("false", (document.getElementsByTagName("activity").item(0) as Element).getAttribute("android:exported"))
        assertEquals("com.existing.package", (document.getElementsByTagName("package").item(0) as Element).getAttribute("android:name"))
        val intents = document.getElementsByTagName("intent")
        assertEquals(2, intents.length)
        val schemes = mutableSetOf<String>()
        for (index in 0 until intents.length) {
            val intent = intents.item(index) as Element
            assertEquals("android.intent.action.VIEW", (intent.getElementsByTagName("action").item(0) as Element).getAttribute("android:name"))
            assertEquals("android.intent.category.BROWSABLE", (intent.getElementsByTagName("category").item(0) as Element).getAttribute("android:name"))
            schemes += (intent.getElementsByTagName("data").item(0) as Element).getAttribute("android:scheme")
        }
        assertEquals(setOf("http", "https"), schemes)
    }

    @Test
    fun `repeated vendor queries and restricted web queries stay intact and insertion is idempotent`() {
        val document = patchManifest("""
            <queries>
                <package android:name="com.vendor.first" />
                <intent>
                    <action android:name="android.intent.action.VIEW" />
                    <category android:name="android.intent.category.BROWSABLE" />
                    <data android:scheme="https" android:host="vendor.example" />
                </intent>
            </queries>
            <queries>
                <package android:name="com.vendor.second" />
                <intent><action android:name="android.intent.action.SEND" /><data android:mimeType="image/*" /></intent>
            </queries>
        """.trimIndent(), 2)
        assertEquals(2, document.getElementsByTagName("queries").length)
        assertEquals(4, document.getElementsByTagName("intent").length)
        val packages = document.getElementsByTagName("package")
        assertEquals(listOf("com.vendor.first", "com.vendor.second"), (0 until packages.length).map {
            (packages.item(it) as Element).getAttribute("android:name")
        })
        val data = document.getElementsByTagName("data")
        assertEquals(1, (0 until data.length).count { (data.item(it) as Element).getAttribute("android:host") == "vendor.example" })
        assertEquals(1, (0 until data.length).count { (data.item(it) as Element).getAttribute("android:mimeType") == "image/*" })
        assertEquals(2, (0 until data.length).count { (data.item(it) as Element).attributes.length == 1 &&
            (data.item(it) as Element).getAttribute("android:scheme") in setOf("http", "https") })
    }

    @Test
    fun `a generic browser query in a later vendor block is reused`() {
        val document = patchManifest("""
            <queries><package android:name="com.vendor.first" /></queries>
            <queries><intent>
                <action android:name="android.intent.action.VIEW" />
                <category android:name="android.intent.category.BROWSABLE" />
                <data android:scheme="https" />
            </intent></queries>
        """.trimIndent(), 2)
        assertEquals(2, document.getElementsByTagName("queries").length)
        assertEquals(2, document.getElementsByTagName("intent").length)
    }

    private fun patchManifest(queries: String, times: Int = 1): Document {
        val work = temporary.newFolder()
        val apk = File(work, "input.apk")
        ApkModule().use { module ->
            module.setManifest(AndroidManifestBlock.empty().apply {
                setPackageName("com.pinterest")
                setVersionName("14.38.0")
                setVersionCode(14388010)
            })
            module.writeApk(apk)
        }
        val config = PatcherConfig(apkFile = apk, temporaryFilesPath = File(work, "patcher"))
        ResourcePatchContext::class.java.getConstructor(PatcherConfig::class.java).newInstance(config).use { context ->
            val manifest = context["AndroidManifest.xml"]
            manifest.parentFile.mkdirs()
            manifest.writeText("""
                <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.pinterest">
                    <uses-permission android:name="android.permission.INTERNET" />
                    $queries
                    <application><activity android:name="com.pinterest.activity.PinterestActivity" android:exported="false" /></application>
                </manifest>
            """.trimIndent())
            repeat(times) { browserQueriesPatch.execute(context) }
            return DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(manifest)
        }
    }
}
