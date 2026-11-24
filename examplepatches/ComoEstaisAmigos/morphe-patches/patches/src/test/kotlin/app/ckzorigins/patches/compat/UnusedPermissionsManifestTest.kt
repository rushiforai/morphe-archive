package app.ckzorigins.patches.compat

import app.adebisi.patches.shared.namedElements
import app.adebisi.patches.shared.parseManifestXml
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class UnusedPermissionsManifestTest {
    @Test
    fun `stock unused entries are removed including duplicate permissions`() {
        val document = parseManifestXml(STOCK)
        removeUnusedEntries(document)
        for ((tag, name) in REMOVED_COMPONENTS) {
            assertEquals(0, namedElements(document, tag, listOf(name)).size, name)
        }
        for (name in REMOVED_PERMISSIONS) {
            assertEquals(0, namedElements(document, "uses-permission", listOf(name)).size, name)
        }
        assertEquals(2, namedElements(document, "uses-permission", listOf("android.permission.INTERNET")).size)
        assertEquals(1, namedElements(document, "uses-permission", listOf("android.permission.WRITE_EXTERNAL_STORAGE")).size)
        assertEquals(1, namedElements(document, "uses-permission", listOf("android.permission.WAKE_LOCK")).size)
        assertEquals(1, namedElements(document, "uses-permission", listOf("android.permission.VIBRATE")).size)
        assertEquals(1, namedElements(document, "uses-permission", listOf("com.android.vending.BILLING")).size)
        assertEquals(1, namedElements(document, "service", listOf("com.glu.plugins.google.BillingService")).size)
    }

    @Test
    fun `a missing permission is refused`() {
        assertFailsWith<app.morphe.patcher.patch.PatchException> {
            removeUnusedEntries(parseManifestXml(NO_LOCATION))
        }
    }

    private companion object {
        const val STOCK = """
            <manifest package="com.glu.ckzombies2">
              <application>
                <receiver android:name="com.flurry.android.InstallReceiver"/>
                <receiver android:name="com.mobileapptracker.Tracker"/>
                <receiver android:name="com.glu.plugins.NotificationReceiver"/>
                <service android:name="com.glu.plugins.google.BillingService"/>
              </application>
              <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
              <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
              <uses-permission android:name="android.permission.GET_ACCOUNTS"/>
              <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
              <uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
              <uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
              <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
              <uses-permission android:name="com.android.vending.CHECK_LICENSE"/>
              <uses-permission android:name="android.permission.INTERNET"/>
              <uses-permission android:name="android.permission.INTERNET"/>
              <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
              <uses-permission android:name="android.permission.WAKE_LOCK"/>
              <uses-permission android:name="android.permission.VIBRATE"/>
              <uses-permission android:name="com.android.vending.BILLING"/>
            </manifest>
        """
        const val NO_LOCATION = """
            <manifest package="com.glu.ckzombies2">
              <application>
                <receiver android:name="com.flurry.android.InstallReceiver"/>
                <receiver android:name="com.mobileapptracker.Tracker"/>
                <receiver android:name="com.glu.plugins.NotificationReceiver"/>
              </application>
              <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
              <uses-permission android:name="android.permission.GET_ACCOUNTS"/>
              <uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
              <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
              <uses-permission android:name="com.android.vending.CHECK_LICENSE"/>
            </manifest>
        """
    }
}
