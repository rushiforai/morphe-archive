package app.onlynazril.extension.tiktok.feedfilter;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.internal.Reflect;
import app.onlynazril.extension.tiktok.settings.FeedFilterSettings;

/**
 * Drops the items a page should not show, in place, on the list the app is about to use.
 *
 * Three call sites, because a page's `items` is written three ways on 47.0.3: the fetch's return
 * (after the app has merged its preloaded ads in), `FeedItemList#setItems`, and `FeedItemList#clone`.
 * They do not hand over the same shape — the fetch and the copy pass a page, the setter passes the
 * list — so both are accepted here rather than only the one the first hook happened to use.
 *
 * The list is walked with an `Iterator` and items are removed through it. Rebuilding the list would
 * leave the pager holding the old one, and `removeIf` needs Android 7 while the app reaches lower.
 *
 * Every link is optional: the page, its item list and an item's counters can each be absent. An
 * absent value never removes anything — see {@link Counts}.
 *
 * One census line per call (capped in the log, never in the screen) says what was handed over and
 * what each filter did with it. It is the only way to tell "the filter never saw this item" from
 * "it saw it and did not match", which look identical on screen.
 */
public final class FeedFilter {
    /**
     * Log lines are spent on what the filter did, not on the order calls arrive in: a session that
     * spent its whole budget on the cold start's two-item pages had no room left for the drops. A
     * few idle lines are still kept, so "the hook never ran" stays visible.
     */
    private static final int MAX_ACTIONS = 100;
    private static final int MAX_IDLE = 6;
    /** Enough dropped items to name in one line to make the filter's work checkable, not a log. */
    private static final int MAX_REASONS = 6;

    private static int actions;
    private static int idle;

    private FeedFilter() {}

    /**
     * The three entry points, one per hook, differing only in what they are handed and in the name
     * they record. The name is the point: `preload=-1` reads the same for the setter's bare list and
     * for a page that carries no ad slots, so without it the log cannot say which hook is talking.
     */
    public static void filterFetch(Object page) {
        filter(page, "fetch");
    }

    public static void filterSet(Object list) {
        filter(list, "set");
    }

    public static void filterClone(Object page) {
        filter(page, "clone");
    }

    public static void filterStore(Object list) {
        filter(list, "store");
    }

    private static void filter(Object source, String site) {
        // Every return here is recorded, including the ones that filter nothing. Without that, "the
        // hook never ran" and "it ran and the page was not what we expected" look the same on screen,
        // which is exactly the pair that is hardest to tell apart from a device.
        if (source == null) {
            FeedFilterStats.record(site + " a null argument", 0);
            return;
        }

        // Two kinds of caller land here: the fetch and the copy hand over a page, the setter hands
        // over the list itself. Reading `items` off a list is what once made the setter's hook count
        // pages without ever filtering one.
        List<?> items = source instanceof List
                ? (List<?>) source
                : asList(Reflect.property(source, "getItems", "items"));
        if (items == null) {
            FeedFilterStats.record(site + " an argument with no item list", 0);
            return;
        }
        if (items.isEmpty()) {
            FeedFilterStats.record(site + " an empty list", 0);
            return;
        }

        Active active = active();
        if (active.filters.length == 0) {
            FeedFilterStats.record(site + " a list of " + items.size() + ", no filter on", 0);
            return;
        }

        int before = items.size();
        int removed = 0;
        int unread = 0;
        int[] hits = new int[active.filters.length];
        List<String> reasons = new ArrayList<>(MAX_REASONS);
        Iterator<?> iterator = items.iterator();
        while (iterator.hasNext()) {
            Object item = iterator.next();
            if (item == null) continue;
            if (active.counts && Reflect.property(item, "getStatistics", "statistics") == null) unread++;
            for (int i = 0; i < active.filters.length; i++) {
                if (active.filters[i].shouldRemove(item)) {
                    hits[i]++;
                    if (reasons.size() < MAX_REASONS) reasons.add(reason(active.filters[i], item));
                    iterator.remove();
                    removed++;
                    break;
                }
            }
        }

        // The page's own ad slots, which the app may merge in after this point rather than in the
        // list. Logged, never cleared: whether they matter is a question for a device, not a guess.
        Object preload = source instanceof List
                ? null
                : Reflect.property(source, "getPreloadAds", "preloadAds");
        int preloadCount = preload instanceof List ? ((List<?>) preload).size() : -1;

        // Recorded on every call, so the settings screen can answer "did it run at all".
        String line = site + " " + describe(items, before, removed, active, hits, unread, preloadCount, reasons);
        FeedFilterStats.record(line, removed);
        if (removed > 0) {
            if (actions++ < MAX_ACTIONS) Debug.print("feedfilter: " + line);
        } else if (idle++ < MAX_IDLE) {
            Debug.print("feedfilter: " + line);
        }
    }

