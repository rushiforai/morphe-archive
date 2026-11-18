import android.content.Intent;
import io.github.jordanwoodson.extension.shared.kick.KickPrivacy;
import io.github.jordanwoodson.extension.shared.settings.Settings;
import java.util.Objects;

/** Exercises the production extension against small Intent/Settings boundary doubles. */
public final class PrivacyProbe {
    private static int checks;

    private static void equal(Object expected, Object actual) {
        checks++;
        if (!Objects.equals(expected, actual)) {
            throw new AssertionError("expected=" + expected + "; actual=" + actual);
        }
    }

    private static void clean(String input, String expected) {
        equal(expected, KickPrivacy.cleanShareText(input));
    }

    public static void main(String[] args) {
        clean(null, null);
        clean("No link here", "No link here");
        clean("https://kick.com/channel", "https://kick.com/channel");
        clean("https://kick.com/x?utm_source=a", "https://kick.com/x");
        clean("https://kick.com/x?utm_source=a&t=123&clip=id#part", "https://kick.com/x?t=123&clip=id#part");
        clean("https://kick.com/x?t=1&utm_campaign=a&t=2&token=a%2Bb#x", "https://kick.com/x?t=1&t=2&token=a%2Bb#x");
        clean("https://kick.com/x?utm_future=a&source=feed&ref=friend", "https://kick.com/x?utm_future=a&source=feed&ref=friend");
        clean("https://kick.com.evil.test/x?utm_source=a", "https://kick.com.evil.test/x?utm_source=a");
        clean("https://other.test/x?utm_source=a", "https://other.test/x?utm_source=a");
        clean("https://kick.com@evil.test/x?utm_source=a", "https://kick.com@evil.test/x?utm_source=a");
        clean("https://user@kick.com/x?utm_source=a", "https://user@kick.com/x?utm_source=a");
        clean("HTTPS://WWW.KICK.COM/x?UTM_SOURCE=a&%75tm_medium=b&t=4", "HTTPS://WWW.KICK.COM/x?t=4");
        clean("https://kick.com/x?gclid=1&dclid=2&fbclid=3&msclkid=4&ttclid=5&twclid=6", "https://kick.com/x");
        clean("https://kick.com/x?utm_source=%zz", "https://kick.com/x?utm_source=%zz");
        clean("Watch (https://kick.com/x?utm_source=a). And https://other.test/x?fbclid=2",
                "Watch (https://kick.com/x). And https://other.test/x?fbclid=2");
        clean("https://kick.com/x?sig=ab%2Fcd%3D&time=2#x?utm_source=fragment",
                "https://kick.com/x?sig=ab%2Fcd%3D&time=2#x?utm_source=fragment");
        clean("https://kick.com/x?utm_source=a&utm_source=b&flag", "https://kick.com/x?flag");
        clean("https://kick.com/x?redirect=https%3A%2F%2Fexample.com%2F%3Futm_source%3D1&utm_id=2",
                "https://kick.com/x?redirect=https%3A%2F%2Fexample.com%2F%3Futm_source%3D1");

        Intent intent = new Intent();
        equal(intent, KickPrivacy.putShareExtra(intent, Intent.EXTRA_TEXT, "https://kick.com/x?utm_source=a"));
        equal("https://kick.com/x", intent.value);
        KickPrivacy.putShareExtra(intent, "android.intent.extra.SUBJECT", "https://kick.com/x?utm_source=a");
        equal("https://kick.com/x?utm_source=a", intent.value);
        Settings.linksEnabled = false;
        KickPrivacy.putShareExtra(intent, Intent.EXTRA_TEXT, "https://kick.com/x?utm_source=a");
        equal("https://kick.com/x?utm_source=a", intent.value);
        equal(false, KickPrivacy.allowAnalyticsCollection(true));

        Settings.linksEnabled = true;
        Settings.analyticsEnabled = false;
        KickPrivacy.putShareExtra(intent, Intent.EXTRA_TEXT, "https://kick.com/x?utm_source=a");
        equal("https://kick.com/x", intent.value);
        equal(true, KickPrivacy.allowAnalyticsCollection(true));
        equal(false, KickPrivacy.allowAnalyticsCollection(false));
        Settings.analyticsEnabled = true;
        equal(false, KickPrivacy.allowAnalyticsCollection(true));
        equal(false, KickPrivacy.allowAnalyticsCollection(false));

        // Block device fingerprinting is opt-in: off, on, and an unreadable registry (key unknown) all checked.
        equal(false, KickPrivacy.blockFingerprint());
        Settings.fingerprintingBlocked = true;
        equal(true, KickPrivacy.blockFingerprint());
        equal(1, io.github.jordanwoodson.extension.shared.Logger.blocked);
        Settings.fingerprintingRegistered = false;
        equal(false, KickPrivacy.blockFingerprint());
        System.out.println("PASS: " + checks + " privacy helper contract assertions");
    }
}
