package app.afterglow.extension.navigation;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;

import java.util.Map;
import java.util.WeakHashMap;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.settings.AfterglowPrefs;

/** Reversible native feed, search and related-video chip rows. */
public final class Subbar {
    private static final Map<View, Boolean> BOUND = new WeakHashMap<>();
    private static final Map<View, Boolean> COLLAPSED = new WeakHashMap<>();

    private Subbar() {}

    public static boolean hidden() { return Gate.on(Gate.NAVIGATION_BAR, "noSubbar"); }

    /** A collapsed AppBar row can receive a reveal request while already at full native height. */
    public static int animationStart(int requested, int end, View target) {
        try {
            if (target == null || !COLLAPSED.containsKey(target) || !hidden()) return requested;
            ViewGroup.LayoutParams params = target.getLayoutParams();
            return params == null ? requested : SubbarAnimation.start(requested, end, params.height, true);
        } catch (Throwable error) {
            Afterglow.error("Subbar.animationStart", error);
            return requested;
        }
    }

    /** Called only at fingerprinted chip RecyclerView construction/lookup sites. */
    public static void bind(View view) {
        if (view == null || !Gate.installed(Gate.NAVIGATION_BAR) || BOUND.containsKey(view)) return;
        BOUND.put(view, true);
        Binding binding = new Binding(view);
        view.addOnAttachStateChangeListener(binding);
        if (view.isAttachedToWindow()) binding.onViewAttachedToWindow(view);
    }

    private static final class Binding implements View.OnAttachStateChangeListener,
            ViewTreeObserver.OnPreDrawListener {
        final View view;
        final SubbarMargin margin = new SubbarMargin();
        View target;
        ViewTreeObserver observer;
        long revision = -1;
        boolean requested, hidden, focusable;
        int accessibility;
        float nativeTranslation, appliedTranslation;

        Binding(View view) { this.view = view; }

        @Override public void onViewAttachedToWindow(View v) {
            if (observer != null) return;
            // Native constructors have not added their RecyclerView yet. Resolve
            // its actual container only after attachment. Include the separator
            // and feed overlay so a hidden row leaves no strip or empty space.
            target = view;
            ViewParent parent = view.getParent();
            for (int depth = 0; depth < 6 && parent instanceof View; depth++) {
                View candidate = (View) parent;
                int id = candidate.getId();
                if (id != View.NO_ID) {
                    String name;
                    try { name = candidate.getResources().getResourceEntryName(id); }
                    catch (android.content.res.Resources.NotFoundException ignored) { name = ""; }
                    if ("filter_bar".equals(name) || "chip_bar_container".equals(name)
                            || "related_chip_cloud_container".equals(name)) target = candidate;
                }
                parent = candidate.getParent();
            }
            observer = target.getViewTreeObserver();
            observer.addOnPreDrawListener(this);
        }

        @Override public void onViewDetachedFromWindow(View v) {
            if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
            observer = null;
            if (target != null) {
                apply(false);
                COLLAPSED.remove(target);
            }
            target = null;
        }

        /** Returns false only when another layout is needed before drawing. */
        @Override public boolean onPreDraw() {
            try {
                long current = AfterglowPrefs.revision();
                if (revision != current) {
                    requested = Subbar.hidden();
                    revision = current;
                }
                return !apply(requested);
            } catch (Throwable error) {
                if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
                observer = null;
                try { apply(false); } catch (Throwable ignored) { }
                COLLAPSED.remove(target);
                Afterglow.error("Subbar", error);
                return true;
            }
        }

        private boolean apply(boolean hide) {
            ViewGroup.LayoutParams layout = target.getLayoutParams();
            if (!(layout instanceof ViewGroup.MarginLayoutParams)) return false;
            ViewGroup.MarginLayoutParams params = (ViewGroup.MarginLayoutParams) layout;
            hide &= target.getVisibility() == View.VISIBLE;
            // Native search/feed animations validate their requested height.
            // Preserve it, and cancel only the space occupied in the parent.
            int next = margin.apply(params.bottomMargin, target.getMeasuredHeight(), hide);
            boolean changed = params.bottomMargin != next;
            if (changed) {
                params.bottomMargin = next;
                target.setLayoutParams(params);
            }
            if (hide) {
                COLLAPSED.put(target, true);
                if (!hidden) {
                    nativeTranslation = target.getTranslationY();
                    accessibility = target.getImportantForAccessibility();
                    focusable = target.isFocusable();
                    target.clearFocus();
                } else if (target.getTranslationY() != appliedTranslation) {
                    nativeTranslation = target.getTranslationY();
                }
                appliedTranslation = nativeTranslation - Math.max(16384f, target.getRootView().getHeight() * 4f);
                if (target.getTranslationY() != appliedTranslation) target.setTranslationY(appliedTranslation);
                target.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
                target.setFocusable(false);
            } else if (hidden) {
                COLLAPSED.remove(target);
                if (target.getTranslationY() == appliedTranslation) target.setTranslationY(nativeTranslation);
                target.setImportantForAccessibility(accessibility);
                target.setFocusable(focusable);
            }
            hidden = hide;
            // Native visibility, adapters and animation dimensions stay intact.
            return changed;
        }
    }
}
