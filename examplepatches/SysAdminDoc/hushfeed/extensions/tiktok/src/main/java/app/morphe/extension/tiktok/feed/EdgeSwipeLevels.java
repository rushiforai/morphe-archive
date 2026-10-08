/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.feed;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.media.AudioManager;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.TextView;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.tiktok.settings.L10n;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.settings.preference.SettingsUi;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Proxy;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Swipe for brightness and volume. A vertical drag that starts inside a thin strip along the left
 * edge of a feed window changes that window's brightness, and one along the right edge changes
 * the music volume, each with a small level on screen.
 *
 * <p>It rides the window's own touch dispatch, which {@link VideoOverlayHider} already follows to
 * the main feed and to a video opened from a profile, so it needs no bytecode of its own. The
 * window's {@link Window.Callback} is wrapped once. Only a drag that starts in a strip and goes
 * mostly vertical is taken; the first event over the touch slop sends the views below a cancel,
 * so the feed pager never starts paging. A tap, a horizontal move, a second finger or anything
 * that starts outside the strips passes through untouched.
 *
 * <p>Brightness is the activity window's own {@code screenBrightness}, which needs no permission
 * and goes back to the system's (-1) when the window pauses or the switch goes off.
 */
public final class EdgeSwipeLevels {
    /** A drag this share of the window's height spans the whole range. */
    static final float RANGE_OF_HEIGHT = 0.75f;
    /** Zero would switch some screens off. */
    static final float MIN_BRIGHTNESS = 0.01f;
    static final float SYSTEM_BRIGHTNESS = WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_NONE;
    private static final long LEVEL_SHOWN_MS = 900L;
    private static final String TAG = "hushfeed_swipe_level";

    /** The strip a press lands in, which says what the drag will change. */
    enum Side { NONE, BRIGHTNESS, VOLUME }

    private static final Map<Window, Boolean> WRAPPED = new WeakHashMap<>();
    private static final Map<Window, Boolean> DIMMED = new WeakHashMap<>();
    private static final Map<View, Runnable> HIDERS = new WeakHashMap<>();

    private EdgeSwipeLevels() {
    }

    /** Whether the feature is on and its host patch is in this bundle. */
    static boolean enabled() {
        return SettingsStatus.videoOverlaysEnabled && Settings.SWIPE_LEVELS.get();
    }

    /** Strip width in whole pixels, from the setting's percent of the window width. */
    static int stripWidth(int windowWidth, int percent) {
        int clamped = Math.max(5, Math.min(30, percent));
        return windowWidth * clamped / 100;
    }

    /** Which strip, if any, a press at {@code x} lands in. */
    static Side sideAt(float x, int windowWidth, int percent) {
        if (windowWidth <= 0) return Side.NONE;
        int strip = stripWidth(windowWidth, percent);
        if (strip <= 0) return Side.NONE;
        if (x < strip) return Side.BRIGHTNESS;
        if (x >= windowWidth - strip) return Side.VOLUME;
        return Side.NONE;
    }

    /** True once a move is far enough, and mostly enough up or down, to be this gesture. */
    static boolean isVerticalDrag(float dx, float dy, int slop) {
        return Math.abs(dy) > slop && Math.abs(dy) > 2f * Math.abs(dx);
    }

    /** True once a move has gone sideways instead: the gesture is someone else's. */
    static boolean isHorizontalMove(float dx, float dy, int slop) {
        return Math.abs(dx) > slop && Math.abs(dx) >= Math.abs(dy);
    }

    /** The level after a drag from {@code startY} to {@code y}, up raising it, kept in [min, 1]. */
    static float levelAfter(float startLevel, float startY, float y, int windowHeight, float min) {
        if (windowHeight <= 0) return clamp(startLevel, min);
        float travel = (startY - y) / (windowHeight * RANGE_OF_HEIGHT);
        return clamp(startLevel + travel, min);
    }

    /** Whole steps of a stream of {@code max} for a 0 to 1 level. */
    static int volumeStep(float level, int max) {
        return Math.max(0, Math.min(max, Math.round(clamp(level, 0f) * max)));
    }

    private static float clamp(float level, float min) {
        return Math.max(min, Math.min(1f, level));
    }

