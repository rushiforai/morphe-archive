package app.soundsync.extension;

import android.app.Application;
import android.app.UiModeManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Configuration;
import android.database.ContentObserver;
import android.database.Cursor;
import android.media.AudioTimestamp;
import android.media.AudioTrack;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.SystemClock;
import android.util.Log;

import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Keeps video in sync with sound that the car plays late (wireless Android Auto buffers audio
 * without telling the phone, so players don't allow for it).
 *
 * The patch redirects the app's calls to {@link AudioTrack#getTimestamp} and
 * {@link AudioTrack#getPlaybackHeadPosition} here. Both report the sound as having played
 * {@code delay} less than it really has, so the player shows each video frame that much later:
 * the picture waits for the car. Nothing else about the sound changes.
 *
 * Settings come from the SoundSync app (content provider {@value #AUTHORITY}) when it is
 * installed, otherwise from the values chosen when patching.
 */
@SuppressWarnings("unused")
public final class AudioSync {

    private static final String TAG = "SoundSync";
    public static final String AUTHORITY = "app.soundsync.settings";
    private static final Uri CONFIG = Uri.parse("content://" + AUTHORITY + "/config");

    public static final int MODE_OFF = 0;
    public static final int MODE_ANDROID_AUTO = 1;
    public static final int MODE_ALWAYS = 2;

    /** Android Auto's own "is a car connected?" lookup (the androidx car app library uses it). */
    private static final Uri CAR_CONNECTION = Uri.parse("content://androidx.car.app.connection");
    private static final String CAR_CONNECTION_STATE = "CarConnectionState";
    private static final String CAR_CONNECTION_UPDATED =
            "androidx.car.app.connection.action.CAR_CONNECTION_UPDATED";

    private static final long CAR_CHECK_INTERVAL_MS = 3000;
    private static final int MAX_DELAY_MS = 5000;

    /** Replaced by the patch with the delay chosen when patching. */
    private static int defaultDelayMs() {
        return 750;
    }

    /** Replaced by the patch with the mode chosen when patching. */
    private static int defaultMode() {
        return MODE_ANDROID_AUTO;
    }

    private static volatile long delayUs = clampMs(defaultDelayMs()) * 1000L;
    private static volatile int mode = defaultMode();
    private static volatile boolean started;
    private static volatile Context context;
    private static volatile boolean inCar;
    private static volatile long carCheckedAt = -CAR_CHECK_INTERVAL_MS;
    private static volatile boolean carCheckQueued;
    private static volatile boolean lastActive;
    private static String lastCarState = "";
    private static Handler handler;

    /**
     * What each AudioTrack has been told so far. The delay is applied per track and the play
     * position it reports never goes back, so the delay can change while something plays (see
     * {@link #trackDelayUs}).
     */
    private static final Map<AudioTrack, TrackState> TRACKS =
            Collections.synchronizedMap(new WeakHashMap<AudioTrack, TrackState>());

    private static final class TrackState {
        /** The track's own play position last time, or -1 before the first call. */
        long lastRaw = -1;
        /** The play position reported last time. */
        long lastOut;
        /** The delay applied to this track now, or -1 before the first call. */
        long appliedUs = -1;
        /** When {@link #appliedUs} was last updated. */
        long appliedAtMs;
    }

    private AudioSync() {
    }

    // ------------------------------------------------------------------ called by the patched app

    /** Replaces {@code audioTrack.getTimestamp(timestamp)}. */
    public static boolean getTimestamp(AudioTrack track, AudioTimestamp timestamp) {
        boolean ok = track.getTimestamp(timestamp);
        if (ok && (timestamp != null)) {
            TrackState s = state(track);
            long d;
            synchronized (s) {
                d = trackDelayUs(s);
            }
            // The frame at framePosition is heard d later than Android thinks.
            if (d > 0) timestamp.nanoTime += d * 1000L;
        }
        return ok;
    }

    /** Replaces {@code audioTrack.getPlaybackHeadPosition()}. */
    public static int getPlaybackHeadPosition(AudioTrack track) {
        int raw = track.getPlaybackHeadPosition();
        long played = raw & 0xFFFFFFFFL; // the value is an unsigned 32-bit counter that wraps
        TrackState s = state(track);
        synchronized (s) {
            // The track went back: it was flushed (a seek, a new item) or its counter wrapped.
            // Either way the player starts counting again, and so does this.
            if ((s.lastRaw >= 0) && (played < s.lastRaw)) s.lastOut = 0;
            s.lastRaw = played;
            long d = trackDelayUs(s);
            long frames = d * track.getSampleRate() / 1_000_000L;
            // Before the first sound reaches the car's speakers, nothing has played.
            long out = Math.max(0, played - frames);
            // Never report less than last time: the player would take a smaller number for the
            // counter wrapping around, decide about a day of sound had played, and stay broken
            // until the app restarts. With a longer delay the position holds still instead,
            // until the sound catches up.
            if (out < s.lastOut) out = s.lastOut;
            s.lastOut = out;
            return (int) (out & 0xFFFFFFFFL);
        }
    }

    private static TrackState state(AudioTrack track) {
        synchronized (TRACKS) {
            TrackState s = TRACKS.get(track);
            if (s == null) {
                s = new TrackState();
                TRACKS.put(track, s);
            }
            return s;
        }
    }

    /**
     * The delay for one track now. It follows the setting (and whether a car is connected), but
     * a longer delay is reached no faster than time passes: the picture pauses for the
     * difference rather than the player's clock jumping back. A shorter one applies at once
     * (the picture skips ahead). Call with {@code s} locked.
     */
    private static long trackDelayUs(TrackState s) {
        long target = activeDelayUs();
        long now = SystemClock.elapsedRealtime();
        if ((s.appliedUs < 0) || (target <= s.appliedUs)) {
            s.appliedUs = target;
        } else {
            long step = Math.max(0, now - s.appliedAtMs) * 1000L;
            s.appliedUs = Math.min(target, s.appliedUs + step);
        }
        s.appliedAtMs = now;
        return s.appliedUs;
    }

    // ------------------------------------------------------------------ state

    private static long activeDelayUs() {
        if (!started) start();
        boolean active;
        switch (mode) {
            case MODE_ALWAYS:
                active = true;
                break;
            case MODE_ANDROID_AUTO:
                active = isInCar();
                break;
            default:
                active = false;
        }
        if (active != lastActive) {
            lastActive = active;
            Log.i(TAG, (active ? "On" : "Off") + ": delay " + (delayUs / 1000) + " ms, mode " + mode);
        }
        return active ? delayUs : 0;
    }

    /**
     * Whether the phone is connected to Android Auto. The player only reads the last answer; the
     * check itself runs on the SoundSync thread, at most every 3 s while something plays, and
     * straight away when Android Auto announces a change.
     */
    private static boolean isInCar() {
        long now = SystemClock.elapsedRealtime();
        if ((now - carCheckedAt >= CAR_CHECK_INTERVAL_MS) && !carCheckQueued && (handler != null)) {
            carCheckQueued = true;
            carCheckedAt = now;
            handler.post(new Runnable() {
                @Override
                public void run() {
                    carCheckQueued = false;
                    checkCar();
                }
            });
        }
        return inCar;
    }

    // Runs on the SoundSync thread.
    private static void checkCar() {
        Context c = context;
        if (c == null) return;
        String state;
        boolean connected;
        int aa = queryCarConnection(c);
        if (aa > 0) {
            connected = true;
            state = (aa == 2) ? "Android Auto connected" : "car connected (type " + aa + ")";
        } else if (isCarMode(c)) {
            connected = true;
            state = "car mode on";
        } else {
            connected = false;
            state = (aa == 0) ? "Android Auto not connected"
                    : "Android Auto status not available (" + aa + "), car mode off";
        }
        inCar = connected;
        if (!state.equals(lastCarState)) {
            lastCarState = state;
            Log.i(TAG, "Car check: " + state);
        }
    }

    /** 0 = not connected, 1 = car's own system, 2 = Android Auto; negative = couldn't ask. */
    private static int queryCarConnection(Context c) {
        Cursor cursor = null;
        try {
            cursor = c.getContentResolver().query(CAR_CONNECTION,
                    new String[]{CAR_CONNECTION_STATE}, null, null, null);
            if (cursor == null) return -1;
            int col = cursor.getColumnIndex(CAR_CONNECTION_STATE);
            if (col < 0) return -2;
            if (!cursor.moveToFirst()) return -3;
            return cursor.getInt(col);
        } catch (Throwable t) {
            return -4;
        } finally {
            if (cursor != null) cursor.close();
        }
    }

    private static boolean isCarMode(Context c) {
        try {
            UiModeManager ui = (UiModeManager) c.getSystemService(Context.UI_MODE_SERVICE);
            return (ui != null) && (ui.getCurrentModeType() == Configuration.UI_MODE_TYPE_CAR);
        } catch (Throwable t) {
            return false;
        }
    }

    private static void listenForCar(Context c) {
        try {
            BroadcastReceiver r = new BroadcastReceiver() {
                @Override
                public void onReceive(Context ctx, Intent intent) {
                    checkCar();
                }
            };
            IntentFilter f = new IntentFilter(CAR_CONNECTION_UPDATED);
            if (Build.VERSION.SDK_INT >= 33) {
                c.registerReceiver(r, f, null, handler, 2 /* Context.RECEIVER_EXPORTED */);
            } else {
                c.registerReceiver(r, f, null, handler);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Can't listen for Android Auto changes; checking every few seconds instead");
        }
    }

    private static synchronized void start() {
        if (started) return;
        started = true;
        try {
            HandlerThread thread = new HandlerThread("SoundSync");
            thread.start();
            handler = new Handler(thread.getLooper());
            handler.post(new Runnable() {
                @Override
                public void run() {
                    init();
                }
            });
        } catch (Throwable t) {
            Log.e(TAG, "Could not start", t);
        }
    }

    // Runs on the SoundSync thread: never blocks the player.
    private static void init() {
        Context c = findContext();
        if (c == null) {
            Log.w(TAG, "No app context; using the patch defaults");
            return;
        }
        context = c;
        loadSettings();
        listenForCar(c);
        checkCar();
        try {
            c.getContentResolver().registerContentObserver(CONFIG, false, new ContentObserver(handler) {
                @Override
                public void onChange(boolean selfChange) {
                    loadSettings();
                }
            });
        } catch (Throwable t) {
            // SoundSync app not installed: keep the patch defaults
        }
    }

    private static void loadSettings() {
        Context c = context;
        if (c == null) return;
        Cursor cursor = null;
        try {
            cursor = c.getContentResolver().query(CONFIG, null, null, null, null);
            if ((cursor != null) && cursor.moveToFirst()) {
                int d = cursor.getInt(cursor.getColumnIndexOrThrow("delay_ms"));
                int m = cursor.getInt(cursor.getColumnIndexOrThrow("mode"));
                delayUs = clampMs(d) * 1000L;
                mode = ((m >= MODE_OFF) && (m <= MODE_ALWAYS)) ? m : MODE_ANDROID_AUTO;
                Log.i(TAG, "Settings from the SoundSync app: delay " + d + " ms, mode " + mode);
            }
        } catch (Throwable t) {
            // SoundSync app not installed or not reachable: keep what we have
        } finally {
            if (cursor != null) cursor.close();
        }
    }

    private static Context findContext() {
        try {
            Object app = Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            if (app instanceof Application) return ((Application) app).getApplicationContext();
        } catch (Throwable ignored) {
        }
        try {
            Object app = Class.forName("android.app.AppGlobals")
                    .getMethod("getInitialApplication").invoke(null);
            if (app instanceof Application) return ((Application) app).getApplicationContext();
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static long clampMs(int ms) {
        return Math.max(0, Math.min(MAX_DELAY_MS, ms));
    }
}
