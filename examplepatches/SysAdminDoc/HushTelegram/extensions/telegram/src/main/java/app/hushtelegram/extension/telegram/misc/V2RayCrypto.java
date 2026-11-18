/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import androidx.annotation.Nullable;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Locale;
import java.util.regex.Pattern;
import java.util.zip.CRC32;
import javax.crypto.Cipher;
import javax.crypto.Mac;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/**
 * The cryptography {@link V2RayTunnels} needs, from the platform's own providers where Android has
 * them: AES-GCM and ChaCha20-Poly1305 (Conscrypt), MD5, SHA-1, SHA-224 and SHA-256, and HMAC.
 * What Android doesn't carry is written here from its specification: HKDF (RFC 5869), OpenSSL's
 * EVP_BytesToKey that Shadowsocks makes a key with, VMess's nested HMAC key derivation, SHAKE128
 * (FIPS 202) for VMess's length masks, FNV-1a and the UUID v5 Xray makes of an id that isn't a UUID.
 */
final class V2RayCrypto {
    static final SecureRandom RANDOM = new SecureRandom();

    /** The root key of VMess's key derivation, from v2fly's proxy/vmess/aead/consts.go. */
    private static final byte[] VMESS_KDF_ROOT = "VMess AEAD KDF".getBytes(StandardCharsets.US_ASCII);
    private static final int HMAC_BLOCK = 64;
    private static final Pattern UUID_TEXT = Pattern.compile(
            "[0-9a-fA-F]{8}-?[0-9a-fA-F]{4}-?[0-9a-fA-F]{4}-?[0-9a-fA-F]{4}-?[0-9a-fA-F]{12}");

    private V2RayCrypto() {
    }

    static byte[] random(int length) {
        byte[] bytes = new byte[length];
        RANDOM.nextBytes(bytes);
        return bytes;
    }

    static byte[] digest(String algorithm, byte[]... parts) {
        try {
            MessageDigest digest = MessageDigest.getInstance(algorithm);
            for (byte[] part : parts) digest.update(part);
            return digest.digest();
        } catch (NoSuchAlgorithmException missing) {
            throw new IllegalStateException(algorithm + " isn't available", missing);
        }
    }

    static byte[] hmac(String algorithm, byte[] key, byte[]... parts) {
        try {
            Mac mac = Mac.getInstance(algorithm);
            mac.init(new SecretKeySpec(key, algorithm));
            for (byte[] part : parts) mac.update(part);
            return mac.doFinal();
        } catch (GeneralSecurityException missing) {
            throw new IllegalStateException(algorithm + " isn't available", missing);
        }
    }

    static byte[] concat(byte[]... parts) {
        int length = 0;
        for (byte[] part : parts) length += part.length;
        byte[] joined = new byte[length];
        int at = 0;
        for (byte[] part : parts) {
            System.arraycopy(part, 0, joined, at, part.length);
            at += part.length;
        }
        return joined;
    }

    static String hex(byte[] bytes) {
        StringBuilder text = new StringBuilder(bytes.length * 2);
        for (byte b : bytes) text.append(String.format(Locale.ROOT, "%02x", b & 0xff));
        return text.toString();
    }

    // ---- Shadowsocks ----------------------------------------------------------------------------

    /** OpenSSL's EVP_BytesToKey with MD5, one round and no salt: how Shadowsocks makes a key of a password. */
    static byte[] passwordKey(String password, int length) {
        byte[] secret = password.getBytes(StandardCharsets.UTF_8);
        byte[] key = new byte[length];
        byte[] block = new byte[0];
        for (int at = 0; at < length; at += block.length) {
            block = digest("MD5", block, secret);
            System.arraycopy(block, 0, key, at, Math.min(block.length, length - at));
        }
        return key;
    }

    /** HKDF with SHA-1 (RFC 5869), which Shadowsocks AEAD makes each connection's subkey with. */
    static byte[] hkdfSha1(byte[] secret, byte[] salt, byte[] info, int length) {
        byte[] prk = hmac("HmacSHA1", salt.length == 0 ? new byte[20] : salt, secret);
        byte[] out = new byte[length];
        byte[] block = new byte[0];
        for (int i = 1, at = 0; at < length; i++) {
            block = hmac("HmacSHA1", prk, block, info, new byte[]{(byte) i});
            System.arraycopy(block, 0, out, at, Math.min(block.length, length - at));
            at += block.length;
        }
        return out;
    }

    // ---- VMess ----------------------------------------------------------------------------------

    /**
     * VMess's key derivation: HMAC-SHA256 keyed "VMess AEAD KDF", then for each part of [path] an
     * HMAC keyed by that part whose hash is the HMAC before it, over [key]. v2fly's KDF in
     * proxy/vmess/aead/kdf.go.
     */
    static byte[] vmessKdf(byte[] key, byte[]... path) {
        return nested(path.length, path, key);
    }

