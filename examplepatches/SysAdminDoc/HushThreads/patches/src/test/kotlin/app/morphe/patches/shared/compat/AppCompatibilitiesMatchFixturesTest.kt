/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Modified for Hushfacebook (Facebook), 2026.
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
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
 * The signing certificates and version code the bundle declares have to be the ones on Threads'
 * own builds. Morphe Manager warns about a picked APK whose certificate differs and treats a
 * version code it was not told about as unsupported, so a wrong value here would warn every user
 * who downloaded the genuine release.
 */
class AppCompatibilitiesMatchFixturesTest {

    @Test
    fun `every retained vendor build is signed by a declared certificate`() {
        val declared = AppCompatibilities.threads().single().signatures.orEmpty()
        assertEquals(
            "declared signatures",
            setOf(AppCompatibilities.THREADS_SIGNER_SHA256, AppCompatibilities.THREADS_ROTATED_SIGNER_SHA256),
            declared,
        )
        val undeclared = mutableMapOf<String, Set<String>>()
        var checked = 0
        for (fixture in Fixtures.files { it.isVendorContainer() }) {
            apksIn(fixture) { name, apk ->
                val result = ApkVerifier.Builder(apk).build().verify()
                assertTrue("$name does not verify: ${result.errors}", result.isVerified)
                // v3.1 rotation puts the newer key in its own block, for Android 13 and newer, so
                // the certificates of every v3 and v3.1 signer count beside the headline ones.
                val signers = (result.signerCertificates +
                    result.v3SchemeSigners.flatMap { it.certificates } +
                    result.v31SchemeSigners.flatMap { it.certificates })
                    .map { sha256(it.encoded) }.toSet()
                assertTrue("$name carries no signer", signers.isNotEmpty())
                val other = signers - declared
                if (other.isNotEmpty()) undeclared[name] = other
                checked++
            }
        }
        assertTrue("no fixture APK was checked", checked > 0)
        assertEquals("fixtures a certificate the bundle does not declare signed",
            emptyMap<String, Set<String>>(), undeclared)
    }

    @Test
    fun `every declared target carries the version code and floor of its vendor build`() {
        val targets = AppCompatibilities.threads().single().targets
        // Only the newest stable build is declared; a newer one replaces it in the same release.
        assertEquals("the declared version", listOf(AppCompatibilities.THREADS_TARGET_VERSION), targets.map { it.version })
        var checked = 0
        for (target in targets) {
            val version = checkNotNull(target.version)
            val codes = checkNotNull(target.versionCodes) { "the $version target declares no version codes" }
            val fixtures = Fixtures.files { it.isVendorContainer() && it.name.contains("-$version-") }
            for (fixture in fixtures) {
                ZipFile(fixture).use { zip ->
                    // An .apkm names the base base.apk, an .xapk after the package.
                    val base = checkNotNull(zip.getEntry("base.apk") ?: zip.getEntry("${AppCompatibilities.THREADS_PACKAGE}.apk")) {
                        "${fixture.name} holds no base APK"
                    }
                    val copy = File.createTempFile("fixture-base", ".apk")
                    try {
                        zip.getInputStream(base).use { input -> copy.outputStream().use { input.copyTo(it) } }
                        // Each read walks the buffer to its end, so each one gets its own view.
                        val manifest = RandomAccessFile(copy, "r").use { file ->
                            ApkUtils.getAndroidManifest(DataSources.asDataSource(file))
                        }
                        assertEquals(
                            "${fixture.name} version code",
                            codes.values.single(),
                            ApkUtils.getVersionCodeFromBinaryAndroidManifest(manifest.duplicate()),
                        )
                        assertEquals(
                            "${fixture.name} minSdk",
                            target.minSdk,
                            ApkUtils.getMinSdkVersionFromBinaryAndroidManifest(manifest.duplicate()),
                        )
                        checked++
                    } finally {
                        copy.delete()
                    }
                }
            }
        }
        assertEquals("one retained fixture for each declared target", targets.size, checked)
    }

    /**
     * A Threads build as the vendor or a mirror ships it, an .apkm or an .xapk. A merged .apk in the
     * same folder was rebuilt from one of these and carries no vendor signature.
     */
    private fun File.isVendorContainer(): Boolean =
        name.startsWith("threads-") && (extension == "apkm" || extension == "xapk")

    /** Every split a fixture holds, each copied out to a temp file. */
    private fun apksIn(fixture: File, check: (String, File) -> Unit) {
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
