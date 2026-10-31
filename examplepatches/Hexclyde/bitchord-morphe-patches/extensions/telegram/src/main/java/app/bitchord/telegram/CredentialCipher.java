package app.bitchord.telegram;

import org.json.JSONObject;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;

/** Encryption independent of Android storage, so the envelope can be tested on a host JVM. */
public final class CredentialCipher {
    private CredentialCipher() {}

    public static JSONObject seal(ApplicationCredentials value, SecretKey key) throws Exception {
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] plain =
                new JSONObject()
                        .put("apiId", value.apiId)
                        .put("apiHash", value.apiHash)
                        .toString()
                        .getBytes(StandardCharsets.UTF_8);
        try {
            return new JSONObject()
                    .put("version", 1)
                    .put("iv", Base64.getEncoder().encodeToString(cipher.getIV()))
                    .put("ciphertext", Base64.getEncoder().encodeToString(cipher.doFinal(plain)));
        } finally {
            java.util.Arrays.fill(plain, (byte) 0);
        }
    }

    public static ApplicationCredentials open(JSONObject envelope, SecretKey key) throws Exception {
        if (envelope.getInt("version") != 1)
            throw new IllegalArgumentException("Unsupported application configuration version");
        byte[] iv = Base64.getDecoder().decode(envelope.getString("iv"));
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.DECRYPT_MODE, key, new GCMParameterSpec(128, iv));
        byte[] plain = cipher.doFinal(Base64.getDecoder().decode(envelope.getString("ciphertext")));
        try {
            JSONObject value = new JSONObject(new String(plain, StandardCharsets.UTF_8));
            return ApplicationCredentials.parse(
                    Integer.toString(value.getInt("apiId")), value.getString("apiHash"));
        } finally {
            java.util.Arrays.fill(plain, (byte) 0);
        }
    }
}
