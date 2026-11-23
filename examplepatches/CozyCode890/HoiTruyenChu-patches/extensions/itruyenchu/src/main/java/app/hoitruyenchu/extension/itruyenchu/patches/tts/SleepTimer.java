package app.hoitruyenchu.extension.itruyenchu.patches.tts;

import android.os.SystemClock;
import android.util.Log;

import org.json.JSONObject;

import app.hoitruyenchu.extension.itruyenchu.patches.shared.HtcSettings;
import app.hoitruyenchu.extension.itruyenchu.patches.shared.JsBridge;

/**
 * Sleep timer of the background reading patch: stop the reading after some minutes or at the end
 * of some chapters. The reading always stops at the end of a line: the next line is not spoken
 * and the voice bar's pause button is pressed (see {@link TtsController#speak}).
 * <p>
 * Options: "off", "m15" .. "m90" (minutes), "c1" .. "c5" (chapters, the current one included).
 * Set from the settings screen or with the voice bar button (one option further per press).
 */
public final class SleepTimer {
    private static final String TAG = "HTC-Sleep";

    public static final String[] OPTIONS = {"off", "m15", "m30", "m45", "m60", "m90", "c1", "c2", "c3", "c5"};

    private static final Object lock = new Object();
    private static String option = "off";
    /** Wall clock end of a minutes timer (for the scripts), and the same on the elapsed clock. */
    private static long endAtWall;
    private static long endAtElapsed;
    private static int chaptersLeft;

    private SleepTimer() {
    }

    public static String label(String option) {
        if (option == null || "off".equals(option)) return "Tắt";
        int n = number(option);
        return option.startsWith("m") ? n + " phút" : "Hết " + n + " chương";
    }

    private static int number(String option) {
        try {
            return Integer.parseInt(option.substring(1));
        } catch (Throwable t) {
            return 0;
        }
    }

    public static String option() {
        synchronized (lock) {
            return option;
        }
    }

    /** What the timer does now, e.g. "Còn 23 phút" or "Còn 2 chương", or null when off. */
    public static String describe() {
        synchronized (lock) {
            if ("off".equals(option)) return null;
            if (option.startsWith("m")) {
                long left = Math.max(0, endAtElapsed - SystemClock.elapsedRealtime());
                return "Còn " + Math.max(1, (left + 59_999) / 60_000) + " phút";
            }
            return chaptersLeft <= 1 ? "Dừng ở cuối chương này" : "Còn " + chaptersLeft + " chương";
        }
    }

    public static void set(String value) {
        synchronized (lock) {
            option = value == null ? "off" : value;
            int n = number(option);
            if (option.startsWith("m") && n > 0) {
                endAtElapsed = SystemClock.elapsedRealtime() + n * 60_000L;
                endAtWall = System.currentTimeMillis() + n * 60_000L;
                chaptersLeft = 0;
            } else if (option.startsWith("c") && n > 0) {
                chaptersLeft = n;
                endAtElapsed = endAtWall = 0;
            } else {
                option = "off";
                endAtElapsed = endAtWall = 0;
                chaptersLeft = 0;
            }
        }
        Log.i(TAG, "sleep timer: " + option);
        publish();
    }

    /** Voice bar button: the next option. */
    public static void cycle() {
        String current = option();
        int index = 0;
        for (int i = 0; i < OPTIONS.length; i++) {
            if (OPTIONS[i].equals(current)) index = i;
        }
        String next = OPTIONS[(index + 1) % OPTIONS.length];
        set(next);
        HtcSettings.toast("off".equals(next) ? "Đã tắt hẹn giờ" : "Hẹn giờ tắt: " + label(next));
    }

    /** Sends the state to the scripts (voice bar button). */
    public static void publish() {
        try {
            JSONObject state = new JSONObject();
            synchronized (lock) {
                state.put("cmd", "sleep");
                state.put("option", option);
                state.put("endAt", endAtWall);
                state.put("chapters", chaptersLeft);
            }
            JsBridge.emit(JsBridge.EVENT_COMMAND, state.toString());
        } catch (Throwable t) {
            Log.w(TAG, "publish failed", t);
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Called by TtsController

    /** A line was spoken to the end. */
    static void onLineDone(String text) {
        boolean changed = false;
        synchronized (lock) {
            if (option.startsWith("c") && chaptersLeft > 0 && TtsController.isEndOfChapter(text)) {
                chaptersLeft--;
                changed = true;
                Log.i(TAG, "chapter finished, " + chaptersLeft + " left");
            }
        }
        if (changed) publish();
    }

    /**
     * A new line is about to be spoken.
     *
     * @param continuous the previous line ended just before (the reading goes on by itself)
     * @return true if the reading must stop instead
     */
    static boolean shouldStop(boolean continuous) {
        boolean expired;
        synchronized (lock) {
            if ("off".equals(option)) return false;
            expired = option.startsWith("m")
                    ? SystemClock.elapsedRealtime() >= endAtElapsed
                    : chaptersLeft <= 0;
        }
        if (!expired) return false;
        set("off");
        if (!continuous) {
            // Play pressed again after the time was over: the timer is simply done.
            Log.i(TAG, "timer over while not reading, reading normally");
            return false;
        }
        Log.i(TAG, "timer over, stopping the reading");
        HtcSettings.toast("Hẹn giờ tắt: đã dừng đọc");
        return true;
    }
}
