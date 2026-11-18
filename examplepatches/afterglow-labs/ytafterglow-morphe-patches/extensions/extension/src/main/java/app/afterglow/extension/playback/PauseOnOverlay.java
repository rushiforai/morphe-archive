package app.afterglow.extension.playback;

import android.os.Looper;
import android.view.View;
import java.util.Map;
import java.util.WeakHashMap;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.diagnostics.DebugLog;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.LiteMode;

/** Native standard-player controls pause on appearance and play on dismissal. */
public final class PauseOnOverlay {
    /** Injected on the owner of these controls, using its actual play/pause controller. */
    public interface Controller {
        View afterglow_overlayRoot();
        boolean afterglow_overlayVisible();
        /** False when the player is unavailable, ended, loading or in an error state. */
        boolean afterglow_overlaySetPlaying(boolean playing);
    }

    private static final Map<Controller, OverlayPauseSession> SESSIONS = new WeakHashMap<>();
    private PauseOnOverlay() {}

    public static void visibilityChanged(Controller owner) {
        if (owner == null || Looper.myLooper() != Looper.getMainLooper()) return;
        OverlayPauseSession session = SESSIONS.get(owner);
        boolean enabled = InstalledTweaks.has("player-overlay") && LiteMode.effectiveBool("pauseOnOverlay");
        if (!enabled && session == null) return;
        if (session == null) { session = new OverlayPauseSession(); SESSIONS.put(owner, session); }
        try {
            View root = owner.afterglow_overlayRoot();
            // This is the containing player root, not the fading controls view.
            boolean available = root != null && root.isAttachedToWindow() && root.isShown()
                    && root.hasWindowFocus() && root.getWindowVisibility() == View.VISIBLE;
            boolean visible = owner.afterglow_overlayVisible();
            if (!session.begin(enabled, available, AfterglowPrefs.revision(), visible)) return;
            boolean accepted = false;
            try {
                accepted = owner.afterglow_overlaySetPlaying(!visible);
                if (accepted) DebugLog.write("overlay-player", visible
                        ? "Overlay shown: pause requested" : "Overlay hidden: play requested");
            } finally { session.end(accepted); }
        } catch (Throwable error) {
            session.end(false);
            Afterglow.error("PauseOnOverlay", error);
        }
    }
}
