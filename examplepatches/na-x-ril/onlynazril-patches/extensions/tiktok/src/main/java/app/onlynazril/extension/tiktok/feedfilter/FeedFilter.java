package app.onlynazril.extension.tiktok.feedfilter;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.internal.Reflect;
import app.onlynazril.extension.tiktok.settings.FeedFilterSettings;

/**
 * Drops the items a page should not show, in place, on the list the app is about to use.
 * <p>
 * Two entry points, both before an item can reach a list the pager counts:
 * <p>
 * The feed's page, at its fetch return, runs the **full** filter. The generic `FeedItemList` setter
 * and clone, shared with the profile, search and repost lists, run the **ad filter only**: a
 * like-count range there would hide the profile owner's own posts, but an ad is not wanted on any
 * surface. The panel's insert callback handles the ad and card paths that never touch the page.
 * <p>
 * No list is wrapped and nothing is removed after it has entered a list. Removing there shifts the
 * positions the pager holds, and refusing the last item empties the feed, which the app renders as
 * its own error view; both were tried and both are recorded in the docs. The page's own filter is
 * the only place a drop happens, and an empty page is a state the app already handles.
 * <p>
 * The list is walked with an `Iterator` and items are removed through it. Rebuilding the list would
 * leave the caller holding the old one, and `removeIf` needs Android 7 while the app reaches lower.
 * <p>
 * Every link is optional: the page, its item list and an item's counters can each be absent. An
 * absent count is outside every range, which is what used to leak a video once its count filled in.
 * <p>
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
     * The page-level entry points, differing in what they are handed and in how much of the filter
     * they are allowed to run. The feed's own hooks get the full set; the generic page model shared
     * with profile/search/repost gets the ad filter only. Nothing is kept back when everything
     * would go: a filtered item is never stored, and the launch page is filtered where the cache is
     * written instead.
     */
    /**
     * The page, at the presenter's entry. This is the one point every page passes: a launch page, a
     * scroll, a refresh. The full filter runs here, one-item pages included, because the page
     * TikTok shows at launch is exactly one item.
     * <p>
     * It is also where the page can be filtered without touching a list: the page has not been
     * copied into the pager yet, so nothing shifts underneath a position the pager holds. An empty
     * result is left as an empty page, which the app already handles, and its next page follows.
     */
    private static boolean firstPage;

    @SuppressWarnings("unchecked")
    public static void filterPage(Object page) {
        if (!firstPage) {
            firstPage = true;
            Debug.mark("first feed page");
        }
        List<?> items = asList(Reflect.property(page, "getItems", "items"));
        Object first = null;
        if (items != null) {
            for (Object candidate : items) {
                if (candidate != null) {
                    first = candidate;
                    break;
                }
            }
        }
        filter(page, "page", false, false);
        if (items == null || first == null || !items.isEmpty()) return;
        // A page with no items is what the app draws as its own error view, and it waits for the
        // next request before anything plays. One kept video is the cheaper failure.
        ((List<Object>) items).add(first);
        Debug.print("feedfilter: page kept=1, everything else was filtered");
    }

    public static void filterGenericSet(Object list) {
        filter(list, "generic-set", true, true);
    }

    public static void filterGenericClone(Object page) {
        filter(page, "generic-clone", true, true);
    }

    /** Whether the item is an ad under the current switch; used by the ad-only list paths. */

    /** Whether the item is an ad under the current switch; the ad-only list uses this. */
    public static boolean shouldRefuse(Object item) {
        return item != null
                && FeedFilterSettings.isAdsEnabled()
                && new AdsFilter().shouldRemove(item);
    }

    /** A list refused an ad at insertion, which is a path no page hook sees. */
    public static void logRefusedItem(Object item) {
        if (refusedItems++ >= MAX_ACTIONS) return;
        Debug.print("feedfilter: list refused ad@" + handle(item) + Debug.by(6));
    }

    private static int refusedItems;

    public static boolean isSurveyEnabled() {
        return FeedFilterSettings.isSurveyEnabled();
    }

    /**
     * Whether the launch preload is skipped. The cached first page is one item from a server-side
     * cache, and it reaches the feed before the switches can remove it without either showing it or
     * emptying the pager. Skipping the preload leaves the app with its own first load instead.
     */


    /**
     * Ads only. The live-list wrapper is shared with the detail feed, the profile's own feed and
     * every other list that uses the same storage, so a LIVE or drama item must not be refused
     * there: refusing the video the profile just opened leaves the detail pager with nothing to
     * show (or with the previous feed's items), and a drama video can still be opened from a
     * profile. The feed's own hooks carry those filters.
     */

    private static String handle(Object item) {
        Object author = Reflect.property(item, "getAuthor", "author");
        return author == null ? "?" : String.valueOf(Reflect.string(author, "getUniqueId", "uniqueId"));
    }

    /**
     * Replaces a storage's live list with an {@link AdFreeList} built from it.
     * <p>
     * The storage keeps its items in an {@code ArrayList} that the ad SDK can add to directly; the
     * field is replaced at construction so a direct {@code add} is refused like every other path.
     * Found by its declared collection type, never through the storage's own getter (that returns a
     * copy).
     */
    public static void wrapStorage(Object store) {
        if (store == null) return;
        boolean wrapped = false;
        for (Class<?> type = store.getClass(); type != null && type != Object.class;
                type = type.getSuperclass()) {
            for (java.lang.reflect.Field field : type.getDeclaredFields()) {
                if (!ArrayList.class.isAssignableFrom(field.getType())) continue;
                try {
                    field.setAccessible(true);
                    Object value = field.get(store);
                    if (!(value instanceof List) || value instanceof AdFreeList) continue;
                    field.set(store, new AdFreeList((List<?>) value));
                    wrapped = true;
                    Debug.print("feedfilter: storage list wrapped field=" + type.getSimpleName()
                            + "." + field.getName() + " size=" + ((List<?>) value).size());
                } catch (Throwable ignored) {
                    // A field the runtime refuses to open is skipped; other hooks still run.
                }
            }
        }
        if (!wrapped) {
            Debug.print("feedfilter: storage list not wrapped for " + store.getClass().getName());
        }
    }

    /**
     * Filters the list the feed panel is about to insert. The source tells the card filters what
     * the batch is; the item filters then remove ads and, when enabled, LIVE items. The returned
     * list is a copy, so the caller's immutable singleton is never mutated.
     */
    public static List<?> filterInsertList(String source, List<?> items) {
        if (items == null || items.isEmpty()) return items;

        boolean survey = FeedFilterSettings.isSurveyEnabled()
                && source != null && source.contains("survey");
        boolean liveCard = FeedFilterSettings.isLiveEnabled()
                && source != null && source.contains("live_card");
        boolean dramaCard = FeedFilterSettings.isDramaEnabled()
                && source != null && source.toLowerCase().contains("drama");
        if (survey || liveCard || dramaCard) {
            String dropped = survey ? "survey" : liveCard ? "live_card" : "drama";
            String line = "insert source=" + source + " items=" + items.size()
                    + " kept=0 dropped=" + dropped;
            FeedFilterStats.record(line, items.size());
            Debug.print("feedfilter: " + line + Debug.by(6));
            return new ArrayList<>(0);
        }

        IFilter ads = FeedFilterSettings.isAdsEnabled() ? new AdsFilter() : null;
        IFilter live = FeedFilterSettings.isLiveEnabled() ? new LiveFilter() : null;
        IFilter drama = FeedFilterSettings.isDramaEnabled() ? new DramaFilter() : null;
        if (ads == null && live == null && drama == null) return items;

        // A single item is the deep-link or current video being inserted. Keep it unless it is an
        // ad; the card filters above already dropped a named card batch.
        if (items.size() == 1) {
            Object only = items.get(0);
            if (only == null || ads == null || !ads.shouldRemove(only)) return items;
        }

        List<Object> kept = null;
        List<String> reasons = null;
        for (int i = 0; i < items.size(); i++) {
            Object item = items.get(i);
            IFilter hit = item != null && ads != null && ads.shouldRemove(item) ? ads
                    : item != null && live != null && live.shouldRemove(item) ? live
                    : item != null && drama != null && drama.shouldRemove(item) ? drama
                    : null;
            if (hit != null) {
                if (kept == null) {
                    kept = new ArrayList<>(items.size());
                    kept.addAll(items.subList(0, i));
                    reasons = new ArrayList<>(MAX_REASONS);
                }
                if (reasons.size() < MAX_REASONS) reasons.add(reason(hit, item));
            } else if (kept != null) {
                kept.add(item);
            }
        }
        if (kept == null) return items;

        int removed = items.size() - kept.size();
        String line = "insert source=" + source
               
                + " items=" + items.size()
                + " kept=" + kept.size()
                + " removed=" + removed
                + " dropped=" + reasons;
        FeedFilterStats.record(line, removed);
        Debug.print("feedfilter: " + line + Debug.by(6));
        return kept;
    }

    @SuppressWarnings("unchecked")
    private static void filter(Object source, String site, boolean adsOnly, boolean keepSingle) {
        // Every return here is recorded, including the ones that filter nothing. Without that, "the
        // hook never ran" and "it ran and the page was not what we expected" look the same on screen,
        // which is exactly the pair that is hardest to tell apart from a device.
        if (source == null) {
            FeedFilterStats.record(site + " a null argument", 0);
            return;
        }

        // Two kinds of caller land here: the fetch hands over a page, the storage hands over the
        // list itself. Reading `items` off a list is what once made a hook count pages without ever
        // filtering one.
        List<?> items = source instanceof List
                ? (List<?>) source
                : asList(Reflect.property(source, "getItems", "items"));
        if (items == null) {
            FeedFilterStats.record(site + " an argument with no item list", 0);
            return;
        }

        Active active = active(adsOnly);
        if (active.filters.length == 0) {
            FeedFilterStats.record(site + " a list of " + items.size() + ", no filter on", 0);
            return;
        }

        // The page's own ad slots, which the app may merge in after this point rather than in the
        // list. Clearing them here is what keeps a preloaded ad from appearing during a later
        // scroll; the item list alone is not enough when the page carries the ad on the side.
        int preloadCount = -1;
        boolean preloadCleared = false;
        if (!(source instanceof List)) {
            Object preload = Reflect.property(source, "getPreloadAds", "preloadAds");
            if (preload instanceof List) {
                preloadCount = ((List<?>) preload).size();
                if (active.adsFilter != null && preloadCount > 0) {
                    ((List<?>) preload).clear();
                    preloadCleared = true;
                }
            }
        }

        if (items.isEmpty()) {
            FeedFilterStats.record(site + " an empty list", 0);
            return;
        }
        // A single item is the deep-link/current video being inserted; removing it leaves nothing
        // to open. A lone ad is still an ad, so that one goes through the normal filter.
        if (keepSingle && items.size() == 1 && !isAd(active, items.get(0))) {
            FeedFilterStats.record(site + " a single-item batch, kept", 0);
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

        // Recorded on every call, so the settings screen can answer "did it run at all".
        String line = site + " " + describe(
                items, before, removed, active, hits, unread, preloadCount, preloadCleared, reasons);
        FeedFilterStats.record(line, removed);
        if (removed > 0) {
            if (actions++ < MAX_ACTIONS) Debug.print("feedfilter: " + line + Debug.by(6));
        } else if (idle++ < MAX_IDLE) {
            Debug.print("feedfilter: " + line + Debug.by(6));
        }
    }

    /**
     * The filters for this page, resolved once: the switches are read here and not per item, and a
     * count filter is only built when its range would hide something. `adsOnly` is the generic page
     * model's mode, shared with lists that are not the feed.
     */
    private static Active active(boolean adsOnly) {
        List<IFilter> filters = new ArrayList<>(3);
        List<String> names = new ArrayList<>(3);
        boolean counts = false;
        IFilter adsFilter = null;

        if (FeedFilterSettings.isAdsEnabled()) {
            adsFilter = new AdsFilter();
            filters.add(adsFilter);
            names.add("ads");
        }
        if (!adsOnly) {
            if (FeedFilterSettings.isLiveEnabled()) {
                filters.add(new LiveFilter());
                names.add("live");
            }
            if (FeedFilterSettings.isDramaEnabled()) {
                filters.add(new DramaFilter());
                names.add("drama");
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
        }
        return new Active(
                filters.toArray(new IFilter[0]),
                names.toArray(new String[0]),
                counts,
                adsFilter);
    }

    /** Whether the one item is an ad, so the single-item guard does not keep a lone ad. */
    private static boolean isAd(Active active, Object item) {
        return active.adsFilter != null && item != null && active.adsFilter.shouldRemove(item);
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
     * but not why , which is the one thing a report has to settle.
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
            boolean preloadCleared,
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
        if (preloadCleared) line.append(" cleared");
        if (!reasons.isEmpty()) {
            line.append(" dropped=").append(reasons);
        }
        return line.toString();
    }

    private static List<?> asList(Object value) {
        return value instanceof List ? (List<?>) value : null;
    }

    private static final class Active {
        final IFilter[] filters;
        final String[] names;
        final boolean counts;
        final IFilter adsFilter;

        Active(IFilter[] filters, String[] names, boolean counts, IFilter adsFilter) {
            this.filters = filters;
            this.names = names;
            this.counts = counts;
            this.adsFilter = adsFilter;
        }
    }
}
