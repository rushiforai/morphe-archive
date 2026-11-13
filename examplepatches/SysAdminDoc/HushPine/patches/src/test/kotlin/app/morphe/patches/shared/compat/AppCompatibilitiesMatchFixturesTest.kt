package app.morphe.patches.shared.compat

import app.morphe.Fixtures
import app.morphe.util.BundleVerifier
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
 * The signing certificate and version code the bundle declares have to be the ones on PineDrama's
 * own builds. Morphe Manager warns about a picked APK whose certificate differs and treats a version
 * code it was not told about as unsupported, so a wrong value here would warn every user who
 * downloaded the genuine release.
 */
class AppCompatibilitiesMatchFixturesTest {

    @Test
    fun `the bundle producer description names every declared host`() {
        val buildScript = File("build.gradle.kts").takeIf { it.isFile }
            ?: File("patches/build.gradle.kts")
        assertTrue("patches build script is missing", buildScript.isFile)
        val description = Regex("""description = "(HushPine patches for PineDrama[^"]+)"""")
            .find(buildScript.readText())?.groupValues?.get(1)
        BundleVerifier.requireTargetDescription(description)
    }

    @Test
    fun `the bundle verifier rejects an omitted host and version lookalikes`() {
        val versions = AppCompatibilities.pineDrama().single().targets.map { checkNotNull(it.version) }
        BundleVerifier.requireTargetDescription("PineDrama " + versions.joinToString(", "))
        for (missing in versions) {
            val others = versions.filter { it != missing }.joinToString(", ")
            for (description in listOf<String?>(null, "PineDrama $others", "PineDrama $others, ${missing}0")) {
                val failure = runCatching { BundleVerifier.requireTargetDescription(description) }.exceptionOrNull()
                assertTrue("accepted a description missing $missing: $description", failure is IllegalArgumentException)
                assertTrue("refusal must name $missing", failure!!.message!!.contains(missing))
            }
        }
    }

    @Test
    fun `every retained vendor build is signed by the declared certificate`() {
        val signers = mutableMapOf<String, Set<String>>()
        // A _merged.apk is one this machine merged out of the .apkm, so nobody signed it.
        val vendor = Fixtures.files { (it.extension == "apk" || it.extension == "apkm") && !it.name.endsWith("_merged.apk") }
        assertTrue("no vendor build to read a signature from", vendor.any())
        for (fixture in vendor) {
            apksIn(fixture) { name, apk ->
                val result = ApkVerifier.Builder(apk).build().verify()
                assertTrue("$name does not verify: ${result.errors}", result.isVerified)
                signers[name] = result.signerCertificates.map { sha256(it.encoded) }.toSet()
            }
        }
        val declared = AppCompatibilities.pineDrama().single().signatures
        assertEquals("declared signatures", setOf(AppCompatibilities.PINEDRAMA_SIGNER_SHA256), declared)
        val other = signers.filterValues { it != declared }
        assertEquals("fixtures another certificate signed", emptyMap<String, Set<String>>(), other)
    }

    @Test
    fun `each declared target carries the version code of its vendor build`() {
        val pineDrama = AppCompatibilities.pineDrama().single()
        assertEquals("com.ss.android.ttmd.video", pineDrama.packageName)
        val expected = mapOf("47.7.3" to AppCompatibilities.PINEDRAMA_4773_VERSION_CODE)
        assertEquals("declared versions", expected.keys, pineDrama.targets.map { it.version }.toSet())
        assertEquals("the codes the Play Store patch accepts", expected.values.toSet(), AppCompatibilities.DECLARED_VERSION_CODES)
        for (target in pineDrama.targets) {
            val version = checkNotNull(target.version)
            val codes = checkNotNull(target.versionCodes) { "the $version target declares no version codes" }
            assertEquals("declared codes for $version", setOf(expected.getValue(version)), codes.values.toSet())

            val fixture = Fixtures.apkOf(version)
            val manifest = RandomAccessFile(fixture, "r").use { file ->
                ApkUtils.getAndroidManifest(DataSources.asDataSource(file))
            }
            assertEquals(
                "${fixture.name} version code",
                expected.getValue(version),
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
