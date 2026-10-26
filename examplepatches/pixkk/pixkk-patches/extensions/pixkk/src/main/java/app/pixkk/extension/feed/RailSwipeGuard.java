/*
 * Copyright 2026 pixkk
 */
package app.pixkk.extension.feed;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.Window;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Proxy;
import java.util.Map;
import java.util.WeakHashMap;

import app.pixkk.extension.core.Logger;
import app.pixkk.extension.core.Settings;

/**
 * Lets a swipe that starts on one of the buttons down the right of a video scroll to the next
 * one, instead of pressing the button when the finger comes up.
 *
 * <p>A press that lands on a button's slot is held back. Once the finger has moved up or down
 * further than a tap may, the press is sent on beside the column instead, from where it began,
 * so the feed takes it as it would a swipe anywhere else. A tap, a long press or a sideways
 * move sends the press on to the button as it came.
 *
 * <p>Ids are 47.4.3's, as in {@link RailSpacing}.
 */
public final class RailSwipeGuard {
    private static final int COLUMN_ID = 0x7f0a3e46;
    private static final int SLOT_ID = 0x7f0a1ab2;
    private static final int MAX_DEPTH = 40;

    private static final Map<Window, Boolean> WRAPPED = new WeakHashMap<>();

    private RailSwipeGuard() {
    }

    /** Called from the patched {@code MainActivity.onCreate} and {@code DetailActivity.onCreate}. */
    public static void install(Activity activity) {
        if (activity == null) return;
        try {
            Window window = activity.getWindow();
            if (window == null || WRAPPED.containsKey(window)) return;
            Window.Callback inner = window.getCallback();
            if (inner == null) return;
            window.setCallback(wrap(activity, inner));
            WRAPPED.put(window, Boolean.TRUE);
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not set up swiping over the right column", ex);
        }
    }

    private static Window.Callback wrap(Activity activity, Window.Callback inner) {
        Guard guard = new Guard(activity);
        InvocationHandler handler = (proxy, method, args) -> {
            try {
                if (args != null && args.length == 1 && args[0] instanceof MotionEvent
                        && "dispatchTouchEvent".equals(method.getName())) {
                    return guard.dispatch(inner, (MotionEvent) args[0]);
                }
                return method.invoke(inner, args);
            } catch (InvocationTargetException ex) {
                throw ex.getCause() != null ? ex.getCause() : ex;
            }
        };
        return (Window.Callback) Proxy.newProxyInstance(Window.Callback.class.getClassLoader(),
                new Class<?>[]{Window.Callback.class}, handler);
    }

    /** One window's press in progress. Touch events arrive on the main thread, one at a time. */
    private static final class Guard {
        private final Activity activity;
        private final Handler handler = new Handler(Looper.getMainLooper());
        private Window.Callback inner;
        /** The press on a button, held back until it is clear whether it is a tap or a swipe. */
        private MotionEvent held;
        private final Runnable flush = this::sendHeld;
        private float downX, downY;
        /** Set once the gesture was moved off the column: how far left every event is shifted. */
        private boolean shifting;
        private float shiftX;

        Guard(Activity activity) {
            this.activity = activity;
        }

        /**
         * Passes an event on to the window. A press on a button that turns into a vertical swipe
         * is cancelled, and the swipe is started again beside the column, so the feed takes it.
         */
        boolean dispatch(Window.Callback inner, MotionEvent event) {
            try {
                this.inner = inner;
                int action = event.getActionMasked();                if (action == MotionEvent.ACTION_DOWN) {
                    shifting = false;
                    dropHeld();
                    View hit = Settings.RAIL_SWIPE_PASSTHROUGH.get() ? slotAt(event) : null;
                    if (hit != null) {
                        held = MotionEvent.obtain(event);
                        downX = event.getX();
                        downY = event.getY();
                        handler.postDelayed(flush, ViewConfiguration.getLongPressTimeout());
                        return true;
                    }
                } else if (held != null) {
                    if (action == MotionEvent.ACTION_MOVE) {
                        float dx = event.getX() - downX;
                        float dy = event.getY() - downY;
                        int slop = ViewConfiguration.get(activity).getScaledTouchSlop();
                        if (Math.abs(dy) > slop && Math.abs(dy) > Math.abs(dx)) {
                            // A swipe: the feed gets the press beside the column, from where it began.
                            handler.removeCallbacks(flush);
                            shiftX = activity.getWindow().getDecorView().getWidth() / 2f - downX;
                            held.offsetLocation(shiftX, 0);
                            shifting = true;
                            sendHeld();
                        } else if (Math.abs(dx) > slop) {
                            flush.run();
                        } else {
                            return true;
                        }
                    } else if (action == MotionEvent.ACTION_CANCEL) {
                        dropHeld();
                    } else {
                        flush.run();
                    }
                }
                if (shifting) {
                    event.offsetLocation(shiftX, 0);
                    if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                        shifting = false;
                    }
                }
            } catch (Throwable ex) {
                dropHeld();
                shifting = false;
                Logger.printException(() -> "Could not hand a swipe on the right column to the feed", ex);
            }
            return inner.dispatchTouchEvent(event);
        }

        /** Sends the held press on to the window, as it came. */
        private void sendHeld() {
            MotionEvent down = held;
            held = null;
            handler.removeCallbacks(flush);
            if (down == null) return;
            if (inner != null) inner.dispatchTouchEvent(down);
            down.recycle();
        }

        private void dropHeld() {
            handler.removeCallbacks(flush);
            if (held != null) held.recycle();
            held = null;
        }

        private View slotAt(MotionEvent event) {
            return slotIn(activity.getWindow().getDecorView(), event, 0);
        }

        /** The feed keeps the neighbouring videos' columns too, so every column is tried. */
        private View slotIn(View view, MotionEvent event, int depth) {
            if (view.getVisibility() != View.VISIBLE || depth > MAX_DEPTH) return null;
            if (!(view instanceof ViewGroup)) return null;
            ViewGroup group = (ViewGroup) view;
            boolean column = view.getId() == COLUMN_ID;
            int[] at = new int[2];
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                if (column) {
                    if (child.getId() != SLOT_ID || child.getVisibility() != View.VISIBLE) continue;
                    child.getLocationOnScreen(at);
                    if (event.getRawX() >= at[0] && event.getRawX() < at[0] + child.getWidth()
                            && event.getRawY() >= at[1] && event.getRawY() < at[1] + child.getHeight()) {
                        return child;
                    }
                } else {
                    View found = slotIn(child, event, depth + 1);
                    if (found != null) return found;
                }
            }
            return null;
        }
    }
}
