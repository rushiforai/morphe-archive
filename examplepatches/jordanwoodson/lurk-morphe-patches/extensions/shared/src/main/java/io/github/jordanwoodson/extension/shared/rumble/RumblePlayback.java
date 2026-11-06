package io.github.jordanwoodson.extension.shared.rumble;

import android.content.Context;
import android.content.SharedPreferences;
import android.media.AudioManager;
import android.os.SystemClock;
import android.view.KeyEvent;

import java.util.List;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.Network;
import io.github.jordanwoodson.extension.shared.SleepTimer;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Playback settings for Rumble: start quality, signed-out resume, remembered speed, audio focus and the
 * sleep timer. With a setting off, each hook returns Rumble's own value.
 */
@SuppressWarnings("unused")
public final class RumblePlayback {
    static final String QUALITY = "video_quality";
    static final String LIVE = "video_quality_live";
    static final String MOBILE = "video_quality_mobile";
    static final String REMEMBER_SPEED = "remember_speed";
    static final String DEFAULT_SPEED = "default_speed";
    static final String AUDIO_FOCUS = "audio_focus";

    /** Lurk's own state for Rumble (not user choices, which are in the settings file). */
    private static final String STATE = "lurk_rumble";
    private static final String SPEED = "speed";
    /** The remembered speed while there is no Context to keep it in (probes). */
    private static volatile String speedInMemory;

    private RumblePlayback() {
    }

    // ---------------------------------------------------------------------------------------------
    // Default video quality

    /** The default quality's height, 0 for Rumble's default or when Default video quality isn't included. */
    static int wifiHeight() {
        return Settings.isRegistered(QUALITY) ? Settings.getInt(QUALITY) : 0;
    }

    /** The highest height to start at on mobile data, 0 for no cap. */
    static int capHeight() {
        return Settings.isRegistered(MOBILE) ? Settings.getInt(MOBILE) : 0;
    }

    /** Injection point: whether the mobile-data cap applies to the video starting now. */
    public static boolean capActive() {
        return capHeight() > 0 && Network.isMetered(Settings.appContext());
    }

    /**
     * Injection point: the default of Rumble's "live streams use Auto" preference, which is true. False
     * while Live streams too is on and a default quality is chosen, so live streams start at that quality.
     */
    public static boolean liveUsesAutoByDefault() {
        return !(Settings.isRegistered(LIVE) && Settings.isEnabled(LIVE) && wifiHeight() > 0);
    }

    /**
     * Injection point: the start of Rumble's start-source chooser, with its sources, the height and bitrate
     * last picked in the player (or nulls) and the server's preferred height. Returns the height to start
     * at. The same instance as {@code saved} keeps the picked height and bitrate; another value is used
     * with the highest bitrate; null leaves Rumble's preferred height.
     */
    public static Integer startHeight(List<?> sources, Integer saved, Integer savedBitrate, int preferred) {
        int cap = capActive() ? capHeight() : 0;
        if (cap <= 0) {
            if (saved != null) return saved;
            int wifi = wifiHeight();
            return wifi > 0 ? Integer.valueOf(wifi) : null;
        }
        int[] heights = new int[sources == null ? 0 : sources.size()];
        for (int i = 0; i < heights.length; i++) {
            try {
                heights[i] = sourceHeight(sources.get(i));
            } catch (RuntimeException e) {
                heights[i] = 0;
            }
        }
        int pick = cappedHeight(saved, preferred, wifiHeight(), cap, heights);
        if (saved != null && savedBitrate != null && saved == pick) return saved;
        return pick;
    }

    /**
     * The height to start at under a cap: what Rumble or the default quality would start at, lowered to the
     * highest available height at or below the cap. Rumble picks the nearest height by the difference of
     * reciprocals, which can land above the cap when no source matches; an available height can't.
     */
    static int cappedHeight(Integer saved, int preferred, int wifi, int cap, int[] heights) {
        int base;
        if (saved != null && saved > 0) base = saved;
        else if (saved == null && wifi > 0) base = wifi;
        else if (saved == null && preferred > 0) base = preferred;
        else base = cap; // Auto (height 0) on mobile data starts at the cap.
        int target = Math.min(base, cap);
        int best = 0;
        int lowest = Integer.MAX_VALUE;
        for (int height : heights) {
            if (height <= 0) continue;
            if (height <= target && height > best) best = height;
            if (height < lowest) lowest = height;
        }
        if (best > 0) return best;
        return lowest != Integer.MAX_VALUE ? lowest : target;
    }

    // ---------------------------------------------------------------------------------------------
    // Resume videos when signed out

    /**
     * Injection point: where a video starts when you aren't signed in, which is 0 in Rumble. Returns the
     * position Rumble kept on the phone (milliseconds) while the switch is on.
     */
    public static long signedOutPosition(long local) {
        return Settings.isEnabled("resume_signed_out") && local > 0 ? local : 0;
    }

    // ---------------------------------------------------------------------------------------------
    // Remember playback speed

    /** Whether a speed was picked since Rumble last reset its speeds to 1x. */
    private static volatile boolean pickedSinceReset;

