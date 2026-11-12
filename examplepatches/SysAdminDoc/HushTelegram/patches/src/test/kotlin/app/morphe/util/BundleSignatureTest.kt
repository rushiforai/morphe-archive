package app.morphe.util

import app.morphe.patcher.patch.PatchBundleSignature
import java.io.File
import java.security.KeyPairGenerator
import java.util.Base64
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder

/**
 * verifyBundle's signature check, against bundles signed by the patcher's own PatchBundleSignature.
 *
 * <p>Morphe Manager pins the first key a source signs with, so a release bundle signed by any other
 * key, or changed after signing, has to fail the build rather than reach users. An unsigned bundle
 * passes here because a build without the key doesn't sign; verifyBundle refuses it when the build had a key.
 */
class BundleSignatureTest {
    @get:Rule val temporary = TemporaryFolder()

    /** A throwaway Ed25519 pair as Base64 raw keys: the 32 byte seed and the 32 byte public key. */
    private fun keyPair(): Pair<String, String> {
        val pair = KeyPairGenerator.getInstance("Ed25519").generateKeyPair()
        val seed = pair.private.encoded.copyOfRange(16, 48)
        val public = pair.public.encoded.copyOfRange(12, 44)
        return Base64.getEncoder().encodeToString(seed) to Base64.getEncoder().encodeToString(public)
    }

    private fun bundle(): File = temporary.newFile("patches.mpp").also { file ->
        ZipOutputStream(file.outputStream()).use { zip ->
            zip.putNextEntry(ZipEntry("classes.dex"))
            zip.write(ByteArray(64) { it.toByte() })
            zip.closeEntry()
        }
    }

    private fun failure(block: () -> Unit) = runCatching(block).exceptionOrNull()

    @Test
    fun acceptsTheBundleThePublishedKeySignedAndRefusesEveryOtherCase() {
        val (privateKey, publicKey) = keyPair()
        val bundle = bundle()
        assertNull("an unsigned bundle has no signer", BundleVerifier.requireSignedBy(bundle, publicKey))

        PatchBundleSignature.sign(bundle, privateKey)
        assertTrue(String(bundle.readBytes(), Charsets.ISO_8859_1).contains("MorpheSig1 $publicKey "))
        assertEquals(publicKey, BundleVerifier.requireSignedBy(bundle, publicKey))

        val otherKey = keyPair().second
        val wrongKey = failure { BundleVerifier.requireSignedBy(bundle, otherKey) }
        assertTrue("a bundle signed by another key must fail, got $wrongKey", wrongKey is IllegalArgumentException)
        assertTrue(wrongKey!!.message!!.contains("not the key morphe-signing.pub publishes"))

        // One byte of the stored entry changed after signing, as a swapped payload would.
        val bytes = bundle.readBytes()
        val data = String(bytes, Charsets.ISO_8859_1).indexOf("classes.dex") + "classes.dex".length + 1
        bytes[data] = (bytes[data] + 1).toByte()
        bundle.writeBytes(bytes)
        val tampered = failure { BundleVerifier.requireSignedBy(bundle, publicKey) }
        assertTrue("a bundle changed after signing must fail, got $tampered", tampered is IllegalArgumentException)
    }
}
