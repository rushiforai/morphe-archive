package app.originisland.extension;

import android.content.ComponentName;
import android.content.Context;
import android.media.MediaDescription;
import android.media.browse.MediaBrowser;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Loads lists of the library from the tree Apple Music keeps for Android Auto. The app lets itself
 * browse that tree, and plays what is in it from the media ids.
 */
final class AppleMusicLibrary {

    interface Callback {
        /**
         * Called on the main thread.
         *
         * @param songs What to show, which is empty if the list has nothing in it or failed to load.
         */
        void onLoaded(List<MediaDescription> songs);
    }

    private static final String TAG = "OriginIslandAppleMusic";
    private static final String SERVICE = "com.apple.android.music.player.MediaPlaybackService";
    private static final String TREE_LIBRARY = "__AUTO_ROOT__/library/";
    private static final String NODE_PLAYLISTS = TREE_LIBRARY + "playlists";
    private static final String NODE_DOWNLOADS = TREE_LIBRARY + "offline_content";
    private static final String CHILD_SONGS = "/songs";
    private static final String CHILD_PLAYLISTS = "/playlists";
    private static final String CHILD_ALBUMS = "/albums";
    private static final String NODE_SONGS = TREE_LIBRARY + "songs";
    private static final String CHILD_ALL_DOWNLOADS = "/downloaded_music";
    private static final String ALL_DOWNLOADS_TITLE = "All Downloads";
    private static final String SUBTITLE_PLAYLIST = "Playlist";
    private static final String SUBTITLE_ALBUM = "Album";
    private static final String FAVORITES_TITLE = "favorite";
    /**
     * The card keeps a list in memory, and a list of the whole library would not fit a transaction.
     */
    private static final int MAX_SONGS = 300;
    /**
     * The playlists of a large library take a long time to load.
     */
    private static final long TIMEOUT_MS = 90_000;
    /**
     * The app answers with nothing until it has opened the library, as it does when it has just started.
     */
    private static final long EMPTY_RETRY_DELAY_MS = 2_000;
    private static final int MAX_EMPTY_RETRIES = 5;

    private static final Handler mainHandler = new Handler(Looper.getMainLooper());

    private final MediaBrowser browser;
    private final Callback callback;
    private final List<MediaDescription> collected = new ArrayList<>();
    private final long startedAt = SystemClock.elapsedRealtime();
    private Runnable onConnected;
    private boolean done;

    private AppleMusicLibrary(Context context, Callback callback) {
        this.callback = callback;
        this.browser = new MediaBrowser(context, new ComponentName(context, SERVICE),
                new MediaBrowser.ConnectionCallback() {
                    @Override
                    public void onConnected() {
                        onConnected.run();
                    }

                    @Override
                    public void onConnectionFailed() {
                        Log.w(TAG, "Could not connect to the library");
                        finish();
                    }
                }, null);
    }

    /**
     * Loads the songs of the playlist of favorite songs, or the playlists if it is not found.
     */
    static void loadFavorites(Context context, Callback callback) {
        AppleMusicLibrary library = new AppleMusicLibrary(context, callback);
        library.start(library::loadFavoritesList);
    }

    /**
     * Loads an entry that plays all downloaded songs, and the downloaded playlists.
     */
    static void loadDownloads(Context context, Callback callback) {
        AppleMusicLibrary library = new AppleMusicLibrary(context, callback);
        library.start(library::loadDownloadsList);
    }

    private void start(Runnable onConnected) {
        this.onConnected = onConnected;
        mainHandler.postDelayed(() -> {
            if (!done) {
                Log.w(TAG, "Loading a list timed out");
                finish();
            }
        }, TIMEOUT_MS);
        browser.connect();
    }

