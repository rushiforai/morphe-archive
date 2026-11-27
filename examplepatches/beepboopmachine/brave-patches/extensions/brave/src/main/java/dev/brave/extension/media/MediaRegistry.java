package dev.brave.extension.media;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicLong;
import dev.brave.extension.core.ActiveTabTracker;
import dev.brave.extension.core.TabLifecycleListener;
import org.chromium.chrome.browser.tab.Tab;
import org.chromium.content_public.browser.NavigationHandle;

/**
 * Thread-safe registry maintaining detected media items segregated by tabId.
 * Uses per-tab locks with monotonic navigation generation counters so stale async
 * results from previous pages cannot race with navigation clearing.
 */
public final class MediaRegistry {
    private static final String TAG = "Brave_MediaRegistry";
    private static final int MAX_MEDIA_PER_TAB = 100;
    private static final int MAX_IMAGES_PER_TAB = 250;

    public interface MediaCountListener {
        void onMediaCountChanged(int tabId, int mediaCount, int imageCount);
    }

    private static final int LOCK_STRIPE_COUNT = 64;
    private static final Object[] LOCK_STRIPES = new Object[LOCK_STRIPE_COUNT];
    static {
        for (int i = 0; i < LOCK_STRIPE_COUNT; i++) {
            LOCK_STRIPES[i] = new Object();
        }
    }

    private static final class TabState {
        long generation;
        String lastUrl = "";
        final Set<MediaItem> media = new CopyOnWriteArraySet<>();
        final Set<MediaItem> images = new CopyOnWriteArraySet<>();

        TabState(long generation) {
            this.generation = generation;
        }
    }

    // Strictly monotonic process-wide generation seed so removed/reused tabIds never collide
    private static final AtomicLong GLOBAL_GENERATION = new AtomicLong(1L);
    private static final Map<Integer, TabState> TAB_STATES = new ConcurrentHashMap<>();
    private static final CopyOnWriteArrayList<MediaCountListener> LISTENERS = new CopyOnWriteArrayList<>();
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    static {
        ActiveTabTracker.addListener(new TabLifecycleListener() {
            @Override
            public void onActiveTabChanged(Tab tab) {
                notifyListenersForActiveTab();
            }

            @Override
            public void onNavigationStarted(Tab tab, NavigationHandle handle) {
                // Generation advance & clear is performed synchronously by ActiveTabTracker
                // before any direct media checks run.
            }

            @Override
            public void onNavigationFinished(Tab tab, NavigationHandle handle) {
                notifyListenersForActiveTab();
            }

            @Override
            public void onTabDestroyed(Tab tab) {
                if (tab != null) {
                    removeTab(tab.getId());
                }
            }
        });
    }

    private MediaRegistry() {}

    private static Object getTabLock(int tabId) {
        return LOCK_STRIPES[(tabId & 0x7FFFFFFF) % LOCK_STRIPE_COUNT];
    }

    private static TabState getOrCreateTabStateLocked(int tabId) {
        TabState st = TAB_STATES.get(tabId);
        if (st == null) {
            st = new TabState(GLOBAL_GENERATION.incrementAndGet());
            TAB_STATES.put(tabId, st);
        }
        return st;
    }

    public static void addListener(MediaCountListener listener) {
        if (listener != null) {
            LISTENERS.addIfAbsent(listener);
        }
    }

    public static void removeListener(MediaCountListener listener) {
        if (listener != null) {
            LISTENERS.remove(listener);
        }
    }

    public static long getTabGeneration(int tabId) {
        if (tabId < 0) tabId = 0;
        synchronized (getTabLock(tabId)) {
            return getOrCreateTabStateLocked(tabId).generation;
        }
    }

    /**
     * Fast pre-check so callers avoid queuing expensive network work when a tab's
     * media or image list is already at capacity.
     */
    public static boolean canAcceptMedia(int tabId, MediaType type) {
        if (tabId < 0) tabId = 0;
        TabState st = TAB_STATES.get(tabId);
        if (st == null) return true;
        boolean isImage = (type != null && type.isImage());
        int maxCap = isImage ? MAX_IMAGES_PER_TAB : MAX_MEDIA_PER_TAB;
        Set<MediaItem> set = isImage ? st.images : st.media;
        return set.size() < maxCap;
    }

    /**
     * Advances the navigation generation for a tab and clears all stale streams/images
     * atomically relative to concurrent addMediaItem calls.
     */
    public static long advanceGenerationAndClear(int tabId, String newUrl, boolean force) {
        if (tabId < 0) tabId = 0;
        long nextGen;
        String normalizedNew = normalizePageUrl(newUrl);

        synchronized (getTabLock(tabId)) {
            TabState st = getOrCreateTabStateLocked(tabId);
            if (!force && !normalizedNew.isEmpty() && normalizedNew.equals(st.lastUrl)) {
                return st.generation;
            }
            nextGen = GLOBAL_GENERATION.incrementAndGet();
            st.generation = nextGen;
            st.lastUrl = normalizedNew;
            st.media.clear();
            st.images.clear();
        }

        notifyCountChanged(tabId);
        Log.i(TAG, "Cleared tab " + tabId + " (gen=" + nextGen + ", url=" + normalizedNew + ")");
        return nextGen;
    }

