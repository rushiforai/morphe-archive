/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.privacy

import app.morphe.patcher.patch.PatchException
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.w3c.dom.Element

class AnalyticsManifestTest {
    @Test
    fun `Firebase deactivation cannot execute before the full bytecode preflight succeeds`() {
        assertTrue(disableAnalyticsPatch.dependencies.contains(disableFirebaseAnalyticsManifestPatch))
        assertTrue(disableFirebaseAnalyticsManifestPatch.dependencies.contains(analyticsPreflightPatch))
    }

    @Test
    fun `deactivation preserves Firebase push auth and all other component declarations`() {
        val document = parse("""
            <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.pinterest">
                <uses-permission android:name="android.permission.INTERNET"/>
                <application android:name="com.pinterest.ReleaseHiltApplication">
                    <provider android:name="com.google.firebase.provider.FirebaseInitProvider" android:authorities="com.pinterest.firebaseinitprovider"/>
                    <service android:name="com.pinterest.pushnotification.MessagingService" android:exported="false"/>
                    <activity android:name="com.pinterest.authentication.EmailLoginActivity" android:exported="false"/>
                    <meta-data android:name="firebase_messaging_auto_init_enabled" android:value="true"/>
                </application>
            </manifest>
        """)
        deactivateFirebaseAnalytics(document)
        assertEquals(1, document.getElementsByTagName("provider").length)
        assertEquals(1, document.getElementsByTagName("service").length)
        assertEquals(1, document.getElementsByTagName("activity").length)
        assertEquals(1, document.getElementsByTagName("uses-permission").length)
        // Messaging's entry is untouched, then every collection switch once, in order, with its value.
        assertEquals(listOf("firebase_messaging_auto_init_enabled" to "true") + ANALYTICS_MANIFEST_FLAGS.toList(), metadata(document))
        assertEquals(listOf(
            FIREBASE_DEACTIVATED to "true",
            "firebase_crashlytics_collection_enabled" to "false",
            "firebase_performance_collection_deactivated" to "true",
            "google_analytics_adid_collection_enabled" to "false",
            "google_analytics_default_allow_analytics_storage" to "false",
            "google_analytics_default_allow_ad_storage" to "false",
            "google_analytics_default_allow_ad_user_data" to "false",
            "google_analytics_default_allow_ad_personalization_signals" to "false",
        ), ANALYTICS_MANIFEST_FLAGS.toList())
        assertTrue("no Firebase Messaging, Installations or sign-in switch is written", ANALYTICS_MANIFEST_FLAGS.keys.none {
            it.contains("messaging") || it.contains("installations") || it.contains("auth")
        })
    }

    @Test
    fun `existing deactivation metadata changes in place and duplicate declarations refuse`() {
        val document = parse("""
            <manifest xmlns:android="http://schemas.android.com/apk/res/android"><application>
                <meta-data android:name="$FIREBASE_DEACTIVATED" android:resource="@bool/disabled"/>
            </application></manifest>
        """)
        deactivateFirebaseAnalytics(document)
        deactivateFirebaseAnalytics(document)
        val entries = document.getElementsByTagName("meta-data")
        assertEquals(ANALYTICS_MANIFEST_FLAGS.size, entries.length)
        val flag = entries.item(0) as Element
        assertEquals(FIREBASE_DEACTIVATED, flag.getAttribute("android:name"))
        assertEquals("true", flag.getAttribute("android:value"))
        assertEquals("", flag.getAttribute("android:resource"))
        assertEquals(ANALYTICS_MANIFEST_FLAGS.toList(), metadata(document))
        val duplicate = parse("""
            <manifest xmlns:android="http://schemas.android.com/apk/res/android"><application>
                <meta-data android:name="$FIREBASE_DEACTIVATED" android:value="false"/>
                <meta-data android:name="$FIREBASE_DEACTIVATED" android:value="false"/>
            </application></manifest>
        """)
        assertThrows(PatchException::class.java) { deactivateFirebaseAnalytics(duplicate) }
    }

    @Test
    fun `granted consent defaults turn denied in place and a repeated switch refuses before any edit`() {
        val document = parse("""
            <manifest xmlns:android="http://schemas.android.com/apk/res/android"><application>
                <meta-data android:name="google_analytics_default_allow_ad_storage" android:value="true" android:extra="kept"/>
                <meta-data android:name="firebase_crashlytics_collection_enabled" android:resource="@bool/crashlytics"/>
            </application></manifest>
        """)
        deactivateFirebaseAnalytics(document)
        val entries = metadataElements(document)
        assertEquals(ANALYTICS_MANIFEST_FLAGS.size, entries.size)
        assertEquals("false", entries[0].getAttribute("android:value"))
        assertEquals("kept", entries[0].getAttribute("android:extra"))
        assertEquals("false", entries[1].getAttribute("android:value"))
        assertEquals("", entries[1].getAttribute("android:resource"))
        assertEquals(ANALYTICS_MANIFEST_FLAGS.toList().sortedBy { it.first }, metadata(document).sortedBy { it.first })

        for (name in ANALYTICS_MANIFEST_FLAGS.keys) {
            val repeated = parse("""
                <manifest xmlns:android="http://schemas.android.com/apk/res/android"><application>
                    <meta-data android:name="google_analytics_default_allow_analytics_storage" android:value="true"/>
                    <meta-data android:name="$name" android:value="true"/>
                    <meta-data android:name="$name" android:value="true"/>
                </application></manifest>
            """)
            val before = metadata(repeated)
            assertThrows(name, PatchException::class.java) { deactivateFirebaseAnalytics(repeated) }
            assertEquals("$name: a refused edit changed the manifest", before, metadata(repeated))
        }
    }

    private fun metadataElements(document: org.w3c.dom.Document): List<Element> = document.getElementsByTagName("meta-data")
        .let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }

    private fun metadata(document: org.w3c.dom.Document) = metadataElements(document)
        .map { it.getAttribute("android:name") to it.getAttribute("android:value") }

    private fun parse(xml: String) = DocumentBuilderFactory.newInstance().newDocumentBuilder()
        .parse(ByteArrayInputStream(xml.trimIndent().toByteArray()))
}
