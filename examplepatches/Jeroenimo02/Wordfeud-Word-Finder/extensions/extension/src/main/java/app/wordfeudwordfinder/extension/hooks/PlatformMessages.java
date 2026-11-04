package app.wordfeudwordfinder.extension.hooks;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONObject;

/** Pure decoding helpers for Flutter platform messages. Never throw; return null when not decodable. */
public final class PlatformMessages {
    /**
     * A game route: {@code /game/<id>}, optionally with a trailing slash, a query or a fragment
     * ({@code /game/123?x=1}), and optionally preceded by a scheme and host ({@code wordfeud://app/game/123}) or
     * without the leading slash. Pages on top of a game ({@code /game/123/chat}, the move history) are not the game
     * screen itself, so a further path segment is not a game route. {@code /games/1}, {@code /game/},
     * {@code /game/abc} and {@code /gameover/1} are not game routes either.
     */
    private static final Pattern GAME_URI =
            Pattern.compile("^(?:[A-Za-z][A-Za-z0-9+.-]*://[^/?#]*)?/?game/(\\d{1,18})/?(?:[?#].*)?$");
    /** Longest route kept by {@link #routeFromNavigation}. */
    static final int MAX_ROUTE = 120;

    private PlatformMessages() {
    }

    public static Long gameIdFromNavigation(String json) {
        return gameIdFromRoute(uri(json));
    }

    /** The game id of a route (see {@link #GAME_URI}), or null when it is not a game route. */
    public static Long gameIdFromRoute(String uri) {
        try {
            if (uri == null) return null;
            Matcher m = GAME_URI.matcher(uri.trim());
            return m.matches() ? Long.valueOf(Long.parseLong(m.group(1))) : null;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * The route of a {@code routeInformationUpdated} message for diagnostics ({@code route=} in Copy details): one
     * line, at most {@link #MAX_ROUTE} characters, the query and fragment replaced by {@code ?...} (they could hold
     * other data). Null when the message has no route.
     */
    public static String routeFromNavigation(String json) {
        String u = uri(json);
        if (u == null) return null;
        u = u.replace('\r', ' ').replace('\n', ' ');
        int q = indexOfAny(u, '?', '#');
        if (q >= 0) u = u.substring(0, q) + "?...";
        return u.length() > MAX_ROUTE ? u.substring(0, MAX_ROUTE) : u;
    }

    /** {@code args.uri} (Dart's routeInformationUpdated), or {@code args.location} (older Flutter versions). */
    private static String uri(String json) {
        try {
            if (json == null) return null;
            JSONObject args = new JSONObject(json).optJSONObject("args");
            if (args == null) return null;
            Object u = args.opt("uri");
            if (!(u instanceof String)) u = args.opt("location");
            return u instanceof String ? (String) u : null;
        } catch (Exception e) {
            return null;
        }
    }

    private static int indexOfAny(String s, char a, char b) {
        int i = s.indexOf(a);
        int j = s.indexOf(b);
        if (i < 0) return j;
        if (j < 0) return i;
        return Math.min(i, j);
    }

    public static Boolean darkFromOverlayStyle(String json) {
        try {
            if (json == null) return null;
            JSONObject args = new JSONObject(json).optJSONObject("args");
            if (args == null) return null;
            Object v = args.opt("statusBarIconBrightness");
            if (!(v instanceof String)) return null;
            String b = (String) v;
            return Boolean.valueOf("Brightness.light".equals(b));
        } catch (Exception e) {
            return null;
        }
    }

    /** StandardMessageCodec list (0x0C) of size 1 holding TRUE (0x01) or FALSE (0x02). */
    public static Boolean bannerVisible(byte[] b) {
        if (b == null || b.length != 3 || b[0] != 0x0C || b[1] != 0x01) return null;
        if (b[2] == 0x01) return Boolean.TRUE;
        if (b[2] == 0x02) return Boolean.FALSE;
        return null;
    }
}
