package app.ytmextras.extension.pitch;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

@SuppressWarnings("unused")
public final class PitchPatch {

    public static final int MIN_SEMITONES = -2;
    public static final int MAX_SEMITONES = 2;

    private static final String TAG = "YtmExtrasPitch";
    private static final String PREFERENCES = "ytmextras_pitch";
    private static final String KEY_SEMITONES = "semitones";
    private static final String KEY_ENABLED = "enabled";

    /**
     * The values the app last asked for, before the pitch of this patch is added.
     */
    private static final class PlayerState {
        float speed = 1.0f;
        float pitch = 1.0f;
        Looper looper;
    }

    private static final Map<PitchPlayer, PlayerState> players =
            Collections.synchronizedMap(new WeakHashMap<>());

    private static final Set<Runnable> listeners = new CopyOnWriteArraySet<>();

    private static volatile int semitones;
    private static volatile boolean enabled = true;
    private static volatile boolean loaded;
    private static volatile String videoId;

    private PitchPatch() {
    }

    /**
     * Injection point.
     */
    public static void onActivityCreate(Activity activity) {
        try {
            load(activity);
            SettingsEntry.register(activity.getApplication());
        } catch (Exception ex) {
            Log.e(TAG, "onActivityCreate failure", ex);
        }
    }

    /**
     * Injection point.
     * Called when a new track loads.
     */
    public static void setVideoId(String id) {
        videoId = id;
    }

    /**
     * Injection point.
     */
    public static void onPlayerCreated(PitchPlayer player) {
        try {
            PlayerState state = new PlayerState();
            state.looper = Looper.myLooper();
            players.put(player, state);

            if (activeSemitones() != 0) {
                apply(player, state);
            }
        } catch (Exception ex) {
            Log.e(TAG, "onPlayerCreated failure", ex);
        }
    }

    /**
     * Injection point.
     *
     * @return The pitch to use, which is the pitch of the app while the setting is 0.
     */
    public static float overridePitch(PitchPlayer player, float speed, float pitch) {
        try {
            PlayerState state;
            synchronized (players) {
                state = players.get(player);
                if (state == null) {
                    state = new PlayerState();
                    players.put(player, state);
                }
            }
            state.speed = speed;
            state.pitch = pitch;
            state.looper = Looper.myLooper();

            final int value = activeSemitones();
            return value == 0 ? pitch : pitch * pitchFactor(value);
        } catch (Exception ex) {
            Log.e(TAG, "overridePitch failure", ex);
            return pitch;
        }
    }

    static float pitchFactor(int semitones) {
        return (float) Math.pow(2.0, semitones / 12.0);
    }

    static int getSemitones() {
        ensureLoaded();
        return semitones;
    }

    static boolean isEnabled() {
        ensureLoaded();
        return enabled;
    }

    static String getVideoId() {
        return videoId;
    }

    static void addListener(Runnable listener) {
        listeners.add(listener);
    }

    static void removeListener(Runnable listener) {
        listeners.remove(listener);
    }

    /**
     * The value that is used for the audio. The switch keeps the last value for when it is on again.
     */
    private static int activeSemitones() {
        ensureLoaded();
        return enabled ? semitones : 0;
    }

    static void setSemitones(Context context, int value) {
        ensureLoaded();
        final int clamped = Math.max(MIN_SEMITONES, Math.min(MAX_SEMITONES, value));
        semitones = clamped;
        context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE)
                .edit().putInt(KEY_SEMITONES, clamped).apply();
        settingChanged();
    }

    static void setEnabled(Context context, boolean value) {
        ensureLoaded();
        enabled = value;
        context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE)
                .edit().putBoolean(KEY_ENABLED, value).apply();
        settingChanged();
    }

    private static void settingChanged() {
        for (Runnable listener : listeners) {
            listener.run();
        }

        List<Map.Entry<PitchPlayer, PlayerState>> entries;
        synchronized (players) {
            entries = new ArrayList<>(players.entrySet());
        }
        for (Map.Entry<PitchPlayer, PlayerState> entry : entries) {
            apply(entry.getKey(), entry.getValue());
        }
    }

    /**
     * Sets the values of the app again, which adds the pitch that is now selected.
     * A player can only be used from the thread the app uses it with.
     */
    private static void apply(PitchPlayer player, PlayerState state) {
        Looper looper = state.looper != null ? state.looper : Looper.getMainLooper();
        new Handler(looper).post(() -> {
            try {
                player.ytmextras_setPlaybackParameters(state.speed, state.pitch);
            } catch (Exception ex) {
                Log.e(TAG, "Could not apply the pitch", ex);
            }
        });
    }

    private static void ensureLoaded() {
        if (!loaded) {
            load(currentApplication());
        }
    }

    private static void load(Context context) {
        if (context == null) {
            return;
        }
        SharedPreferences preferences =
                context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
        final int value = preferences.getInt(KEY_SEMITONES, 0);
        semitones = Math.max(MIN_SEMITONES, Math.min(MAX_SEMITONES, value));
        enabled = preferences.getBoolean(KEY_ENABLED, true);
        loaded = true;
    }

    /**
     * Playback can start without an activity, such as from a media button.
     */
    private static Application currentApplication() {
        try {
            return (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Exception ex) {
            Log.e(TAG, "Could not get the application", ex);
            return null;
        }
    }
}
