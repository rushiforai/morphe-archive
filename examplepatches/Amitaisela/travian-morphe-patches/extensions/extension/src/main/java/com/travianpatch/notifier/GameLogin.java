package com.travianpatch.notifier;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Reusing the game's own saved world login instead of signing in separately. The game keeps it in its
 * saved settings under "lastCookie-<avatar uuid>" (names seen in the v1.26.1 PREFS log). It is only used
 * when the token inside has the same claim NAMES as the one this app got from its own sign-in (so it is
 * the same kind of token) and has not expired. Nothing here ever logs a value: describe() gives lengths,
 * claim names and minutes left only. Pure logic (no Android APIs).
 */
final class GameLogin {

    static final String COOKIE_PREFIX = "lastCookie-";
    private static final Pattern JWT = Pattern.compile("eyJ[A-Za-z0-9_-]+\\.[A-Za-z0-9_-]+\\.[A-Za-z0-9_-]*");

    private GameLogin() {
    }

    /** The first JWT inside a saved cookie text (bare token or "JWT=...; path=/..."), or null. */
    static String jwtIn(String saved) {
        if (saved == null) {
            return null;
        }
        Matcher m = JWT.matcher(saved);
        return m.find() ? m.group() : null;
    }

    /** The JWT's payload claims, or null when it can't be read. */
    static JSONObject claims(String jwt) {
        try {
            String[] parts = jwt.split("\\.");
            if (parts.length < 2) {
                return null;
            }
            String b64 = parts[1].replace('-', '+').replace('_', '/');
            while (b64.length() % 4 != 0) {
                b64 += "=";
            }
            return new JSONObject(new String(java.util.Base64.getDecoder().decode(b64), "UTF-8"));
        } catch (Exception e) {
            return null;
        }
    }

    /** The claim names, sorted and joined ("aud,exp,iat,..."); "" when unreadable. */
    static String claimNames(String jwt) {
        JSONObject c = jwt == null ? null : claims(jwt);
        if (c == null) {
            return "";
        }
        List<String> names = new ArrayList<String>();
        Iterator<String> it = c.keys();
        while (it.hasNext()) {
            names.add(it.next());
        }
        Collections.sort(names);
        StringBuilder b = new StringBuilder();
        for (String n : names) {
            if (b.length() > 0) {
                b.append(',');
            }
            b.append(n);
        }
        return b.toString();
    }

    /** The token's expiry (epoch ms), 0 when not known. */
    static long expiresAtMs(String jwt) {
        JSONObject c = jwt == null ? null : claims(jwt);
        long exp = c == null ? 0 : c.optLong("exp", 0);
        return exp > 0 ? exp * 1000L : 0;
    }

    /**
     * The saved cookie to use: the one for this avatar when there is one, else the only one saved; null
     * when there are none, or several and none matches the avatar.
     */
    static String pick(Map<String, ?> saved, String avatarUuid) {
        String only = null;
        int count = 0;
        for (Map.Entry<String, ?> e : saved.entrySet()) {
            if (!e.getKey().startsWith(COOKIE_PREFIX) || !(e.getValue() instanceof String)) {
                continue;
            }
            if (avatarUuid != null && e.getKey().equals(COOKIE_PREFIX + avatarUuid)) {
                return (String) e.getValue();
            }
            only = (String) e.getValue();
            count++;
        }
        return count == 1 ? only : null;
    }

    /**
     * The game's token when it may be used now: same claim names as this app's own token (ourClaimNames,
     * not empty) and more than marginMs left. Null otherwise.
     */
    static String usable(String saved, String ourClaimNames, long nowMs, long marginMs) {
        String jwt = jwtIn(saved);
        if (jwt == null || ourClaimNames == null || ourClaimNames.isEmpty()) {
            return null;
        }
        if (!ourClaimNames.equals(claimNames(jwt))) {
            return null;
        }
        return expiresAtMs(jwt) - nowMs > marginMs ? jwt : null;
    }

    /** A log line with no values: lengths, shape, claim names, whether they match ours, minutes left. */
    static String describe(String saved, String ourClaimNames, long nowMs) {
        if (saved == null) {
            return "no saved game login";
        }
        String jwt = jwtIn(saved);
        String names = claimNames(jwt);
        long exp = expiresAtMs(jwt);
        return "saved text " + saved.length() + " chars" + (saved.startsWith("JWT=") ? ", starts with JWT=" : "")
                + ", token " + (jwt == null ? "not found" : jwt.length() + " chars")
                + ", claims [" + names + "]"
                + ", same kind as ours: " + (ourClaimNames != null && !ourClaimNames.isEmpty() && ourClaimNames.equals(names))
                + (exp > 0 ? ", " + ((exp - nowMs) / 60_000L) + " min left" : ", no expiry");
    }
}