    /**
     * The filters for this page, resolved once: the switches are read here and not per item, and a
     * count filter is only built when its range would hide something.
     */
    private static Active active() {
        List<IFilter> filters = new ArrayList<>(3);
        List<String> names = new ArrayList<>(3);
        boolean counts = false;

        if (FeedFilterSettings.isAdsEnabled()) {
            filters.add(new AdsFilter());
            names.add("ads");
        }
        long[] views = setRange(FeedFilterSettings.minMaxViews());
        if (views != null) {
            filters.add(new ViewCountFilter(views));
            names.add(described("views", views));
            counts = true;
        }
        long[] likes = setRange(FeedFilterSettings.minMaxLikes());
        if (likes != null) {
            filters.add(new LikeCountFilter(likes));
            names.add(described("likes", likes));
            counts = true;
        }
        return new Active(
                filters.toArray(new IFilter[0]),
                names.toArray(new String[0]),
                counts);
    }

    /**
     * What a dropped item was, so it can be recognised on screen: the count that failed the bound and
     * the handle that posted it. Without the handle a drop can only be counted, never matched against
     * what the feed is still showing.
     */
    private static String reason(IFilter filter, Object item) {
        String reason = filter.reason(item);
        Object author = Reflect.property(item, "getAuthor", "author");
        if (author == null) return reason;
        String handle = Reflect.string(author, "getUniqueId", "uniqueId");
        return handle == null ? reason : reason + "@" + handle;
    }

    /**
     * A count filter's name with the range it is enforcing, so a drop's reason and the bound that
     * caused it are in the same line. Without the bound, `dropped=[likes=17913]` says an item went
     * but not why — which is the one thing a report has to settle.
     */
    private static String described(String filter, long[] range) {
        return filter + "[" + bound(range[0]) + ".." + bound(range[1]) + "]";
    }

    private static String bound(long value) {
        return value == Long.MAX_VALUE ? "MAX" : Long.toString(value);
    }

    /** null for the whole range, which hides nothing; the filter is not built for it. */
    private static long[] setRange(long[] range) {
        return range[0] == 0 && range[1] == Long.MAX_VALUE ? null : range;
    }

    private static String describe(
            List<?> items,
            int before,
            int removed,
            Active active,
            int[] hits,
            int unread,
            int preload,
            List<String> reasons) {
        StringBuilder line = new StringBuilder("list=")
                .append(Integer.toHexString(System.identityHashCode(items)))
                .append(" items=").append(before)
                .append(" removed=").append(removed);
        for (int i = 0; i < active.filters.length; i++) {
            line.append(' ').append(active.names[i]).append('=').append(hits[i]);
        }
        if (active.counts) line.append(" unreadCounts=").append(unread);
        line.append(" preload=").append(preload);
        if (!reasons.isEmpty()) {
            // Only on a call that dropped something: the builder is what a fix has to reach, and the
            // list it hands over is a fresh copy every time, so the frames are the only thing that
            // names it.
            line.append(" by=").append(caller());
            line.append(" dropped=").append(reasons);
        }
        return line.toString();
    }

    /** The frames above the hook, minus the extension's own, so the caller that built the list is named. */
    private static String caller() {
        StackTraceElement[] frames = new Throwable().getStackTrace();
        StringBuilder out = new StringBuilder();
        int shown = 0;
        for (StackTraceElement frame : frames) {
            String name = frame.getClassName();
            if (name.startsWith("app.onlynazril.extension") || name.startsWith("java.lang.Thread")) {
                continue;
            }
            if (shown++ >= 3) break;
            if (out.length() > 0) out.append(" <- ");
            out.append(name).append('#').append(frame.getMethodName());
        }
        return out.toString();
    }

    private static List<?> asList(Object value) {
        return value instanceof List ? (List<?>) value : null;
    }

    private static final class Active {
        final IFilter[] filters;
        final String[] names;
        final boolean counts;

        Active(IFilter[] filters, String[] names, boolean counts) {
            this.filters = filters;
            this.names = names;
            this.counts = counts;
        }
    }
}
