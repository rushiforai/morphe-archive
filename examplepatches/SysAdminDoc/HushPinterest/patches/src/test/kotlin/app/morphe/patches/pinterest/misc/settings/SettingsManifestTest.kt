/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.misc.settings

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
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

/** Runs the actual resource patch against the patcher's file-backed DOM, including its save. */
class SettingsManifestTest {
    @Rule
    @JvmField
    val temporary = TemporaryFolder()

    @Test
    fun `stock floors below API 28 are raised`() {
        for (stock in listOf(1, 21, 27)) {
            assertEquals("stock minSdk $stock", "28", sdk(patchManifest("<uses-sdk android:minSdkVersion=\"$stock\" />"))
                .getAttribute("android:minSdkVersion"))
        }
    }

    @Test
    fun `a stock floor at API 28 stays there`() {
        assertEquals("28", sdk(patchManifest("<uses-sdk android:minSdkVersion=\"28\" />"))
            .getAttribute("android:minSdkVersion"))
    }

    @Test
    fun `higher stock floors are preserved`() {
        for (stock in listOf(29, 36)) {
            assertEquals("stock minSdk $stock", stock.toString(),
                sdk(patchManifest("<uses-sdk android:minSdkVersion=\"$stock\" />"))
                    .getAttribute("android:minSdkVersion"))
        }
    }

    @Test
    fun `a missing uses-sdk is inserted before the application`() {
        val document = patchManifest("")
        val sdk = sdk(document)
        assertEquals("28", sdk.getAttribute("android:minSdkVersion"))
        val application = document.getElementsByTagName("application").item(0)
        assertTrue(sdk.compareDocumentPosition(application).toInt()
            .and(org.w3c.dom.Node.DOCUMENT_POSITION_FOLLOWING.toInt()) != 0)
    }

    @Test
    fun `a missing minimum is raised without changing other sdk attributes`() {
        val sdk = sdk(patchManifest("<uses-sdk android:targetSdkVersion=\"36\" android:maxSdkVersion=\"99\" />"))
        assertEquals("28", sdk.getAttribute("android:minSdkVersion"))
        assertEquals("36", sdk.getAttribute("android:targetSdkVersion"))
        assertEquals("99", sdk.getAttribute("android:maxSdkVersion"))
    }

    @Test
    fun `the stock target and settings alias survive the floor change`() {
        val document = patchManifest("<uses-sdk android:minSdkVersion=\"21\" android:targetSdkVersion=\"36\" />")
        assertEquals("36", sdk(document).getAttribute("android:targetSdkVersion"))
        val activity = document.getElementsByTagName("activity").item(0) as Element
        assertEquals(MAIN_ACTIVITY_NAME, activity.getAttribute("android:name"))
        assertEquals("Pinterest's activity keeps its own visibility", "", activity.getAttribute("android:exported"))
        val aliases = document.getElementsByTagName("activity-alias")
        assertEquals(2, aliases.length)
        val launcher = aliases.item(0) as Element
        assertEquals("Pinterest's launcher alias is left alone", MAIN_ACTIVITY_NAME, launcher.getAttribute("android:name"))
        val alias = aliases.item(1) as Element
        assertEquals(SETTINGS_ALIAS_NAME, alias.getAttribute("android:name"))
        assertEquals(MAIN_ACTIVITY_NAME, alias.getAttribute("android:targetActivity"))
        assertEquals("true", alias.getAttribute("android:exported"))
        val action = alias.getElementsByTagName("action").item(0) as Element
        assertEquals(APPLICATION_PREFERENCES, action.getAttribute("android:name"))
    }

    @Test
    fun `ambiguous SDK declarations are refused`() {
        val failure = assertThrows(PatchException::class.java) {
            patchManifest("<uses-sdk android:minSdkVersion=\"21\" /><uses-sdk android:minSdkVersion=\"36\" />")
        }
        assertTrue(failure.message.orEmpty().contains("more than one uses-sdk"))
    }

    @Test
    fun `invalid and preview minimums are refused instead of being lowered`() {
        for (stock in listOf("", "0", "-1", "Future", "2147483648")) {
            val failure = assertThrows(PatchException::class.java) {
                patchManifest("<uses-sdk android:minSdkVersion=\"$stock\" />")
            }
            assertTrue("stock minSdk $stock", failure.message.orEmpty().contains("invalid minSdkVersion"))
        }
    }

    private fun sdk(document: Document): Element {
        val elements = document.getElementsByTagName("uses-sdk")
        assertEquals(1, elements.length)
        return elements.item(0) as Element
    }

    private fun patchManifest(sdk: String): Document {
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
        // The constructor is Kotlin-internal; this is the JVM signature pinned to patcher 1.14.1.
        ResourcePatchContext::class.java.getConstructor(PatcherConfig::class.java).newInstance(config).use { context ->
            val manifest = context["AndroidManifest.xml"]
            manifest.parentFile.mkdirs()
            manifest.writeText(
                """
                <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.pinterest">
                    $sdk
                    <application android:name="com.pinterest.ReleaseHiltApplication">
                        <activity android:name="$MAIN_ACTIVITY_NAME" android:noHistory="true" />
                        <activity-alias android:name="$MAIN_ACTIVITY_NAME" android:exported="true"
                            android:targetActivity="$MAIN_ACTIVITY_NAME" />
                    </application>
                </manifest>
                """.trimIndent(),
            )
            settingsManifestPatch.execute(context)
            return DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(manifest)
        }
    }
}
