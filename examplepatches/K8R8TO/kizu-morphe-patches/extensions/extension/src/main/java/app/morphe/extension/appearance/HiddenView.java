package app.morphe.extension.appearance;

import android.view.View;
import android.view.ViewTreeObserver;

import java.util.Map;
import java.util.WeakHashMap;

final class HiddenView implements ViewTreeObserver.OnPreDrawListener, View.OnAttachStateChangeListener {
    interface Condition {
        boolean shouldHide(View view);
    }

    private static final Map<View, Boolean> HANDLED = new WeakHashMap<>();
    private final View view;
    private final Condition condition;
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
        return !update();
    }

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
