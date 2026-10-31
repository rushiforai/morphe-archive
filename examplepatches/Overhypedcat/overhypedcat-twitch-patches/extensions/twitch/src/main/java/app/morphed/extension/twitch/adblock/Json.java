package app.morphed.extension.twitch.adblock;

/**
 * Just enough JSON handling for the access token request, without org.json so it runs in unit tests.
 */
final class Json {
    private Json() {
    }

    static String quote(String value) {
        StringBuilder out = new StringBuilder(value.length() + 2).append('"');
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            switch (c) {
                case '"': out.append("\\\""); break;
                case '\\': out.append("\\\\"); break;
                case '\n': out.append("\\n"); break;
                case '\r': out.append("\\r"); break;
                case '\t': out.append("\\t"); break;
                default:
                    if (c < 0x20) out.append(String.format("\\u%04x", (int) c));
                    else out.append(c);
            }
        }
        return out.append('"').toString();
    }

    /**
     * The decoded string value of the first {@code "key": "..."} at or after {@code from}, or null.
     */
    static String stringValue(String json, String key, int from) {
        String needle = "\"" + key + "\"";
        int index = json.indexOf(needle, Math.max(0, from));
        while (index >= 0) {
            int i = index + needle.length();
            while (i < json.length() && Character.isWhitespace(json.charAt(i))) i++;
            if (i < json.length() && json.charAt(i) == ':') {
                i++;
                while (i < json.length() && Character.isWhitespace(json.charAt(i))) i++;
                if (i < json.length() && json.charAt(i) == '"') return readString(json, i + 1);
                return null;
            }
            index = json.indexOf(needle, index + 1);
        }
        return null;
    }

    private static String readString(String json, int start) {
        StringBuilder out = new StringBuilder();
        for (int i = start; i < json.length(); i++) {
            char c = json.charAt(i);
            if (c == '"') return out.toString();
            if (c != '\\') {
                out.append(c);
                continue;
            }
            if (++i >= json.length()) return null;
            char escaped = json.charAt(i);
            switch (escaped) {
                case 'n': out.append('\n'); break;
                case 'r': out.append('\r'); break;
                case 't': out.append('\t'); break;
                case 'b': out.append('\b'); break;
                case 'f': out.append('\f'); break;
                case 'u':
                    if (i + 4 >= json.length()) return null;
                    out.append((char) Integer.parseInt(json.substring(i + 1, i + 5), 16));
                    i += 4;
                    break;
                default: out.append(escaped);
            }
        }
        return null;
    }
}