    private static String normalizePageUrl(String url) {
        if (url == null) return "";
        String u = url.trim();
        int hash = u.indexOf('#');
        if (hash > 0) u = u.substring(0, hash);
        return u;
    }

    public static boolean addMediaItem(int tabId, MediaItem item) {
        return addMediaItem(tabId, 0L, item);
    }

    /**
     * Atomically validates navigation generation, merges duplicates (including type upgrades,
     * auth/variants), enforces per-tab capacity, and inserts the item.
     *
     * @return true if a new item was inserted or upgraded, false if stale, duplicate-merged, or rejected at cap.
     */
    public static boolean addMediaItem(int tabId, long expectedGeneration, MediaItem item) {
        if (tabId < 0) tabId = 0;
        if (item == null || item.url == null || item.url.isEmpty()) return false;

        boolean changed = false;
        synchronized (getTabLock(tabId)) {
            TabState st;
            if (expectedGeneration > 0) {
                st = TAB_STATES.get(tabId);
                if (st == null || st.generation != expectedGeneration) {
                    long actualGen = (st != null) ? st.generation : -1L;
                    Log.d(TAG, "Dropping stale media item from previous page (gen " + expectedGeneration + " != " + actualGen + "): " + item.url);
                    return false;
                }
            } else {
                st = getOrCreateTabStateLocked(tabId);
            }

            boolean isImage = item.type.isImage();
            Set<MediaItem> set = isImage ? st.images : st.media;
            int maxCap = isImage ? MAX_IMAGES_PER_TAB : MAX_MEDIA_PER_TAB;

            for (MediaItem existing : set) {
                if (existing.equals(item)) {
                    boolean upgraded = existing.mergeFrom(item);
                    if (upgraded) {
                        changed = true;
                        break;
                    }
                    return false;
                }
            }

            if (!changed) {
                if (set.size() >= maxCap) {
                    return false;
                }
                Log.i(TAG, "addMediaItem: tab=" + tabId + " (gen=" + st.generation + "), " + item.type + " -> " + item.url);
                set.add(item);
                changed = true;
            }
        }

        if (changed) {
            notifyCountChanged(tabId);
        }
        return changed;
    }

    public static List<MediaItem> getMediaForTab(int tabId) {
        if (tabId < 0) return Collections.emptyList();
        TabState st = TAB_STATES.get(tabId);
        return st != null ? new ArrayList<>(st.media) : Collections.emptyList();
    }

    public static List<MediaItem> getImagesForTab(int tabId) {
        if (tabId < 0) return Collections.emptyList();
        TabState st = TAB_STATES.get(tabId);
        return st != null ? new ArrayList<>(st.images) : Collections.emptyList();
    }

    public static int getMediaCount(int tabId) {
        if (tabId < 0) return 0;
        TabState st = TAB_STATES.get(tabId);
        return st != null ? st.media.size() : 0;
    }

    public static int getImageCount(int tabId) {
        if (tabId < 0) return 0;
        TabState st = TAB_STATES.get(tabId);
        return st != null ? st.images.size() : 0;
    }

    public static void clearTab(int tabId) {
        if (tabId < 0) tabId = 0;
        synchronized (getTabLock(tabId)) {
            TabState st = getOrCreateTabStateLocked(tabId);
            st.generation = GLOBAL_GENERATION.incrementAndGet();
            st.lastUrl = "";
            st.media.clear();
            st.images.clear();
        }
        notifyCountChanged(tabId);
    }

    /**
     * Removes per-tab media state when a tab is destroyed while advancing the monotonic
     * generation seed so stale async tasks or reused tab IDs can never collide.
     */
    public static void removeTab(int tabId) {
        if (tabId < 0) return;
        synchronized (getTabLock(tabId)) {
            GLOBAL_GENERATION.incrementAndGet();
            TabState removed = TAB_STATES.remove(tabId);
            if (removed != null) {
                removed.generation = GLOBAL_GENERATION.get();
                removed.lastUrl = "";
                removed.media.clear();
                removed.images.clear();
            }
        }
        notifyCountChanged(tabId);
    }

    private static void notifyCountChanged(final int tabId) {
        final int mediaCount = getMediaCount(tabId);
        final int imageCount = getImageCount(tabId);

        Runnable task = () -> {
            for (MediaCountListener l : LISTENERS) {
                try {
                    l.onMediaCountChanged(tabId, mediaCount, imageCount);
                } catch (Throwable t) {
                    Log.w(TAG, "Listener error in notifyCountChanged", t);
                }
            }
        };
        if (Looper.myLooper() == Looper.getMainLooper()) {
            task.run();
        } else {
            MAIN_HANDLER.post(task);
        }
    }

    private static void notifyListenersForActiveTab() {
        int tabId = ActiveTabTracker.getActiveTabId();
        notifyCountChanged(tabId);
    }
}
