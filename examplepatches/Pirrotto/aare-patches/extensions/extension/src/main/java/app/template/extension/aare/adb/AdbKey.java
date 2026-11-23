package app.template.extension.aare.adb;

import android.content.Context;
import android.content.SharedPreferences;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import android.util.Base64;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.math.BigInteger;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.KeyStore;
import java.security.Principal;
import java.security.PrivateKey;
import java.security.SecureRandom;
import java.security.Signature;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.security.interfaces.RSAPrivateCrtKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.RSAKeyGenParameterSpec;
import java.security.spec.RSAPublicKeySpec;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.spec.GCMParameterSpec;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLEngine;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509ExtendedKeyManager;
import javax.net.ssl.X509ExtendedTrustManager;

/**
 * AARE's own adb key: the RSA key that wireless debugging pairs with, like a computer's ~/.android/adbkey.
 *
 * The private key is kept encrypted in AARE's preferences with an AES key of the Android keystore,
 * which never leaves the phone's secure hardware. Adapted from Shizuku's AdbKey (Apache-2.0).
 */
final class AdbKey {
    private static final String ANDROID_KEYSTORE = "AndroidKeyStore";
    private static final String ENCRYPTION_KEY_ALIAS = "aare_adbkey_encryption_key";
    private static final String PREFS = "aare_integrated_shizuku";
    private static final String PREF_KEY = "adbkey";

    private final RSAPrivateCrtKey privateKey;
    private final RSAPublicKey publicKey;
    private final X509Certificate certificate;

    AdbKey(Context context) throws Exception {
        SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        Key aes = encryptionKey();
        byte[] aad = new byte[16];
        byte[] tag = "adbkey".getBytes(StandardCharsets.US_ASCII);
        System.arraycopy(tag, 0, aad, 0, tag.length);

        RSAPrivateCrtKey key = null;
        String stored = prefs.getString(PREF_KEY, null);
        if (stored != null) {
            try {
                byte[] plain = decrypt(aes, Base64.decode(stored, Base64.NO_WRAP), aad);
                key = (RSAPrivateCrtKey) KeyFactory.getInstance("RSA").generatePrivate(new PKCS8EncodedKeySpec(plain));
            } catch (Exception ignored) {
                // A new key means pairing again.
            }
        }
        if (key == null) {
            KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
            generator.initialize(new RSAKeyGenParameterSpec(2048, RSAKeyGenParameterSpec.F4));
            KeyPair pair = generator.generateKeyPair();
            key = (RSAPrivateCrtKey) pair.getPrivate();
            prefs.edit().putString(PREF_KEY, Base64.encodeToString(encrypt(aes, key.getEncoded(), aad), Base64.NO_WRAP)).apply();
        }
        privateKey = key;
        publicKey = (RSAPublicKey) KeyFactory.getInstance("RSA")
                .generatePublic(new RSAPublicKeySpec(key.getModulus(), key.getPublicExponent()));
        certificate = selfSignedCertificate(publicKey, privateKey);
    }