    /**
     * Wraps {@code activity}'s window touch dispatch if the switch is on, and puts its brightness
     * back if it is not. Safe to call on every layout pass.
     */
    static void sync(Activity activity) {
        if (activity == null) return;
        try {
            Window window = activity.getWindow();
            if (window == null) return;
            if (!enabled()) {
                releaseBrightness(window);
                return;
            }
            if (WRAPPED.containsKey(window)) return;
            Window.Callback inner = window.getCallback();
            if (inner == null) return;
            window.setCallback(wrap(activity, inner));
            WRAPPED.put(window, Boolean.TRUE);
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not set up swipe for brightness and volume", ex);
        }
    }

    /** Gives the window back the system's brightness, if this class changed it. */
    static void releaseBrightness(Window window) {
        if (window == null || !DIMMED.containsKey(window)) return;
        DIMMED.remove(window);
        WindowManager.LayoutParams params = window.getAttributes();
        params.screenBrightness = SYSTEM_BRIGHTNESS;
        window.setAttributes(params);
    }

    /** Called as a feed window pauses. */
    static void onPaused(Activity activity) {
        if (activity != null) releaseBrightness(activity.getWindow());
    }

    /** Whether {@code window} currently carries a brightness this class set. */
    static boolean holdsBrightness(Window window) {
        return DIMMED.containsKey(window);
    }

    private static Window.Callback wrap(Activity activity, Window.Callback inner) {
        Gesture gesture = new Gesture(activity);
        InvocationHandler handler = (proxy, method, args) -> {
            try {
                if (args != null && args.length == 1 && args[0] instanceof MotionEvent
                        && "dispatchTouchEvent".equals(method.getName())) {
                    return gesture.dispatch((MotionEvent) args[0], inner);
                }
                return method.invoke(inner, args);
            } catch (InvocationTargetException ex) {
                throw ex.getCause() != null ? ex.getCause() : ex;
            }
        };
        return (Window.Callback) Proxy.newProxyInstance(Window.Callback.class.getClassLoader(),
                new Class<?>[]{Window.Callback.class}, handler);
    }

    /** One window's drag in progress. Touch events arrive on the main thread, one at a time. */
    static final class Gesture {
        private enum State { IDLE, WATCHING, TAKEN, PASSING }

        private final Activity activity;
        private State state = State.IDLE;
        private Side side = Side.NONE;
        private float downX, downY, startY, startLevel;

        Gesture(Activity activity) {
            this.activity = activity;
        }

        /** True when the drag was taken (the event is consumed here). */
        boolean taken() {
            return state == State.TAKEN;
        }

        boolean dispatch(MotionEvent event, Window.Callback inner) {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    state = State.IDLE;
                    side = Side.NONE;
                    if (enabled()) {
                        side = sideAt(event.getX(), windowWidth(), Settings.SWIPE_LEVELS_STRIP_PERCENT.get());
                        if (side != Side.NONE) {
                            state = State.WATCHING;
                            downX = event.getX();
                            downY = event.getY();
                        }
                    }
                    return inner.dispatchTouchEvent(event);
                case MotionEvent.ACTION_POINTER_DOWN:
                    if (state == State.WATCHING) state = State.PASSING;
                    return state == State.TAKEN || inner.dispatchTouchEvent(event);
                case MotionEvent.ACTION_MOVE:
                    if (state == State.WATCHING) {
                        float dx = event.getX() - downX;
                        float dy = event.getY() - downY;
                        int slop = ViewConfiguration.get(activity).getScaledTouchSlop();
                        if (!enabled() || isHorizontalMove(dx, dy, slop)) {
                            state = State.PASSING;
                        } else if (isVerticalDrag(dx, dy, slop) && begin(event)) {
                            MotionEvent cancel = MotionEvent.obtain(event);
                            cancel.setAction(MotionEvent.ACTION_CANCEL);
                            try {
                                inner.dispatchTouchEvent(cancel);
                            } finally {
                                cancel.recycle();
                            }
                            return true;
                        }
                    }
                    if (state == State.TAKEN) {
                        move(event);
                        return true;
                    }
                    return inner.dispatchTouchEvent(event);
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    boolean wasTaken = state == State.TAKEN;
                    state = State.IDLE;
                    side = Side.NONE;
                    return wasTaken || inner.dispatchTouchEvent(event);
                default:
                    return state == State.TAKEN || inner.dispatchTouchEvent(event);
            }
        }

