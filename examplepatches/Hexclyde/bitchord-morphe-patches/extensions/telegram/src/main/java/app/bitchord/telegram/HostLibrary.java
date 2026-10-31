package app.bitchord.telegram;

import android.content.Context;

import org.json.JSONObject;

import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.*;

/**
 * BitChord's own playlists and downloads, reached the same way {@link NativeSource} reaches its
 * source list. A channel's songs go in as Unofficial Telegram tracks, so they play and download
 * from Telegram like a search result does.
 */
final class HostLibrary {
    private HostLibrary() {}

    static final String KEY_PREFIX = "src:" + NativeSource.ID + "::";

    /** The parameter types of BitChord 1.8.1's Song constructor, in order. */
    private static final String[] SONG_PARAMETERS = {
        "String",
        "String",
        "String",
        "String",
        "String",
        "String",
        "List",
        "String",
        "String",
        "boolean",
        "boolean",
        "String",
        "QueueTier",
        "String",
        "String",
        "String",
        "String",
        "String",
        "Long",
        "Long",
        "Integer",
        "String",
        "boolean",
        "Boolean",
        "String",
        "PlaybackSourceType",
        "String"
    };

    /** BitChord's quality tier for a row: LOSSLESS, HIGH, LOW or null. */
    static String tier(String quality) {
        if (quality.contains("LOSSLESS")) return "LOSSLESS";
        if (quality.equals("HIGH")) return "HIGH";
        if (quality.equals("LOW")) return "LOW";
        return null;
    }

    static String durationText(int seconds) {
        return seconds <= 0
                ? null
                : seconds / 60 + ":" + String.format(Locale.ROOT, "%02d", seconds % 60);
    }

    /** Songs for BitChord, one per row, with covers that are already saved on the phone. */
    static List<Object> songs(List<JSONObject> rows, Artwork artwork) throws Exception {
        Class<?> songType = Class.forName("com.music.bitchord.data.model.Song");
        Constructor<?> make = null;
        for (Constructor<?> c : songType.getConstructors())
            if (matches(c.getParameterTypes())) make = c;
        if (make == null)
            throw new IOException("This BitChord version can't take songs from the patch.");
        Object context =
                Class.forName("com.music.bitchord.data.model.QueueTier")
                        .getField("CONTEXT")
                        .get(null);
        List<Object> songs = new ArrayList<>();
        for (JSONObject row : rows) {
            String quality = InternalAddon.quality(row);
            Object[] a = new Object[SONG_PARAMETERS.length];
            a[0] = KEY_PREFIX + row.getString("id");
            a[1] = row.optString("title");
            a[2] = row.optString("artist");
            a[3] = artwork == null ? null : artwork.cached(row);
            a[4] = durationText(row.optInt("duration"));
            a[6] = Collections.emptyList();
            a[9] = false;
            a[10] = false;
            a[12] = context;
            a[21] = tier(quality);
            a[22] = quality.startsWith("HI_RES");
            songs.add(make.newInstance(a));
        }
        return songs;
    }

    private static boolean matches(Class<?>[] types) {
        if (types.length != SONG_PARAMETERS.length) return false;
        for (int i = 0; i < types.length; i++)
            if (!types[i].getSimpleName().equals(SONG_PARAMETERS[i])) return false;
        return true;
    }

    /**
     * Saves the songs as a playlist in BitChord's Library, replacing the one saved last time for
     * the same chat. Returns the new playlist's id.
     */
    static String savePlaylist(String title, List<Object> songs, String replacing)
            throws Exception {
        Class<?> store = Class.forName("com.music.bitchord.data.spotify.LocalPlaylistStore");
        if (replacing != null && !replacing.isEmpty()) remove(store, replacing);
        Object playlist =
                store.getMethod("savePlaylist", String.class, List.class)
                        .invoke(null, title, songs);
        Field id = playlist.getClass().getDeclaredField("id");
        id.setAccessible(true);
        return (String) id.get(playlist);
    }

    /**
     * Takes a playlist out of the store's list. BitChord's own delete isn't in the app any more, so
     * this does what it did: the next save writes the list without it.
     */
    private static void remove(Class<?> store, String playlistId) throws Exception {
        Field field = store.getDeclaredField("_playlists");
        field.setAccessible(true);
        Object flow = field.get(null);
        Method value = Class.forName("kotlinx.coroutines.flow.StateFlow").getMethod("getValue");
        // StateFlowImpl is public in BitChord's build; its interface lost the method to shrinking.
        Method swap = flow.getClass().getMethod("compareAndSet", Object.class, Object.class);
        swap.setAccessible(true);
        for (int attempt = 0; attempt < 10; attempt++) {
            List<?> current = (List<?>) value.invoke(flow);
            List<Object> kept = new ArrayList<>();
            for (Object playlist : current) {
                Field id = playlist.getClass().getDeclaredField("id");
                id.setAccessible(true);
                if (!playlistId.equals(id.get(playlist))) kept.add(playlist);
            }
            if (kept.size() == current.size()) return;
            if ((Boolean) swap.invoke(flow, current, kept)) return;
        }
    }

    /** Queues the songs in BitChord's downloads, which fetch them from Telegram. */
    static void download(Context context, List<Object> songs, String from) throws Exception {
        Class<?> songType = Class.forName("com.music.bitchord.data.model.Song");
        Method enqueue =
                Class.forName("com.music.bitchord.download.Downloads")
                        .getMethod("enqueue", Context.class, songType, String.class);
        for (Object song : songs) enqueue.invoke(null, context, song, from);
    }
}
