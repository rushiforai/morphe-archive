package app.spicetify.extension.spotify.extensions;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Trash Bin, after Spicetify's desktop {@code trashbin.js}: a song or artist the user throws away
 * is skipped as soon as it plays. The sets persist in SharedPreferences {@code "spicetify_trash"},
 * one JSON string per category, in the desktop export's {@code {"songs":{uri:true},"artists":{uri:true}}}
 * shape, so an export moves between the two without conversion.
 * <p>
 * Threading: {@link #onState} arrives on the player bridge thread, and menu and settings taps on
 * the UI thread.
 * {@link #SONGS} and {@link #ARTISTS} are concurrent sets, so both sides read and write them
 * without extra locking, and {@link #handle} is the one synchronized gate that decides whether a
 * track gets skipped.
 */
public final class TrashBin {
    private static final String PREFERENCES = "spicetify_trash";
    private static final String SONGS_KEY = "songs";
    private static final String ARTISTS_KEY = "artists";

    private static final Set<String> SONGS = ConcurrentHashMap.newKeySet();
    private static final Set<String> ARTISTS = ConcurrentHashMap.newKeySet();
    private static final Guard GUARD = new Guard();
    private static final PlayerBridge.StateListener LISTENER = TrashBin::onState;

    private static boolean loaded; // guarded by TrashBin.class, with handle()
    private static String lastHandledTrackUid; // guarded by TrashBin.class, with handle()
    private static boolean blockedNotified; // guarded by TrashBin.class, with handle()

    private TrashBin() {}

    static void register() {
        Extensions.onSwitch(Extensions.TRASH_BIN, TrashBin::onSwitch);
    }

    /**
     * Adds the state listener when turned on, and removes it when turned off. Off also resets the
     * skip state, so a track that was already handled before the switch cycled gets reconsidered.
     */
    private static void onSwitch(Context context, boolean on) {
        if (!on) {
            PlayerBridge.removeStateListener(LISTENER);
            reset();
            return;
        }
        if (!Extensions.isOn(context, Extensions.TRASH_BIN)) return; // lost a race with another switch
        ensureLoaded(context);
        PlayerBridge.addStateListener(LISTENER);
        // The stream may already be open because of another extension's listener, in which case no
        // new state arrives until the next track; evaluate the one already known right away.
        Esperanto.PlayerState state = PlayerBridge.lastState();
        if (state != null) handle(state, false);
    }

    private static synchronized void reset() {
        lastHandledTrackUid = null;
        blockedNotified = false;
        GUARD.reset();
    }

    // ---- Sets ----

    static boolean isSongTrashed(String uri) {
        ensureLoaded(Extensions.appContext());
        return uri != null && SONGS.contains(uri);
    }

    static boolean isArtistTrashed(String uri) {
        ensureLoaded(Extensions.appContext());
        return uri != null && ARTISTS.contains(uri);
    }

    /** Trashing the track {@link PlayerBridge#lastState()} reports as playing also skips it. */
    static void setSong(Context context, String uri, boolean trashed) {
        setTrashed(context, SONGS, SONGS_KEY, uri, trashed);
        if (!trashed || uri == null) return;
        Esperanto.PlayerState state = PlayerBridge.lastState();
        if (state != null && uri.equals(state.trackUri)) handle(state, true);
    }

    /** Trashing the artist of the track {@link PlayerBridge#lastState()} reports also skips it. */
    static void setArtist(Context context, String uri, boolean trashed) {
        setTrashed(context, ARTISTS, ARTISTS_KEY, uri, trashed);
        if (!trashed || uri == null) return;
        Esperanto.PlayerState state = PlayerBridge.lastState();
        if (state != null && state.artistUris.contains(uri)) handle(state, true);
    }

    private static void setTrashed(Context context, Set<String> set, String key, String uri, boolean trashed) {
        ensureLoaded(context);
        if (uri == null) return;
        if (trashed) set.add(uri); else set.remove(uri);
        save(context, key, set);
    }

    /** How many songs are in the trash. */
    public static int songCount(Context context) {
        ensureLoaded(context);
        return SONGS.size();
    }

    /** How many artists are in the trash. */
    public static int artistCount(Context context) {
        ensureLoaded(context);
        return ARTISTS.size();
    }

    public static void clear(Context context) {
        ensureLoaded(context);
        SONGS.clear();
        ARTISTS.clear();
        save(context, SONGS_KEY, SONGS);
        save(context, ARTISTS_KEY, ARTISTS);
    }

    // ---- Import and export ----

    public static String exportJson() {
        ensureLoaded(Extensions.appContext());
        try {
            JSONObject root = new JSONObject();
            root.put(SONGS_KEY, toJsonObject(SONGS));
            root.put(ARTISTS_KEY, toJsonObject(ARTISTS));
            return root.toString();
        } catch (JSONException impossible) {
            throw new IllegalStateException(impossible);
        }
    }

    /**
     * Adds {@code json}'s songs and artists to the trash; desktop's import replaces the trash instead.
     * It must be the desktop export's shape, with songs, artists or both, each an object of URIs to
     * true; a URI set to false isn't trashed, as on desktop. Anything else throws before the trash
     * changes.
     */
    public static void importJson(Context context, String json) throws JSONException {
        JSONObject root = new JSONObject(json);
        if (!root.has(SONGS_KEY) && !root.has(ARTISTS_KEY)) throw new JSONException("Neither songs nor artists");
        Set<String> songs = trashed(root, SONGS_KEY);
        Set<String> artists = trashed(root, ARTISTS_KEY);
        ensureLoaded(context);
        SONGS.addAll(songs);
        ARTISTS.addAll(artists);
        save(context, SONGS_KEY, SONGS);
        save(context, ARTISTS_KEY, ARTISTS);
    }

    /** The URIs set to true under {@code key}, which, if it's there, must be an object of booleans. */
    private static Set<String> trashed(JSONObject root, String key) throws JSONException {
        Set<String> uris = new HashSet<>();
        if (!root.has(key)) return uris;
        JSONObject list = root.getJSONObject(key);
        Iterator<String> keys = list.keys();
        while (keys.hasNext()) {
            String uri = keys.next();
            if (list.getBoolean(uri)) uris.add(uri);
        }
        return uris;
    }

    private static JSONObject toJsonObject(Set<String> uris) throws JSONException {
        JSONObject object = new JSONObject();
        for (String uri : uris) object.put(uri, true);
        return object;
    }

    // ---- Auto skip ----

    /** Ads and episodes are left alone; otherwise true when the track or one of its artists is trashed. */
    static boolean shouldSkip(Esperanto.PlayerState state) {
        if (state == null || state.advertisement || state.episode) return false;
        if (state.trackUri != null && SONGS.contains(state.trackUri)) return true;
        for (String artistUri : state.artistUris) {
            if (ARTISTS.contains(artistUri)) return true;
        }
        return false;
    }

    /** On the player bridge thread. */
    private static void onState(Esperanto.PlayerState state) {
        try {
            handle(state, false);
        } catch (Throwable e) {
            Log.w("Spicetify", "Trash Bin couldn't process a player state", e);
        }
    }

    /**
     * The one gate a track goes through, whether it arrived from the state stream or from trashing
     * the playing song directly. {@code force} skips the "already handled" check: trashing the
     * playing song must skip it even though its track id was already handled as not trashed.
     */
    private static synchronized void handle(Esperanto.PlayerState state, boolean force) {
        if (state.trackUid == null) return;
        // The saved switch decides, not the listener: a start that raced a turn-off can leave it added.
        Context context = Extensions.appContext();
        if (context == null || !Extensions.isOn(context, Extensions.TRASH_BIN)) return;
        if (!force && state.trackUid.equals(lastHandledTrackUid)) return;
        lastHandledTrackUid = state.trackUid;
        if (!shouldSkip(state)) return;
        if (!GUARD.allow(System.currentTimeMillis())) {
            if (!blockedNotified) {
                blockedNotified = true;
                notifyBlocked();
            }
            return;
        }
        blockedNotified = false;
        skip(state.trackUri);
    }

    private static void notifyBlocked() {
        String line = "Stopped: 5 skips in 10 seconds";
        Extensions.status(Extensions.TRASH_BIN, line);
        Context context = Extensions.appContext();
        if (context == null) return;
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                Toast.makeText(context, "Trash Bin: " + line, Toast.LENGTH_LONG).show();
            } catch (Throwable e) {
                Log.w("Spicetify", "Trash Bin couldn't show its toast", e);
            }
        });
    }

    private static void skip(String trackUri) {
        PlayerBridge.call(Esperanto.CONTEXT_PLAYER, "SkipNext", Esperanto.skipNext(), new PlayerBridge.Result() {
            @Override
            public void done(byte[] body) {
                try {
                    int error = Esperanto.parseResult(body);
                    Extensions.status(Extensions.TRASH_BIN,
                            error == Esperanto.FORBIDDEN ? "Spotify refused the skip" : "Skipped " + trackUri);
                } catch (Throwable e) {
                    Log.w("Spicetify", "Trash Bin couldn't read the skip result", e);
                }
            }

            @Override
            public void failed(String reason) {
                Extensions.status(Extensions.TRASH_BIN, "Couldn't skip: " + reason);
            }
        });
    }

    // ---- Persistence ----

    private static synchronized void ensureLoaded(Context context) {
        if (loaded || context == null) return;
        readInto(context, SONGS_KEY, SONGS);
        readInto(context, ARTISTS_KEY, ARTISTS);
        loaded = true;
    }

    private static void readInto(Context context, String key, Set<String> into) {
        try {
            JSONObject saved = new JSONObject(preferences(context).getString(key, "{}"));
            Iterator<String> keys = saved.keys();
            while (keys.hasNext()) into.add(keys.next());
        } catch (JSONException malformed) {
            Log.w("Spicetify", "Couldn't read trashed " + key, malformed);
        }
    }

    private static void save(Context context, String key, Set<String> uris) {
        try {
            preferences(context).edit().putString(key, toJsonObject(uris).toString()).apply();
        } catch (JSONException impossible) {
            throw new IllegalStateException(impossible);
        }
    }

    private static SharedPreferences preferences(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    /** At most 5 skips in any 10 seconds: a sliding window, which lets one more in as the oldest leaves it. */
    static final class Guard {
        private static final int MAX_SKIPS = 5;
        private static final long WINDOW_MILLIS = 10_000;
        private final long[] times = new long[MAX_SKIPS];
        private int count;

        synchronized boolean allow(long nowMillis) {
            int kept = 0;
            for (int i = 0; i < count; i++) {
                if (times[i] >= nowMillis - WINDOW_MILLIS) times[kept++] = times[i];
            }
            count = kept;
            if (count >= MAX_SKIPS) return false;
            times[count++] = nowMillis;
            return true;
        }

        synchronized void reset() {
            count = 0;
        }
    }
}
