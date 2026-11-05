package dev.utaa.linimal.patches.features.googleauth

import dev.utaa.linimal.patches.status.FeatureId
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNull
import org.w3c.dom.Element

class GoogleAuthTokenRoutingPatchTest {
    private val certificate = "89396DC419292473972813922867E6973D6F5C50"

    @Test
    fun `the spoofed signature is declared in lowercase under the application`() {
        val document = manifestDocument("<application />")

        GoogleAuthMicrogManifest.register(document, certificate)

        val metaData = document.getElementsByTagName("meta-data").item(0) as Element
        assertEquals("app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE", metaData.getAttribute("android:name"))
        assertEquals(certificate.lowercase(), metaData.getAttribute("android:value"))
        assertEquals("application", metaData.parentNode.nodeName)
    }

    /** Android 11 以上で MicroG-RE を見つけて bind するため、package visibility を宣言します。 */
    @Test
    fun `MicroG-RE is declared as a visible package`() {
        val document = manifestDocument("<application />")

        GoogleAuthMicrogManifest.register(document, certificate)

        val queries = document.getElementsByTagName("queries").item(0) as Element
        val visible = queries.getElementsByTagName("package").item(0) as Element
        assertEquals("manifest", queries.parentNode.nodeName)
        assertEquals("app.revanced.android.gms", visible.getAttribute("android:name"))
    }

    @Test
    fun `an existing declaration is not overwritten`() {
        val document = manifestDocument(
            "<application><meta-data android:name=\"app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE\" " +
                "android:value=\"x\" /></application>",
        )

        assertFailsWith<GoogleAuthMicrogManifestException> {
            GoogleAuthMicrogManifest.register(document, certificate)
        }
    }

    @Test
    fun `a manifest without a single application is rejected`() {
        assertFailsWith<GoogleAuthMicrogManifestException> {
            GoogleAuthMicrogManifest.register(manifestDocument(""), certificate)
        }
        assertFailsWith<GoogleAuthMicrogManifestException> {
            GoogleAuthMicrogManifest.register(manifestDocument("<application /><application />"), certificate)
        }
    }

    @Test
    fun `static parameters occupy the last registers`() {
        assertEquals(1..1, staticParameterRegisters(registerCount = 2, parameterCount = 1))
        assertEquals(4..6, staticParameterRegisters(registerCount = 7, parameterCount = 3))
        assertNull(staticParameterRegisters(registerCount = 2, parameterCount = 3))
        assertNull(staticParameterRegisters(registerCount = 2, parameterCount = 0))
    }

    @Test
    fun `an unconfigured certificate is reported as disabled`() {
        val record = googleAuthNotConfiguredRecord(PatchId.GOOGLE_AUTH_TOKEN_ROUTING)

        assertEquals(PatchStatus.DISABLED, record.status)
        assertEquals(0, record.expectedTargetCount)
    }

    @Test
    fun `all MicroG-RE patches belong to the Google Drive backup feature`() {
        assertEquals(FeatureId.GOOGLE_DRIVE_BACKUP, PatchId.GOOGLE_AUTH_SIGN_IN_ROUTING.featureId)
        assertEquals(FeatureId.GOOGLE_DRIVE_BACKUP, PatchId.GOOGLE_AUTH_ACCOUNT_PICKER_ROUTING.featureId)
        assertEquals(FeatureId.GOOGLE_DRIVE_BACKUP, PatchId.GOOGLE_AUTH_MICROG_MANIFEST.featureId)
        assertEquals(FeatureId.GOOGLE_DRIVE_BACKUP, PatchId.GOOGLE_AUTH_TOKEN_ROUTING.featureId)
        assertEquals(FeatureId.GOOGLE_DRIVE_BACKUP, PatchId.GOOGLE_AUTH_FAILURE_DIAGNOSTICS.featureId)
        assertEquals("linimal.google-drive-backup", FeatureId.GOOGLE_DRIVE_BACKUP.value)
    }

    private fun manifestDocument(applicationXml: String) = DocumentBuilderFactory.newInstance()
        .newDocumentBuilder()
        .parse(
            (
                "<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\" " +
                    "package=\"jp.naver.line.android\">$applicationXml</manifest>"
                ).byteInputStream(),
        )
}
