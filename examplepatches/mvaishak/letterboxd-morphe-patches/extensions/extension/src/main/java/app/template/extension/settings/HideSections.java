package app.template.extension.settings;

import android.view.View;
import android.view.ViewTreeObserver;
import android.view.ViewGroup;

import androidx.fragment.app.Fragment;
import app.template.extension.watch.RatingsRow;

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
     * view {@code GONE} first, then a coroutine updates its visibility asynchronously.
     * Keep the injected external ratings row visible by hiding only the two stock children.
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
                    refreshWhereToWatch(view);
                }
            };
            view.getViewTreeObserver().addOnGlobalLayoutListener(self[0]);
            self[0].onGlobalLayout();
        } catch (Throwable ignored) {
        }
    }

    public static void refreshWhereToWatch(View view) {
        if (!Prefs.hideWhereToWatch() || !(view instanceof ViewGroup)) return;
        ViewGroup root = (ViewGroup) view;
        if (root.getChildCount() < 2) return;
        root.getChildAt(0).setVisibility(View.GONE);
        root.getChildAt(1).setVisibility(View.GONE);
        boolean hasRatings = root.findViewWithTag(RatingsRow.TAG) != null;
        view.setVisibility(hasRatings ? View.VISIBLE : View.GONE);
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
