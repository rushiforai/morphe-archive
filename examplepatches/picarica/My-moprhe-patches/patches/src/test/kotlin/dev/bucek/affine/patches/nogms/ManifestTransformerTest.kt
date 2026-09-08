package dev.bucek.affine.patches.nogms

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertThrows
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory

class ManifestTransformerTest {
    @Test
    fun `restores AFFiNE and removes Google startup declarations`() {
        val document = parseManifest(includeBundleMetadata = true)

        val result = ManifestTransformer.transform(document)

        val application = document.getElementsByTagName("application").item(0) as Element
        assertEquals("app.affine.pro.AFFiNEApp", application.androidName())
        assertEquals(5, result.removedPermissions.size)
        assertEquals(11, result.removedComponents.size)
        assertEquals(6, result.removedMetadata.size)

        val xml = document.toXmlLikeText()
        assertFalse(xml.contains("com.pairip"))
        assertFalse(xml.contains("com.google.firebase"))
        assertFalse(xml.contains("com.google.android.gms"))
        assertFalse(xml.contains("com.google.android.datatransport"))
        assertTrue(xml.contains("app.affine.pro.MainActivity"))
        assertTrue(xml.contains("androidx.startup.InitializationProvider"))
    }

    @Test
    fun `accepts bundle metadata already removed by Morphe merger`() {
        val result = ManifestTransformer.transform(parseManifest(includeBundleMetadata = false))

        assertEquals(setOf("com.google.android.gms.version"), result.removedMetadata)
    }

    @Test
    fun `rejects a non PairIP application instead of silently half patching`() {
        val document = parseManifest(includeBundleMetadata = false)
        val application = document.getElementsByTagName("application").item(0) as Element
        application.setAttributeNS(ANDROID_NAMESPACE, "android:name", "app.affine.pro.AFFiNEApp")

        val error = assertThrows(IllegalArgumentException::class.java) {
            ManifestTransformer.transform(document)
        }
        assertTrue(error.message!!.contains("Unexpected application class"))
    }

    @Test
    fun `rejects a changed manifest missing a required Firebase component`() {
        val document = parseManifest(includeBundleMetadata = false)
        val providers = document.getElementsByTagName("provider")
        val firebase = (0 until providers.length)
            .map { providers.item(it) as Element }
            .first { it.androidName() == "com.google.firebase.provider.FirebaseInitProvider" }
        firebase.parentNode.removeChild(firebase)

        val error = assertThrows(IllegalStateException::class.java) {
            ManifestTransformer.transform(document)
        }
        assertTrue(error.message!!.contains("Expected startup components"))
    }

    private fun parseManifest(includeBundleMetadata: Boolean): Document {
        val metadata = if (includeBundleMetadata) {
            """
+            <meta-data android:name="com.android.vending.splits.required" android:value="true"/>
+            <meta-data android:name="com.android.stamp.source" android:value="https://play.google.com/store"/>
+            <meta-data android:name="com.android.stamp.type" android:value="STAMP_TYPE_DISTRIBUTION_APK"/>
+            <meta-data android:name="com.android.vending.splits" android:resource="@xml/splits0"/>
+            <meta-data android:name="com.android.vending.derived.apk.id" android:value="3"/>
            """.trimMargin("+")
        } else {
            ""
        }

        val xml = """
            <manifest xmlns:android="$ANDROID_NAMESPACE" package="app.affine.pro">
                <uses-permission android:name="android.permission.INTERNET"/>
                <uses-permission android:name="com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE"/>
                <uses-permission android:name="com.google.android.gms.permission.AD_ID"/>
                <uses-permission android:name="android.permission.ACCESS_ADSERVICES_ATTRIBUTION"/>
                <uses-permission android:name="android.permission.ACCESS_ADSERVICES_AD_ID"/>
                <uses-permission android:name="com.android.vending.CHECK_LICENSE"/>
                <application android:name="com.pairip.application.Application">
                    <activity android:name="app.affine.pro.MainActivity"/>
                    <provider android:name="androidx.startup.InitializationProvider"/>
                    <receiver android:name="com.google.android.gms.measurement.AppMeasurementReceiver"/>
                    <service android:name="com.google.android.gms.measurement.AppMeasurementService"/>
                    <service android:name="com.google.android.gms.measurement.AppMeasurementJobService"/>
                    <service android:name="com.google.firebase.components.ComponentDiscoveryService"/>
                    <service android:name="com.google.firebase.sessions.SessionLifecycleService"/>
                    <provider android:name="com.google.firebase.provider.FirebaseInitProvider"/>
                    <activity android:name="com.google.android.gms.common.api.GoogleApiActivity"/>
                    <service android:name="com.google.android.datatransport.runtime.backends.TransportBackendDiscovery"/>
                    <service android:name="com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService"/>
                    <receiver android:name="com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver"/>
                    <activity android:name="com.pairip.licensecheck.LicenseActivity"/>
                    <meta-data android:name="com.google.android.gms.version" android:value="123"/>
                    $metadata
                </application>
            </manifest>
        """.trimIndent()

        return DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
            .newDocumentBuilder()
            .parse(ByteArrayInputStream(xml.toByteArray()))
    }

    private fun Element.androidName() = getAttributeNS(ANDROID_NAMESPACE, "name")

    private fun Document.toXmlLikeText(): String = documentElement.textContent + walk(documentElement)

    private fun walk(element: Element): String = buildString {
        append(element.tagName)
        for (index in 0 until element.attributes.length) {
            append(element.attributes.item(index).nodeValue)
        }
        for (index in 0 until element.childNodes.length) {
            val child = element.childNodes.item(index)
            if (child is Element) append(walk(child))
        }
    }

    private companion object {
        const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
    }
}
