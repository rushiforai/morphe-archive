package dev.rikunode.futatabi.bridge;

import org.json.JSONObject;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Base64;

/** Official ALTCHA v1 client protocol, used only for a user-initiated post. */
final class AimogeProof {
    private AimogeProof() {}

    static String solve(JSONObject c) throws Exception {
        String algorithm = c.getString("algorithm");
        String challenge = c.getString("challenge");
        String salt = c.getString("salt");
        String signature = c.getString("signature");
        long max = c.getLong("maxnumber");
        if (!"SHA-256".equals(algorithm) || !challenge.matches("[0-9a-f]{64}")
                || salt.isEmpty() || salt.length() > 512
                || !signature.matches("[0-9a-f]{64}") || max < 0 || max > 1_000_000)
            throw new IllegalArgumentException("Unsupported ALTCHA challenge");
        byte[] target = new byte[32];
        for (int i = 0; i < target.length; i++)
            target[i] = (byte) Integer.parseInt(challenge.substring(i * 2, i * 2 + 2), 16);
        byte[] prefix = salt.getBytes(StandardCharsets.UTF_8);
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        for (int n = 0; n <= max; n++) {
            if ((n & 1023) == 0 && Thread.currentThread().isInterrupted())
                throw new InterruptedException("ALTCHA interrupted");
            digest.update(prefix);
            if (!MessageDigest.isEqual(target, digest.digest(Integer.toString(n).getBytes(StandardCharsets.US_ASCII))))
                continue;
            JSONObject solution = new JSONObject();
            solution.put("algorithm", algorithm);
            solution.put("challenge", challenge);
            solution.put("salt", salt);
            solution.put("signature", signature);
            solution.put("number", n);
            return Base64.getEncoder().encodeToString(solution.toString().getBytes(StandardCharsets.UTF_8));
        }
        throw new IllegalStateException("ALTCHA solution not found within server bound");
    }
}
