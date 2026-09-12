package app.morphe.extension.tiktok.feedfilter;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.tiktok.settings.Settings;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import com.ss.android.ugc.aweme.feed.model.FeedItemList;
import com.ss.android.ugc.aweme.follow.presenter.FollowFeed;
import com.ss.android.ugc.aweme.follow.presenter.FollowFeedList;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

public final class FeedItemsFilter {
    private static final List<IFilter> FILTERS = List.of(
        new AdsFilter(),
        new LiveFilter(),
        new StoryFilter(),
        new ImageVideoFilter(),
        new ViewCountFilter(),
        new LikeCountFilter(),
        new ShopFilter()
    );

    private static final int MAX_NULL_ITEMS_LOGS = 3;
    private static final int MAX_BATCH_LOGS = 20;
    private static final long PROCESSED_LIST_CACHE_TTL_MS = 250;
    private static final int PROCESSED_LIST_CACHE_MAX_SEEN_LISTS = 256;

    private static final AtomicInteger feedItemListNullItemsLogCount = new AtomicInteger();
    private static final AtomicInteger followFeedListNullItemsLogCount = new AtomicInteger();
    private static final AtomicInteger batchLogCount = new AtomicInteger();
    private static final Map<Integer, ProcessedListState> processedListCache = new HashMap<>();

    private FeedItemsFilter() {}

    public static void filter(FeedItemList feedItemList) {
        if (feedItemList == null || feedItemList.items == null) {
            if (BaseSettings.DEBUG.get()) {
                logNullItems("FeedItemList", feedItemListNullItemsLogCount);
            }
            return;
        }

        filterFeedList(
            "FeedItemList",
            feedItemList.items,
            container -> (container instanceof Aweme) ? (Aweme) container : null,
            true
        );
    }

    public static void filter(FollowFeedList followFeedList) {
        filterFollowFeedList(followFeedList, true);
    }

    public static void filterFinal(FollowFeedList followFeedList) {
        filterFollowFeedList(followFeedList, false);
    }

    private static void filterFollowFeedList(FollowFeedList followFeedList, boolean allowRecentSkip) {
        if (followFeedList == null || followFeedList.mItems == null) {
            if (BaseSettings.DEBUG.get()) {
                logNullItems("FollowFeedList", followFeedListNullItemsLogCount);
            }
            return;
        }

        filterFeedList(
            "FollowFeedList",
            followFeedList.mItems,
            container -> (container instanceof FollowFeed) ? ((FollowFeed) container).aweme : null,
            allowRecentSkip
        );
    }

    /**
     * Keep filtering behaviour completely independent from diagnostic mode.
     *
     * Diagnostics used to execute a large probe path while filtering, including
     * additional Aweme getters and timing/cache instrumentation. On TikTok 46.4.3
     * that made DEBUG/diagnostic mode observably different from normal operation.
     * The filtering pass below now has one code path. DEBUG is only consulted after
     * filtering and cache state have already been committed, and the log only uses
     * values produced by the filtering pass itself plus settings values.
     */
    private static void filterFeedList(
        String source,
        List list,
        AwemeExtractor extractor,
        boolean allowRecentSkip
    ) {
        if (list == null) return;

        List<IFilter> activeFilters = getActiveFilters();
        if (activeFilters.isEmpty()) return;

        String filterMask = getFilterMask(activeFilters);
        ListFingerprint beforeFingerprint = ListFingerprint.from(list, extractor);
        int listId = System.identityHashCode(list);

        if (allowRecentSkip && shouldSkipRecentlyProcessedList(listId, beforeFingerprint, filterMask)) {
            return;
        }

        int initialSize = list.size();
        int removed = 0;
        Map<String, Integer> reasonCounts = new HashMap<>();

        List snapshot = new ArrayList(list);
        List kept = new ArrayList(snapshot.size());
        for (Object container : snapshot) {
            Aweme item = extractor.extract(container);
            if (item == null) {
                kept.add(container);
                continue;
            }

            String reason = getFilterReason(activeFilters, item);
            if (reason == null) {
                kept.add(container);
                continue;
            }

            removed++;
            reasonCounts.merge(reason, 1, Integer::sum);
        }

        if (removed > 0) {
            list.clear();
            list.addAll(kept);
        }

        // Commit cache state before diagnostics. Logging can therefore never change
        // which list state the production filter considers processed.
        rememberProcessedList(listId, ListFingerprint.from(list, extractor), filterMask);

        if (BaseSettings.DEBUG.get() && shouldLogBatch()) {
            logBatchResult(source, initialSize, list.size(), removed, reasonCounts, filterMask);
        }
    }

    private static List<IFilter> getActiveFilters() {
        List<IFilter> activeFilters = new ArrayList<>(FILTERS.size());
        for (IFilter filter : FILTERS) {
            if (filter.getEnabled()) {
                activeFilters.add(filter);
            }
        }
        return activeFilters;
    }

    private static String getFilterReason(List<IFilter> activeFilters, Aweme item) {
        for (IFilter filter : activeFilters) {
            if (filter.getFiltered(item)) {
                return filter.getClass().getSimpleName();
            }
        }
        return null;
    }

    private static void logNullItems(String source, AtomicInteger counter) {
        int count = counter.getAndIncrement();
        if (count < MAX_NULL_ITEMS_LOGS) {
            Logger.printInfo(() -> "[Morphe TikTok FeedFilter] filter(" + source + "): items=null");
        } else if (count == MAX_NULL_ITEMS_LOGS) {
            Logger.printInfo(() -> "[Morphe TikTok FeedFilter] filter(" + source + "): items=null (further logs suppressed)");
        }
    }

