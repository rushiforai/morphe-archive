package semicoloncolonel.mobilestream.extension.yttv.ads;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.graphics.Color;
import android.media.AudioManager;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import semicoloncolonel.mobilestream.extension.shared.misc.AdBreakText;

/**
 * Covers and mutes the ad slots YouTube TV inserts into live channels.
 *
 * The native player core announces each live ad slot to Java as a cue-point
 * list (a protobuf). Each cue point carries its id, the slot's duration, and
 * an inner payload with the slot's start on the broadcast clock (UTC
 * seconds). The live time bar (UnpluggedTimeBarModel) is told the UTC time of
 * the frame on screen on every update. While that time falls inside a slot,
 * the cover is up and the media volume is muted, so the cover follows what is
 * on screen, through pauses, rewinds, and DVR.
 *
 * Cue points arrive as segments download, ahead of the screen and in bursts,
 * so their offsets are used only as a fallback when the time bar has gone
 * quiet.
 *
 * The slots belong to one playback. When the player gets a new cue-point
 * provider (a new channel or recording), the slots are cleared, so one
 * channel's break never covers another.
 *
 * The network's own commercials around that slot carry no cue points and are
 * not covered.
 */
@SuppressWarnings("unused")
public final class YttvLiveMask {
    private static final String TAG = "MSP-YTTV-MASK";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** Each slot: {start UTC ms, end UTC ms, fallback start (device clock), fallback end}. */
    private static final Map<String, long[]> slots = new HashMap<>();

    // The UTC time of the frame on screen, and when it was reported.
    private static volatile long playheadUtcMs;
    private static volatile long playheadAtMs;
    private static long lastPositionLogMs;
    private static boolean ticking;

    private static FrameLayout cover;
    private static TextView label;
    private static boolean muted;

    private YttvLiveMask() {
    }

    /** Injection point: the live time bar's update, with the UTC time on screen. */
    public static void position(long currentUtcMs) {
        if (currentUtcMs <= 0) return;
        playheadUtcMs = currentUtcMs;
        playheadAtMs = SystemClock.elapsedRealtime();
    }

    /** Called by YttvDaiDisabler when a new playback gets its cue-point provider. */
    public static void reset() {
        synchronized (slots) {
            if (slots.isEmpty()) return;
            slots.clear();
        }
        Log.i(TAG, "new playback: slots cleared");
        MAIN.post(new Runnable() {
            @Override
            public void run() {
                hide();
            }
        });
    }

    /** Injection point: CuePointDataProviderWrapper.NativeCallback.onCuepointList. */
    public static void cuepoints(byte[] list) {
        if (list == null) return;
        try {
            long now = SystemClock.elapsedRealtime();
            for (byte[] entry : fields(list, 1)) {
                for (byte[] cue : fields(entry, 1)) {
                    record(cue, now);
                }
            }
        } catch (Throwable t) {
            // Never let a malformed list reach the native caller.
            Log.e(TAG, "cue-point read failure", t);
        }
    }

    private static void record(byte[] cue, long now) {
        Reader r = new Reader(cue);
        String id = null;
        double duration = -1;
        double offset = Double.NaN;
        long startUtcMs = 0;
        while (r.more()) {
            int key = (int) r.varint();
            int field = key >>> 3;
            int type = key & 7;
            if (field == 3 && type == 1) duration = r.float64();
            else if (field == 4 && type == 1) offset = r.float64();
            else if (field == 5 && type == 2) startUtcMs = slotStartUtc(r.bytes());
            else if (field == 6 && type == 2) id = new String(r.bytes());
            else r.skip(type);
        }
        if (id == null || duration <= 0) return;
        long durationMs = Math.round(duration * 1000);
        long wallStart = Double.isNaN(offset) ? 0 : now - Math.round(offset * 1000);
        boolean start;
        synchronized (slots) {
            long[] known = slots.get(id);
            if (known == null) {
                slots.put(id, new long[] {startUtcMs, startUtcMs + durationMs, wallStart, wallStart + durationMs});
                Log.i(TAG, "slot " + id + ": " + duration + " s from UTC " + startUtcMs);
            } else if (known[0] == 0 && startUtcMs > 0) {
                known[0] = startUtcMs;
                known[1] = startUtcMs + durationMs;
            }
            start = !ticking;
            ticking = true;
        }
        if (start) MAIN.post(TICK);
    }

