package app.afterglow.extension.playback;

import android.os.Handler;
import android.os.Looper;

import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.litho.LithoContext;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.LiteMode;

/** Refreshes native watch and fullscreen action components after a hide setting changes. */
public final class WatchActions {
    private static final String[] KEYS = {"noPlayerShareButton", "noPlayerSaveButton",
            "noPlayerDownloadButton", "noPlayerRemixButton", "noPlayerClipButton"};
    private static final Map<WatchActionsController, Integer> BOUND = new WeakHashMap<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Runnable REFRESH = WatchActions::refresh;

    static {
        AfterglowPrefs.addListener(key -> {
            // Lite mode, import and reset can change several effective values together.
            if (key != null && !key.equals(LiteMode.KEY)) {
                boolean relevant = false;
                for (String candidate : KEYS) if (candidate.equals(key)) relevant = true;
                if (!relevant) return;
            }
            MAIN.removeCallbacks(REFRESH);
            MAIN.post(REFRESH);
        });
    }

    private WatchActions() {}

    private static int hiddenButtons() {
        int value = 0;
        for (int i = 0; i < KEYS.length; i++) if (LiteMode.effectiveBool(KEYS[i])) value |= 1 << i;
        return value;
    }

    public static void observe(WatchActionsController controller, Object model, Object context,
                               LithoContext conversion) {
        try {
            if (!InstalledTweaks.has("player-buttons-menus") || conversion == null) return;
            String identifier = conversion.afterglow_getIdentifier();
            boolean watch = identifier != null && identifier.contains("video_action_bar.e");
            boolean fullscreen = identifier != null && identifier.contains("quick_actions.e");
            if (!watch && !fullscreen) return;
            int rendered = hiddenButtons();
            // Conversion callbacks can hold the native component-store monitor.
            // Native layout holds the owner monitor while subscribing to that store.
            // Always leave the callback before acquiring the owner, even on main.
            MAIN.post(() -> {
                try {
                    controller.afterglow_rememberActions(model, context);
                    synchronized (BOUND) { BOUND.put(controller, rendered); }
                    // A settings refresh may have run before this owner was recorded.
                    if (rendered != hiddenButtons()) {
                        MAIN.removeCallbacks(REFRESH);
                        MAIN.post(REFRESH);
                    }
                } catch (Throwable error) {
                    Afterglow.error("WatchActions.remember", error);
                }
            });
        } catch (Throwable error) {
            Afterglow.error("WatchActions.observe", error);
        }
    }

    private static void refresh() {
        ArrayList<WatchActionsController> targets;
        synchronized (BOUND) { targets = new ArrayList<>(BOUND.keySet()); }
        int desired = hiddenButtons();
        for (WatchActionsController controller : targets) {
            if (controller == null) continue;
            synchronized (BOUND) {
                Integer rendered = BOUND.get(controller);
                if (rendered == null || rendered == desired) continue;
            }
            try {
                boolean active = controller.afterglow_refreshActions();
                synchronized (BOUND) {
                    if (active) BOUND.put(controller, desired);
                    else BOUND.remove(controller);
                }
            } catch (Throwable error) {
                synchronized (BOUND) { BOUND.remove(controller); }
                Afterglow.error("WatchActions.refresh", error);
            }
        }
    }
}
