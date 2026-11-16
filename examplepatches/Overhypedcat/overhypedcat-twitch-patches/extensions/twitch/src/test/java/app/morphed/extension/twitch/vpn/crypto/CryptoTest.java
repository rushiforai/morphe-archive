package app.morphed.extension.twitch.vpn.crypto;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

import java.math.BigInteger;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.spec.NamedParameterSpec;
import java.security.spec.XECPrivateKeySpec;
import java.security.spec.XECPublicKeySpec;
import java.util.Random;

import javax.crypto.Cipher;
import javax.crypto.KeyAgreement;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/** The tunnel's crypto against RFC vectors, Python's hashlib and the JDK's own implementations. */
public class CryptoTest {
    static byte[] hex(String hex) {
        byte[] out = new byte[hex.length() / 2];
        for (int i = 0; i < out.length; i++) out[i] = (byte) Integer.parseInt(hex.substring(2 * i, 2 * i + 2), 16);
        return out;
    }

    static String hex(byte[] bytes) {
        StringBuilder out = new StringBuilder();
        for (byte b : bytes) out.append(String.format("%02x", b));
        return out.toString();
    }

    private static byte[] range(int n) {
        byte[] out = new byte[n];
        for (int i = 0; i < n; i++) out[i] = (byte) i;
        return out;
    }

    @Test
    public void x25519MatchesRfc7748() {
        byte[] scalar = hex("a546e36bf0527c9d3b16154b82465edd62144c0ac1fc5a18506a2244ba449ac4");
        byte[] u = hex("e6db6867583030db3594c1a424b15f7c726624ec26b3353b10a903a6d0ab1c4c");
        assertEquals("c3da55379de9c6908e94ea4df28d084f32eccf03491c71f754b4075577a28552", hex(X25519.scalarMult(scalar, u)));
    }

    @Test
    public void x25519AgreesWithTheJdk() throws Exception {
        SecureRandom random = new SecureRandom();
        KeyFactory factory = KeyFactory.getInstance("XDH");
        for (int i = 0; i < 5; i++) {
            byte[] mine = X25519.generatePrivateKey(random);
            byte[] theirs = X25519.generatePrivateKey(random);
            byte[] theirPublic = X25519.publicKey(theirs);
            PrivateKey jdkMine = factory.generatePrivate(new XECPrivateKeySpec(NamedParameterSpec.X25519, mine));
            byte[] reversed = new byte[32];
            for (int j = 0; j < 32; j++) reversed[j] = theirPublic[31 - j];
            PublicKey jdkTheirs = factory.generatePublic(new XECPublicKeySpec(NamedParameterSpec.X25519, new BigInteger(1, reversed)));
            KeyAgreement agreement = KeyAgreement.getInstance("XDH");
            agreement.init(jdkMine);
            agreement.doPhase(jdkTheirs, true);
            assertArrayEquals(agreement.generateSecret(), X25519.scalarMult(mine, theirPublic));
            assertArrayEquals(X25519.scalarMult(mine, theirPublic), X25519.scalarMult(theirs, X25519.publicKey(mine)));
        }
    }

    @Test
    public void blake2sMatchesHashlib() {
        assertEquals("508c5e8c327c14e2e1a72ba34eeb452f37458b209ed63a294d999b4c86675982", hex(Blake2s.hash("abc".getBytes())));
        assertEquals("69217a3079908094e11121d042354a7c1f55b6482ca1a51e1b250dfd1ed0eef9", hex(Blake2s.hash(new byte[0])));
        assertEquals("ae09db7cd54f42b490ef09b6bc541af688e4959bb8c53f359a6f56e38ab454a3", hex(Blake2s.hash(new byte[64])));
        assertEquals("857328bf990b00922782d3e81c6054c25d3375d386c7424abe3e01d79041046c", hex(Blake2s.hash(new byte[65])));
        assertEquals("42a6f8ff590af21b512e9e088257aa34", hex(Blake2s.mac(range(32), range(200), 200)));
        assertEquals("ab8de334c780c9f8619f195f50dc4653044dc0a584c7398a3b89c2a8206ee1b6",
                hex(Blake2s.hmac(range(32), "hello world".getBytes())));
    }

    @Test
    public void chachaPolyAgreesWithTheJdk() throws Exception {
        Random random = new Random(9);
        for (int length : new int[]{0, 1, 15, 16, 17, 63, 64, 65, 1420}) {
            byte[] key = new byte[32], plain = new byte[length], aad = new byte[length % 20];
            random.nextBytes(key);
            random.nextBytes(plain);
            random.nextBytes(aad);
            byte[] nonce = ChaChaPoly.nonce(random.nextLong());
            Cipher cipher = Cipher.getInstance("ChaCha20-Poly1305");
            cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(key, "ChaCha20"), new IvParameterSpec(nonce));
            if (aad.length > 0) cipher.updateAAD(aad);
            byte[] expected = cipher.doFinal(plain);
            byte[] sealed = ChaChaPoly.seal(key, nonce, aad.length > 0 ? aad : null, plain);
            assertArrayEquals("length " + length, expected, sealed);
            assertArrayEquals(plain, ChaChaPoly.open(key, nonce, aad.length > 0 ? aad : null, sealed));
            sealed[sealed.length - 1] ^= 1;
            assertNull(ChaChaPoly.open(key, nonce, aad.length > 0 ? aad : null, sealed));
        }
    }

    @Test
    public void hchachaMatchesTheDraftVector() {
        byte[] key = hex("000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f");
        byte[] nonce = hex("000000090000004a0000000031415927");
        assertEquals("82413b4227b27bfed30e42508a877d73a0f9e4d58a74a853c12ec41326d3ecdc",
                hex(ChaChaPoly.hchacha(key, nonce)));
    }
}
