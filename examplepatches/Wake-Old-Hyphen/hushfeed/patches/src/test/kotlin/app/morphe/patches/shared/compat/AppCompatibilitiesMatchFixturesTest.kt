package app.morphe.patches.shared.compat

import app.morphe.Fixtures
import com.android.apksig.ApkVerifier
import com.android.apksig.apk.ApkUtils
import com.android.apksig.util.DataSources
import java.io.File
import java.io.RandomAccessFile
import java.security.MessageDigest
import java.util.zip.ZipFile
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The signing certificate and version code the bundle declares have to be the ones on TikTok's own
 * builds. Morphe Manager warns about a picked APK whose certificate differs and treats a version
 * code it was not told about as unsupported, so a wrong value here would warn every user who
 * downloaded the genuine release.
 */
class AppCompatibilitiesMatchFixturesTest {

    @Test
    fun `every retained vendor build is signed by the declared certificate`() {
        val signers = mutableMapOf<String, Set<String>>()
        for (fixture in Fixtures.files { it.extension == "apk" || it.extension == "apkm" }) {
            apksIn(fixture) { name, apk ->
                val result = ApkVerifier.Builder(apk).build().verify()
                assertTrue("$name does not verify: ${result.errors}", result.isVerified)
                signers[name] = result.signerCertificates.map { sha256(it.encoded) }.toSet()
            }
        }
        val declared = AppCompatibilities.tiktok4703().single().signatures
        assertEquals("declared signatures", setOf(AppCompatibilities.TIKTOK_SIGNER_SHA256), declared)
        val other = signers.filterValues { it != declared }
        assertEquals("fixtures another certificate signed", emptyMap<String, Set<String>>(), other)
    }

    @Test
    fun `the declared target carries the version code of the vendor build`() {
        val target = AppCompatibilities.tiktok4703().single().targets.single()
        val version = checkNotNull(target.version)
        val codes = checkNotNull(target.versionCodes) { "the $version target declares no version codes" }
        assertEquals("declared codes for $version", setOf(AppCompatibilities.TIKTOK_4703_VERSION_CODE), codes.values.toSet())

        val fixtures = Fixtures.files {
            it.extension == "apk" && (it.name.contains("_$version-") || it.name == "tiktok-$version.apk")
        }
        for (fixture in fixtures) {
            val manifest = RandomAccessFile(fixture, "r").use { file ->
                ApkUtils.getAndroidManifest(DataSources.asDataSource(file))
            }
            assertEquals(
                "${fixture.name} version code",
                AppCompatibilities.TIKTOK_4703_VERSION_CODE,
                ApkUtils.getVersionCodeFromBinaryAndroidManifest(manifest),
            )
        }
    }

    /** Every APK a fixture holds: itself, or each split inside an .apkm, copied out to a temp file. */
    private fun apksIn(fixture: File, check: (String, File) -> Unit) {
        if (fixture.extension == "apk") return check(fixture.name, fixture)
        ZipFile(fixture).use { zip ->
            val apks = zip.entries().asSequence().filter { it.name.endsWith(".apk") }.toList()
            assertTrue("${fixture.name} holds no APK", apks.isNotEmpty())
            for (entry in apks) {
                val copy = File.createTempFile("fixture-split", ".apk")
                try {
                    zip.getInputStream(entry).use { input -> copy.outputStream().use { input.copyTo(it) } }
                    check("${fixture.name}!${entry.name}", copy)
                } finally {
                    copy.delete()
                }
            }
        }
    }

    private fun sha256(bytes: ByteArray): String =
        MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }
}
