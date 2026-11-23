package app.morphe.extension.chmateuaspoof;

import java.net.URI;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/** Pure, Android-free rules. Unit-tested on the JVM. */
public final class UaSpoofRules {
    public static final String DALVIK_14 = dalvik("14");
    public static final String DALVIK_15 = dalvik("15");
    public static final String DALVIK_16 = dalvik("16");
    public static final String LEGACY =
            "Dalvik/2.1.0 (Linux; U; Android 4.0.3; HT-01 Build/XYZ0.123456.789)";

    static String dalvik(String version) {
        return "Dalvik/2.1.0 (Linux; U; Android " + version + "; HT-01 Build/XYZ0.123456.789)";
    }

    /** Printable ASCII only, like an HTTP header value; never allows CR/LF injection. */
    public static boolean valid(String agent) {
        if (agent == null || agent.isEmpty() || agent.length() > 1024) return false;
        if (agent.charAt(0) == ' ' || agent.charAt(agent.length() - 1) == ' ') return false;
        for (int i = 0; i < agent.length(); i++) {
            char c = agent.charAt(i);
            if (c < 32 || c > 126) return false;
        }
        return true;
    }

    /** Only absolute http(s) URLs without user info, same scope as Haiagaru's viewing UA. */
    public static boolean eligible(String url, String method) {
        if (url == null || method == null || !method.matches("[A-Za-z]+")) return false;
        try {
            URI uri = URI.create(url);
            String scheme = uri.getScheme();
            return ("http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme))
                    && uri.getHost() != null && uri.getUserInfo() == null;
        } catch (IllegalArgumentException invalid) {
            return false;
        }
    }

    /**
     * Returns a new name/value array whose User-Agent is exactly {@code agent} (all other headers
     * and their order kept), or {@code original} itself when nothing changes.
     */
    public static String[] withAgent(String[] original, String agent) {
        if (original == null || original.length % 2 != 0 || !valid(agent)) return original;
        List<String> result = new ArrayList<>(original.length + 2);
        boolean changed = false, seen = false;
        for (int i = 0; i < original.length; i += 2) {
            if ("User-Agent".equalsIgnoreCase(original[i])) {
                if (seen || !agent.equals(original[i + 1])) changed = true;
                if (seen) continue;
                seen = true;
                result.add(original[i]);
                result.add(agent);
            } else {
                result.add(original[i]);
                result.add(original[i + 1]);
            }
        }
        if (!seen) {
            result.add("User-Agent");
            result.add(agent);
            changed = true;
        }
        return changed ? result.toArray(new String[0]) : original;
    }

    /**
     * After a runtime switch to OFF, a UA string built earlier from the spoofed http.agent still
     * ends with that value. Put the original http.agent back; anything else is left untouched.
     */
    public static String restore(String value, Collection<String> applied, String original) {
        if (value == null || original == null || applied == null) return value;
        for (String agent : applied) {
            if (agent == null || agent.equals(original)) continue;
            if (value.equals(agent)) return original;
            if (value.endsWith(" " + agent)) {
                String result = value.substring(0, value.length() - agent.length()) + original;
                return valid(result) ? result : value;
            }
        }
        return value;
    }

    /** Header-array variant of {@link #restore}. Returns {@code original} when unchanged. */
    public static String[] restoreHeaders(String[] original, Collection<String> applied, String originalAgent) {
        if (original == null || original.length % 2 != 0) return original;
        String[] result = null;
        for (int i = 0; i < original.length; i += 2) {
            if (!"User-Agent".equalsIgnoreCase(original[i])) continue;
            String fixed = restore(original[i + 1], applied, originalAgent);
            if (fixed != null && !fixed.equals(original[i + 1])) {
                if (result == null) result = original.clone();
                result[i + 1] = fixed;
            }
        }
        return result == null ? original : result;
    }

    private UaSpoofRules() { }
}
