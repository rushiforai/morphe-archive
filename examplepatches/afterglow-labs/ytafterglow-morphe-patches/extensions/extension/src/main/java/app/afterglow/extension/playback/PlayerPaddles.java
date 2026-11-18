package app.afterglow.extension.playback;

import android.os.Handler;
import android.os.Looper;
import android.view.View;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.diagnostics.DebugLog;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.LiteMode;

/** Re-renders the native transport subscriber without changing its source state. */
public final class PlayerPaddles {
    public interface Controller {
        void afterglow_rememberPaddles(Object transition);
        boolean afterglow_singletonVod();
        View afterglow_paddleRoot();
        void afterglow_refreshPaddles();
    }

    private static final Map<Controller, Integer> BOUND = new WeakHashMap<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Runnable REFRESH = PlayerPaddles::refresh;

    static {
        AfterglowPrefs.addListener(key -> {
            if (key != null && !key.equals("replacePrevNext") && !key.equals("hidePrevNext")
                    && !key.equals(LiteMode.KEY)) return;
            MAIN.removeCallbacks(REFRESH);
            MAIN.post(REFRESH);
        });
    }

    private PlayerPaddles() {}

    /** Runs once at the start of each native UI update, before its visibility decisions. */
    public static int observe(Controller owner, Object transition) {
        if (owner == null || Looper.myLooper() != Looper.getMainLooper()
                || !InstalledTweaks.has("player-overlay")) return PaddlePolicy.NATIVE;
        try {
            owner.afterglow_rememberPaddles(transition);
            boolean enabled = LiteMode.effectiveBool("replacePrevNext");
            int mode = PaddlePolicy.mode(enabled, enabled && owner.afterglow_singletonVod(),
                    LiteMode.effectiveBool("hidePrevNext"));
            Integer previous = BOUND.put(owner, mode);
            if (previous == null ? mode != PaddlePolicy.NATIVE : previous != mode) {
                DebugLog.write("overlay-player", "Native transport presentation " + mode);
            }
            return mode;
        } catch (Throwable error) {
            Afterglow.error("PlayerPaddles.observe", error);
            return PaddlePolicy.NATIVE;
        }
    }

    private static void refresh() {
        for (Controller owner : new ArrayList<>(BOUND.keySet())) {
            if (owner == null) continue;
            try {
                View root = owner.afterglow_paddleRoot();
                if (root != null && root.isAttachedToWindow()) owner.afterglow_refreshPaddles();
            } catch (Throwable error) { Afterglow.error("PlayerPaddles.refresh", error); }
        }
    }
}
