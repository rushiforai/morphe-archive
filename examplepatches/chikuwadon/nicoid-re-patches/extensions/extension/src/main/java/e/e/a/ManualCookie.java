package e.e.a;

/** Accept only account session cookies, never arbitrary headers or cookie attributes. */
public final class ManualCookie {
    private ManualCookie() { }

    public static String normalize(String input) {
        if (input == null || input.length() > 16384 || input.indexOf('\r') >= 0 || input.indexOf('\n') >= 0)
            throw new IllegalArgumentException();
        String text = input.trim();
        if (text.regionMatches(true, 0, "Cookie:", 0, 7)) text = text.substring(7).trim();
        if (text.startsWith("user_session_") && text.indexOf('=') < 0 && text.indexOf(';') < 0)
            text = "user_session=" + text;
        String session = null, secure = null;
        for (String part : text.split(";")) {
            int equals = part.indexOf('=');
            if (equals < 0) continue;
            String name = part.substring(0, equals).trim();
            if (!"user_session".equals(name) && !"user_session_secure".equals(name)) continue;
            String value = part.substring(equals + 1).trim();
            if (value.isEmpty()) throw new IllegalArgumentException();
            for (int i = 0; i < value.length(); i++) {
                char c = value.charAt(i);
                if (c <= 0x20 || c >= 0x7f || c == '"' || c == ',' || c == '\\')
                    throw new IllegalArgumentException();
            }
            if ("user_session".equals(name)) {
                if (session != null) throw new IllegalArgumentException();
                session = value;
            } else {
                if (secure != null) throw new IllegalArgumentException();
                secure = value;
            }
        }
        if (session == null) throw new IllegalArgumentException();
        // The legacy importer requires the trailing semicolon and space.
        return "user_session=" + session + "; " + (secure == null ? "" : "user_session_secure=" + secure + "; ");
    }
}
