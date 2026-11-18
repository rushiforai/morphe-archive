package app.afterglow.extension.playback;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.widget.FrameLayout;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.diagnostics.DebugLog;

/** Shares the eye presentation and its timeout between native watch and Shorts hosts. */
public final class OverlayModes {
    public interface Listener { void onOverlayModeChanged(); }
    private static final OverlayModeSession SESSION = new OverlayModeSession();
    private static final Map<OverlayModeController, Boolean> BOUND = new WeakHashMap<>();
    private static final Map<Listener, Boolean> LISTENERS = new WeakHashMap<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile boolean suppressed;
    private static boolean applying;
    private static final Runnable TIMEOUT = () -> {
        if (SESSION.timeout(SystemClock.uptimeMillis())) publish(false);
    };

    private OverlayModes() {}
    public static int mode() { return SESSION.mode(); }
    public static boolean controlsVisible() { return SESSION.controlsVisible(); }
    public static float eyeOpacity() { return SESSION.eyeOpacity(); }
    public static boolean suppressStock() { return InstalledTweaks.has("overlay-buttons") && suppressed; }
    public static boolean standardVisible(boolean requested) { return requested && !suppressStock(); }
    public static void addListener(Listener listener) { LISTENERS.put(listener, true); }
    public static void removeListener(Listener listener) { LISTENERS.remove(listener); }

    public static void cycle() {
        if (!InstalledTweaks.has("overlay-buttons")) return;
        Afterglow.runOnMain(() -> {
            boolean previous = SESSION.suppressStock();
            SESSION.cycle(SystemClock.uptimeMillis());
            publish(previous != SESSION.suppressStock());
            DebugLog.write("overlay-eye", "Overlay mode " + SESSION.mode());
        });
    }

    /** The future Control Center action calls this without changing saved preferences. */
    public static void reset() {
        Afterglow.runOnMain(() -> {
            boolean previous = SESSION.suppressStock();
            SESSION.reset();
            publish(previous);
        });
    }

    private static void publish(boolean refreshStock) {
        suppressed = SESSION.suppressStock();
        MAIN.removeCallbacks(TIMEOUT);
        if (SESSION.deadline() != 0) {
            MAIN.postDelayed(TIMEOUT, Math.max(0, SESSION.deadline() - SystemClock.uptimeMillis()));
        }
        for (Listener listener : new ArrayList<>(LISTENERS.keySet())) {
            if (listener != null) listener.onOverlayModeChanged();
        }
        if (!refreshStock || applying) return;
        applying = true;
        try {
            for (OverlayModeController owner : new ArrayList<>(BOUND.keySet())) {
                if (owner == null) continue;
                try {
                    View root = owner.afterglow_modeRoot();
                    if (root != null && root.isAttachedToWindow()) owner.afterglow_refreshMode(!suppressed);
                } catch (Throwable error) { Afterglow.error("OverlayModes.refresh", error); }
            }
        } finally { applying = false; }
    }

    public static void bindStandard(OverlayModeController owner) {
        if (!InstalledTweaks.has("overlay-buttons") || owner == null) return;
        try {
            if (!BOUND.containsKey(owner)) BOUND.put(owner, owner.afterglow_modeVisible());
        } catch (Throwable error) { Afterglow.error("OverlayModes.bind", error); }
    }

    /** Called after native visibility has been computed, before it can be confused with the mask. */
    public static void standardChanged(OverlayModeController owner) {
        if (!InstalledTweaks.has("overlay-buttons") || owner == null) return;
        try {
            boolean visible = owner.afterglow_modeVisible();
            Boolean previous = BOUND.put(owner, visible);
            if (!applying && visible && !Boolean.TRUE.equals(previous)
                    && SESSION.nativeShow(SystemClock.uptimeMillis())) publish(false);
        } catch (Throwable error) { Afterglow.error("OverlayModes.nativeShow", error); }
    }

    public static void bindShorts(OverlayModeController owner) {
        if (!InstalledTweaks.has("overlay-buttons") || owner == null) return;
        try {
            if (!BOUND.containsKey(owner)) BOUND.put(owner, owner.afterglow_modeVisible());
            View root = owner.afterglow_modeRoot();
            if (root instanceof FrameLayout) OverlayButtons.bindShorts((FrameLayout) root);
        } catch (Throwable error) { Afterglow.error("OverlayModes.bindShorts", error); }
    }

    /** Shorts requests are observed before either the eye or the independent player-layer mask. */
    public static boolean shortsVisible(boolean requested) {
        if (!applying && requested && InstalledTweaks.has("overlay-buttons")
                && SESSION.nativeShow(SystemClock.uptimeMillis())) publish(false);
        return requested && !suppressStock();
    }
}
