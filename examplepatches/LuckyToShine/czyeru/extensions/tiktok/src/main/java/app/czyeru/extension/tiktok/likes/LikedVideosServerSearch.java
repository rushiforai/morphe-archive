package app.czyeru.extension.tiktok.likes;

import android.view.View;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.czyeru.extension.shared.Logger;
import app.czyeru.extension.shared.Utils;
import app.czyeru.extension.tiktok.search.ListSearch;
import app.czyeru.extension.tiktok.settings.Settings;
import app.czyeru.extension.tiktok.settings.SettingsStatus;

/**
 * Liked videos search V2: on top of the V1 filter, asks TikTok's server for matching liked videos
 * so videos that have not loaded yet show up right away.
 * <p>
 * TikTok only searches favorites on the server (/tiktok/user/profile/search/item/v1, scene 103).
 * The scene for liked videos is not in the app, so this tries guessed scenes and only accepts one
 * whose results are all videos you liked. Anything else (errors, other videos, no scene works)
 * leaves the search working exactly as V1.
 */
@SuppressWarnings({"unused", "rawtypes"})
public final class LikedVideosServerSearch {
    // shortcut: guessed scene ids (the app only names 103 = favorites); replace with the real one once known.
    private static final int[] SCENE_CANDIDATES = {102, 101, 104};
    private static final int PAGE_SIZE = 30;
    private static final int MAX_PAGES = 3;
    private static final long DEBOUNCE_MS = 400;
    private static final String SEARCH_METHOD = "enter_search";

    private static final ExecutorService executor = Executors.newSingleThreadExecutor();
    private static final Set<Integer> rejectedScenes = ConcurrentHashMap.newKeySet();
    private static volatile int confirmedScene = -1;
    /** Main thread only. Bumped on every query so stale searches are dropped. */
    private static int generation;

    private LikedVideosServerSearch() {
    }

    /** True when the V2 patch is included and its setting is on. */
    public static boolean isEnabled() {
        return SettingsStatus.likedVideosServerSearchEnabled && Settings.LIKED_VIDEOS_SERVER_SEARCH.get();
    }

    /**
     * Replaced by the V2 patch with TikTok's own favorites search request (same URL builder,
     * network client and response class). Blocking. Returns a FavoriteSearchData, or throws.
     */
    private static Object requestPage(int sceneId, String keyword, long cursor, int count, String searchMethod) {
        return null;
    }

    /** Query listener of the liked videos search bar. */
    public static void onQuery(View recyclerView, String query) {
        int current = ++generation;
        if (query == null || query.isEmpty()) {
            return;
        }
        // Wait for a pause in typing, then search off the main thread.
        Utils.runOnMainThreadDelayed(() -> {
            if (current != generation) {
                return;
            }
            executor.execute(() -> {
                List found = search(query);
                if (found == null || found.isEmpty()) {
                    return;
                }
                Utils.runOnMainThread(() -> {
                    if (current == generation) {
                        ListSearch.setExtraItems(recyclerView, query, found);
                    }
                });
            });
        }, DEBOUNCE_MS);
    }

    /** Liked videos the server found for the query, or null when no scene gave a usable answer. */
    private static List search(String query) {
        int[] scenes = confirmedScene != -1 ? new int[]{confirmedScene} : SCENE_CANDIDATES;
        for (int scene : scenes) {
            if (rejectedScenes.contains(scene)) {
                continue;
            }

            List<Object> liked = new ArrayList<>();
            boolean anyItems = false;
            boolean allLiked = true;
            try {
                long cursor = 0;
                for (int page = 0; page < MAX_PAGES; page++) {
                    Object data = requestPage(scene, query, cursor, PAGE_SIZE, SEARCH_METHOD);
                    if (data == null) {
                        break;
                    }
                    Object items = readField(data, "awemeList");
                    if (items instanceof List) {
                        for (Object aweme : (List) items) {
                            if (aweme == null) {
                                continue;
                            }
                            anyItems = true;
                            if (isLiked(aweme)) {
                                liked.add(aweme);
                            } else {
                                allLiked = false;
                            }
                        }
                    }
                    Object next = readField(data, "cursor");
                    if (!Boolean.TRUE.equals(readField(data, "hasMore"))
                            || !(next instanceof Long) || (Long) next <= cursor) {
                        break;
                    }
                    cursor = (Long) next;
                }
            } catch (Throwable throwable) {
                Logger.printDebug(() -> "Liked videos server search: scene " + scene + " failed: " + throwable);
                if (scene != confirmedScene) {
                    // Retried on the next app start.
                    rejectedScenes.add(scene);
                }
                continue;
            }

            if (anyItems && !allLiked) {
                // Not the liked videos list: it returned videos you did not like.
                Logger.printDebug(() -> "Liked videos server search: scene " + scene + " is not liked videos");
                rejectedScenes.add(scene);
                continue;
            }
            if (!liked.isEmpty()) {
                if (confirmedScene != scene) {
                    confirmedScene = scene;
                    Logger.printDebug(() -> "Liked videos server search: using scene " + scene);
                }
                return liked;
            }
            if (scene == confirmedScene) {
                // Known scene, no results for this query.
                return liked;
            }
            // No results: says nothing about the scene. Try the next one.
        }
        return null;
    }

    /** Aweme.getUserDigg() is 1 for a video the current user liked. */
    private static boolean isLiked(Object aweme) {
        Object digg = ListSearch.call(aweme, "getUserDigg");
        return digg instanceof Integer && (Integer) digg == 1;
    }

    private static Object readField(Object target, String name) {
        for (Class<?> type = target.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (NoSuchFieldException ignored) {
                // Check the superclass.
            } catch (Throwable throwable) {
                return null;
            }
        }
        return null;
    }
}
