package app.ckzombies.patches.compat

import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.StringWriter
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class UnusedPermissionsPatchTest {
    /** The parts of Glu's manifest this patch touches, and some of what it must leave alone. */
    private val manifest = """
        <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.glu.android.zombsniper">
            <application android:name="ZombSniperApplication">
                <activity android:name="com.tapjoy.TJCOffersWebView"/>
                <receiver android:exported="true" android:name="com.tapjoy.TapjoyReferralTracker">
                    <intent-filter><action android:name="com.android.vending.INSTALL_REFERRER"/></intent-filter>
                </receiver>
                <service android:name="com.glu.android.iap.GluGoogleIAP"/>
                <receiver android:name="com.glu.googleiap.BillingReceiver"/>
                <service android:name="com.glu.platform.android.GluNotificationService"/>
                <receiver android:name="com.glu.platform.android.GluPushHandler"/>
                <receiver android:name="com.urbanairship.CoreReceiver">
                    <intent-filter><action android:name="android.intent.action.BOOT_COMPLETED"/></intent-filter>
                </receiver>
                <receiver android:name="com.urbanairship.push.c2dm.C2DMPushReceiver" android:permission="com.google.android.c2dm.permission.SEND"/>
                <service android:name="com.urbanairship.push.PushService" android:process=":com.urbanairship.push.process"/>
            </application>
            <permission android:name="com.glu.android.zombsniper.permission.C2D_MESSAGE" android:protectionLevel="signature"/>
            <uses-permission android:name="com.glu.android.zombsniper.permission.C2D_MESSAGE"/>
            <uses-permission android:name="com.google.android.c2dm.permission.RECEIVE"/>
            <uses-permission android:name="com.android.vending.BILLING"/>
            <uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
            <uses-permission android:name="com.android.vending.CHECK_LICENSE"/>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.GET_ACCOUNTS"/>
            <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            <uses-permission android:name="android.permission.VIBRATE"/>
            <uses-permission android:name="android.permission.WAKE_LOCK"/>
            <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
        </manifest>
    """.trimIndent()

    private fun parse(xml: String): Document =
        DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(xml.byteInputStream())

    private fun names(document: Document, tag: String): List<String> =
        document.getElementsByTagName(tag).let { list ->
            (0 until list.length).map { (list.item(it) as Element).getAttribute("android:name") }
        }

    private fun Document.text(): String = StringWriter().also {
        TransformerFactory.newInstance().newTransformer().transform(DOMSource(this), StreamResult(it))
    }.toString()

    @Test
    fun removesExactlyTheListedEntries() {
        val document = parse(manifest)
        removeUnusedEntries(document)

        assertEquals(
            listOf(
                "com.android.vending.BILLING", "com.android.vending.CHECK_LICENSE", "android.permission.INTERNET",
                "android.permission.ACCESS_NETWORK_STATE", "android.permission.WRITE_EXTERNAL_STORAGE",
                "android.permission.VIBRATE", "android.permission.WAKE_LOCK",
            ),
            names(document, "uses-permission"),
        )
        assertEquals(emptyList(), names(document, "permission"))
        assertEquals(listOf("com.glu.googleiap.BillingReceiver"), names(document, "receiver"))
        assertEquals(
            listOf("com.glu.android.iap.GluGoogleIAP", "com.glu.platform.android.GluNotificationService"),
            names(document, "service"),
        )
        assertEquals(listOf("com.tapjoy.TJCOffersWebView"), names(document, "activity"))
    }

    @Test
    fun namesThePackagePermissionAfterThePackage() {
        val document = parse(manifest.replace("com.glu.android.zombsniper", "com.example.other"))
        removeUnusedEntries(document)
        assertEquals(emptyList(), names(document, "permission"))
    }

    @Test
    fun aManifestMissingAnEntryIsRefusedAndLeftAlone() {
        for (gone in listOf(
            """<uses-permission android:name="android.permission.READ_PHONE_STATE"/>""",
            """<service android:name="com.urbanairship.push.PushService" android:process=":com.urbanairship.push.process"/>""",
        )) {
            val xml = manifest.replace(gone, "")
            val document = parse(xml)
            val before = document.text()
            assertFailsWith<PatchException> { removeUnusedEntries(document) }
            assertEquals(before, document.text(), "nothing removed when $gone is missing")
        }
    }

    @Test
    fun appliedTwiceIsRefused() {
        val document = parse(manifest)
        removeUnusedEntries(document)
        assertFailsWith<PatchException> { removeUnusedEntries(document) }
    }
}
