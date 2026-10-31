package xyz.urro.gboard;

import android.util.Base64;
import org.json.JSONObject;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

/** ClipCascade's SHA3 login and PBKDF2/AES-GCM wire format. No credentials are logged. */
public final class ClipCrypto {
    private final SecretKeySpec key;

    public static String loginPassword(String password) throws Exception {
        byte[] bytes = Sha3.sha3_512(password.getBytes(StandardCharsets.UTF_8));
        StringBuilder hex = new StringBuilder(128);
        for (byte value : bytes) hex.append(String.format(java.util.Locale.ROOT, "%02x", value & 255));
        return hex.toString();
    }

    // Login uses SHA3; stock clipboard encryption derives its key from the original password.
    ClipCrypto(String username, String password, String salt, int iterations, boolean enabled) throws Exception {
        if (iterations < 1 || iterations > 10000000) throw new IllegalArgumentException("Invalid encryption iterations");
        key = enabled ? new SecretKeySpec(SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256")
                .generateSecret(new PBEKeySpec(password.toCharArray(),
                        (username + password + salt).getBytes(StandardCharsets.UTF_8), iterations, 256))
                .getEncoded(), "AES") : null;
    }

    String encrypt(String text) throws Exception {
        if (key == null) return text;
        byte[] nonce = new byte[12];
        new SecureRandom().nextBytes(nonce);
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.ENCRYPT_MODE, key, new GCMParameterSpec(128, nonce));
        byte[] sealed = cipher.doFinal(text.getBytes(StandardCharsets.UTF_8));
        return new JSONObject().put("nonce", encode(nonce)).put("ciphertext", encode(java.util.Arrays.copyOf(sealed, sealed.length - 16)))
                .put("tag", encode(java.util.Arrays.copyOfRange(sealed, sealed.length - 16, sealed.length))).toString();
    }

    String decrypt(String payload) throws Exception {
        if (key == null) return payload;
        JSONObject envelope = new JSONObject(payload);
        byte[] ciphertext = Base64.decode(envelope.getString("ciphertext"), Base64.DEFAULT);
        byte[] tag = Base64.decode(envelope.getString("tag"), Base64.DEFAULT);
        if (tag.length != 16) throw new IllegalArgumentException("Invalid authentication tag");
        byte[] combined = new byte[ciphertext.length + tag.length];
        System.arraycopy(ciphertext, 0, combined, 0, ciphertext.length);
        System.arraycopy(tag, 0, combined, ciphertext.length, tag.length);
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.DECRYPT_MODE, key, new GCMParameterSpec(128, Base64.decode(envelope.getString("nonce"), Base64.DEFAULT)));
        return new String(cipher.doFinal(combined), StandardCharsets.UTF_8);
    }

    private static String encode(byte[] bytes) { return Base64.encodeToString(bytes, Base64.NO_WRAP); }
}
