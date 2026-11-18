package io.github.sabopura.morphe.extension.twitch.app;

import android.graphics.Rect;
import android.view.View;

import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;

/** A native player presenter (live, VOD, clip) attached its player view. Each listener gates itself. */
@SuppressWarnings("unused")
public final class PlayerAttach {
    private static final Map<View, WeakReference<Object>> PRESENTERS = new WeakHashMap<>();

    private PlayerAttach() {
    }

    /** Injection point. Main thread. */
    public static void attached(Object presenter, View view) {
        try {
            if (presenter != null && view != null) PRESENTERS.put(view, new WeakReference<>(presenter));
            ForceLandscape.playerView(view);
            LatencyBadge.playerView(view);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.player-attach", e);
        }
    }

    /** The presenter whose player covers the most of the screen, so never a preloaded neighbour. Main thread. */
    static Object onScreen() {
        Object best = null;
        int bestArea = 0;
        Rect visible = new Rect();
        for (Map.Entry<View, WeakReference<Object>> entry : PRESENTERS.entrySet()) {
            View view = entry.getKey();
            Object presenter = entry.getValue().get();
            if (view == null || presenter == null || !view.isShown() || !view.getGlobalVisibleRect(visible)) continue;
            int area = visible.width() * visible.height();
            if (area > bestArea) {
                best = presenter;
                bestArea = area;
            }
        }
        return best;
    }
}
