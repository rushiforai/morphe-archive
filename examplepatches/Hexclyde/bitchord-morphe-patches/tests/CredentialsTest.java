package app.bitchord.telegram;

import org.json.*;

import java.util.*;

import javax.crypto.*;

public final class CredentialsTest {
    static int checks;

    static void check(boolean value, String message) {
        checks++;
        if (!value) throw new AssertionError(message);
    }

    static void invalid(String id, String hash) {
        boolean failed = false;
        try {
            ApplicationCredentials.parse(id, hash);
        } catch (IllegalArgumentException e) {
            failed = true;
        }
        check(failed, "Invalid credentials accepted");
    }

    public static void main(String[] args) throws Exception {
        String secret = "ABCDEF0123456789ABCDEF0123456789";
        check(!ApplicationCredentials.empty().configured(), "Empty configuration allowed");
        ApplicationCredentials c = ApplicationCredentials.parse(" 12345 ", " " + secret + " ");
        check(c.configured() && c.apiId == 12345, "Valid numeric ID");
        check(c.apiHash.equals(secret.toLowerCase(Locale.ROOT)), "Normalized hash");
        for (String id : new String[] {"", "0", "-1", "abc", "2147483648"}) invalid(id, secret);
        for (String hash :
                new String[] {"", "abcd", secret + "0", "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"})
            invalid("12345", hash);
        check(!c.toString().contains(c.apiHash), "Hash redacted from diagnostics");
        KeyGenerator g = KeyGenerator.getInstance("AES");
        g.init(256);
        javax.crypto.SecretKey key = g.generateKey();
        JSONObject sealed = CredentialCipher.seal(c, key);
        check(
                !sealed.toString().contains(c.apiHash) && !sealed.toString().contains(secret),
                "No plaintext hash in storage envelope");
        check(CredentialCipher.open(sealed, key).sameAs(c), "Encrypted credentials round trip");
        check(
                !CredentialCipher.seal(c, key).getString("iv").equals(sealed.getString("iv")),
                "Fresh encryption nonce");
        boolean wrongKey = false;
        try {
            CredentialCipher.open(sealed, g.generateKey());
        } catch (Exception e) {
            wrongKey = true;
        }
        check(wrongKey, "Wrong key rejected");
        byte[] bytes = Base64.getDecoder().decode(sealed.getString("ciphertext"));
        bytes[0] ^= 1;
        sealed.put("ciphertext", Base64.getEncoder().encodeToString(bytes));
        boolean tamper = false;
        try {
            CredentialCipher.open(sealed, key);
        } catch (Exception e) {
            tamper = true;
        }
        check(tamper, "Ciphertext tampering rejected");
        System.out.println(
                "PASS: " + checks + " application-credential validation and encryption checks.");
    }
}