    /**
     * A favorite is a state of a song, which the tree has no list of, so the songs are asked of the
     * library the way the app does for its own suggestions. The playlist is what is left otherwise.
     */
    private void loadFavoritesList() {
        new Thread(() -> {
            List<MediaDescription> songs = null;
            try {
                songs = queryLikedSongs();
            } catch (Throwable ex) {
                Log.e(TAG, "Could not query the favorites", ex);
            }
            List<MediaDescription> found = songs;
            mainHandler.post(() -> {
                if (found != null && !found.isEmpty()) {
                    Log.i(TAG, "Favorites: " + found.size() + " songs after " + elapsedMs() + " ms");
                    collected.addAll(found);
                    finish();
                } else {
                    Log.i(TAG, "No favorites from the library, looking for the playlist");
                    loadFavoritesPlaylist();
                }
            });
        }, "AppleMusicFavorites").start();
    }

    private void loadFavoritesPlaylist() {
        load(NODE_PLAYLISTS, MAX_EMPTY_RETRIES, playlists -> {
            MediaBrowser.MediaItem playlist = findFavorites(playlists);
            if (playlist != null) {
                add(List.of(playlist), SUBTITLE_PLAYLIST);
            }
            finish();
        });
    }

    /**
     * The names here are of Apple Music 7.0.0, as its classes are obfuscated.
     */
    private static List<MediaDescription> queryLikedSongs() throws Exception {
        Object library = Class.forName("com.apple.android.medialibrary.library.a").getMethod("d0").invoke(null);
        if (library == null) {
            return null;
        }

        Class<?> builderClass = Class.forName("N6.f$a");
        Object builder = builderClass.getConstructor().newInstance();
        Class<?> mediaType = Class.forName("N6.g$c");
        builderClass.getMethod("c", mediaType).invoke(builder, enumOf(mediaType, "MediaTypeSong"));

        Class<?> baseClass = Class.forName("N6.h$a");
        baseClass.getField("d").set(builder, enumOf(Class.forName("N6.g$b"), "Liked"));
        baseClass.getField("b").set(builder, Class.forName("N6.j").getConstructor(int.class).newInstance(MAX_SONGS));
        baseClass.getField("f").setBoolean(builder, false);
        Class<?> sortBy = Class.forName("N6.l$a");
        Class<?> sortOrder = Class.forName("N6.l$b");
        baseClass.getField("a").set(builder, Class.forName("N6.l").getConstructor(sortBy, sortOrder)
                .newInstance(enumOf(sortBy, "BY_ENTITY_LIKE_DATE"), enumOf(sortOrder, "DESCENDING_ORDER")));

        Object query = Class.forName("N6.f").getConstructor(builderClass).newInstance(builder);
        Class<?> libraryInterface = Class.forName("com.apple.android.medialibrary.library.MediaLibrary");
        Object pending = libraryInterface.getMethod("g", Class.forName("N6.g")).invoke(library, query);
        Object results = pending.getClass().getMethod("d").invoke(pending);

        int count = (int) results.getClass().getMethod("getItemCount").invoke(results);
        List<MediaDescription> songs = new ArrayList<>();
        for (int i = 0; i < count && i < MAX_SONGS; i++) {
            Object item = results.getClass().getMethod("getItemAtIndex", int.class).invoke(results, i);
            Object title = item.getClass().getMethod("getTitle").invoke(item);
            if (title == null) {
                continue;
            }
            Object subtitle = item.getClass().getMethod("getSubTitle").invoke(item);
            Object type = item.getClass().getMethod("getContentType").invoke(item);
            Object id = item.getClass().getMethod("getPersistentId").invoke(item);
            songs.add(new MediaDescription.Builder()
                    .setMediaId(NODE_SONGS + "/" + type + "-" + id)
                    .setTitle(title.toString())
                    .setSubtitle(subtitle == null ? "" : subtitle.toString())
                    .build());
        }
        return songs;
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private static Object enumOf(Class<?> type, String name) {
        return Enum.valueOf((Class) type, name);
    }

    private void loadDownloadsList() {
        load(NODE_DOWNLOADS, MAX_EMPTY_RETRIES, sections -> {
            Log.i(TAG, "Downloads: " + sections.size() + " sections");
            MediaBrowser.MediaItem songs = findBySuffix(sections, CHILD_SONGS);
            MediaBrowser.MediaItem playlists = findBySuffix(sections, CHILD_PLAYLISTS);
            MediaBrowser.MediaItem albums = findBySuffix(sections, CHILD_ALBUMS);
            Runnable loadAlbums = () -> {
                if (albums == null) {
                    finish();
                    return;
                }
                load(albums.getMediaId(), 0, items -> {
                    Log.i(TAG, "Downloaded albums: " + items.size());
                    add(items, SUBTITLE_ALBUM);
                    finish();
                });
            };
            Runnable loadPlaylists = () -> {
                if (playlists == null) {
                    loadAlbums.run();
                    return;
                }
                load(playlists.getMediaId(), 0, items -> {
                    Log.i(TAG, "Downloaded playlists: " + items.size());
                    add(items, SUBTITLE_PLAYLIST);
                    loadAlbums.run();
                });
            };
            if (songs == null) {
                loadPlaylists.run();
                return;
            }
            load(songs.getMediaId(), 0, items -> {
                MediaBrowser.MediaItem all = findBySuffix(items, CHILD_ALL_DOWNLOADS);
                Log.i(TAG, "Downloaded songs: " + items.size() + ", entry for all: " + (all != null));
                if (all != null) {
                    collected.add(new MediaDescription.Builder()
                            .setMediaId(all.getMediaId())
                            .setTitle(ALL_DOWNLOADS_TITLE)
                            .setSubtitle(items.size() - 1 + (items.size() == 2 ? " song" : " songs"))
                            .build());
                }
                loadPlaylists.run();
            });
        });
    }

    private long elapsedMs() {
        return SystemClock.elapsedRealtime() - startedAt;
    }

    private static MediaBrowser.MediaItem findBySuffix(List<MediaBrowser.MediaItem> items, String suffix) {
        for (MediaBrowser.MediaItem item : items) {
            if (item.getMediaId() != null && item.getMediaId().endsWith(suffix)) {
                return item;
            }
        }
        return null;
    }

    private static MediaBrowser.MediaItem findFavorites(List<MediaBrowser.MediaItem> playlists) {
        for (MediaBrowser.MediaItem playlist : playlists) {
            CharSequence title = playlist.getDescription().getTitle();
            if (title != null && title.toString().toLowerCase(Locale.ROOT).contains(FAVORITES_TITLE)) {
                return playlist;
            }
        }
        return null;
    }

    private interface Children {
        void onChildren(List<MediaBrowser.MediaItem> children);
    }

    private void load(String node, int emptyRetries, Children then) {
        browser.subscribe(node, new MediaBrowser.SubscriptionCallback() {
            @Override
            public void onChildrenLoaded(String parentId, List<MediaBrowser.MediaItem> children) {
                browser.unsubscribe(parentId);
                if (done) {
                    return;
                }
                if (children.isEmpty() && emptyRetries > 0) {
                    mainHandler.postDelayed(() -> load(node, emptyRetries - 1, then), EMPTY_RETRY_DELAY_MS);
                    return;
                }
                then.onChildren(children);
            }

            @Override
            public void onError(String parentId) {
                Log.w(TAG, "Could not load a list");
                finish();
            }
        });
    }

    /**
     * @param subtitle Shown for an item without a subtitle of its own, as the card says that the
     *                 line under the title is empty otherwise.
     */
    private void add(List<MediaBrowser.MediaItem> items, String subtitle) {
        for (MediaBrowser.MediaItem item : items) {
            if (collected.size() >= MAX_SONGS) {
                return;
            }
            MediaDescription description = item.getDescription();
            if (description.getMediaId() != null && description.getTitle() != null) {
                collected.add(new MediaDescription.Builder()
                        .setMediaId(description.getMediaId())
                        .setTitle(description.getTitle())
                        .setSubtitle(description.getSubtitle() == null || description.getSubtitle().length() == 0
                                ? subtitle : description.getSubtitle())
                        .build());
            }
        }
    }

    private void finish() {
        if (done) {
            return;
        }
        done = true;
        if (browser.isConnected()) {
            browser.disconnect();
        }
        callback.onLoaded(collected);
    }
}
