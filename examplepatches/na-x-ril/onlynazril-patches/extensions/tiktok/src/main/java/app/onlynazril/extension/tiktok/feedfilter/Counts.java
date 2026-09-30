package app.onlynazril.extension.tiktok.feedfilter;

import app.onlynazril.extension.tiktok.internal.Reflect;

/**
 * Reading a counter off an item, the one place the "cannot tell" rule lives.
 *
 * An ad carries no statistics, and a freshly built item may carry statistics whose count is not
 * filled in yet. Both answer -1, and -1 is never outside any range: hiding a video because its
 * count has not arrived would empty the feed on a slow response.
 */
final class Counts {
    /** The item's counter, or -1 when the statistics or the count cannot be read. */
    static long of(Object item, String getter, String field) {
        Object statistics = Reflect.property(item, "getStatistics", "statistics");
        if (statistics == null) return -1L;
        long count = asLong(Reflect.property(statistics, getter, field));
        return count < 0 ? -1L : count;
    }

    /** Whether the item's counter is known and falls outside `[min, max]`. */
    static boolean outside(Object item, String getter, String field, long[] range) {
        long count = of(item, getter, field);
        return count >= 0 && (count < range[0] || count > range[1]);
    }

    private static long asLong(Object value) {
        return value instanceof Number ? ((Number) value).longValue() : -1L;
    }

    private Counts() {}
}
