package app.ayham.extension.music.features;

import android.content.Context;
import android.content.SharedPreferences;
import android.webkit.CookieManager;

/**
 * The listener's own Spotify sign-in for the canvas (canvas.md §4 rule 0, §13 rule 9): the sp_dc
 * cookie read from Spotify's own login page (SpotifySignInPreference), kept in the app's private
 * storage. It is never printed, logged, shown (not even in part) or put in a URL; it goes only to
 * Spotify, in the cookie header. After Sign out it is forgotten and not picked up again.
 */
public final class SpotifySession {
    private static final String FILE = "ayham_spotify", KEY = "sp_dc";

    private SpotifySession() {
    }

    private static SharedPreferences prefs(Context c) {
        return c.getSharedPreferences(FILE, Context.MODE_PRIVATE);
    }

    static boolean signedIn() {
        return cookie() != null;
    }

    static boolean signedIn(Context c) {
        return c != null && prefs(c).getString(KEY, null) != null;
    }

    /** The session cookie, or null when signed out. */
    static String cookie() {
        Context c = Features.appContext;
        String v = c == null ? null : prefs(c).getString(KEY, null);
        return v == null || v.isEmpty() ? null : v;
    }

    /** The sp_dc value in a Cookie header line from Spotify's pages, or null. */
    static String spDc(String cookies) {
        if (cookies == null) return null;
        for (String part : cookies.split(";")) {
            String p = part.trim();
            if (p.startsWith(KEY + "=")) {
                String v = p.substring(KEY.length() + 1).trim();
                return v.isEmpty() ? null : v;
            }
        }
        return null;
    }

    static void save(Context c, String spDc) {
        prefs(c).edit().putString(KEY, spDc).apply();
        SpotifyCanvas.forgetUser();
    }

    /**
     * Sign out: the kept cookie is deleted, and so are Spotify's own cookies in the sign-in screen's
     * web view (all of them, its login page's too: else Sign in logs the same account straight back
     * in, with no way to pick another), so nothing is read again until the listener signs in. Only
     * Spotify's: the app's other web views keep theirs.
     */
    static void signOut(Context c) {
        prefs(c).edit().remove(KEY).apply();
        SpotifyCanvas.forgetUser();
        try {
            CookieManager m = CookieManager.getInstance();
            for (String host : new String[]{"https://open.spotify.com", "https://accounts.spotify.com", "https://www.spotify.com", "https://spotify.com"}) {
                java.util.Set<String> names = new java.util.HashSet<>();
                names.add(KEY);
                String all = m.getCookie(host);
                if (all != null) for (String part : all.split(";")) {
                    int eq = part.indexOf('=');
                    String n = (eq < 0 ? part : part.substring(0, eq)).trim();
                    if (!n.isEmpty()) names.add(n);
                }
                for (String n : names) {
                    // a cookie set for the whole domain, and one set for this host only
                    m.setCookie(host, n + "=; Max-Age=0; Domain=.spotify.com; Path=/");
                    m.setCookie(host, n + "=; Max-Age=0; Path=/");
                }
            }
            m.flush();
        } catch (Throwable ignored) {
            // no web view on this phone: nothing kept there
        }
    }
}
