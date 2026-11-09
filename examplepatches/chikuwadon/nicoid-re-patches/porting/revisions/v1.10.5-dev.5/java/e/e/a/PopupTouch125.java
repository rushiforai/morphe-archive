package e.e.a;

import android.app.Service;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewConfiguration;
import android.widget.Button;
import android.widget.SeekBar;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.WeakHashMap;

/**
 * The root popup touch bridge is authoritative for non-control video taps.
 * Motion is routed to the existing native popup drag listener. The video
 * control's single-tap toggle fires only after a confirmed ACTION_UP.
 * Buttons, seekbars, edge resizing and popup hold-speed run on their
 * existing paths and are never artificially delayed.
 */
public final class PopupTouch125 {
    private static final WeakHashMap<Object, PopupTouchPolicy125.State> STATES = new WeakHashMap<>();
    private PopupTouch125() {}

    private static PopupTouchPolicy125.State state(Object owner) {
        PopupTouchPolicy125.State s = STATES.get(owner);
        if (s == null) {
            s = new PopupTouchPolicy125.State();
            STATES.put(owner, s);
        }
        return s;
    }

    private static Object video(Object owner) throws Exception {
        return owner.getClass().getField("e").get(owner);
    }

    private static Object controls(Object player) throws Exception {
        return player.getClass().getMethod("getVideoControls").invoke(player);
    }

    private static boolean controlsVisible(Object controls) {
        // The ExoMedia controls are Android Views. View does not expose an
        // isVisible() method; an attempted reflective lookup used to abort
        // the entire popup gesture bridge before it could see two taps.
        if (controls instanceof View) return ((View) controls).isShown();
        if (controls == null) return false;
        try {
            Object value = controls.getClass().getMethod("getVisibility").invoke(controls);
            return value instanceof Number && ((Number) value).intValue() == View.VISIBLE;
        } catch (Exception ignored) {
            return false;
        }
    }

    private static boolean hit(View view, float x, float y) {
        if (!view.isShown() || view.getWidth() <= 0 || view.getHeight() <= 0) return false;
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        return x >= at[0] && y >= at[1]
                && x <= at[0] + view.getWidth()
                && y <= at[1] + view.getHeight();
    }

    private static boolean interactiveHit(View view, View player, float x, float y) {
        if (!hit(view, x, y)) return false;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = group.getChildCount() - 1; i >= 0; i--) {
                if (interactiveHit(group.getChildAt(i), player, x, y)) return true;
            }
        }
        return view != player && (view instanceof SeekBar || view instanceof Button
                || view.hasOnClickListeners());
    }

    private static void forward(Object owner, View root, MotionEvent event) {
        ((View.OnTouchListener) owner).onTouch(root, event);
    }

    private static void toggle(Object player, Object controls, boolean startedVisible) {
        try {
            if (startedVisible) {
                controls.getClass().getMethod("hide").invoke(controls);
            } else {
                player.getClass().getMethod("showControls").invoke(player);
            }
        } catch (Exception ignored) {
            // Never synthesize click events: these can trigger unrelated buttons.
        }
    }

    /**
     * Run after edge and long-press-speed handlers, before child dispatch.
     * Returns true only for a stream taken over on the video surface.
     */
    public static boolean dispatch(View root, Object owner, MotionEvent event) {
        if (!(owner instanceof Service) || root == null || event == null) return false;
        int action = event.getActionMasked();
        PopupTouchPolicy125.State state = state(owner);
        if (action == MotionEvent.ACTION_POINTER_DOWN ||
                action == MotionEvent.ACTION_CANCEL ||
                action == MotionEvent.ACTION_POINTER_UP) {
            if (action != MotionEvent.ACTION_POINTER_UP) state.cancel();
            if (state.routing() && action == MotionEvent.ACTION_CANCEL) {
                forward(owner, root, event);
                state.reset();
                return true;
            }
            return false;
        }
        if (action == MotionEvent.ACTION_DOWN) {
            // Gesture routing must not depend on optional player control APIs.
            // Keep handling the popup surface even if a controls implementation
            // differs across Android/ExoMedia versions.
            if (!hit(root, event.getRawX(), event.getRawY())) return false;
            Object player = root;
            try {
                Object candidate = video(owner);
                if (candidate instanceof View) player = candidate;
            } catch (Exception ignored) { }
            Object controls = null;
            boolean visible = false;
            try {
                controls = controls(player);
                visible = controlsVisible(controls);
            } catch (Exception ignored) { }
            boolean interactive = visible &&
                    interactiveHit(root, (View) player, event.getRawX(), event.getRawY());
            ViewConfiguration config = ViewConfiguration.get(root.getContext());
            boolean routed = state.begin(event.getEventTime(), event.getRawX(), event.getRawY(),
                    visible, interactive, config.getScaledDoubleTapSlop(),
                    ViewConfiguration.getDoubleTapTimeout());
            if (!routed) return false;
            forward(owner, root, event);
            return true;
        }
        if (!state.routing()) return false;
        if (action == MotionEvent.ACTION_MOVE) {
            state.move(event.getRawX(), event.getRawY(),
                    ViewConfiguration.get(root.getContext()).getScaledTouchSlop());
            forward(owner, root, event);
            return true;
        }
        if (action == MotionEvent.ACTION_UP) {
            // MOVE events can be coalesced; the final coordinate must also obey touch slop.
            state.move(event.getRawX(), event.getRawY(),
                    ViewConfiguration.get(root.getContext()).getScaledTouchSlop());
            forward(owner, root, event);
            boolean wasVisible = state.startedVisible();
            int result = state.end(event.getEventTime(), ViewConfiguration.getLongPressTimeout());
            if (result == PopupTouchPolicy125.SINGLE_TAP) {
                try {
                    Object player = video(owner);
                    Object controls = controls(player);
                    if (controls != null) toggle(player, controls, wasVisible);
                } catch (Exception ignored) { }
            } else if (result == PopupTouchPolicy125.DOUBLE_TAP) {
                android.util.Log.i("nicoid-popup", "Confirmed popup double tap on finger release");
                // The legacy close-vs-seek selection is unchanged.
                boolean seekMode = android.preference.PreferenceManager
                        .getDefaultSharedPreferences((Service) owner)
                        .getBoolean("popup_double_tap_seek", false);
                if (seekMode) {
                    // PopupGestures is part of the existing helper DEX, not the
                    // separately compiled development Java source set.
                    // Never fall back to close when seek mode is enabled.
                    try {
                        Class<?> gestures = Class.forName("e.e.a.PopupGestures");
                        gestures.getMethod("doubleTap", Object.class, MotionEvent.class)
                                .invoke(null, owner, event);
                    } catch (Exception problem) {
                        android.util.Log.w("nicoid-popup", "Popup double-tap seek unavailable");
                    }
                } else {
                    ((Service) owner).stopSelf();
                }
            }
            return true;
        }
        return false;
    }

    /** GestureDetector invokes this on second DOWN; do not close until second UP. */
    public static boolean doubleTap(Object owner, MotionEvent event) {
        if (owner != null && event != null) state(owner).markDoubleTap();
        return true;
    }

    /** The native window drag path must run after movement crosses touch slop. */
    public static boolean dragging(Object owner) {
        PopupTouchPolicy125.State s = STATES.get(owner);
        return s != null && s.dragging();
    }

    /** Called when an edge-resize, long hold or pinch consumes the stream. */
    public static void cancel(Object owner) {
        PopupTouchPolicy125.State s = STATES.get(owner);
        if (s != null) s.cancel();
    }
}
