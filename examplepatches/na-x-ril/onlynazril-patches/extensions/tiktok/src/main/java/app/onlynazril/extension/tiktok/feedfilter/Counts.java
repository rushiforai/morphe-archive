package app.onlynazril.extension.tiktok.feedfilter;

import app.onlynazril.extension.tiktok.internal.Reflect;

/**
 * Reading a counter off an item, the one place the "cannot tell" rule lives.
 * <p>
 * An ad carries no statistics, and a freshly built item may carry statistics whose count is not
 * filled in yet. Both answer -1. An unknown count counts as outside the range: the item is
 * dropped, and hiding it is safe because the feed's lists keep one item when everything would go
 * , a page can no longer empty the surface.
 * <p>
 * Keeping those items was the leak: TikTok fills a page's counts in a moment after the list is
 * inserted, so a video held back only because its count had not arrived came back on screen with
 * its real, filtered-out count in the corner (a 876-like video under a 2000-like minimum). The
 * page's own census line reports those items as `unreadCounts`, and a drop made for this reason
 * reads `likes=-1` / `plays=-1` in the dropped list.
 */
final class Counts {
    /** The item's counter, or -1 when the statistics or the count cannot be read. */
    static long of(Object item, String getter, String field) {
        Object statistics = Reflect.property(item, "getStatistics", "statistics");
        if (statistics == null) return -1L;
        long count = asLong(Reflect.property(statistics, getter, field));
        return count < 0 ? -1L : count;
    }

    /** Whether the item's counter is unknown, or known and outside `[min, max]`. */
    static boolean outside(Object item, String getter, String field, long[] range) {
        long count = of(item, getter, field);
        return count < 0 || count < range[0] || count > range[1];
    }

    private static long asLong(Object value) {
        return value instanceof Number ? ((Number) value).longValue() : -1L;
    }

    private Counts() {}
}