        private int windowWidth() {
            View decor = activity.getWindow().getDecorView();
            return decor.getWidth() > 0 ? decor.getWidth()
                    : activity.getResources().getDisplayMetrics().widthPixels;
        }

        private int windowHeight() {
            View decor = activity.getWindow().getDecorView();
            return decor.getHeight() > 0 ? decor.getHeight()
                    : activity.getResources().getDisplayMetrics().heightPixels;
        }

        /** Takes the drag, reading the level it starts from. False leaves the gesture alone. */
        private boolean begin(MotionEvent event) {
            float level = side == Side.BRIGHTNESS ? currentBrightness(activity) : currentVolume(activity);
            if (level < 0f) {
                state = State.PASSING;
                return false;
            }
            startLevel = level;
            startY = event.getY();
            state = State.TAKEN;
            return true;
        }

        private void move(MotionEvent event) {
            if (side == Side.BRIGHTNESS) {
                float level = levelAfter(startLevel, startY, event.getY(), windowHeight(), MIN_BRIGHTNESS);
                setBrightness(activity.getWindow(), level);
                show(activity, L10n.t(activity, "Brightness"), level);
            } else {
                float level = levelAfter(startLevel, startY, event.getY(), windowHeight(), 0f);
                AudioManager audio = (AudioManager) activity.getSystemService(Context.AUDIO_SERVICE);
                if (audio != null) {
                    audio.setStreamVolume(AudioManager.STREAM_MUSIC,
                            volumeStep(level, audio.getStreamMaxVolume(AudioManager.STREAM_MUSIC)), 0);
                }
                show(activity, L10n.t(activity, "Volume"), level);
            }
        }
    }

    /** The window's brightness as 0 to 1, from its own setting or else the system's. */
    static float currentBrightness(Activity activity) {
        float own = activity.getWindow().getAttributes().screenBrightness;
        if (own >= 0f) return own;
        int system = android.provider.Settings.System.getInt(activity.getContentResolver(),
                android.provider.Settings.System.SCREEN_BRIGHTNESS, 128);
        return Math.max(MIN_BRIGHTNESS, system / 255f);
    }

    /** The music volume as 0 to 1, or -1 when there is no audio service. */
    static float currentVolume(Activity activity) {
        AudioManager audio = (AudioManager) activity.getSystemService(Context.AUDIO_SERVICE);
        if (audio == null) return -1f;
        int max = audio.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
        return max <= 0 ? -1f : audio.getStreamVolume(AudioManager.STREAM_MUSIC) / (float) max;
    }

    static void setBrightness(Window window, float level) {
        WindowManager.LayoutParams params = window.getAttributes();
        params.screenBrightness = clamp(level, MIN_BRIGHTNESS);
        window.setAttributes(params);
        DIMMED.put(window, Boolean.TRUE);
    }

    /**
     * The one level label per window, drawn over the content and taken away shortly after.
     * {@code label} arrives already translated.
     */
    private static void show(Activity activity, String label, float level) {
        try {
            ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
            TextView view = decor.findViewWithTag(TAG);
            if (view == null) {
                view = new TextView(activity);
                view.setTag(TAG);
                view.setTextColor(Color.WHITE);
                view.setTextSize(16f);
                float density = activity.getResources().getDisplayMetrics().density;
                int pad = Math.round(12 * density);
                view.setPadding(pad * 2, pad, pad * 2, pad);
                GradientDrawable background = new GradientDrawable();
                background.setColor(0xCC000000);
                background.setCornerRadius(SettingsUi.dp(activity, SettingsUi.RADIUS_OVERLAY));
                view.setBackground(background);
                view.setClickable(false);
                view.setFocusable(false);
                FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                        Gravity.CENTER_HORIZONTAL | Gravity.TOP);
                params.topMargin = Math.round(96 * density);
                decor.addView(view, params);
            }
            view.setText(label + " " + Math.round(level * 100) + "%");
            view.setVisibility(View.VISIBLE);
            TextView shown = view;
            Runnable earlier = HIDERS.get(shown);
            if (earlier != null) shown.removeCallbacks(earlier);
            Runnable hide = () -> shown.setVisibility(View.GONE);
            HIDERS.put(shown, hide);
            shown.postDelayed(hide, LEVEL_SHOWN_MS);
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not show the swipe level", ex);
        }
    }
}
