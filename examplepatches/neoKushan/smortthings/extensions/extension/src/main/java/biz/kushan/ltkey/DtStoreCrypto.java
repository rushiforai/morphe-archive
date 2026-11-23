package biz.kushan.ltkey;

import java.security.MessageDigest;
import javax.crypto.Cipher;
import javax.crypto.Mac;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/**
 * Decrypts a SmartThings/OneConnect OCF SVR-DB `.datenc` store, matching the native
 * {@code psiDecrypt} in {@code liboctbstack.so} (statically confirmed on 1.8.52.23):
 *
 * <pre>
 *   file = IV(16) | AES-256-CBC ciphertext | HMAC-SHA256(32)
 * </pre>
 *
 * The same 32-byte key is used for BOTH the AES key and the HMAC key. The MAC covers the
 * ciphertext only (not the IV, not the trailer). There is no PKCS#7 padding; the real plaintext
 * length is {@code file.length - 64 + (IV[15] & 0x0F)} — the low nibble of the last IV byte says
 * how much of the final decrypted block is real.
 *
 * Android-free (javax.crypto only) so it unit-tests on a plain JDK.
 */
final class DtStoreCrypto {

    static final int IV_LEN = 16;
    static final int MAC_LEN = 32;

    /** @return decrypted plaintext (CBOR), or throws on any integrity/shape failure. */
    static byte[] decrypt(byte[] key, byte[] file) throws Exception {
        if (key == null || key.length != 32) throw new IllegalArgumentException("key must be 32 bytes");
        if (file == null || file.length < IV_LEN + MAC_LEN + 16)
            throw new IllegalArgumentException("file too small");

        int ctLen = file.length - IV_LEN - MAC_LEN;
        if (ctLen <= 0 || ctLen % 16 != 0) throw new IllegalArgumentException("ciphertext not block-aligned");

        byte[] iv = new byte[IV_LEN];
        byte[] ct = new byte[ctLen];
        byte[] mac = new byte[MAC_LEN];
        System.arraycopy(file, 0, iv, 0, IV_LEN);
        System.arraycopy(file, IV_LEN, ct, 0, ctLen);
        System.arraycopy(file, IV_LEN + ctLen, mac, 0, MAC_LEN);

        // HMAC-SHA256(key, ciphertext) — constant-time compare.
        Mac hmac = Mac.getInstance("HmacSHA256");
        hmac.init(new SecretKeySpec(key, "HmacSHA256"));
        byte[] calc = hmac.doFinal(ct);
        if (!MessageDigest.isEqual(calc, mac))
            throw new SecurityException("HMAC check failed (wrong key or corrupt store)");

        // AES-256-CBC decrypt, no padding.
        Cipher c = Cipher.getInstance("AES/CBC/NoPadding");
        c.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key, "AES"), new IvParameterSpec(iv));
        byte[] padded = c.doFinal(ct);

        // Custom length trailer: real length = total - 64 + (IV[15] & 0x0F).
        int size = file.length - (IV_LEN + MAC_LEN + 16) + (iv[15] & 0x0f);
        if (size < 0 || size > padded.length) throw new IllegalStateException("bad length trailer");

        byte[] out = new byte[size];
        System.arraycopy(padded, 0, out, 0, size);
        return out;
    }
}
