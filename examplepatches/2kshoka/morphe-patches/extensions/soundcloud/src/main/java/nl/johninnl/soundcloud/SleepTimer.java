package nl.johninnl.soundcloud;

import android.app.AlertDialog;
import android.content.Context;
import android.media.AudioManager;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.KeyEvent;
import android.widget.Toast;

/**
 * Sleep timer. All state is touched on the main thread only (dialog click handler and
 * the Handler callback both run there), so no locking is needed.
 *
 * The pause is a MEDIA_PAUSE key event sent through AudioManager. Android routes it to the
 * system's current media-button target, which is normally the app that is playing, but this
 * class cannot guarantee that the target is SoundCloud (see audit notes).
 */
public final class SleepTimer {
    private static final String TAG = "SleepTimer";
    private static final Handler HANDLER = new Handler(Looper.getMainLooper());
    private static Runnable pending;
    private static long endAtUptime;

    public static void showDialog(Context context) {
        String[] labels = {"15 минут", "30 минут", "45 минут", "60 минут", "Отключить таймер"};
        int[] minutes = {15, 30, 45, 60, 0};
        String title = "Таймер сна";
        long left = remainingMinutes();
        if (left > 0) title += " (осталось " + left + " мин.)";
        try {
            new AlertDialog.Builder(context)
                .setTitle(title)
                .setItems(labels, (d, i) -> set(context.getApplicationContext(), minutes[i]))
                .show();
        } catch (RuntimeException e) { // e.g. BadTokenException for a dying Activity
            Log.w(TAG, "Could not show dialog", e);
        }
    }

    private static long remainingMinutes() {
        if (pending == null) return 0;
        long ms = endAtUptime - SystemClock.uptimeMillis();
        return ms <= 0 ? 0 : (ms + 59_999L) / 60_000L;
    }

    private static void set(Context app, int minutes) {
        boolean wasRunning = pending != null;
        if (wasRunning) HANDLER.removeCallbacks(pending);
        pending = null;
        if (minutes == 0) {
            Toast.makeText(app, wasRunning ? "Таймер сна отключён" : "Таймер сна не был запущен",
                Toast.LENGTH_SHORT).show();
            return;
        }
        pending = () -> { pending = null; pause(app); };
        long delay = minutes * 60_000L;
        endAtUptime = SystemClock.uptimeMillis() + delay;
        HANDLER.postDelayed(pending, delay);
        Toast.makeText(app, "Музыка остановится через " + minutes + " мин.", Toast.LENGTH_SHORT).show();
    }

    private static void pause(Context ctx) {
        AudioManager am = (AudioManager) ctx.getSystemService(Context.AUDIO_SERVICE);
        if (am == null) return;
        long now = SystemClock.uptimeMillis();
        am.dispatchMediaKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_MEDIA_PAUSE, 0));
        am.dispatchMediaKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_UP, KeyEvent.KEYCODE_MEDIA_PAUSE, 0));
    }
    public static boolean isRunning() {
    return pending != null;
}

public static long remainingMillis() {
    if (pending == null) return 0;
    return Math.max(0, endAtUptime - SystemClock.uptimeMillis());
}

public static void start(Context context, int minutes) {
    if (context == null || minutes <= 0) return;
    set(context.getApplicationContext(), minutes);
}

public static void stop(Context context) {
    if (context == null) return;
    set(context.getApplicationContext(), 0);
}

/**
 * Adds minutes to a running timer: the pending pause is re-posted for (time left + minutes),
 * the same mechanism set() uses. Does nothing when no timer is running.
 */
public static void extend(Context context, int minutes) {
    if (context == null || minutes <= 0 || pending == null) return;
    Context app = context.getApplicationContext();
    long left = Math.max(0, endAtUptime - SystemClock.uptimeMillis());
    long delay = left + minutes * 60_000L;
    HANDLER.removeCallbacks(pending);
    pending = () -> { pending = null; pause(app); };
    endAtUptime = SystemClock.uptimeMillis() + delay;
    HANDLER.postDelayed(pending, delay);
}

    private SleepTimer() {}
}
