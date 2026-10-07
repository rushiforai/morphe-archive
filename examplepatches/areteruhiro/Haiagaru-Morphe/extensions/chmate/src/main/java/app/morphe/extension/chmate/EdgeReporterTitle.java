package app.morphe.extension.chmate;

/** Keeps subject metadata when the thread menu loads an older history title. */
public final class EdgeReporterTitle {
    private EdgeReporterTitle() {}

    public static String preserve(String selected, String history) {
        if (history == null || history.isEmpty()) return selected;
        if (selected == null) return history;
        String suffix = EdgeReporterId.suffix(selected);
        // Do not replace renamed titles or attach metadata to a different title.
        if (suffix != null && EdgeReporterId.titleForNextThreadMatch(selected).equals(history)) {
            return selected;
        }
        return history;
    }
}
