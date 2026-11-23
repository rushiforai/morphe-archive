package patches.upflix

import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assume.assumeTrue
import org.junit.Test
import java.io.File

/**
 * Guards the Upflix bundle patch. The crypto test always runs; the bundle replay runs when
 * UPFLIX_DECRYPTED_DIR / UPFLIX_EXPECTED_DIR point at a decrypted bundle and a verified
 * patched tree (see .analysis/upflix-5.12.10-ads-tracking).
 */
class UpflixBundleTest {

    @Test
    fun `asset cipher round trips arbitrary bytes`() {
        for (size in intArrayOf(0, 1, 15, 16, 17, 4096)) {
            val plain = ByteArray(size) { (it * 31).toByte() }
            assertArrayEquals(plain, decryptBundle(encryptBundle(plain)))
        }
    }

    @Test
    fun `every module anchor still exists and the result is clean`() {
        val decrypted = System.getenv("UPFLIX_DECRYPTED_DIR")?.let(::File)
        assumeTrue("UPFLIX_DECRYPTED_DIR not set", decrypted?.isDirectory == true)
        val expected = System.getenv("UPFLIX_EXPECTED_DIR")?.let(::File)
        assumeTrue("UPFLIX_EXPECTED_DIR not set", expected?.isDirectory == true)

        mapOf(
            "Resources/ui/common/RemoveAdsWindow.js" to PAYWALL_STUB,
            "Resources/ui/onboarding/AdsConsent.js" to ADS_CONSENT_STUB,
        ).forEach { (relative, stub) ->
            assertEquals("$relative stub differs", stub, File(expected, relative).readText())
        }

        val modules = MODULE_PATCHES.keys
        modules.forEach { relative ->
            val original = File(decrypted, relative).readText()
            val patched = patchModuleText(relative, original)
            val want = File(expected, relative).readText()
            if (want != patched) {
                File(System.getProperty("java.io.tmpdir"),
                    "upflix-actual-" + relative.replace('/', '_')).writeText(patched)
                File(System.getProperty("java.io.tmpdir"),
                    "upflix-expected-" + relative.replace('/', '_')).writeText(want)
            }
            assertEquals("$relative differs from the verified output", want, patched)
            listOf("ca-app-pub", "Admob.create", "Admob.AdaptiveBanner", "requestConsentForm",
                "firebase.analytics", "onetrust", "ipinfo.io", "Titanium.Platform.id").forEach { needle ->
                assertFalse("$relative still contains $needle", patched.contains(needle))
            }
        }
    }
}
