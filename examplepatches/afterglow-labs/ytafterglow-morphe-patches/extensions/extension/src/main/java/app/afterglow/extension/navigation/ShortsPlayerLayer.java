package app.afterglow.extension.navigation;

import android.os.Handler;
import android.os.Looper;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.LiteMode;

/** Masks the native overlay's final visibility request without hiding its player parent. */
public final class ShortsPlayerLayer {
    public interface Controller { boolean afterglow_refreshLayer(); }
    private static final String TWEAK = "shorts-layout", KEY = "hideShortsPlayerLayer";
    private static final Map<Controller, Boolean> BOUND = new WeakHashMap<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Runnable REFRESH = ShortsPlayerLayer::refresh;

    static {
        AfterglowPrefs.addListener(key -> {
            if (key != null && !key.equals(KEY) && !key.equals(LiteMode.KEY)) return;
            MAIN.removeCallbacks(REFRESH);
            MAIN.post(REFRESH);
        });
    }

    private ShortsPlayerLayer() {}

    public static boolean visible(boolean original) { return original && !Gate.on(TWEAK, KEY); }

    /** Native state remains stored by YouTube; refresh re-runs that same visibility calculation. */
    public static void observe(Controller controller) {
        if (!Gate.installed(TWEAK) || controller == null) return;
        synchronized (BOUND) { BOUND.put(controller, Gate.on(TWEAK, KEY)); }
    }

    private static void refresh() {
        ArrayList<Controller> targets;
        synchronized (BOUND) { targets = new ArrayList<>(BOUND.keySet()); }
        boolean desired = Gate.on(TWEAK, KEY);
        for (Controller controller : targets) {
            if (controller == null) continue;
            synchronized (BOUND) {
                Boolean previous = BOUND.get(controller);
                if (previous == null || previous == desired) continue;
            }
            try {
                boolean active = controller.afterglow_refreshLayer();
                synchronized (BOUND) {
                    if (active) BOUND.put(controller, desired);
                    else BOUND.remove(controller);
                }
            } catch (Throwable error) {
                synchronized (BOUND) { BOUND.remove(controller); }
                Afterglow.error("ShortsPlayerLayer.refresh", error);
            }
        }
    }
}