    static boolean exists(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).contains(PREF_KEY);
    }

    // region Keystore

    private static Key encryptionKey() throws Exception {
        KeyStore keyStore = KeyStore.getInstance(ANDROID_KEYSTORE);
        keyStore.load(null);
        Key key = keyStore.getKey(ENCRYPTION_KEY_ALIAS, null);
        if (key != null) return key;
        KeyGenerator generator = KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES, ANDROID_KEYSTORE);
        generator.init(new KeyGenParameterSpec.Builder(ENCRYPTION_KEY_ALIAS,
                KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
                .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
                .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
                .setKeySize(256)
                .build());
        return generator.generateKey();
    }

    private static byte[] encrypt(Key key, byte[] plain, byte[] aad) throws Exception {
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.ENCRYPT_MODE, key);
        cipher.updateAAD(aad);
        byte[] body = cipher.doFinal(plain);
        byte[] iv = cipher.getIV();
        byte[] out = new byte[iv.length + body.length];
        System.arraycopy(iv, 0, out, 0, iv.length);
        System.arraycopy(body, 0, out, iv.length, body.length);
        return out;
    }

    private static byte[] decrypt(Key key, byte[] data, byte[] aad) throws Exception {
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.DECRYPT_MODE, key, new GCMParameterSpec(128, data, 0, 12));
        cipher.updateAAD(aad);
        return cipher.doFinal(data, 12, data.length - 12);
    }

    // endregion

    // region adb public key ("<base64> <name>")

    /** The public key in adb's format (android_pubkey.c), followed by the device name. */
    byte[] adbPublicKey(String name) {
        final int words = 2048 / 32;
        BigInteger r32 = BigInteger.ZERO.setBit(32);
        BigInteger modulus = publicKey.getModulus();
        BigInteger n0inv = modulus.remainder(r32).modInverse(r32).negate();
        BigInteger rr = BigInteger.ZERO.setBit(2048).modPow(BigInteger.valueOf(2), modulus);

        ByteBuffer buffer = ByteBuffer.allocate(524).order(ByteOrder.LITTLE_ENDIAN);
        buffer.putInt(words);
        buffer.putInt(n0inv.intValue());
        putLittleEndianWords(buffer, modulus, words);
        putLittleEndianWords(buffer, rr, words);
        buffer.putInt(publicKey.getPublicExponent().intValue());

        byte[] base64 = Base64.encode(buffer.array(), Base64.NO_WRAP);
        byte[] suffix = (" " + name + "\u0000").getBytes(StandardCharsets.UTF_8);
        byte[] out = new byte[base64.length + suffix.length];
        System.arraycopy(base64, 0, out, 0, base64.length);
        System.arraycopy(suffix, 0, out, base64.length, suffix.length);
        return out;
    }

    private static void putLittleEndianWords(ByteBuffer buffer, BigInteger value, int words) {
        BigInteger r32 = BigInteger.ZERO.setBit(32);
        BigInteger rest = value;
        for (int i = 0; i < words; i++) {
            BigInteger[] qr = rest.divideAndRemainder(r32);
            rest = qr[0];
            buffer.putInt(qr[1].intValue());
        }
    }

    // endregion

    // region TLS

    SSLContext sslContext() throws Exception {
        SSLContext context = SSLContext.getInstance("TLSv1.3");
        context.init(new X509ExtendedKeyManager[]{keyManager()}, new TrustManager[]{trustAll()}, new SecureRandom());
        return context;
    }

    private X509ExtendedKeyManager keyManager() {
        final String alias = "key";
        return new X509ExtendedKeyManager() {
            @Override
            public String chooseClientAlias(String[] keyTypes, Principal[] issuers, Socket socket) {
                for (String type : keyTypes) if ("RSA".equals(type)) return alias;
                return null;
            }

            @Override
            public String chooseEngineClientAlias(String[] keyTypes, Principal[] issuers, SSLEngine engine) {
                return chooseClientAlias(keyTypes, issuers, null);
            }

            @Override
            public X509Certificate[] getCertificateChain(String a) {
                return alias.equals(a) ? new X509Certificate[]{certificate} : null;
            }

            @Override
            public PrivateKey getPrivateKey(String a) {
                return alias.equals(a) ? privateKey : null;
            }

            @Override
            public String[] getClientAliases(String keyType, Principal[] issuers) {
                return null;
            }

            @Override
            public String[] getServerAliases(String keyType, Principal[] issuers) {
                return null;
            }

            @Override
            public String chooseServerAlias(String keyType, Principal[] issuers, Socket socket) {
                return null;
            }
        };
    }

    /**
     * adbd presents a self-signed certificate: the pairing (and the key adbd stored when pairing)
     * is what authenticates both sides, as in adb itself.
     */
    private static X509ExtendedTrustManager trustAll() {
        return new X509ExtendedTrustManager() {
            @Override
            public void checkClientTrusted(X509Certificate[] chain, String authType, Socket socket) {
            }

            @Override
            public void checkServerTrusted(X509Certificate[] chain, String authType, Socket socket) {
            }

            @Override
            public void checkClientTrusted(X509Certificate[] chain, String authType, SSLEngine engine) {
            }

            @Override
            public void checkServerTrusted(X509Certificate[] chain, String authType, SSLEngine engine) {
            }

            @Override
            public void checkClientTrusted(X509Certificate[] chain, String authType) {
            }

            @Override
            public void checkServerTrusted(X509Certificate[] chain, String authType) {
            }

            @Override
            public X509Certificate[] getAcceptedIssuers() {
                return new X509Certificate[0];
            }
        };
    }

    // endregion

    // region Self-signed certificate (DER, no external library)

    private static final byte[] OID_SHA256_WITH_RSA = {0x2A, (byte) 0x86, 0x48, (byte) 0x86, (byte) 0xF7, 0x0D, 0x01, 0x01, 0x0B};
    private static final byte[] OID_COMMON_NAME = {0x55, 0x04, 0x03};

    private static X509Certificate selfSignedCertificate(RSAPublicKey publicKey, PrivateKey privateKey) throws Exception {
        byte[] algorithm = der(0x30, concat(der(0x06, OID_SHA256_WITH_RSA), der(0x05, new byte[0])));
        byte[] name = der(0x30, der(0x31, der(0x30, concat(der(0x06, OID_COMMON_NAME),
                der(0x0C, "00".getBytes(StandardCharsets.US_ASCII))))));
        byte[] validity = der(0x30, concat(
                der(0x17, "700101000000Z".getBytes(StandardCharsets.US_ASCII)),
                der(0x18, "20491231235959Z".getBytes(StandardCharsets.US_ASCII))));
        byte[] tbs = der(0x30, concat(
                der(0xA0, der(0x02, new byte[]{2})),   // version 3
                der(0x02, new byte[]{1}),              // serial number
                algorithm,
                name,
                validity,
                name,
                publicKey.getEncoded()));               // SubjectPublicKeyInfo

        Signature signer = Signature.getInstance("SHA256withRSA");
        signer.initSign(privateKey);
        signer.update(tbs);
        byte[] signature = signer.sign();
        byte[] bits = new byte[signature.length + 1];
        System.arraycopy(signature, 0, bits, 1, signature.length);

        byte[] cert = der(0x30, concat(tbs, algorithm, der(0x03, bits)));
        return (X509Certificate) CertificateFactory.getInstance("X.509").generateCertificate(new ByteArrayInputStream(cert));
    }

    private static byte[] der(int tag, byte[] content) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        out.write(tag);
        int length = content.length;
        if (length < 0x80) {
            out.write(length);
        } else if (length < 0x100) {
            out.write(0x81);
            out.write(length);
        } else if (length < 0x10000) {
            out.write(0x82);
            out.write(length >> 8);
            out.write(length);
        } else {
            out.write(0x83);
            out.write(length >> 16);
            out.write(length >> 8);
            out.write(length);
        }
        out.write(content, 0, content.length);
        return out.toByteArray();
    }

    private static byte[] concat(byte[]... parts) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        for (byte[] p : parts) out.write(p, 0, p.length);
        return out.toByteArray();
    }

    // endregion
}
