package app.morphed.extension.twitch.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

import app.morphed.extension.twitch.App;

/**
 * The patches' switches: the ad blocker, song removal and the quality unlock (the video player's Options), kept
 * across launches. Read on every playlist and audio buffer, so the values are cached in memory.
 */
public final class PatchSettings {
    public static final String PREFERENCES = "twitch_morphed";
    public static final String AD_BLOCK = "ad_block";
    public static final String SONG_REMOVAL = "song_removal";
    /** The streams song removal is on for: off until switched on, per channel (a past broadcast on its own). */
    static final String SONG_REMOVAL_STREAMS = "song_removal_streams";
    public static final String QUALITY_UNLOCK = "quality_unlock";

    public interface Listener {
        void changed(String key, boolean on);
    }

    private static volatile boolean loaded;
    private static volatile boolean adBlock = true;
    private static volatile Set<String> songStreams = new HashSet<>(); // copied on change
    private static volatile String watching; // the stream being watched: "channel:name" or "vod:id"
    private static volatile boolean qualityUnlock = false; // on once a VPN server is added
    private static final CopyOnWriteArrayList<Listener> LISTENERS = new CopyOnWriteArrayList<>();

    private PatchSettings() {
    }

    private static void load() {
        if (loaded) return;
        synchronized (PatchSettings.class) {
            if (loaded) return;
            Context context = App.application();
            if (context == null) return; // too early: defaults until the app is there
            SharedPreferences preferences = preferences(context);
            adBlock = preferences.getBoolean(AD_BLOCK, true);
            Set<String> saved = preferences.getStringSet(SONG_REMOVAL_STREAMS, null);
            if (saved != null) songStreams = new HashSet<>(saved);
            qualityUnlock = preferences.getBoolean(QUALITY_UNLOCK, false);
            loaded = true;
        }
    }

    public static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    public static boolean adBlock() {
        load();
        return adBlock;
    }

    /** Whether song removal is on for the stream being watched. */
    public static boolean songRemoval() {
        return songRemovalFor(watching);
    }

    public static boolean songRemovalFor(String stream) {
        load();
        return stream != null && songStreams.contains(stream);
    }

    /** The stream being watched changed: the song removal switch now speaks for it. */
    public static void watching(String stream) {
        if (stream == null || stream.equals(watching)) return;
        boolean before = songRemoval();
        watching = stream;
        boolean now = songRemoval();
        if (now != before) tell(SONG_REMOVAL, now);
    }

    /** Whether a past broadcast is being watched (its song removal switch is its own, not its channel's). */
    public static boolean watchingVideo() {
        String stream = watching;
        return stream != null && stream.startsWith("vod:");
    }

    public static boolean qualityUnlock() {
        load();
        return qualityUnlock;
    }

    public static boolean get(String key) {
        switch (key) {
            case AD_BLOCK: return adBlock();
            case SONG_REMOVAL: return songRemoval();
            case QUALITY_UNLOCK: return qualityUnlock();
            default: throw new IllegalArgumentException(key);
        }
    }

    public static void set(String key, boolean on) {
        load();
        switch (key) {
            case AD_BLOCK: adBlock = on; break;
            case SONG_REMOVAL: {
                String stream = watching;
                if (stream == null) { // no stream to switch it for: the switch goes back
                    Log.w(App.TAG, "Song removal switched with no stream playing");
                    tell(key, false);
                    return;
                }
                Set<String> next = new HashSet<>(songStreams);
                if (on) next.add(stream);
                else next.remove(stream);
                songStreams = next;
                Context context = App.application();
                if (context != null) preferences(context).edit().putStringSet(SONG_REMOVAL_STREAMS, next).apply();
                tell(key, on);
                return;
            }
            case QUALITY_UNLOCK: qualityUnlock = on; break;
            default: throw new IllegalArgumentException(key);
        }
        Context context = App.application();
        if (context != null) preferences(context).edit().putBoolean(key, on).apply();
        tell(key, on);
    }

    private static void tell(String key, boolean on) {
        for (Listener listener : LISTENERS) {
            try {
                listener.changed(key, on);
            } catch (Throwable t) { // one listener's failure mustn't stop the switch or crash the tap
                Log.e(App.TAG, "A settings listener failed", t);
            }
        }
    }

    public static void addListener(Listener listener) {
        LISTENERS.add(listener);
    }

    public static void removeListener(Listener listener) {
        LISTENERS.remove(listener);
    }

    /** For tests: values without an app. */
    public static void setForTest(boolean block, boolean unlock) {
        adBlock = block;
        qualityUnlock = unlock;
        songStreams = new HashSet<>();
        watching = null;
        loaded = true;
    }
}
