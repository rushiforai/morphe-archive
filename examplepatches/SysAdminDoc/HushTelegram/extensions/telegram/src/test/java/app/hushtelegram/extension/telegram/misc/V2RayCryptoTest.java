/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * Known answers for the cryptography the tunnels use. Each expected value comes from the
 * specification or the upstream project's own tests, as noted, never from this code's output.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class V2RayCryptoTest {

    private static byte[] unhex(String hex) {
        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < bytes.length; i++) bytes[i] = (byte) Integer.parseInt(hex.substring(i * 2, i * 2 + 2), 16);
        return bytes;
    }

    private static byte[] ascii(String text) {
        return text.getBytes(StandardCharsets.US_ASCII);
    }

    private static byte[] range(int from, int to) {
        byte[] bytes = new byte[to - from];
        for (int i = 0; i < bytes.length; i++) bytes[i] = (byte) (from + i);
        return bytes;
    }

    // ---- VMess --------------------------------------------------------------------------------

    /** v2fly's proxy/vmess/aead/kdf_test.go, TestKDFValue. */
    @Test public void vmessKdfGivesV2flysKnownValue() {
        byte[] got = V2RayCrypto.vmessKdf(ascii("Demo Key for KDF Value Test"),
                "Demo Path for KDF Value Test", "Demo Path for KDF Value Test2", "Demo Path for KDF Value Test3");
        assertEquals("53e9d7e1bd7bd25022b71ead07d8a596efc8a845c7888652fd684b4903dc8892", V2RayCrypto.hex(got));
    }

    /** With no path the KDF is HMAC-SHA256 keyed by the root, and kdf16 is its first half. */
    @Test public void vmessKdfWithoutAPathIsTheRootHmac() {
        byte[] key = ascii("key");
        assertArrayEquals(V2RayCrypto.hmac("HmacSHA256", ascii("VMess AEAD KDF"), key), V2RayCrypto.vmessKdf(key, new byte[0][]));
        assertArrayEquals(Arrays.copyOf(V2RayCrypto.vmessKdf(key, ascii("AES Auth ID Encryption")), 16),
                V2RayCrypto.vmessKdf16(key, ascii("AES Auth ID Encryption")));
    }

    /** A path element longer than an HMAC block is hashed by the HMAC above it first, as Go's hmac does. */
    @Test public void vmessKdfTakesAPathLongerThanABlock() {
        byte[] longPath = new byte[100];
        Arrays.fill(longPath, (byte) 7);
        byte[] once = V2RayCrypto.vmessKdf(ascii("k"), longPath);
        assertEquals(32, once.length);
        assertArrayEquals(once, V2RayCrypto.vmessKdf(ascii("k"), longPath.clone()));
        assertFalse(Arrays.equals(once, V2RayCrypto.vmessKdf(ascii("k"), Arrays.copyOf(longPath, 99))));
    }

    /** FNV-1a 32 from the FNV reference test vectors. */
    @Test public void fnv1aMatchesTheReferenceVectors() {
        assertEquals(0xe40c292c, V2RayCrypto.fnv1a(ascii("a"), 0, 1));
        assertEquals(0xbf9cf968, V2RayCrypto.fnv1a(ascii("foobar"), 0, 6));
        assertEquals(0x811c9dc5, V2RayCrypto.fnv1a(new byte[0], 0, 0));
    }

    /** SHAKE128 from FIPS 202's examples (empty input and the pangram), first 32 bytes. */
    @Test public void shake128MatchesFips202() {
        assertEquals("7f9c2ba4e88f827d616045507605853ed73b8093f6efbc88eb1a6eacfa66ef26",
                V2RayCrypto.hex(new V2RayCrypto.Shake128(new byte[0]).squeeze(32)));
        assertEquals("f4202e3c5852f9182a0430fd8144f0a74b95e7417ecae17db0f8cfeed0e3e66e",
                V2RayCrypto.hex(new V2RayCrypto.Shake128(ascii("The quick brown fox jumps over the lazy dog")).squeeze(32)));
    }

    /**
     * A seed longer than one block, squeezed past several blocks two bytes at a time, as VMess reads
     * its masks. Expected from Python's hashlib.shake_128(bytes(range(200))).hexdigest(400).
     */
    @Test public void shake128SqueezesAcrossBlocks() {
        String expected = "0c4234ca1e31801ae606f8b8d8e0665c66f42a21d601c2681858a92c79ad5d69e143c3b1393dd894e7abd5621b0d877f"
                + "3573a34245e6b911f671081664a5fa53f778886cb56bdba60b2e8d21bd5b68b2f03f7db45fab8bec05d586922735967393"
                + "f6c99991150acb1dcbfe12e54793975742408b347feedeabfeb77f9bbc70f3b14024309f530cc8919ed69e58b9b8ece0cf"
                + "40db1b7a33d1329885e9ca4004b1fba4bad349b3f98d635b9775fc9cb1027c1e431756302e109614ff269d8415f43b504f"
                + "bdff98605f9bf8a5ac0120f6e2403cc38fc07c6dfe2575f52f208cdf030b9fbdc20ecf6cbff7ff8e22744c70b25e3fa55e"
                + "ca18d67f3767f095f03856264588cf1fd09f29da759c2e849b1f345feebde0f271a418c12e126fbe086095b9433e06a84f"
                + "609a0c91793cc7379342c5822870da2c37ea464a0ad2d778678a33d40bc054dfe5f39fcf3dae74a1e11e5c62dfab35b73c"
                + "d2ecf088cc55d9724862c7641051d76a524264402261d3d8f601fee6ee2f71a7379d317fde494491ec873fa6be71b2cf38"
                + "88ff169e5a98c7fa85";
        V2RayCrypto.Shake128 shake = new V2RayCrypto.Shake128(range(0, 200));
        StringBuilder got = new StringBuilder();
        for (int i = 0; i < 200; i++) got.append(String.format("%04x", shake.nextShort()));
        assertEquals(expected, got.toString());
    }

    /** Xray maps an id that isn't a UUID to UUID v5 in the nil namespace (Python's uuid.uuid5). */
    @Test public void uuidReadsUuidsAndMapsOtherIds() {
        assertEquals("feb54431301b52bba6dde1e93e81bb9e", V2RayCrypto.hex(V2RayCrypto.uuid("example")));
        assertEquals("b831381d63244d53ad4f8cda48b30811",
                V2RayCrypto.hex(V2RayCrypto.uuid("b831381d-6324-4d53-ad4f-8cda48b30811")));
        assertEquals("b831381d63244d53ad4f8cda48b30811",
                V2RayCrypto.hex(V2RayCrypto.uuid("B831381D63244D53AD4F8CDA48B30811")));
        assertNull(V2RayCrypto.uuid(""));
        assertNull(V2RayCrypto.uuid("an id that's far too long to be one Xray would map"));
    }

    /** VMess's cmdKey is MD5 of the id and its fixed UUID text (v2fly common/protocol/id.go). */
    @Test public void vmessCmdKeyIsMd5OfIdAndConstant() {
        assertEquals("8e12bc156ecaf05b7f0a83a21aa77742", V2RayCrypto.hex(V2RayCrypto.vmessCmdKey(range(0, 16))));
    }

    // ---- Shadowsocks --------------------------------------------------------------------------

    /** RFC 5869 appendix A.4, HKDF with SHA-1. */
    @Test public void hkdfSha1MatchesRfc5869() {
        byte[] okm = V2RayCrypto.hkdfSha1(unhex("0b0b0b0b0b0b0b0b0b0b0b"), range(0x00, 0x0d), range(0xf0, 0xfa), 42);
        assertEquals("085a01ea1b10f36933068b56efa5ad81a4f14b822f5b091568a9cdd4f155fda2c22e422478d305f3f896",
                V2RayCrypto.hex(okm));
    }

    /** EVP_BytesToKey with MD5: D1 = MD5(password), D2 = MD5(D1 || password). MD5("password") is the well-known 5f4dcc3b... */
    @Test public void passwordKeyIsEvpBytesToKey() {
        assertEquals("5f4dcc3b5aa765d61d8327deb882cf99", V2RayCrypto.hex(V2RayCrypto.passwordKey("password", 16)));
        assertEquals("5f4dcc3b5aa765d61d8327deb882cf992b95990a9151374abd8ff8c5a7a0fe08",
                V2RayCrypto.hex(V2RayCrypto.passwordKey("password", 32)));
    }

    /**
     * Shadowsocks AEAD's session subkey, HKDF-SHA1(key, salt, "ss-subkey"), for the password
     * "barfoo!" and salt 00..1f; worked with Python's cryptography HKDF.
     */
    @Test public void shadowsocksSubkeyFollowsTheSpec() {
        byte[] key = V2RayCrypto.passwordKey("barfoo!", 32);
        byte[] subkey = V2RayCrypto.hkdfSha1(key, range(0, 32), ascii("ss-subkey"), 32);
        assertEquals("6e62f41174d7879ffea269ebf7805b730f62002e2b461f4dcb2a21dfb6f6423e", V2RayCrypto.hex(subkey));
    }

    /** Trojan sends the hex of SHA-224 of its password. */
    @Test public void sha224OfPassword() {
        assertEquals("d63dc919e201d7bc4c825630d2cf25fdc93d4b2f0d46706d29038d01",
                V2RayCrypto.hex(V2RayCrypto.digest("SHA-224", ascii("password"))));
    }

    // ---- AEAD ---------------------------------------------------------------------------------

    /** The GCM specification's test case 2: all-zero key, IV and block. */
    @Test public void aesGcmMatchesTheGcmSpec() throws Exception {
        V2RayCrypto.Aead aead = new V2RayCrypto.Aead(V2RayCrypto.Aead.AES_GCM, new byte[16]);
        byte[] sealed = aead.seal(new byte[12], new byte[16], 0, 16, null);
        assertEquals("0388dace60b6a392f328c2b971b2fe78ab6e47d42cec13bdf53a67b21257bddf", V2RayCrypto.hex(sealed));
        assertArrayEquals(new byte[16], aead.open(new byte[12], sealed, 0, sealed.length, null));
    }

    /** RFC 8439 section 2.8.2. */
    @Test public void chachaMatchesRfc8439() throws Exception {
        assertTrue(V2RayCrypto.chachaAvailable());
        V2RayCrypto.Aead aead = new V2RayCrypto.Aead(V2RayCrypto.Aead.CHACHA, range(0x80, 0xa0));
        byte[] plain = ascii("Ladies and Gentlemen of the class of '99: If I could offer you only one tip for the future, sunscreen would be it.");
        byte[] sealed = aead.seal(unhex("070000004041424344454647"), plain, 0, plain.length, unhex("50515253c0c1c2c3c4c5c6c7"));
        String hex = V2RayCrypto.hex(sealed);
        assertTrue(hex.startsWith("d31a8d34648e60db7b86afbc53ef7ec2a4aded51296e08fea9e2b5a736ee62d63dbea45e8ca9671282fafb69da92728b"));
        assertTrue(hex.endsWith("1ae10b594f09e26a7e902ecbd0600691"));
        assertArrayEquals(plain, aead.open(unhex("070000004041424344454647"), sealed, 0, sealed.length,
                unhex("50515253c0c1c2c3c4c5c6c7")));
    }

    @Test public void aTamperedChunkDoesNotOpen() throws Exception {
        V2RayCrypto.Aead aead = new V2RayCrypto.Aead(V2RayCrypto.Aead.AES_GCM, new byte[32]);
        byte[] sealed = aead.seal(new byte[12], ascii("hello"), 0, 5, null);
        sealed[0] ^= 1;
        try {
            aead.open(new byte[12], sealed, 0, sealed.length, null);
            fail("a tampered chunk opened");
        } catch (java.security.GeneralSecurityException expected) {
            // what a bad tag gives
        }
    }
}