    static byte[] vmessKdf(byte[] key, String... path) {
        byte[][] parts = new byte[path.length][];
        for (int i = 0; i < path.length; i++) parts[i] = path[i].getBytes(StandardCharsets.UTF_8);
        return vmessKdf(key, parts);
    }

    static byte[] vmessKdf16(byte[] key, byte[]... path) {
        byte[] full = vmessKdf(key, path);
        byte[] cut = new byte[16];
        System.arraycopy(full, 0, cut, 0, 16);
        return cut;
    }

    /** The hash of [data] at [level]: level 0 is HMAC-SHA256 keyed by the root, each next an HMAC over the one before. */
    private static byte[] nested(int level, byte[][] path, byte[] data) {
        if (level == 0) return hmac("HmacSHA256", VMESS_KDF_ROOT, data);
        byte[] key = path[level - 1];
        if (key.length > HMAC_BLOCK) key = nested(level - 1, path, key);
        byte[] inner = new byte[HMAC_BLOCK];
        byte[] outer = new byte[HMAC_BLOCK];
        for (int i = 0; i < HMAC_BLOCK; i++) {
            byte b = i < key.length ? key[i] : 0;
            inner[i] = (byte) (b ^ 0x36);
            outer[i] = (byte) (b ^ 0x5c);
        }
        return nested(level - 1, path, concat(outer, nested(level - 1, path, concat(inner, data))));
    }

    /** The key VMess makes of a user's id: MD5 of the id and a fixed UUID. */
    static byte[] vmessCmdKey(byte[] id) {
        return digest("MD5", id, "c48619fe-8f02-49e0-b9e9-edf763e17e21".getBytes(StandardCharsets.US_ASCII));
    }

    /** 32-bit FNV-1a, which ends a VMess request header. */
    static int fnv1a(byte[] data, int offset, int length) {
        int hash = 0x811c9dc5;
        for (int i = offset; i < offset + length; i++) {
            hash ^= data[i] & 0xff;
            hash *= 0x01000193;
        }
        return hash;
    }

    static int crc32(byte[] data, int offset, int length) {
        CRC32 crc = new CRC32();
        crc.update(data, offset, length);
        return (int) crc.getValue();
    }

    /**
     * The 16 bytes of a VMess or VLESS id: a UUID as written, or for any other text of 1 to 30
     * bytes the UUID v5 Xray makes of it (SHA-1 of the nil UUID and the text). Null when it's neither.
     */
    @Nullable
    static byte[] uuid(String text) {
        if (UUID_TEXT.matcher(text).matches()) {
            String digits = text.replace("-", "");
            byte[] id = new byte[16];
            for (int i = 0; i < 16; i++) id[i] = (byte) Integer.parseInt(digits.substring(i * 2, i * 2 + 2), 16);
            return id;
        }
        byte[] name = text.getBytes(StandardCharsets.UTF_8);
        if (name.length == 0 || name.length > 30) return null;
        byte[] hash = digest("SHA-1", new byte[16], name);
        byte[] id = new byte[16];
        System.arraycopy(hash, 0, id, 0, 16);
        id[6] = (byte) ((id[6] & 0x0f) | 0x50);
        id[8] = (byte) ((id[8] & 0x3f) | 0x80);
        return id;
    }

    /** SHAKE128 (FIPS 202): absorbs a seed once, then squeezes as much as is asked for, a little at a time. */
    static final class Shake128 {
        private static final int RATE = 168;
        private static final long[] ROUND = {
                0x0000000000000001L, 0x0000000000008082L, 0x800000000000808aL, 0x8000000080008000L,
                0x000000000000808bL, 0x0000000080000001L, 0x8000000080008081L, 0x8000000000008009L,
                0x000000000000008aL, 0x0000000000000088L, 0x0000000080008009L, 0x000000008000000aL,
                0x000000008000808bL, 0x800000000000008bL, 0x8000000000008089L, 0x8000000000008003L,
                0x8000000000008002L, 0x8000000000000080L, 0x000000000000800aL, 0x800000008000000aL,
                0x8000000080008081L, 0x8000000000008080L, 0x0000000080000001L, 0x8000000080008008L};
        private static final int[] ROTATE = {
                0, 1, 62, 28, 27, 36, 44, 6, 55, 20, 3, 10, 43, 25, 39, 41, 45, 15, 21, 8, 18, 2, 61, 56, 14};

        private final long[] state = new long[25];
        private final byte[] block = new byte[RATE];
        private int taken = RATE;

        Shake128(byte[] seed) {
            int at = 0;
            while (seed.length - at >= RATE) {
                xorIn(seed, at, RATE);
                permute();
                at += RATE;
            }
            byte[] last = new byte[RATE];
            System.arraycopy(seed, at, last, 0, seed.length - at);
            last[seed.length - at] ^= 0x1f;
            last[RATE - 1] ^= (byte) 0x80;
            xorIn(last, 0, RATE);
        }