    /** The slot's start on the broadcast clock, from the cue's inner payload (base64 protobuf). */
    private static long slotStartUtc(byte[] payload) {
        try {
            // The payload is URL-safe base64 ("-" and "_").
            String text = new String(payload).replace('+', '-').replace('/', '_');
            byte[] inner = android.util.Base64.decode(text, android.util.Base64.URL_SAFE);
            for (byte[] timing : fields(inner, 2)) {
                Reader r = new Reader(timing);
                while (r.more()) {
                    int key = (int) r.varint();
                    if ((key >>> 3) == 3 && (key & 7) == 0) return r.varint() * 1000;
                    r.skip(key & 7);
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "slot start unreadable: " + t);
        }
        return 0;
    }

    private static final Runnable TICK = new Runnable() {
        @Override
        public void run() {
            long now = SystemClock.elapsedRealtime();
            // The time bar updates about once a second while the player is on
            // screen. When it goes quiet (paused, or the player was left),
            // nothing is covered, so a slot airing in real time never covers a
            // paused frame or another screen.
            boolean onScreen = playheadUtcMs > 0 && now - playheadAtMs < 3000;
            long playhead = playheadUtcMs + (onScreen ? now - playheadAtMs : 0);
            if (onScreen && now - lastPositionLogMs >= 30_000) {
                lastPositionLogMs = now;
                Log.i(TAG, "playhead UTC " + playhead);
            }
            boolean inSlot = false;
            synchronized (slots) {
                Iterator<long[]> it = slots.values().iterator();
                while (it.hasNext()) {
                    long[] slot = it.next();
                    if (onScreen) {
                        // A slot without a broadcast start falls back to the
                        // download-based timing.
                        if (slot[0] > 0 ? playhead >= slot[0] && playhead < slot[1]
                                : now >= slot[2] && now < slot[3]) inSlot = true;
                    }
                    // Keep slots for an hour, so a rewind into one is still covered.
                    if (now - slot[3] > 3_600_000) it.remove();
                }
                if (slots.isEmpty() && cover == null && !muted) {
                    ticking = false;
                    return;
                }
            }
            Activity activity = inSlot ? currentActivity() : null;
            if (activity != null) show(activity);
            else if (cover != null || muted) hide();
            MAIN.postDelayed(this, 250);
        }
    };

    private static void show(Activity activity) {
        try {
            if (activity.isFinishing()) return;
            ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
            if (cover == null || cover.getParent() != decor) {
                if (cover != null && cover.getParent() != null) ((ViewGroup) cover.getParent()).removeView(cover);
                cover = buildCover(activity);
                decor.addView(cover, new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
                Log.i(TAG, "Live ad slot covered");
            }
            cover.bringToFront();
            // No countdown: the slot's end is known, but the network's own
            // commercials can follow it, so the show may not be back then.
            label.setText(AdBreakText.untimed());
            if (!muted) {
                AudioManager audio = audio();
                if (audio != null) {
                    audio.adjustStreamVolume(AudioManager.STREAM_MUSIC, AudioManager.ADJUST_MUTE, 0);
                    muted = true;
                }
            }
        } catch (Exception ex) {
            Log.e(TAG, "show failure", ex);
        }
    }

    private static void hide() {
        try {
            if (cover != null) {
                ViewGroup parent = (ViewGroup) cover.getParent();
                if (parent != null) parent.removeView(cover);
                cover = null;
                label = null;
                Log.i(TAG, "Live ad slot ended");
            }
            if (muted) {
                // Unmuted through the application, so it works with the app
                // in the background or in picture-in-picture.
                AudioManager audio = audio();
                if (audio != null) {
                    audio.adjustStreamVolume(AudioManager.STREAM_MUSIC, AudioManager.ADJUST_UNMUTE, 0);
                    muted = false;
                }
            }
        } catch (Exception ex) {
            Log.e(TAG, "hide failure", ex);
        }
    }

    private static AudioManager audio() {
        try {
            Application app = (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            return app == null ? null : (AudioManager) app.getSystemService(Context.AUDIO_SERVICE);
        } catch (Throwable t) {
            Log.w(TAG, "audio manager: " + t);
            return null;
        }
    }

    private static FrameLayout buildCover(Activity activity) {
        FrameLayout layout = new FrameLayout(activity);
        layout.setBackgroundColor(Color.BLACK);
        // Not clickable: taps reach the app underneath, so the channel can
        // still be changed during the slot.
        layout.setClickable(false);
        label = new TextView(activity);
        label.setTextColor(Color.LTGRAY);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        label.setGravity(Gravity.CENTER);
        int padding = (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, 32, activity.getResources().getDisplayMetrics());
        label.setPadding(padding, padding, padding, padding);
        layout.addView(label, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        return layout;
    }

    /** The resumed Activity, found through ActivityThread so no extra app hook is needed. */
    private static Activity currentActivity() {
        try {
            Class<?> threadClass = Class.forName("android.app.ActivityThread");
            Object thread = threadClass.getMethod("currentActivityThread").invoke(null);
            Field activitiesField = threadClass.getDeclaredField("mActivities");
            activitiesField.setAccessible(true);
            Object activities = activitiesField.get(thread);
            if (!(activities instanceof Map)) return null;
            for (Object record : ((Map<?, ?>) activities).values()) {
                Field pausedField = record.getClass().getDeclaredField("paused");
                pausedField.setAccessible(true);
                if (!pausedField.getBoolean(record)) {
                    Field activityField = record.getClass().getDeclaredField("activity");
                    activityField.setAccessible(true);
                    Object activity = activityField.get(record);
                    if (activity instanceof Activity) return (Activity) activity;
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "current activity: " + t);
        }
        return null;
    }

    /** Every length-delimited value of one field number in a protobuf message. */
    private static java.util.List<byte[]> fields(byte[] message, int number) {
        java.util.List<byte[]> out = new java.util.ArrayList<>();
        Reader r = new Reader(message);
        while (r.more()) {
            int key = (int) r.varint();
            if ((key >>> 3) == number && (key & 7) == 2) out.add(r.bytes());
            else r.skip(key & 7);
        }
        return out;
    }

    /** A minimal protobuf wire-format reader. */
    private static final class Reader {
        private final byte[] b;
        private int i;

        Reader(byte[] bytes) {
            b = bytes;
        }

        boolean more() {
            return i < b.length;
        }

        long varint() {
            long result = 0;
            for (int shift = 0; shift < 64; shift += 7) {
                byte x = b[i++];
                result |= (long) (x & 0x7f) << shift;
                if ((x & 0x80) == 0) break;
            }
            return result;
        }

        double float64() {
            long bits = 0;
            for (int k = 0; k < 8; k++) bits |= (long) (b[i++] & 0xff) << (8 * k);
            return Double.longBitsToDouble(bits);
        }

        byte[] bytes() {
            int n = length();
            byte[] out = new byte[n];
            System.arraycopy(b, i, out, 0, n);
            i += n;
            return out;
        }

        /** A length prefix, rejected unless it fits in what is left. */
        int length() {
            long n = varint();
            if (n < 0 || n > b.length - i) throw new IllegalArgumentException("bad length " + n);
            return (int) n;
        }

        void skip(int type) {
            switch (type) {
                case 0: varint(); break;
                case 1: i = Math.min(b.length, i + 8); break;
                case 2: {
                    // Read the length first: in `i += varint()` Java would use
                    // the position from before the length prefix.
                    int length = length();
                    i += length;
                    break;
                }
                case 5: i = Math.min(b.length, i + 4); break;
                default: i = b.length;
            }
        }
    }
}
