package app.template.extension.settings;

import android.view.View;
import android.view.ViewTreeObserver;

import androidx.fragment.app.Fragment;

import java.util.WeakHashMap;

/**
 * Static section hiding for "Mod settings" toggles that don't need "Hide ratings until watched"'s
 * per-visit reveal state — just keep a section's own root view {@code GONE} while its pref says
 * so. Fails open (never hides anything) on any error.
 */
public final class HideSections {

    private static final WeakHashMap<View, Boolean> ATTACHED = new WeakHashMap<>();

    private HideSections() {}

    /**
     * Injected at the top of {@code WhereToWatchFragment.onViewCreated}. That method sets its own
     * view {@code GONE} first, then a coroutine sets it back {@code VISIBLE} once availability
     * data loads asynchronously — a one-shot hide here would just get overwritten once that
     * finishes. A layout listener re-asserts {@code GONE} on every pass instead, the same
     * reactive shape "Hide ratings until watched" uses for the same reason.
     */
    public static void enforceWhereToWatch(final Fragment fragment) {
        try {
            final View view = fragment.getView();
            if (view == null || Boolean.TRUE.equals(ATTACHED.get(view))) return;
            ATTACHED.put(view, Boolean.TRUE);

            final ViewTreeObserver.OnGlobalLayoutListener[] self =
                    new ViewTreeObserver.OnGlobalLayoutListener[1];
            self[0] = new ViewTreeObserver.OnGlobalLayoutListener() {
                @Override
                public void onGlobalLayout() {
                    if (!Prefs.hideWhereToWatch()) {
                        detach(view, self[0]);
                        return;
                    }
                    if (view.getVisibility() != View.GONE) view.setVisibility(View.GONE);
                }
            };
            view.getViewTreeObserver().addOnGlobalLayoutListener(self[0]);
            self[0].onGlobalLayout();
        } catch (Throwable ignored) {
        }
    }

    private static void detach(View v, ViewTreeObserver.OnGlobalLayoutListener l) {
        try {
            ViewTreeObserver vto = v.getViewTreeObserver();
            if (vto.isAlive()) vto.removeOnGlobalLayoutListener(l);
        } catch (Throwable ignored) {
        }
        ATTACHED.remove(v);
    }
}
