package patches.bright;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/**
 * The audited publisher signing format: "epoch-120:hmac-sha256-hex" where the
 * HMAC key is the provisioned constant and the message is the epoch string.
 * The key lives only inside this signer; its value is never logged, exported
 * or attached outside the private article client.
 */
final class HmacArticleHeaderSigner implements ArticleHeaderSigner {

    static final String HEADER_NAME = "x-app-article";
    private static final long BACKDATE_SECONDS = 120L;

    private final SigningKeySource keys;
    private final EpochClock clock;

    HmacArticleHeaderSigner(SigningKeySource keys, EpochClock clock) {
        this.keys = keys;
        this.clock = clock;
    }

    @Override
    public String sign() {
        byte[] secret = keys.load();
        if (secret == null || secret.length == 0) {
            return null;
        }
        long epoch = clock.nowSeconds() - BACKDATE_SECONDS;
        if (epoch <= 0) {
            return null;
        }
        String stamp = Long.toString(epoch);
        try {
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(new SecretKeySpec(secret, "HmacSHA256"));
            byte[] digest = mac.doFinal(stamp.getBytes("UTF-8"));
            StringBuilder hex = new StringBuilder(digest.length * 2);
            for (byte b : digest) {
                hex.append(Character.forDigit((b >> 4) & 0xf, 16));
                hex.append(Character.forDigit(b & 0xf, 16));
            }
            return stamp + ":" + hex;
        } catch (Exception failure) {
            return null;
        }
    }
}
