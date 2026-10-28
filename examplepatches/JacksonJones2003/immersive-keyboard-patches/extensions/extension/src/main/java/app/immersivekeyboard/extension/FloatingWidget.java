package app.immersivekeyboard.extension;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;

import java.util.Map;
import java.util.WeakHashMap;

/**
 * Makes Gboard's floating keyboard switcher, shown while a hardware keyboard is in use, and
 * the menu it opens fit in the keyboard window.
 *
 * In the edge-to-edge mode the Immersive Keyboard patch turns on, the keyboard view fills the
 * screen and Gboard places popups relative to it. When a hardware keyboard hides that view,
 * the window shrinks to fit the switcher, which is still placed above where the keys were,
 * and the menu it opens is laid out for that small window and opens above it: out of sight,
 * cut short, or out of reach of touches.
 *
 * While the keyboard view is hidden, this gives the popup layer the full screen height, so
 * Gboard lays its menu out at full size above the switcher, and pins the switcher to the
 * bottom of the screen. Gboard still only accepts touches on its popups, so the app behind
 * stays usable.
 */
@SuppressWarnings("unused")
public final class FloatingWidget {
    private static final String INPUT_VIEW_CLASS = "InputView";
    private static final String SWITCHER_CLASS = "KeyboardViewHolder";
    private static final String MENU_CLASS = "PopupMenu";

    private static final Map<View, Boolean> WATCHED = new WeakHashMap<>();

    private FloatingWidget() {
    }

    /** Injection point. Called right after Gboard positions a floating popup's container. */
    public static void positioned(View container) {
        try {
            if (!(container.getParent() instanceof ViewGroup)) {
                return;
            }
            ViewGroup layer = (ViewGroup) container.getParent();
            watch(layer);
            update(layer);
        } catch (Throwable ignored) {
            // Never get in the way of the keyboard.
        }
    }

    private static void watch(ViewGroup layer) {
        if (WATCHED.containsKey(layer)) {
            return;
        }
        WATCHED.put(layer, Boolean.TRUE);
        layer.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
            @Override
            public boolean onPreDraw() {
                try {
                    // Skip a frame that would show the switcher in the wrong place.
                    return !update(layer);
                } catch (Throwable ignored) {
                    return true;
                }
            }
        });
    }

    /** Returns whether anything moved or changed size. */
    private static boolean update(ViewGroup layer) {
        boolean keyboardHidden = !inputViewShown(layer.getRootView());
        int wanted = keyboardHidden ? layer.getResources().getDisplayMetrics().heightPixels : 0;
        boolean changed = false;
        if (layer.getMinimumHeight() != wanted) {
            layer.setMinimumHeight(wanted);
            layer.requestLayout();
            changed = true;
        }
        if (!keyboardHidden || layer.getHeight() <= 0) {
            return changed;
        }
        float move = 0;
        for (int index = 0; index < layer.getChildCount(); index++) {
            View content = content(layer.getChildAt(index));
            if (content != null && content.getClass().getName().endsWith(SWITCHER_CLASS)
                    && content.getHeight() > 0) {
                View container = layer.getChildAt(index);
                move = layer.getHeight() - content.getHeight() - content.getTop()
                        - content.getTranslationY() - container.getY();
                break;
            }
        }
        if (Math.abs(move) <= 0.5f) {
            return changed;
        }
        // Move the switcher and the pieces Gboard placed along with it; menus are placed
        // relative to the switcher once it has moved, so they stay where they are.
        for (int index = 0; index < layer.getChildCount(); index++) {
            View container = layer.getChildAt(index);
            View content = content(container);
            if (content != null && !content.getClass().getName().contains(MENU_CLASS)) {
                container.setY(container.getY() + move);
            }
        }
        return true;
    }

    private static View content(View container) {
        return container instanceof ViewGroup && ((ViewGroup) container).getChildCount() > 0
                ? ((ViewGroup) container).getChildAt(0) : null;
    }

    /** Whether the on-screen keyboard is showing in the window that holds this view. */
    static boolean inputViewShown(View view) {
        View inputView = find(view);
        return inputView != null && inputView.isShown() && inputView.getHeight() > 0;
    }

    private static View find(View view) {
        if (view.getClass().getName().endsWith("." + INPUT_VIEW_CLASS)) {
            return view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                View found = find(group.getChildAt(index));
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }
}