    private static void logBatchResult(
        String source,
        int beforeSize,
        int afterSize,
        int removed,
        Map<String, Integer> reasonCounts,
        String filterMask
    ) {
        String reasons = reasonCounts.isEmpty() ? "none" : reasonCounts.toString();
        Logger.printInfo(() ->
            "[Morphe TikTok FeedFilter] filter(" + source + ")"
                + " size=" + beforeSize + "->" + afterSize
                + " removed=" + removed
                + " reasons=" + reasons
                + " filters=\"" + filterMask + "\""
                + " remove_ads=" + Settings.REMOVE_ADS.get()
                + " hide_shop=" + Settings.HIDE_SHOP.get()
                + " hide_live=" + Settings.HIDE_LIVE.get()
                + " hide_story=" + Settings.HIDE_STORY.get()
                + " hide_image=" + Settings.HIDE_IMAGE.get()
                + " min_max_views=\"" + Settings.MIN_MAX_VIEWS.get() + "\""
                + " min_max_likes=\"" + Settings.MIN_MAX_LIKES.get() + "\""
        );
    }

    private static boolean shouldLogBatch() {
        return batchLogCount.getAndIncrement() < MAX_BATCH_LOGS;
    }

    private static boolean shouldSkipRecentlyProcessedList(
        int listId,
        ListFingerprint fingerprint,
        String filterMask
    ) {
        ProcessedListState state;
        long now = System.currentTimeMillis();

        synchronized (processedListCache) {
            state = processedListCache.get(listId);
            return state != null && state.matches(fingerprint, filterMask, now);
        }
    }

    private static void rememberProcessedList(int listId, ListFingerprint fingerprint, String filterMask) {
        synchronized (processedListCache) {
            if (processedListCache.size() > PROCESSED_LIST_CACHE_MAX_SEEN_LISTS) {
                processedListCache.clear();
            }

            processedListCache.put(
                listId,
                new ProcessedListState(fingerprint, filterMask, System.currentTimeMillis())
            );
        }
    }

    private static String getFilterMask(List<IFilter> activeFilters) {
        StringBuilder builder = new StringBuilder();
        for (IFilter filter : activeFilters) {
            if (builder.length() > 0) builder.append('|');
            builder.append(filter.getClass().getSimpleName());
        }
        return builder.toString();
    }

    @FunctionalInterface
    interface AwemeExtractor {
        Aweme extract(Object source);
    }

    private static final class ProcessedListState {
        final ListFingerprint fingerprint;
        final String filterMask;
        final long processedAtMs;

        ProcessedListState(ListFingerprint fingerprint, String filterMask, long processedAtMs) {
            this.fingerprint = fingerprint;
            this.filterMask = filterMask;
            this.processedAtMs = processedAtMs;
        }

        boolean matches(ListFingerprint currentFingerprint, String currentFilterMask, long nowMs) {
            return nowMs - processedAtMs <= PROCESSED_LIST_CACHE_TTL_MS
                && filterMask.equals(currentFilterMask)
                && fingerprint.matches(currentFingerprint);
        }
    }

    private static final class ListFingerprint {
        final int size;
        final int firstIdentity;
        final int middleIdentity;
        final int lastIdentity;
        final String firstAid;
        final String middleAid;
        final String lastAid;

        private ListFingerprint(
            int size,
            int firstIdentity,
            int middleIdentity,
            int lastIdentity,
            String firstAid,
            String middleAid,
            String lastAid
        ) {
            this.size = size;
            this.firstIdentity = firstIdentity;
            this.middleIdentity = middleIdentity;
            this.lastIdentity = lastIdentity;
            this.firstAid = firstAid;
            this.middleAid = middleAid;
            this.lastAid = lastAid;
        }

        static ListFingerprint from(List list, AwemeExtractor extractor) {
            int size = list.size();
            if (size == 0) {
                return new ListFingerprint(0, 0, 0, 0, "", "", "");
            }

            int middleIndex = size / 2;
            int lastIndex = size - 1;
            Aweme first = extractAt(list, extractor, 0);
            Aweme middle = extractAt(list, extractor, middleIndex);
            Aweme last = extractAt(list, extractor, lastIndex);

            return new ListFingerprint(
                size,
                identity(first),
                identity(middle),
                identity(last),
                aid(first),
                aid(middle),
                aid(last)
            );
        }

        private static Aweme extractAt(List list, AwemeExtractor extractor, int index) {
            try {
                return extractor.extract(list.get(index));
            } catch (RuntimeException ex) {
                return null;
            }
        }

        boolean matches(ListFingerprint other) {
            return size == other.size
                && firstIdentity == other.firstIdentity
                && middleIdentity == other.middleIdentity
                && lastIdentity == other.lastIdentity
                && firstAid.equals(other.firstAid)
                && middleAid.equals(other.middleAid)
                && lastAid.equals(other.lastAid);
        }

        private static int identity(Aweme item) {
            return item == null ? 0 : System.identityHashCode(item);
        }

        private static String aid(Aweme item) {
            if (item == null) return "";
            try {
                String aid = item.getAid();
                return aid == null ? "" : aid;
            } catch (Throwable ignored) {
                return "";
            }
        }
    }
}
