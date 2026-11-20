package app.template.extension.hevalcontrols;

import java.util.Locale;

/**
 * The Patch settings screen's section rules, kept free of Android types so they run in plain JVM
 * unit tests: which category goes first, which sections start collapsed and the header count.
 */
public final class Sections {
    private Sections() { }

    /**
     * A category about spoilers ("Spoiler-free", "Scores and spoilers") is listed above the others: it
     * is the one a user opens the screen for.
     */
    public static boolean isFirst(String category) {
        return category != null && category.toLowerCase(Locale.ROOT).contains("spoiler");
    }

    /**
     * A section starts collapsed when the screen collapses sections at all ({@code collapsible}: enough
     * features for a search field) and none of its features is on.
     */
    public static boolean startsCollapsed(boolean collapsible, int on) {
        return collapsible && on == 0;
    }

    /** The header count: "2 of 9 on", "1 of 1 on", "0 of 4 on". */
    public static String onCount(int on, int total) {
        return on + " of " + total + " on";
    }

    /** The header's spoken summary: "9 settings, 2 on", "1 setting, none on". */
    public static String spokenCount(int on, int total) {
        return total + (total == 1 ? " setting, " : " settings, ") + (on == 0 ? "none on" : on + " on");
    }
}