        /** The next [length] bytes of output. */
        byte[] squeeze(int length) {
            byte[] out = new byte[length];
            for (int i = 0; i < length; i++) {
                if (taken == RATE) {
                    permute();
                    for (int j = 0; j < RATE; j++) block[j] = (byte) (state[j / 8] >>> (8 * (j % 8)));
                    taken = 0;
                }
                out[i] = block[taken++];
            }
            return out;
        }

        /** The next two bytes, big-endian, which is how VMess reads a length mask. */
        int nextShort() {
            byte[] two = squeeze(2);
            return ((two[0] & 0xff) << 8) | (two[1] & 0xff);
        }

        private void xorIn(byte[] data, int offset, int length) {
            for (int i = 0; i < length; i++) state[i / 8] ^= (long) (data[offset + i] & 0xff) << (8 * (i % 8));
        }

        private void permute() {
            long[] a = state;
            long[] c = new long[5];
            long[] b = new long[25];
            for (long round : ROUND) {
                for (int x = 0; x < 5; x++) c[x] = a[x] ^ a[x + 5] ^ a[x + 10] ^ a[x + 15] ^ a[x + 20];
                for (int x = 0; x < 5; x++) {
                    long d = c[(x + 4) % 5] ^ Long.rotateLeft(c[(x + 1) % 5], 1);
                    for (int y = 0; y < 25; y += 5) a[y + x] ^= d;
                }
                for (int x = 0; x < 5; x++) {
                    for (int y = 0; y < 5; y++) {
                        b[y + 5 * ((2 * x + 3 * y) % 5)] = Long.rotateLeft(a[x + 5 * y], ROTATE[x + 5 * y]);
                    }
                }
                for (int y = 0; y < 25; y += 5) {
                    for (int x = 0; x < 5; x++) a[y + x] = b[y + x] ^ (~b[y + (x + 1) % 5] & b[y + (x + 2) % 5]);
                }
                a[0] ^= round;
            }
        }
    }

    // ---- AEAD -----------------------------------------------------------------------------------

    /** Whether this phone can do ChaCha20-Poly1305, which some links ask for. */
    static boolean chachaAvailable() {
        try {
            new Aead(Aead.CHACHA, new byte[32]);
            return true;
        } catch (GeneralSecurityException missing) {
            return false;
        }
    }

    /** AES-GCM or ChaCha20-Poly1305 with a 12-byte nonce and a 16-byte tag, one key for its life. */
    static final class Aead {
        static final String AES_GCM = "AES-GCM";
        static final String CHACHA = "ChaCha20-Poly1305";
        static final int TAG = 16;

        private final String kind;
        private final SecretKeySpec key;
        private final Cipher cipher;

        Aead(String kind, byte[] key) throws GeneralSecurityException {
            this.kind = kind;
            if (AES_GCM.equals(kind)) {
                this.key = new SecretKeySpec(key, "AES");
                this.cipher = Cipher.getInstance("AES/GCM/NoPadding");
            } else {
                this.key = new SecretKeySpec(key, "ChaCha20");
                this.cipher = chacha();
            }
            // A provider that can't take the key says so now rather than on the first chunk.
            cipher.init(Cipher.DECRYPT_MODE, this.key, spec(new byte[12]));
        }

        /** Conscrypt names it one way and the JDK the other. */
        private static Cipher chacha() throws GeneralSecurityException {
            try {
                return Cipher.getInstance("ChaCha20/Poly1305/NoPadding");
            } catch (GeneralSecurityException notThatName) {
                return Cipher.getInstance("ChaCha20-Poly1305");
            }
        }

        private java.security.spec.AlgorithmParameterSpec spec(byte[] nonce) {
            return AES_GCM.equals(kind) ? new GCMParameterSpec(TAG * 8, nonce) : new IvParameterSpec(nonce);
        }

        byte[] seal(byte[] nonce, byte[] plain, int offset, int length, @Nullable byte[] associated)
                throws GeneralSecurityException {
            cipher.init(Cipher.ENCRYPT_MODE, key, spec(nonce));
            if (associated != null) cipher.updateAAD(associated);
            return cipher.doFinal(plain, offset, length);
        }

        byte[] open(byte[] nonce, byte[] sealed, int offset, int length, @Nullable byte[] associated)
                throws GeneralSecurityException {
            cipher.init(Cipher.DECRYPT_MODE, key, spec(nonce));
            if (associated != null) cipher.updateAAD(associated);
            return cipher.doFinal(sealed, offset, length);
        }
    }

    /** One AES block, as VMess seals its 16-byte AuthID. */
    static byte[] aesBlock(byte[] key, byte[] block) throws GeneralSecurityException {
        Cipher aes = Cipher.getInstance("AES/ECB/NoPadding");
        aes.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(key, "AES"));
        return aes.doFinal(block);
    }
}
