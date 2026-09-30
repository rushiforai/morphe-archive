/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 *
 * Part of the Twitter Bookmarker overlay: see morphe/README.md.
 */

package app.morphe.extension.twitter.patches.bookmarker;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * What the phone knows about the backend between requests: the collections a
 * tweet can be saved into, and which tweets are already saved.
 *
 * <p>Both exist to remove a wait from the tap. The picker used to fetch the
 * collection list before it could show anything, which is a network round trip
 * on every tap (~1 s through a tunnel); with this cache the sheet is drawn from
 * memory and the fetch happens in the background. The saved index is the same
 * idea for the button's "already saved" mark: {@code GET /v1/index} returns every
 * saved tweet id at once, so one request answers for every tweet that scrolls
 * past, and looking one up afterwards is a map read.
 *
 * <p>Freshness, stated plainly because it is a trade-off: an answer is trusted
 * for {@link #TTL_MS}, and a tweet scrolling into view is what triggers the
 * refresh once it is that old. Saves made on this phone are remembered
 * immediately without a refetch; saves made elsewhere appear after the next
 * refresh. Failed attempts back off for {@link #MIN_ATTEMPT_GAP_MS} so a scroll
 * with a wrong token or a stopped backend cannot turn into a request storm.
 *
 * <p>All state is process-wide and guarded by {@link #LOCK}. Callers never wait
 * for the network here: {@link #savedSlug} and {@link #collectionsOrNull} answer
 * from memory, and only {@link #warmUp} starts a fetch, on a background thread.
 */
public final class BookmarkerCache {

    /** How long a fetched answer is trusted before the next tweet triggers a refresh. */
    private static final long TTL_MS = 10 * 60 * 1000L;

    /**
     * Shortest gap between two refresh attempts, successful or not. Without it a
     * scroll would retry a failing backend for every action bar that inflates.
     */
    private static final long MIN_ATTEMPT_GAP_MS = 30 * 1000L;

    private static final Object LOCK = new Object();

    /** Tweet id -> collection slug, as last fetched or saved from this phone. */
    private static final Map<String, String> SAVED = new HashMap<>();

    private static final List<BookmarkerApi.Collection> COLLECTIONS = new ArrayList<>();

    /** The base URL the two maps were fetched from; a change throws them away. */
    private static String loadedBaseUrl = "";

    private static long savedAtMs = 0L;
    private static long collectionsAtMs = 0L;
    private static long lastAttemptMs = 0L;
    private static boolean refreshing = false;

    /** Called on the main thread whenever the maps change. */
    private static final List<Runnable> LISTENERS = new ArrayList<>();

    private BookmarkerCache() {}

    /**
     * Called for every action bar that scrolls in, so it must stay cheap: it
     * starts a fetch only when the cached answer is missing or older than the
     * TTL, and it seeds the collections from the persisted copy first, which is
     * what makes a cold app start still open the picker instantly.
     */
    public static void warmUp() {
        if (!BookmarkerPrefs.isConfigured()) return;
        refreshIfStale(false);
    }

    /** Refresh regardless of age — used once the settings have been saved. */
    public static void refreshNow() {
        if (!BookmarkerPrefs.isConfigured()) return;
        refreshIfStale(true);
    }

    /** The collection a tweet is already saved in, or null when it is not. */
    public static String savedSlug(String tweetId) {
        if (tweetId == null || tweetId.isEmpty()) return null;
        synchronized (LOCK) {
            return SAVED.get(tweetId);
        }
    }

    /** The cached collections, or null when nothing has been fetched yet. */
    public static List<BookmarkerApi.Collection> collectionsOrNull() {
        synchronized (LOCK) {
            return COLLECTIONS.isEmpty() ? null : new ArrayList<>(COLLECTIONS);
        }
    }

    /** The name to show for a slug, falling back to the slug itself. */
    public static String nameFor(String slug) {
        if (slug == null || slug.isEmpty()) return "";
        synchronized (LOCK) {
            for (BookmarkerApi.Collection collection : COLLECTIONS) {
                if (collection.slug.equals(slug)) return collection.name;
            }
        }
        return slug;
    }

    /**
     * Records a save made from this phone: the mark appears as soon as the toast
     * does, with no refetch, and a collection the user just created is usable for
     * the next tap too.
     */
    public static void remember(String tweetId, String slug, String name) {
        if (tweetId == null || tweetId.isEmpty() || slug == null || slug.isEmpty()) return;

        synchronized (LOCK) {
            SAVED.put(tweetId, slug);
            if (!name.isEmpty()) {
                boolean known = false;
                for (BookmarkerApi.Collection collection : COLLECTIONS) {
                    if (collection.slug.equals(slug)) {
                        known = true;
                        break;
                    }
                }
                if (!known) {
                    // A save is how a collection is created, so the response's slug
                    // and name are the only place this collection will be announced.
                    // It belongs to the backend the save went to, which is the one in
                    // the preferences at this moment.
                    COLLECTIONS.add(new BookmarkerApi.Collection(slug, name, 0));
                    BookmarkerPrefs.saveCachedCollections(
                            collectionsToJson(COLLECTIONS), BookmarkerPrefs.backendUrl());
                }
            }
        }
        notifyListeners();
    }

    /** Register a listener; it runs on the main thread and may be called often. */
    public static void addListener(Runnable listener) {
        synchronized (LISTENERS) {
            LISTENERS.add(listener);
        }
    }

    private static void refreshIfStale(boolean force) {
        final String base = BookmarkerPrefs.backendUrl();
        final String token = BookmarkerPrefs.backendToken();

        final boolean needCollections;
        final boolean needIndex;
        synchronized (LOCK) {
            if (!base.equals(loadedBaseUrl)) {
                // A different backend is a different archive: nothing cached about
                // the old one may be shown as if it belonged to the new one.
                SAVED.clear();
                COLLECTIONS.clear();
                savedAtMs = 0L;
                collectionsAtMs = 0L;
                loadedBaseUrl = base;
                loadPersistedCollections(base);
            }

            long now = System.currentTimeMillis();
            if (refreshing) return;
            if (!force && now - lastAttemptMs < MIN_ATTEMPT_GAP_MS) return;

            boolean collectionsStale = collectionsAtMs == 0L || now - collectionsAtMs > TTL_MS;
            boolean indexStale = savedAtMs == 0L || now - savedAtMs > TTL_MS;
            if (!force && !collectionsStale && !indexStale) return;

            needCollections = force || collectionsStale;
            needIndex = force || indexStale;
            refreshing = true;
            lastAttemptMs = now;
        }

        Utils.runOnBackgroundThread(() -> {
            boolean changed = false;
            try {
                if (needIndex) {
                    Map<String, String> fetched = BookmarkerApi.savedIndex(base, token);
                    synchronized (LOCK) {
                        if (!base.equals(loadedBaseUrl)) {
                            // The backend was changed while this fetch was in flight,
                            // so this answer describes the archive we just left.
                            Logger.printInfo(() -> "twb: discarding a saved index from the previous backend");
                        } else {
                            SAVED.clear();
                            SAVED.putAll(fetched);
                            savedAtMs = System.currentTimeMillis();
                            changed = true;
                        }
                    }
                }
            } catch (Exception e) {
                // Silent on purpose: this runs while the user is scrolling. A wrong
                // token or a stopped backend is reported where the user asked for
                // something (the settings dialog's Test, or a save), not here.
                Logger.printInfo(() -> "twb: could not refresh the saved index: " + e);
            }

            try {
                if (needCollections) {
                    List<BookmarkerApi.Collection> fetched = BookmarkerApi.collections(base, token);
                    boolean current;
                    synchronized (LOCK) {
                        current = base.equals(loadedBaseUrl);
                        if (current) {
                            COLLECTIONS.clear();
                            COLLECTIONS.addAll(fetched);
                            collectionsAtMs = System.currentTimeMillis();
                            changed = true;
                        }
                    }
                    if (current) {
                        BookmarkerPrefs.saveCachedCollections(collectionsToJson(fetched), base);
                    } else {
                        // Same as above: a list from the old backend must not be
                        // persisted for the new one either.
                        Logger.printInfo(() -> "twb: discarding a collection list from the previous backend");
                    }
                }
            } catch (Exception e) {
                Logger.printInfo(() -> "twb: could not refresh the collection list: " + e);
            }

            synchronized (LOCK) {
                refreshing = false;
            }
            if (changed) notifyListeners();
        });
    }

    /**
     * The last collection list seen, from {@code twb_settings}. It is only a
     * starting point: {@code collectionsAtMs} comes from its timestamp, so an old
     * copy is still refreshed on the next tweet that scrolls in.
     */
    private static void loadPersistedCollections(String base) {
        // Slugs only mean something inside the archive that defined them, so a copy
        // written by another backend is not a starting point at all.
        if (!base.equals(BookmarkerPrefs.cachedCollectionsUrl())) return;

        String json = BookmarkerPrefs.cachedCollectionsJson();
        if (json.isEmpty()) return;

        List<BookmarkerApi.Collection> persisted = collectionsFromJson(json);
        if (persisted.isEmpty()) return;

        COLLECTIONS.addAll(persisted);
        collectionsAtMs = BookmarkerPrefs.cachedCollectionsAt();
        Logger.printInfo(() -> "twb: " + persisted.size() + " collections restored from disk");
    }

    private static void notifyListeners() {
        List<Runnable> listeners;
        synchronized (LISTENERS) {
            if (LISTENERS.isEmpty()) return;
            listeners = new ArrayList<>(LISTENERS);
        }
        Utils.runOnMainThread(() -> {
            for (Runnable listener : listeners) {
                listener.run();
            }
        });
    }

    /** The cached collections as JSON, for {@link BookmarkerPrefs}. */
    static String collectionsToJson(List<BookmarkerApi.Collection> collections) {
        try {
            JSONArray array = new JSONArray();
            for (BookmarkerApi.Collection collection : collections) {
                JSONObject item = new JSONObject();
                item.put("slug", collection.slug);
                item.put("name", collection.name);
                item.put("post_count", collection.postCount);
                array.put(item);
            }
            return array.toString();
        } catch (Exception e) {
            // org.json's put() throws a checked exception. Losing the cache is
            // survivable — the next fetch refills it — so this is not fatal.
            Logger.printInfo(() -> "twb: could not serialize the collections: " + e);
            return "";
        }
    }

    /** The inverse of {@link #collectionsToJson}; a corrupt copy reads as empty. */
    static List<BookmarkerApi.Collection> collectionsFromJson(String json) {
        List<BookmarkerApi.Collection> out = new ArrayList<>();
        if (json == null || json.isEmpty()) return out;

        try {
            JSONArray array = new JSONArray(json);
            for (int i = 0; i < array.length(); i++) {
                JSONObject item = array.optJSONObject(i);
                if (item == null) continue;
                String slug = item.optString("slug", "");
                if (slug.isEmpty()) continue;
                String name = item.optString("name", "");
                out.add(new BookmarkerApi.Collection(
                        slug,
                        name.isEmpty() ? slug : name,
                        item.optInt("post_count", 0)));
            }
        } catch (Exception e) {
            Logger.printInfo(() -> "twb: could not read the cached collections: " + e);
            return new ArrayList<>();
        }
        return out;
    }
}
