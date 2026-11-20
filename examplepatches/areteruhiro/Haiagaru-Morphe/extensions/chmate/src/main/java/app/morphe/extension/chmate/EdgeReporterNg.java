package app.morphe.extension.chmate;

import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

/** Matches reporter-only NGThread rules against the suffix restored for display. */
final class EdgeReporterNg {
    private final String value;
    private final Pattern regex;

    private EdgeReporterNg(String value, Pattern regex) {
        this.value = value;
        this.regex = regex;
    }

    static EdgeReporterNg compile(String value, short flags) {
        if (value == null || value.indexOf('\u2605') < 0 || (flags & 4) != 0) return null;
        if ((flags & 0x20) == 0) return new EdgeReporterNg(value, null);
        try {
            return new EdgeReporterNg(value, Pattern.compile(value));
        } catch (PatternSyntaxException invalid) {
            return null;
        }
    }

    boolean matches(String suffix) {
        if (suffix == null) return false;
        return regex == null ? suffix.contains(value) : regex.matcher(suffix).find();
    }
}
