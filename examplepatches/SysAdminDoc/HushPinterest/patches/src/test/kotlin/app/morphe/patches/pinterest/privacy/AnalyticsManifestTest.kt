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
        val entries = document.getElementsByTagName("meta-data")
        assertEquals(2, entries.length)
        assertEquals("firebase_messaging_auto_init_enabled", (entries.item(0) as Element).getAttribute("android:name"))
        assertEquals("true", (entries.item(0) as Element).getAttribute("android:value"))
        assertEquals(FIREBASE_DEACTIVATED, (entries.item(1) as Element).getAttribute("android:name"))
        assertEquals("true", (entries.item(1) as Element).getAttribute("android:value"))
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
        assertEquals(1, entries.length)
        val flag = entries.item(0) as Element
        assertEquals("true", flag.getAttribute("android:value"))
        assertEquals("", flag.getAttribute("android:resource"))
        val duplicate = parse("""
            <manifest xmlns:android="http://schemas.android.com/apk/res/android"><application>
                <meta-data android:name="$FIREBASE_DEACTIVATED" android:value="false"/>
                <meta-data android:name="$FIREBASE_DEACTIVATED" android:value="false"/>
            </application></manifest>
        """)
        assertThrows(PatchException::class.java) { deactivateFirebaseAnalytics(duplicate) }
    }

    private fun parse(xml: String) = DocumentBuilderFactory.newInstance().newDocumentBuilder()
        .parse(ByteArrayInputStream(xml.trimIndent().toByteArray()))
}
