// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import android.util.Log;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Collections;
import java.util.Locale;
import java.util.Map;
import org.json.JSONObject;

/**
 * Lets the app's own Redgifs lookup, {@code GET https://api.redgifs.com/v2/gifs/<id>}, work again. Redgifs disabled the
 * app's client credentials (401 ClientDisabled), so the token comes from Redgifs' temporary-token API instead. That
 * token is bound to the User-Agent and address it was issued to, so the lookup sends the same User-Agent as the token
 * request: the system's, not the one the app sends to Reddit. The app pinned api.redgifs.com to keys Redgifs no longer
 * uses, so that host loses its pins and is checked against the system's CAs like every other unpinned host.
 */
public final class Redgifs {
    static final String PINNED_HOST = "api.redgifs.com";
    private static final String TOKEN_URL = "https://" + PINNED_HOST + "/v2/auth/temporary";
    // Renew a little before the token's own expiry, so it doesn't run out between here and Redgifs.
    static final long EXPIRY_MARGIN_MS = 60_000;

    /** Gets a new token; a fake in tests. */
    interface Issuer {
        String issue() throws Exception;
    }

    /** The cached token and when to stop using it; renewed when Redgifs rejects it. */
    static final class Tokens {
        private final Issuer issuer;
        private String token;
        private long renewAt;

        Tokens(Issuer issuer) {
            this.issuer = issuer;
        }

        /**
         * The token for a lookup. {@code previousStatus} is the HTTP status of the lookup's previous try, 0 for none: the
         * app tries again only when Redgifs rejected the token (400, 401, 403), so any other value means the cached one is
         * spent. Throws when no token could be had.
         */
        synchronized String get(int previousStatus, long now) throws Exception {
            if (previousStatus != 0 || token == null || now >= renewAt) {
                token = null;
                String fresh = issuer.issue();
                long expiry = expiryMs(fresh);
                // Without an expiry in it, keep it until Redgifs rejects it.
                renewAt = expiry > 0 ? expiry - EXPIRY_MARGIN_MS : Long.MAX_VALUE;
                token = fresh;
            }
            return token;
        }
    }

    private static final Tokens TOKENS = new Tokens(Redgifs::issue);

    private Redgifs() {}

    /** Turned on by the "Fix Redgifs" patch. */
    public static boolean isEnabled() {
        return false;
    }

    /**
     * Called by the app's Redgifs lookup in place of its token getter. Returns null when no token could be had, which
     * the app reports as a failed load without trying again.
     */
    public static String token(int previousStatus) {
        try {
            return TOKENS.get(previousStatus, System.currentTimeMillis());
        } catch (Exception error) {
            Log.w(App.TAG, "Redgifs token request failed", error);
            return null;
        }
    }

    /** The User-Agent of the app's Redgifs lookup: the one the token was issued to. */
    public static String userAgent() {
        return Http.systemUserAgent();
    }

    /**
     * The gif ID the app looks up, lowercased: the app keeps the case of IDs it takes from links
     * ({@code redgifs.com/watch/PeskyShinyHarvestmouse}), and the API answers 404 for any but lowercase. Anything that
     * isn't a plain ID passes through as it was.
     */
    public static String gifId(String id) {
        if (id == null || !id.matches("[A-Za-z0-9]+")) return id;
        return id.toLowerCase(Locale.ROOT);
    }

    /** The pins the app adds for {@code host}: none for api.redgifs.com, whose pinned keys Redgifs no longer uses. */
    public static String[] pins(String host, String[] pins) {
        String[] kept = pins(host, pins, isEnabled());
        if (kept != pins) Log.i(App.TAG, "Unpinned " + host);
        return kept;
    }

    static String[] pins(String host, String[] pins, boolean on) {
        return on && PINNED_HOST.equals(host) ? new String[0] : pins;
    }

    private static String issue() throws Exception {
        Map<String, String> headers = Collections.singletonMap("User-Agent", userAgent());
        Http.Reply reply = Http.send("GET", TOKEN_URL, headers, null, false);
        if (reply.status != 200) throw new IllegalStateException("Redgifs token request returned " + reply.status);
        String token = new JSONObject(new String(reply.body, StandardCharsets.UTF_8)).optString("token", "");
        // It goes into an Authorization header.
        if (!token.matches("[A-Za-z0-9._~+/=-]+")) throw new IllegalStateException("Redgifs sent no token");
        return token;
    }

    /** When the token, a JWT, expires, in milliseconds since the epoch; 0 when it carries no readable expiry. */
    static long expiryMs(String token) {
        String[] parts = token.split("\\.", -1);
        if (parts.length != 3) return 0;
        byte[] payload = base64Url(parts[1]);
        if (payload == null) return 0;
        try {
            long exp = new JSONObject(new String(payload, StandardCharsets.UTF_8)).optLong("exp", 0);
            return exp > 0 && exp < Long.MAX_VALUE / 1000 ? exp * 1000 : 0;
        } catch (Exception error) {
            return 0;
        }
    }

    /** Decodes unpadded base64url, or returns null. (java.util.Base64 needs API 26; android.util.Base64 is a stub in tests.) */
    static byte[] base64Url(String text) {
        if (text.length() % 4 == 1) return null;
        byte[] out = new byte[text.length() * 3 / 4];
        int bits = 0;
        int count = 0;
        int length = 0;
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            int value;
            if (c >= 'A' && c <= 'Z') value = c - 'A';
            else if (c >= 'a' && c <= 'z') value = c - 'a' + 26;
            else if (c >= '0' && c <= '9') value = c - '0' + 52;
            else if (c == '-') value = 62;
            else if (c == '_') value = 63;
            else return null;
            bits = (bits << 6) | value;
            count += 6;
            if (count >= 8) {
                count -= 8;
                out[length++] = (byte) (bits >> count);
                bits &= (1 << count) - 1;
            }
        }
        return length == out.length ? out : Arrays.copyOf(out, length);
    }
}
