package app.morphe.extension.chmate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Literal local-log query only; never changes external search or NG rules. */
final class CachedWacchoiQuery {
    private static final Pattern SLIP = Pattern.compile("(?<![A-Za-z0-9+/])([A-Za-z0-9+/]{4})-([A-Za-z0-9+/]{4})(?![A-Za-z0-9+/])");
    static String suffix(String query) {
        Matcher match = SLIP.matcher(query == null ? "" : query);
        // Keep the separator: a bare token could also match the upper half.
        return match.find() ? "-" + match.group(2) : null;
    }
    static String restore(String current, String applied, String original) {
        return current != null && current.equals(applied) ? original : current;
    }
    private CachedWacchoiQuery() { }
}
