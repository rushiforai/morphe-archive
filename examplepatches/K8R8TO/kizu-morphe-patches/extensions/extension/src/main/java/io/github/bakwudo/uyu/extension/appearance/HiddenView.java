package io.github.bakwudo.uyu.extension.appearance;

import android.view.View;
import android.view.ViewTreeObserver;

import java.util.Map;
import java.util.WeakHashMap;

/**
 * Keeps one of Twitch's views hidden while a condition holds. Twitch shows and hides its views
 * from many places, so the condition is checked right before every frame is drawn instead of
 * hooking each of them. A view that Twitch shows is hidden again before the frame is drawn, so
 * it never flashes.
 */
final class HiddenView implements ViewTreeObserver.OnPreDrawListener, View.OnAttachStateChangeListener {
    interface Condition {
        boolean shouldHide(View view);
    }

    /** Views that already have a HiddenView. Only touched on the main thread. */
    private static final Map<View, Boolean> HANDLED = new WeakHashMap<>();

    private final View view;
    private final Condition condition;
    /**
     * Whether the view is shown again when the condition stops holding. Only for views whose
     * visibility Twitch does not manage itself; otherwise Twitch's next update shows them.
     */
    private final boolean restore;
    private boolean hiddenByUs;
    private ViewTreeObserver observer;

    private HiddenView(View view, Condition condition, boolean restore) {
        this.view = view;
        this.condition = condition;
        this.restore = restore;
    }

    static void attach(View view, Condition condition, boolean restore) {
        if (HANDLED.put(view, Boolean.TRUE) != null) return;

        HiddenView hiddenView = new HiddenView(view, condition, restore);
        view.addOnAttachStateChangeListener(hiddenView);
        if (view.isAttachedToWindow()) hiddenView.onViewAttachedToWindow(view);
    }

    @Override
    public void onViewAttachedToWindow(View attached) {
        // Registered with the window only while attached, so views of a closed screen do
        // not stay registered.
        observer = view.getViewTreeObserver();
        observer.addOnPreDrawListener(this);
    }

    @Override
    public void onViewDetachedFromWindow(View detached) {
        if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
        observer = null;
    }

    @Override
    public boolean onPreDraw() {
        // Returning false skips this frame; the next one is drawn with the new visibility.
        return !update();
    }

    /**
     * @return Whether the visibility changed.
     */
    private boolean update() {
        if (condition.shouldHide(view)) {
            if (view.getVisibility() == View.GONE) return false;
            view.setVisibility(View.GONE);
            hiddenByUs = true;
            return true;
        }

        if (!hiddenByUs) return false;
        hiddenByUs = false;
        if (!restore || view.getVisibility() != View.GONE) return false;
        view.setVisibility(View.VISIBLE);
        return true;
    }
}
