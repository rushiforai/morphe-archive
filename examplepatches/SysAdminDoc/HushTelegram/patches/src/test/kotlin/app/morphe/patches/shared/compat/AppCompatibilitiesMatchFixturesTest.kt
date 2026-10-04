/*
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
import com.reandroid.apk.ApkModule
import java.io.RandomAccessFile
import java.io.StringReader
import java.io.StringWriter
import java.security.MessageDigest
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.xml.sax.InputSource
import org.xmlpull.v1.XmlPullParserFactory
import javax.xml.parsers.DocumentBuilderFactory

/**
 * The signing certificate and version code the bundle declares have to be the ones on telegram.org's
 * own build. Morphe Manager warns about a picked APK whose certificate differs and treats a version
 * code it was not told about as unsupported, so a wrong value here would warn every user who
 * downloaded the genuine release.
 *
 * Telegram ships as one universal APK, not a split bundle, so a fixture here is read directly:
 * nothing to unzip a base APK out of first.
 */
class AppCompatibilitiesMatchFixturesTest {

    @Test
    fun `every retained vendor build is signed by a declared certificate`() {
        val compatibilities = AppCompatibilities.telegram().associateBy { it.packageName }
        for (compatibility in compatibilities.values) assertEquals(
            "${compatibility.packageName} declared signatures", setOf(AppCompatibilities.TELEGRAM_SIGNER_SHA256),
            compatibility.signatures.orEmpty())
        val undeclared = mutableMapOf<String, Set<String>>()
        var checked = 0
        for (fixture in Fixtures.apks()) {
            val identity = identity(fixture)
            val declared = checkNotNull(compatibilities[identity.first]) {
                "${fixture.name} is an undeclared package ${identity.first}"
            }.signatures.orEmpty()
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
     * HushTelegram's own floor, which the extension's settings screen and diagnostics raise past
     * telegram.org's (Android 5), so the build's manifest value is only ever a lower bound on it.
     */
    @Test
    fun `every declared target carries the version code of its vendor build and a floor at least as high`() {
        val compatibilities = AppCompatibilities.telegram()
        assertEquals(
            "only independently verified distributions and versions",
            mapOf("org.telegram.messenger.web" to listOf("12.10.6"), "org.telegram.messenger.beta" to listOf("12.10.7")),
            compatibilities.associate { it.packageName to it.targets.map { target -> target.version } },
        )
        var checked = 0
        for (compatibility in compatibilities) for (target in compatibility.targets) {
            val version = checkNotNull(target.version)
            val codes = checkNotNull(target.versionCodes) { "the $version target declares no version codes" }
            val fixtures = codes.values.toSet().flatMap { code ->
                Fixtures.files { it.name == "${Fixtures.prefix(compatibility.packageName)}-$version-$code.apk" }
            }
            for (fixture in fixtures) {
                assertEquals("${fixture.name} native package and version name", compatibility.packageName to version,
                    identity(fixture))
                // Each read walks the buffer to its end, so each one gets its own view.
                val manifest = RandomAccessFile(fixture, "r").use { file ->
                    ApkUtils.getAndroidManifest(DataSources.asDataSource(file))
                }
                assertEquals(
                    "${fixture.name} version code",
                    codes.values.toSet().single(),
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
        assertEquals("one retained fixture for each declared package target", compatibilities.sumOf { it.targets.size }, checked)
    }

    private fun identity(fixture: java.io.File): Pair<String, String> {
        val xml = StringWriter()
        ApkModule.loadApkFile(fixture).use { module ->
            module.tableBlock
            XmlPullParserFactory.newInstance().newSerializer().apply { setOutput(xml) }
                .also { module.androidManifest.serialize(it) }
        }
        val factory = DocumentBuilderFactory.newInstance().apply {
            setFeature("http://apache.org/xml/features/disallow-doctype-decl", true)
        }
        val manifest = factory.newDocumentBuilder().parse(InputSource(StringReader(xml.toString()))).documentElement
        return manifest.getAttribute("package") to manifest.getAttribute("android:versionName")
    }

    private fun sha256(bytes: ByteArray): String =
        MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }
}
