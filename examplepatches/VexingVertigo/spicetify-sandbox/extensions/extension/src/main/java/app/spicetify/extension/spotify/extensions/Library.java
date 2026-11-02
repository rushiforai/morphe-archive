package app.spicetify.extension.spotify.extensions;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * The saved playlists and albums in Your Library, with their names and covers, for the Home pins
 * picker. They come from Spotify's core through the player bridge, which the Home pins patch
 * brings along. Liked Songs is added by hand.
 */
public final class Library {
    /** Liked Songs as a tile's uri: the form Spotify's navigator routes, of the four the app accepts. */
    public static final String LIKED_SONGS = "spotify:collection:tracks";
    /** The cover Spotify itself shows for Liked Songs. */
    static final String LIKED_SONGS_IMAGE = "https://misc.scdn.co/liked-songs/liked-songs-300.png";
    /** A library the core is still loading is asked for again this many times, this far apart. */
    static final int LOADING_RETRIES = 3;
    static final long LOADING_RETRY_MILLIS = 1000;

    private Library() {}

    /** A saved playlist or album, or Liked Songs. */
    public static final class Item {
        public final String uri;
        /** Its name in Your Library, or null without one. */
        public final String title;
        /** Its cover as Your Library gives it, such as {@code spotify:image:<id>}, or null without one. */
        public final String image;
        public final boolean album;

        public Item(String uri, String title, String image, boolean album) {
            this.uri = uri;
            this.title = title;
            this.image = image;
            this.album = album;
        }
    }

    /** Hears how a {@link #fetch} ended, on the main thread. */
    public interface Callback {
        /** Liked Songs, then each saved playlist and album once, in Your Library's order. */
        void loaded(List<Item> items);

        /** Why there's no library, such as "bridge not connected" before Spotify's core is up. */
        void failed(String reason);
    }

    /**
     * Reads the library on the bridge thread, then tells {@code callback} on the main thread. It
     * returns at once and never throws, so a tap can call it. A library the core is still loading may
     * be missing playlists, so it's asked for again a few times, and then taken as it is.
     */
    public static void fetch(Context context, Callback callback) {
        fetch(context, callback, LOADING_RETRY_MILLIS);
    }

    static void fetch(Context context, Callback callback, long loadingRetryMillis) {
        Handler main = new Handler(Looper.getMainLooper());
        try {
            String likedSongs = likedSongsTitle(context);
            PlayerBridge.post(() -> ask(main, callback, likedSongs, loadingRetryMillis, LOADING_RETRIES));
        } catch (Throwable e) {
            failed(main, callback, String.valueOf(e), e);
        }
    }

    /**
     * Asks on the bridge thread. While the core is still loading the library, it asks again
     * {@code retryMillis} later, {@code retries} more times at most, and then gives what it has.
     */
    private static void ask(Handler main, Callback callback, String likedSongs, long retryMillis, int retries) {
        PlayerBridge.call(Esperanto.YOUR_LIBRARY, "All", Esperanto.yourLibraryAll(), new PlayerBridge.Result() {
            @Override
            public void done(byte[] body) {
                try {
                    Esperanto.Library library = Esperanto.parseYourLibrary(body);
                    if (library.loading && retries > 0) {
                        PlayerBridge.postDelayed(() -> ask(main, callback, likedSongs, retryMillis, retries - 1),
                                retryMillis);
                        return;
                    }
                    List<Item> items = items(library, likedSongs);
                    tell(main, () -> callback.loaded(items));
                } catch (Throwable e) {
                    Library.failed(main, callback, e.getMessage() != null ? e.getMessage() : e.toString(), e);
                }
            }

            @Override
            public void failed(String reason) {
                Library.failed(main, callback, reason, null);
            }
        });
    }

    /**
     * Liked Songs first, as {@link #LIKED_SONGS}, then the rest in the order the parse kept them. The parse
     * gives Liked Songs first too, under its list uri, so that one is left out.
     */
    private static List<Item> items(Esperanto.Library library, String likedSongs) {
        List<Item> items = new ArrayList<>();
        items.add(new Item(LIKED_SONGS, likedSongs, LIKED_SONGS_IMAGE, false));
        for (Esperanto.LibrarySource source : library.sources) {
            if (!Esperanto.LIKED_SONGS.equals(source.uri)) {
                items.add(new Item(source.uri, source.name, source.image, source.album));
            }
        }
        return Collections.unmodifiableList(items);
    }

    /** Whether {@code uri} is one of the four uris the app treats as Liked Songs; false for null. */
    public static boolean isLikedSongs(String uri) {
        return uri != null && Esperanto.isLikedSongs(uri);
    }

    /** Spotify's own name for Liked Songs, in the app's language, or the English one if it has none. */
    @SuppressLint("DiscouragedApi") // Spotify's string, whose id this extension can't know when it's built
    private static String likedSongsTitle(Context context) {
        Resources resources = context.getResources();
        int id = resources.getIdentifier("collection_liked_songs_title", "string", context.getPackageName());
        return id == 0 ? "Liked Songs" : resources.getString(id);
    }

    private static void failed(Handler main, Callback callback, String reason, Throwable e) {
        Log.w("Spicetify", "Couldn't read the library: " + reason, e);
        tell(main, () -> callback.failed(reason));
    }

    /** Runs {@code answer} on the main thread, where a throw is logged instead of reaching Spotify's looper. */
    private static void tell(Handler main, Runnable answer) {
        main.post(() -> {
            try {
                answer.run();
            } catch (Throwable e) {
                Log.w("Spicetify", "The library's callback failed", e);
            }
        });
    }
}
