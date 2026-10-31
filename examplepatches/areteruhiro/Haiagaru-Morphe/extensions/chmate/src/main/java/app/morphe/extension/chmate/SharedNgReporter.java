package app.morphe.extension.chmate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Recognize only the literal reporter-ID template. Never execute or transmit a script. */
final class SharedNgReporter {
    private static final Pattern EXACT = Pattern.compile(
            "\\A\\s*function\\s*\\(\\s*text\\s*,\\s*options\\s*\\)\\s*\\{\\s*return\\s+options\\.posterId\\s*===\\s*(['\"])([A-Za-z0-9+/!_.-]{1,100})\\1\\s*;?\\s*}\\s*\\z");

    static String literal(String script) {
        if (script == null || script.length() > 4096) return null;
        Matcher match = EXACT.matcher(script);
        return match.matches() ? match.group(2) : null;
    }

    static String nativeLiteral(String pattern) {
        if(pattern==null||!pattern.matches("\\[[A-Za-z0-9+/!_.-]{1,100}★\\]"))return null;
        return pattern.substring(1,pattern.length()-2);
    }

    private SharedNgReporter() { }
}
