package app.deadcrossing.patches.compat

import app.adebisi.patches.shared.namedElements
import app.adebisi.patches.shared.parseManifestXml
import app.adebisi.patches.shared.removeMetaData
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class UnusedPermissionsManifestTest {
    @Test
    fun `stock unused entries are removed and billing stays`() {
        val document = parseManifestXml(STOCK)
        removeUnusedEntries(document)
        removeMetaData(document, REMOVED_META)
        for ((tag, name) in REMOVED_COMPONENTS) {
            assertEquals(0, namedElements(document, tag, listOf(name)).size, name)
        }
        for (name in REMOVED_PERMISSIONS) {
            assertEquals(0, namedElements(document, "uses-permission", listOf(name)).size, name)
        }
        assertEquals(1, namedElements(document, "uses-permission", listOf("android.permission.INTERNET")).size)
        assertEquals(1, namedElements(document, "uses-permission", listOf("android.permission.ACCESS_NETWORK_STATE")).size)
        assertEquals(1, namedElements(document, "uses-permission", listOf("android.permission.WRITE_EXTERNAL_STORAGE")).size)
        assertEquals(1, namedElements(document, "uses-permission", listOf("android.permission.WAKE_LOCK")).size)
        assertEquals(1, namedElements(document, "uses-permission", listOf("android.permission.VIBRATE")).size)
        assertEquals(1, namedElements(document, "uses-permission", listOf("com.android.vending.BILLING")).size)
        assertEquals(1, namedElements(document, "service", listOf("com.feelingtouch.unityandroid.pay.checkout.BillingService")).size)
        assertEquals(0, namedElements(document, "meta-data", listOf("com.mobclix.APPLICATION_ID")).size)
        assertEquals(1, namedElements(document, "meta-data", listOf("IAP_KEY")).size)
        assertEquals(0, namedElements(document, "activity", listOf("com.mobclix.android.sdk.MobclixBrowserActivity")).size)
    }

    @Test
    fun `kept permissions are the ones UnityPlayer and IOUtil still call`() {
        assertEquals(
            listOf(
                "android.permission.READ_PHONE_STATE",
                "android.permission.ACCESS_WIFI_STATE",
            ),
            REMOVED_PERMISSIONS,
        )
        assertEquals(listOf("com.mobclix.APPLICATION_ID"), REMOVED_META)
        assertTrue(REMOVED_COMPONENTS.contains("activity" to "com.mobclix.android.sdk.MobclixBrowserActivity"))
        assertFalse("android.permission.VIBRATE" in REMOVED_PERMISSIONS)
        assertFalse("android.permission.WAKE_LOCK" in REMOVED_PERMISSIONS)
        assertFalse("android.permission.WRITE_EXTERNAL_STORAGE" in REMOVED_PERMISSIONS)
        assertFalse("android.permission.ACCESS_NETWORK_STATE" in REMOVED_PERMISSIONS)
        assertFalse("android.permission.INTERNET" in REMOVED_PERMISSIONS)
        assertFalse("com.android.vending.BILLING" in REMOVED_PERMISSIONS)
        assertFalse("IAP_KEY" in REMOVED_META)
    }

    @Test
    fun `a missing permission is refused`() {
        assertFailsWith<app.morphe.patcher.patch.PatchException> {
            removeUnusedEntries(parseManifestXml(NO_WIFI))
        }
    }

    @Test
    fun `a missing mobclix meta is refused`() {
        val document = parseManifestXml(NO_MOBCLIX_META)
        removeUnusedEntries(document)
        assertFailsWith<app.morphe.patcher.patch.PatchException> {
            removeMetaData(document, REMOVED_META)
        }
        assertEquals(1, namedElements(document, "meta-data", listOf("IAP_KEY")).size)
    }

    private companion object {
        const val STOCK = """
            <manifest package="com.feelingtouch.crossx">
              <application>
                <receiver android:name="com.feelingtouch.bannerad.pushAd.PushAdReceiver"/>
                <receiver android:name="com.feelingtouch.bannerad.pushAd.PushAdClickReceiver"/>
                <receiver android:name="com.google.android.apps.analytics.AnalyticsReceiver"/>
                <service android:name="com.feelingtouch.bannerad.pushAd.PushAdService"/>
                <service android:name="com.feelingtouch.unityandroid.pay.checkout.BillingService"/>
                <activity android:name="com.mobclix.android.sdk.MobclixBrowserActivity"/>
                <meta-data android:name="com.mobclix.APPLICATION_ID" android:value="dead"/>
                <meta-data android:name="IAP_KEY" android:value="keep"/>
              </application>
              <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
              <uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
              <uses-permission android:name="android.permission.INTERNET"/>
              <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
              <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
              <uses-permission android:name="android.permission.WAKE_LOCK"/>
              <uses-permission android:name="android.permission.VIBRATE"/>
              <uses-permission android:name="com.android.vending.BILLING"/>
            </manifest>
        """
        const val NO_MOBCLIX_META = """
            <manifest package="com.feelingtouch.crossx">
              <application>
                <receiver android:name="com.feelingtouch.bannerad.pushAd.PushAdReceiver"/>
                <receiver android:name="com.feelingtouch.bannerad.pushAd.PushAdClickReceiver"/>
                <receiver android:name="com.google.android.apps.analytics.AnalyticsReceiver"/>
                <service android:name="com.feelingtouch.bannerad.pushAd.PushAdService"/>
                <activity android:name="com.mobclix.android.sdk.MobclixBrowserActivity"/>
                <meta-data android:name="IAP_KEY" android:value="keep"/>
              </application>
              <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
              <uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
            </manifest>
        """
        const val NO_WIFI = """
            <manifest package="com.feelingtouch.crossx">
              <application>
                <receiver android:name="com.feelingtouch.bannerad.pushAd.PushAdReceiver"/>
                <receiver android:name="com.feelingtouch.bannerad.pushAd.PushAdClickReceiver"/>
                <receiver android:name="com.google.android.apps.analytics.AnalyticsReceiver"/>
                <service android:name="com.feelingtouch.bannerad.pushAd.PushAdService"/>
                <activity android:name="com.mobclix.android.sdk.MobclixBrowserActivity"/>
              </application>
              <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            </manifest>
        """
    }
}
