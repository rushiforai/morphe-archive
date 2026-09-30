package app.onlynazril.extension.tiktok.feedfilter;

/**
 * One reason a feed item is kept out of the page.
 *
 * Whether the filter is switched on is decided before it is built, not by the filter: the page is
 * walked once, so a switch read per item would read the preferences thousands of times per fetch
 * for an answer that cannot change mid-page.
 */
public interface IFilter {
    /** Whether this item should be dropped from the page. */
    boolean shouldRemove(Object item);

    /**
     * What was dropped and why, for the tally line — the counter that failed the range, or the flag
     * that made the item an ad. Only asked for items this filter has already matched.
     */
    String reason(Object item);
}
