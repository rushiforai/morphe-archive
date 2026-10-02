/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.adid

import app.morphe.patcher.patch.PatchException
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.w3c.dom.Document
import org.w3c.dom.Element
import javax.xml.parsers.DocumentBuilderFactory

class RemoveAdPermissionsTest {
    private val others = listOf("android.permission.INTERNET", "com.google.android.c2dm.permission.RECEIVE")

    /** All three go, a second request for one goes with it, and nothing else in the manifest moves. */
    @Test
    fun theAdPermissionsGoAndNothingElseDoes() {
        val manifest = manifest(others + AD_PERMISSIONS + AD_PERMISSIONS.first())

        removeAdPermissions(manifest)

        assertEquals(others, requested(manifest))
        assertEquals("the ad services config property", 1, manifest.getElementsByTagName("property").length)
        assertEquals("the ad services library", 1, manifest.getElementsByTagName("uses-library").length)
    }

    /** A request in the Android 6 form goes too, and one asked for only that way counts as asked for. */
    @Test
    fun theAndroidSixFormGoesToo() {
        val manifest = manifest(others + AD_PERMISSIONS.drop(1), sdk23 = AD_PERMISSIONS + "android.permission.CAMERA")

        removeAdPermissions(manifest)

        assertEquals(others, requested(manifest))
        assertEquals(listOf("android.permission.CAMERA"), requested(manifest, "uses-permission-sdk-23"))
    }

    /** A manifest that doesn't ask for one of them fails at patch time, naming it, with nothing removed. */
    @Test
    fun aManifestMissingOneFailsBeforeAnythingIsRemoved() {
        for (absent in AD_PERMISSIONS) {
            val asked = others + AD_PERMISSIONS.filter { it != absent }
            val manifest = manifest(asked)

            val failure = assertThrows(PatchException::class.java) { removeAdPermissions(manifest) }

            assertTrue(failure.message!!, failure.message!!.contains(absent))
            assertEquals("$absent missing: something was removed", asked, requested(manifest))
        }
    }

    private fun manifest(permissions: List<String>, sdk23: List<String> = emptyList()): Document {
        val xml = buildString {
            append("""<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.instagram.android">""")
            permissions.forEach { append("""<uses-permission android:name="$it"/>""") }
            sdk23.forEach { append("""<uses-permission-sdk-23 android:name="$it"/>""") }
            append("""<application><property android:name="android.adservices.AD_SERVICES_CONFIG" android:resource="@xml/ad_services_config"/>""")
            append("""<uses-library android:name="android.ext.adservices" android:required="false"/></application></manifest>""")
        }
        return DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(xml.byteInputStream())
    }

    private fun requested(manifest: Document, tag: String = "uses-permission"): List<String> = manifest.getElementsByTagName(tag)
        .let { list -> (0 until list.length).map { (list.item(it) as Element).getAttribute("android:name") } }
}
