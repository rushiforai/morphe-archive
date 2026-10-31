package app.ratbanana.extension.gaminghub;

import java.util.Locale;

/**
 * Decides which server-driven rows of the Gaming Hub home feed are removed.
 * <p>
 * Rows are identified by the title the server sends for them ({@code rcu_title}),
 * because the server assigns no stable type to a curated row.
 */
@SuppressWarnings("unused")
public final class HomeRowFilter {

    /** Separates alternative titles of one row, e.g. translations. */
    private static final String TITLE_SEPARATOR = "|";

    private HomeRowFilter() {
    }

    /**
     * Injection point.
     *
     * @param rowTitle     Title of the row sent by the server. May be null.
     * @param hiddenTitles Titles to hide, separated by {@value #TITLE_SEPARATOR}.
     * @return Whether the row must be removed from the home feed.
     */
    public static boolean shouldHideRow(String rowTitle, String hiddenTitles) {
        if (rowTitle == null || hiddenTitles == null) {
            return false;
        }

        String normalizedRowTitle = normalize(rowTitle);
        if (normalizedRowTitle.isEmpty()) {
            return false;
        }

        int start = 0;
        while (start <= hiddenTitles.length()) {
            int end = hiddenTitles.indexOf(TITLE_SEPARATOR, start);
            if (end < 0) {
                end = hiddenTitles.length();
            }

            String candidate = normalize(hiddenTitles.substring(start, end));
            if (!candidate.isEmpty() && candidate.equals(normalizedRowTitle)) {
                return true;
            }

            start = end + TITLE_SEPARATOR.length();
        }

        return false;
    }

    /** Display type of the categories row. Enum names survive obfuscation, fields do not. */
    private static final String CATEGORY_LIST_DISPLAY_TYPE = "CATEGORY_LIST";

    /**
     * Injection point.
     *
     * @param displayType Display type enum constant of the row sent by the server. May be null.
     * @return Whether the row is the categories row.
     */
    public static boolean isCategoryListRow(Object displayType) {
        return displayType instanceof Enum
                && CATEGORY_LIST_DISPLAY_TYPE.equals(((Enum<?>) displayType).name());
    }

    /** Case and whitespace insensitive form, so cosmetic server changes do not break matching. */
    private static String normalize(String title) {
        return title.trim().replaceAll("\\s+", " ").toLowerCase(Locale.ROOT);
    }
}
