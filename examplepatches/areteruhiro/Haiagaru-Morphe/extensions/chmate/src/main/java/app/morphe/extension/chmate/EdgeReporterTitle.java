package app.morphe.extension.chmate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Keeps subject metadata when the thread menu loads an older history title. */
public final class EdgeReporterTitle {
    private static final Pattern REPORTER = Pattern.compile(" \\[([A-Za-z0-9+/]{8})★\\]$");

    private EdgeReporterTitle() {}

    public static String preserve(String selected, String history) {
        if (history == null || history.isEmpty()) return selected;
        if (selected == null) return history;
        Matcher reporter = REPORTER.matcher(selected);
        // Do not replace renamed titles or attach metadata to a different title.
        if (reporter.find() && selected.substring(0, reporter.start()).equals(history)) {
            return selected;
        }
        return history;
    }
}
