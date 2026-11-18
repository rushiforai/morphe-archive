// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import android.content.SharedPreferences;
import android.net.Uri;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

/** The parts of "Spoof client" that run in the app. */
public final class SpoofClient {
    private static final String TOKEN_PATH = "/api/v1/access_token";
    /** Reddit hosts that serve no API, as the app itself lists them. */
    private static final Set<String> NOT_API =
            new HashSet<>(Arrays.asList("about.reddit.com", "blog.reddit.com", "code.reddit.com",
                    "static.reddit.com", "thumbs.reddit.com"));
    private static final String APP_TOKEN_KEY = "app_token_client";

    private SpoofClient() {}

    /** Turned on by the "Spoof client" patch. */
    public static boolean isEnabled() {
        return false;
    }

    /** The "OAuth client ID" option, put here by the patch. */
    public static String clientId() {
        return "";
    }

    /** The "User-Agent" option, put here by the patch. */
    public static String userAgent() {
        return "";
    }

    /**
     * Replaces the app's check of whether a request takes the app-only token when no account is logged in. The app
     * gave it only to oauth.reddit.com/api/v1/ and sent everything else to www.reddit.com without a token, which
     * Reddit now refuses (403). With this, every Reddit API request goes to oauth.reddit.com with the token, as it does
     * for a logged-in account. The token request itself never does: it would ask for a token to get a token.
     */
    public static boolean usesAppToken(Uri uri) {
        return uri != null && usesAppToken(uri.getScheme(), uri.getHost(), uri.getPath());
    }

    static boolean usesAppToken(String scheme, String host, String path) {
        if (!"https".equalsIgnoreCase(scheme) && !"http".equalsIgnoreCase(scheme)) return false;
        if (host == null) return false;
        String name = host.toLowerCase(Locale.ROOT);
        if (!name.equals("reddit.com") && !name.endsWith(".reddit.com")) return false;
        if (NOT_API.contains(name)) return false;
        return path == null || !path.startsWith(TOKEN_PATH);
    }

    /**
     * The expiry the app reads for its cached app-only token, or 0, which makes it get a new one, when that token
     * wasn't issued to the current client ID: a token from another client (an earlier build with other options) would
     * fail every logged-out request until it expired, up to a day.
     */
    public static long appTokenExpiry(String token, long expiry) {
        try {
            SharedPreferences preferences = App.preferences();
            if (token == null || token.isEmpty() || preferences == null) return expiry;
            return expiryFor(preferences.getString(APP_TOKEN_KEY, null), token, expiry);
        } catch (RuntimeException error) {
            return expiry;
        }
    }

    /**
     * {@code expiry} if {@code marker}, the stored note of the last token handed out, says {@code token} was issued to
     * the current client ID, else 0.
     */
    static long expiryFor(String marker, String token, long expiry) {
        return issuedHere(token).equals(marker) ? expiry : 0;
    }

    /** Notes that the app-only token the app hands out was issued to the current client ID. */
    public static void appTokenIssued(String token) {
        try {
            SharedPreferences preferences = App.preferences();
            if (token == null || token.isEmpty() || preferences == null) return;
            String issued = issuedHere(token);
            if (!issued.equals(preferences.getString(APP_TOKEN_KEY, null))) {
                preferences.edit().putString(APP_TOKEN_KEY, issued).apply();
            }
        } catch (RuntimeException ignored) {
            // At worst the next request gets a new token.
        }
    }

    /** The client ID and a hash of the token, so the token itself is stored once only, by the app. */
    static String issuedHere(String token) {
        return clientId() + ":" + sha256(token);
    }

    static String sha256(String text) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(text.getBytes(StandardCharsets.UTF_8));
            StringBuilder hex = new StringBuilder(digest.length * 2);
            for (byte b : digest) hex.append(String.format(Locale.ROOT, "%02x", b));
            return hex.toString();
        } catch (Exception error) {
            throw new IllegalStateException(error);
        }
    }

    /** The User-Agent for requests the extension sends Reddit itself: the option's, or the system's without it. */
    static String redditUserAgent() {
        return isEnabled() ? userAgent() : Http.systemUserAgent();
    }
}
