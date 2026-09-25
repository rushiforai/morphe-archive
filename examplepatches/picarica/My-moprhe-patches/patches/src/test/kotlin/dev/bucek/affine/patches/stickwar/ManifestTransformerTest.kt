package dev.bucek.affine.patches.stickwar

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
    fun `removes only PairIP launch licensing declarations`() {
        val document = parseManifest()

        val result = ManifestTransformer.transform(document)

        assertEquals(setOf("com.android.vending.CHECK_LICENSE"), result.removedPermissions)
        assertEquals(setOf("com.pairip.licensecheck.LicenseActivity"), result.removedComponents)

        val xml = document.toXmlLikeText()
        assertFalse(xml.contains("com.android.vending.CHECK_LICENSE"))
        assertFalse(xml.contains("com.pairip.licensecheck.LicenseActivity"))
        assertTrue(xml.contains("com.pairip.application.Application"))
        assertTrue(xml.contains("com.android.vending.BILLING"))
        assertTrue(xml.contains("com.google.android.play.core.assetpacks.AssetPackExtractionService"))
        assertTrue(xml.contains("com.google.android.gms.games.APP_ID"))
        assertTrue(xml.contains("com.google.firebase.provider.FirebaseInitProvider"))
    }

    @Test
    fun `rejects a non PairIP application wrapper`() {
        val document = parseManifest()
        val application = document.getElementsByTagName("application").item(0) as Element
        application.setAttributeNS(ANDROID_NAMESPACE, "android:name", "android.app.Application")

        val error = assertThrows(IllegalArgumentException::class.java) {
            ManifestTransformer.transform(document)
        }
        assertTrue(error.message!!.contains("Unexpected application class"))
    }

    @Test
    fun `rejects a changed manifest missing the license activity`() {
        val document = parseManifest()
        val activities = document.getElementsByTagName("activity")
        val licenseActivity = (0 until activities.length)
            .map { activities.item(it) as Element }
            .first { it.androidName() == "com.pairip.licensecheck.LicenseActivity" }
        licenseActivity.parentNode.removeChild(licenseActivity)

        val error = assertThrows(IllegalStateException::class.java) {
            ManifestTransformer.transform(document)
        }
        assertTrue(error.message!!.contains("license activity"))
    }

    @Test
    fun `rejects a changed manifest missing the license permission`() {
        val document = parseManifest()
        val permissions = document.getElementsByTagName("uses-permission")
        val licensePermission = (0 until permissions.length)
            .map { permissions.item(it) as Element }
            .first { it.androidName() == "com.android.vending.CHECK_LICENSE" }
        licensePermission.parentNode.removeChild(licensePermission)

        val error = assertThrows(IllegalStateException::class.java) {
            ManifestTransformer.transform(document)
        }
        assertTrue(error.message!!.contains("licensing permission"))
    }

    private fun parseManifest(): Document {
        val xml = """
            <manifest xmlns:android="$ANDROID_NAMESPACE" package="com.maxgames.stickwarlegacy">
                <uses-permission android:name="android.permission.INTERNET"/>
                <uses-permission android:name="com.android.vending.BILLING"/>
                <uses-permission android:name="com.android.vending.CHECK_LICENSE"/>
                <application android:name="com.pairip.application.Application">
                    <activity android:name="com.unity3d.player.UnityPlayerActivity"/>
                    <activity android:name="com.pairip.licensecheck.LicenseActivity"/>
                    <service android:name="com.google.android.play.core.assetpacks.AssetPackExtractionService"/>
                    <provider android:name="com.google.firebase.provider.FirebaseInitProvider"/>
                    <meta-data android:name="com.google.android.gms.games.APP_ID" android:value="123"/>
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