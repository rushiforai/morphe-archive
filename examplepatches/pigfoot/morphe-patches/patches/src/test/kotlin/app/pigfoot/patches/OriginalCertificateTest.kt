package app.pigfoot.patches

import app.pigfoot.patches.shared.certificate.requireOriginalCertificate
import java.security.cert.CertificateFactory
import java.security.cert.X509Certificate
import java.util.Locale
import org.junit.Assert.*
import org.junit.Test

class OriginalCertificateTest {
    private val pinA = "dd9b69c3f8764e79934d66ad5fcdce55e1e2d688"
    private val pinB = "b4dc2db75b5abe0a2145621bef6d62e6fc7ceebb"
    private fun certificate(name: String) = javaClass.getResourceAsStream("/certificates/$name.pem")!!.use {
        CertificateFactory.getInstance("X.509").generateCertificate(it) as X509Certificate
    }

    @Test fun originalInputProducesPinnedLowercaseIdentity() {
        val identity = requireOriginalCertificate(listOf(certificate("test-a")), pinA)
        assertEquals(pinA, identity.sha1)
        assertEquals("7f9b098f385d3d9af725326f772f01ec289c4d5593907de93bbdb14c0f3e66ef", identity.sha256)
        assertEquals(identity, requireOriginalCertificate(listOf(certificate("test-a")), pinA.uppercase(Locale.ROOT)))
    }

    @Test fun duplicateCopiesAcrossSigningSchemesAreNotMultipleIdentities() {
        val a = certificate("test-a")
        assertEquals(pinA, requireOriginalCertificate(listOf(a, certificate("test-a"), a), pinA).sha1)
    }

    @Test fun missingOrAmbiguousCertificatesRejectRatherThanPickingFirst() {
        for (certificates in listOf(emptyList(), listOf(certificate("test-a"), certificate("test-b")),
            listOf(certificate("test-b"), certificate("test-a")))) {
            assertThrows(IllegalArgumentException::class.java) { requireOriginalCertificate(certificates, pinA) }
        }
    }

    @Test fun resignedInputCannotOverrideTheAppPin() {
        assertThrows(IllegalArgumentException::class.java) { requireOriginalCertificate(listOf(certificate("test-b")), pinA) }
    }

    @Test fun malformedPinsRejectWithoutNormalizationGuessing() {
        for (pin in listOf("", " ${pinA}", pinA.dropLast(1), "g".repeat(40), pinA.chunked(2).joinToString(":"))) {
            assertThrows(IllegalArgumentException::class.java) { requireOriginalCertificate(listOf(certificate("test-a")), pin) }
        }
    }

    @Test fun successiveInputsNeverReusePreviousCertificateOrFailureState() {
        val a = requireOriginalCertificate(listOf(certificate("test-a")), pinA)
        assertThrows(IllegalArgumentException::class.java) { requireOriginalCertificate(emptyList(), pinA) }
        val b = requireOriginalCertificate(listOf(certificate("test-b")), pinB)
        assertEquals(pinA, a.sha1)
        assertEquals(pinB, b.sha1)
        assertNotEquals(a, b)
        assertEquals(a, requireOriginalCertificate(listOf(certificate("test-a")), pinA))
    }
}
