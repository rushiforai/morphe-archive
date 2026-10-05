/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
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
import java.io.RandomAccessFile
import java.security.MessageDigest
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The signing certificate and version code the bundle declares have to be the ones on Pinterest's
 * own build. Morphe Manager warns about a picked APK whose certificate differs and treats a version
 * code it was not told about as unsupported, so a wrong value here would warn every user who
 * downloaded the genuine release.
 *
 * Pinterest ships as one universal APK, not a split bundle, so a fixture here is read directly:
 * nothing to unzip a base APK out of first.
 */
class AppCompatibilitiesMatchFixturesTest {

    @Test
    fun `every retained vendor build is signed by a declared certificate`() {
        val declared = AppCompatibilities.pinterest().single().signatures.orEmpty()
        assertEquals(
            "declared signatures",
            setOf(AppCompatibilities.PINTEREST_SIGNER_SHA256),
            declared,
        )
        val undeclared = mutableMapOf<String, Set<String>>()
        var checked = 0
        for (fixture in Fixtures.apks()) {
            val result = ApkVerifier.Builder(fixture).build().verify()
            assertTrue("${fixture.name} does not verify: ${result.errors}", result.isVerified)
            // v3.1 rotation puts the newer key in its own block, for Android 13 and newer, so the
            // certificates of every v3 and v3.1 signer count beside the headline ones.
            val signers = (result.signerCertificates +
                result.v3SchemeSigners.flatMap { it.certificates } +
                result.v31SchemeSigners.flatMap { it.certificates })
                .map { sha256(it.encoded) }.toSet()
            assertTrue("${fixture.name} carries no signer", signers.isNotEmpty())
            val other = signers - declared
            if (other.isNotEmpty()) undeclared[fixture.name] = other
            checked++
        }
        assertTrue("no fixture APK was checked", checked > 0)
        assertEquals("fixtures a certificate the bundle does not declare signed",
            emptyMap<String, Set<String>>(), undeclared)
    }

    /**
     * minSdk is declared metadata for Morphe Manager, not a mirror of the vendor manifest: it is
     * HushPinterest's own floor, which the extension's settings screen and diagnostics raise past
     * Pinterest's (Android 9), so the build's manifest value is only ever a lower bound on it.
     */
    @Test
    fun `every declared target carries the version code of its vendor build and a floor at least as high`() {
        val targets = AppCompatibilities.pinterest().single().targets
        assertEquals(
            "declared versions, newest first",
            listOf(AppCompatibilities.PINTEREST_TARGET_VERSION, "14.25.0"),
            targets.map { it.version },
        )
        var checked = 0
        for (target in targets) {
            val version = checkNotNull(target.version)
            val codes = checkNotNull(target.versionCodes) { "the $version target declares no version codes" }
            val fixtures = Fixtures.files { it.extension == "apk" && it.name.startsWith("pinterest-$version-") }
            for (fixture in fixtures) {
                // Each read walks the buffer to its end, so each one gets its own view.
                val manifest = RandomAccessFile(fixture, "r").use { file ->
                    ApkUtils.getAndroidManifest(DataSources.asDataSource(file))
                }
                assertEquals(
                    "${fixture.name} version code",
                    codes.values.single(),
                    ApkUtils.getVersionCodeFromBinaryAndroidManifest(manifest.duplicate()),
                )
                val vendorMinSdk = ApkUtils.getMinSdkVersionFromBinaryAndroidManifest(manifest.duplicate())
                assertTrue(
                    "${fixture.name}: declared minSdk ${target.minSdk} is lower than the build's own $vendorMinSdk, " +
                        "so Manager would offer this patch on a device the vendor build itself refuses",
                    checkNotNull(target.minSdk) { "the $version target declares no minSdk" } >= vendorMinSdk,
                )
                checked++
            }
        }
        assertEquals("one retained fixture for each declared target", targets.size, checked)
    }

    private fun sha256(bytes: ByteArray): String =
        MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }
}
