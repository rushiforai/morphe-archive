package app.afterglow.extension.navigation;

import android.os.Handler;
import android.os.Looper;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.LiteMode;

/** Re-evaluates the native progress policy when the independent Shorts setting changes. */
public final class ShortsProgress {
    public interface Controller { boolean afterglow_refreshProgress(); }
    private static final Map<Controller, Boolean> BOUND = new WeakHashMap<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Runnable REFRESH = ShortsProgress::refresh;

    static {
        AfterglowPrefs.addListener(key -> {
            if (key != null && !key.equals("shortsProgress") && !key.equals(LiteMode.KEY)) return;
            MAIN.removeCallbacks(REFRESH);
            MAIN.post(REFRESH);
        });
    }

    private ShortsProgress() {}

    public static int displayMode(int original) {
        return ShortsProgressPolicy.displayMode(original);
    }

    /** A new native model is immediately followed by the native policy update. */
    public static void observe(Controller controller) {
        if (!Gate.installed(Gate.SHORTS) || controller == null) return;
        synchronized (BOUND) { BOUND.put(controller, ShortsProgressPolicy.enabled()); }
    }

    private static void refresh() {
        ArrayList<Controller> targets;
        synchronized (BOUND) { targets = new ArrayList<>(BOUND.keySet()); }
        boolean desired = ShortsProgressPolicy.enabled();
        for (Controller controller : targets) {
            if (controller == null) continue;
            synchronized (BOUND) {
                Boolean previous = BOUND.get(controller);
                if (previous == null || previous == desired) continue;
            }
            try {
                boolean active = controller.afterglow_refreshProgress();
                synchronized (BOUND) {
                    if (active) BOUND.put(controller, desired);
                    else BOUND.remove(controller);
                }
            } catch (Throwable error) {
                synchronized (BOUND) { BOUND.remove(controller); }
                Afterglow.error("ShortsProgress.refresh", error);
            }
        }
    }
}
