package xyz.urro.transit;

import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Pure classifier for Transit GO instruction text. No Android dependencies.
 *
 * Templates come from Transit 6.3.5 native strings: "Get off in %d stop(s)",
 * "Stay onboard! Get off the %1$s in %2$d stop(s)", "Your stop is next!",
 * "This is your stop!", "Approaching, %s. This is your stop.", "Next stop: %s".
 * These are only shown while the rider is aboard a vehicle.
 */
public final class GoInstruction {
    public enum Kind { STOPS, NEXT, CURRENT, ABOARD, OTHER }

    public static final class Result {
        public final Kind kind;
        public final int stops;
        /** Vehicle name from "Get off the X in N stops", lower case, or null when the template omits it. */
        public final String vehicle;
        Result(Kind kind, int stops, String vehicle) { this.kind = kind; this.stops = stops; this.vehicle = vehicle; }
        public boolean aboard() { return kind != Kind.OTHER; }
    }

    private static final Pattern MARKUP = Pattern.compile("<[^<>]{0,200}>");
    private static final Pattern STOPS = Pattern.compile(
        "^(?:stay onboard!?\\s*)?get off(?: the (.{1,40}?))? in ([0-9]{1,3}) stops?(?: at .{1,160})?[.!]?$", Pattern.CASE_INSENSITIVE);
    private static final Pattern NEXT = Pattern.compile("^your stop is next!?$", Pattern.CASE_INSENSITIVE);
    private static final Pattern CURRENT = Pattern.compile("^(?:approaching, .{1,120}\\. )?this is your stop[.!]?$", Pattern.CASE_INSENSITIVE);
    private static final Pattern ABOARD = Pattern.compile("^(?:next stop[,:] .{1,120}|at your stop[.!]?)$", Pattern.CASE_INSENSITIVE);

    private GoInstruction() {}

    /** Removes SmartString markup such as {@code <color|5e7a82/c6c6ca>} and normalizes whitespace. */
    public static String plain(String raw) {
        if (raw == null) return null;
        String s = MARKUP.matcher(raw).replaceAll("");
        s = s.replace('\u00a0', ' ').replaceAll("\\s+", " ").trim();
        return s.length() > 500 ? s.substring(0, 500) : s;
    }

    public static Result classify(String text) {
        String s = plain(text);
        if (s == null || s.isEmpty()) return new Result(Kind.OTHER, -1, null);
        Matcher m = STOPS.matcher(s);
        if (m.matches()) {
            int n;
            try { n = Integer.parseInt(m.group(2)); } catch (NumberFormatException e) { return new Result(Kind.OTHER, -1, null); }
            String vehicle = m.group(1) == null ? null : m.group(1).trim().toLowerCase(Locale.ROOT);
            return new Result(Kind.STOPS, n, vehicle);
        }
        if (NEXT.matcher(s).matches()) return new Result(Kind.NEXT, -1, null);
        if (CURRENT.matcher(s).matches()) return new Result(Kind.CURRENT, -1, null);
        if (ABOARD.matcher(s).matches()) return new Result(Kind.ABOARD, -1, null);
        return new Result(Kind.OTHER, -1, null);
    }

    /** Privacy-preserving shape for diagnostics: template kind only; unknown text can contain stop names. */
    public static String shape(String text) {
        String s = plain(text);
        if (s == null || s.isEmpty()) return "empty";
        Result r = classify(s);
        if (r.kind != Kind.OTHER) return r.kind.name() + (r.vehicle == null ? "" : ":" + r.vehicle);
        return "OTHER";
    }
}