    /** Injection point: a speed picked in the player (a constant of Rumble's speed enum). */
    public static void onSpeedPicked(Enum<?> speed) {
        if (speed == null) return;
        pickedSinceReset = true;
        if (!on(REMEMBER_SPEED)) return;
        speedInMemory = speed.name();
        SharedPreferences state = state();
        if (state != null) state.edit().putString(SPEED, speed.name()).apply();
    }

    /** Injection point: Rumble setting every speed back to 1x (its player service starting over). */
    public static void onSpeedReset() {
        pickedSinceReset = false;
    }

    /**
     * Injection point: the speed a player starts at. Returns the speed last picked while Remember playback speed
     * is on; otherwise, until a speed is picked, the default playback speed; else null for Rumble's own (1x
     * unless picked). {@code normal} is the enum's 1x constant.
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static Enum<?> rememberedSpeed(Enum<?> normal) {
        if (normal == null) return null;
        String name = null;
        if (on(REMEMBER_SPEED)) {
            SharedPreferences state = state();
            name = state != null ? state.getString(SPEED, null) : speedInMemory;
        }
        if (name == null && !pickedSinceReset) name = defaultSpeedName();
        if (name == null) return null;
        try {
            return Enum.valueOf((Class) normal.getDeclaringClass(), name);
        } catch (IllegalArgumentException e) {
            return null;
        }
    }

    /** The default playback speed as a constant name of Rumble's speed enum, or null for 1x. */
    static String defaultSpeedName() {
        if (!Settings.isRegistered(DEFAULT_SPEED)) return null;
        switch (Settings.getInt(DEFAULT_SPEED)) {
            case 25: return "SPEED_0_25";
            case 50: return "SPEED_0_5";
            case 75: return "SPEED_0_75";
            case 90: return "SPEED_0_9";
            case 125: return "SPEED_1_25";
            case 150: return "SPEED_1_5";
            case 175: return "SPEED_1_75";
            case 200: return "SPEED_2";
            default: return null;
        }
    }

    /** Whether a switch of an included patch is on; keys of patches left out count as off. */
    private static boolean on(String key) {
        return Settings.isRegistered(key) && Settings.isEnabled(key);
    }

    private static SharedPreferences state() {
        Context context = Settings.appContext();
        return context == null ? null : context.getSharedPreferences(STATE, Context.MODE_PRIVATE);
    }

    // ---------------------------------------------------------------------------------------------
    // Keep playing during other sounds

    /**
     * Injection point: the start of the player service's audio focus listener. True ignores the loss, so
     * playback goes on: for short interruptions (choice 1) or any (choice 2). Calls always pause.
     */
    public static boolean ignoreFocusLoss(int change) {
        if (change >= 0) return false;
        int choice = Settings.getInt(AUDIO_FOCUS);
        if (choice <= 0) return false;
        if (inCall()) return false;
        if (choice == 1) {
            return change == AudioManager.AUDIOFOCUS_LOSS_TRANSIENT
                    || change == AudioManager.AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK;
        }
        return true;
    }

    private static boolean inCall() {
        try {
            Context context = Settings.appContext();
            AudioManager audio = context == null ? null : context.getSystemService(AudioManager.class);
            if (audio == null) return false;
            int mode = audio.getMode();
            return mode == AudioManager.MODE_IN_CALL || mode == AudioManager.MODE_IN_COMMUNICATION
                    || mode == AudioManager.MODE_RINGTONE;
        } catch (RuntimeException e) {
            return false;
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Sleep timer

    private static volatile boolean pauseActionSet;

    /** Injection point: the player service's listener seeing playback start or stop. */
    public static void onPlayingChanged(Object listener, boolean playing) {
        if (!pauseActionSet) {
            pauseActionSet = true;
            SleepTimer.setPauseAction(RumblePlayback::pauseStarted);
        }
        if (playing) SleepTimer.onPlay(listener);
        else SleepTimer.onStop(listener);
    }

    /**
     * Pauses each player service whose listener reported playback, through the pause Rumble's media session
     * uses. Only when none could be paused does it fall back to a media key, which the system sends to the
     * active media session, possibly another app's.
     */
    static void pauseStarted() {
        int paused = 0;
        for (Object listener : SleepTimer.started()) {
            try {
                if (pausePlayer(listener)) paused++;
            } catch (Throwable t) {
                Logger.d("sleep timer: " + t);
            }
        }
        if (paused > 0) {
            Logger.d("sleep timer: paused " + paused + " player" + (paused == 1 ? "" : "s"));
        } else {
            pauseByMediaKey();
        }
    }

    /** Replaced at patch time: pauses the player of a player service listener; false if it has none. */
    private static boolean pausePlayer(Object listener) {
        return false;
    }

    /** Fallback: a media key, as a headset's pause button would send, to the system's active media session. */
    static void pauseByMediaKey() {
        Context context = Settings.appContext();
        AudioManager audio = context == null ? null : context.getSystemService(AudioManager.class);
        if (audio == null) {
            Logger.d("sleep timer: no audio service");
            return;
        }
        long now = SystemClock.uptimeMillis();
        audio.dispatchMediaKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_MEDIA_PAUSE, 0));
        audio.dispatchMediaKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_UP, KeyEvent.KEYCODE_MEDIA_PAUSE, 0));
        Logger.d("sleep timer: sent pause");
    }

    /** Replaced at patch time: a player video source's height (0 for Auto). */
    private static int sourceHeight(Object source) {
        return 0;
    }
}
