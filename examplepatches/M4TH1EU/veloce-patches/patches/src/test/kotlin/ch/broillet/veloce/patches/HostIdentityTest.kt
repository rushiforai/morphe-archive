package ch.broillet.veloce.patches

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.OptionException
import ch.broillet.veloce.patches.audiobookshelf.customBrowserPatch as audiobookshelf
import ch.broillet.veloce.patches.homeassistant.customCarHostPatch as homeassistant
import ch.broillet.veloce.patches.spotify.customBrowserPatch as spotify
import ch.broillet.veloce.patches.waze.customCarHostPatch as waze
import ch.broillet.veloce.patches.shared.certificateDigest
import ch.broillet.veloce.patches.shared.hostPackageName
import ch.broillet.veloce.patches.shared.VELOCE_CERTIFICATE
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class HostIdentityTest {
    @Test fun patchesDefaultToVeloceAndAcceptCustomHosts() {
        for (patch in listOf(audiobookshelf, homeassistant, spotify, waze)) {
            val options = patch.options
            try {
                assertEquals("ch.broillet.veloce", options["hostPackage"].value)
                options["hostPackage"] = "org.example.custom_host"
                assertEquals("org.example.custom_host", options["hostPackage"].value)
                assertFailsWith<OptionException.ValueValidationException> { options["hostPackage"] = "invalid\"" }
                if ("hostCertificate" in options) {
                    assertEquals(VELOCE_CERTIFICATE, options["hostCertificate"].value)
                    options["hostCertificate"] = "AB:".repeat(31) + "AB"
                    assertEquals("ab".repeat(32), certificateDigest(options["hostCertificate"].value as String))
                    assertFailsWith<OptionException.ValueValidationException> { options["hostCertificate"] = "invalid" }
                }
            } finally {
                options.values.forEach { it.reset() }
            }
        }
    }

    @Test fun defaultCertificateIsValid() {
        assertEquals(VELOCE_CERTIFICATE, certificateDigest(VELOCE_CERTIFICATE))
    }

    @Test fun acceptsCustomApplicationIds() {
        listOf("ch.broillet.veloce", "org.example.custom_host", "com.example.Host2").forEach {
            assertEquals(it, hostPackageName(it))
        }
    }

    @Test fun rejectsInvalidApplicationIdsAndSmaliEscapes() {
        listOf("", "veloce", "com..host", " com.example.host", "com.example.host\n", "com.example.1host", "com.example.\"host").forEach {
            assertFailsWith<PatchException> { hostPackageName(it) }
        }
    }

    @Test fun acceptsApksignerAndKeytoolDigestFormatting() {
        assertEquals("ab".repeat(32), certificateDigest(" AB:".repeat(31) + " AB\n"))
    }

    @Test fun rejectsMissingTruncatedAndNonHexDigests() {
        listOf("", "ab", "zz".repeat(32), "SHA256:" + "ab".repeat(32)).forEach { value ->
            assertFailsWith<PatchException> { certificateDigest(value) }
        }
    }
}
