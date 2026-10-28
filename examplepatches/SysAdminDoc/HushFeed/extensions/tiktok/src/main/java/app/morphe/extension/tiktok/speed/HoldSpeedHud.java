/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.speed;

import android.app.Activity;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import java.lang.ref.WeakReference;

/**
 * Slide to change the hold speed (#248). Holding a video plays it at the hold speed, as TikTok
 * does; with {@link Settings#HOLD_SPEED_SLIDE} on, a bubble shows that speed and sliding left or
 * right moves it a {@link PlaybackSpeedPatch#LIVE_STEP} at a time between
 * {@link PlaybackSpeedPatch#MIN_SPEED} and {@link PlaybackSpeedPatch#MAX_SPEED}.
 *
 * <p>The speed reaches the player through the gesture's own apply call, the one TikTok plays its
 * 2x with, so TikTok's speed state is left alone and letting go returns the video to the speed it
 * had, as it always does. TikTok's pull-down lock stays the only lock: the slid speed is what
 * {@link PlaybackSpeedPatch#holdSpeed} answers until the next hold or the next video, so a lock
 * keeps it, its toast names it, and Remember the last speed keeps it the way it keeps a locked 2x.
 * The finger is read from the gesture's own touch listener, which already has the move events
 * while the video is held; nothing here takes a touch from TikTok.
 *
 * <p>There is one bubble at most. A new hold, letting go, the video on screen changing, the window
 * losing focus (a pause, a dialog, the notification shade), Hushfeed Pause and the switch going off
 * each take it down, and a recreated activity drops it with its old views.
 */
public final class HoldSpeedHud {
    /** How far the finger moves sideways before the speed changes, and then how far per step, in dp. */
    static final float DEAD_ZONE_DP = 16f;
    static final float STEP_DP = 28f;

    private static WeakReference<Object> gesture = new WeakReference<>(null);
    private static WeakReference<Bubble> bubble = new WeakReference<>(null);
    private static boolean holding;
    private static float startSpeed = Float.NaN;
    private static float anchorX = Float.NaN;
    private static String heldVideo = "";
    /** The speed slid to in this hold, or NaN; read by the gesture's literals off the main thread too. */
    private static volatile float slidSpeed = Float.NaN;

    /** What the gesture component's apply call does, so a test can stand in for TikTok's. */
    public interface Applier {
        void apply(Object gesture, float speed);
    }

    /** Set by tests only. Unpatched, as in the tests, {@link #applyNative} does nothing. */
    public static volatile Applier applierForTests;

    private HoldSpeedHud() {}

    static boolean enabled() {
        return SettingsStatus.holdSpeedSlideEnabled && Settings.HOLD_SPEED_SLIDE.get() && !Setting.isPaused();
    }

    /** The speed slid to for this hold, or NaN when there is none or the switch is off. */
    static float slidSpeed() {
        float slid = slidSpeed;
        return Float.isNaN(slid) || !enabled() ? Float.NaN : slid;
    }

    /**
     * Replaced with a call to the gesture component's apply method, the (F)V call its press plays
     * the hold speed with.
     */
    public static void applyNative(Object gesture, float speed) { }

    /** Called from the gesture's press, past its "already held" guard, with the component. */
    public static void onHoldPress(Object component) {
        try {
            dismiss();
            slidSpeed = Float.NaN;
            holding = false;
            if (!enabled() || component == null) return;
            gesture = new WeakReference<>(component);
            startSpeed = PlaybackSpeedPatch.boostSpeed();
            anchorX = Float.NaN;
            heldVideo = PlaybackSpeedPatch.onScreenVideoId();
            holding = true;
            show(startSpeed);
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not start the hold speed bubble", ex);
        }
    }

    /**
     * Called with every event the gesture's touch listener gets. Only a move during a hold does
     * anything: the first one marks where the finger is, later ones step the speed by how far it
     * moved sideways from there. Up and cancel are left to the gesture's release.
     */
    public static void onHoldTouch(MotionEvent event) {
        if (!holding || event == null || event.getActionMasked() != MotionEvent.ACTION_MOVE) return;
        try {
            if (!enabled()) {
                end();
                return;
            }
            float x = event.getX();
            if (Float.isNaN(anchorX)) {
                anchorX = x;
                return;
            }
            Bubble shown = bubble.get();
            float density = shown != null ? shown.getResources().getDisplayMetrics().density : 1f;
            float target = speedFor(startSpeed, x - anchorX, density);
            if (Float.compare(target, current()) != 0) apply(target);
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not change the hold speed", ex);
            end();
        }
    }

    /** Called from the gesture's release, past its "not held" guard: the bubble goes. */
    public static void onHoldRelease() {
        holding = false;
        gesture.clear();
        dismiss();
    }

    /**
     * The on-screen tracker named another video: a slid speed was for the one before, and a hold
     * still going is over for this bubble.
     */
    static void onScreenVideo(String aid) {
        if (aid == null || aid.equals(heldVideo)) return;
        slidSpeed = Float.NaN;
        // Checked again on the main thread: a hold that began on this video since then stays.
        Utils.runOnMainThread(() -> {
            if (holding && !aid.equals(heldVideo)) end();
        });
    }

    /**
     * The speed {@code dx} pixels of sideways slide lands on from {@code start}: the start inside
     * the dead zone, then one step past it and another every {@link #STEP_DP}, held to the range.
     */
    static float speedFor(float start, float dx, float density) {
        float dead = DEAD_ZONE_DP * density;
        float step = STEP_DP * density;
        float distance = Math.abs(dx);
        if (distance <= dead) return start;
        int steps = 1 + (int) ((distance - dead) / step);
        return PlaybackSpeedPatch.snapLiveSpeed(start + Math.signum(dx) * steps * PlaybackSpeedPatch.LIVE_STEP);
    }

    private static float current() {
        float slid = slidSpeed;
        return Float.isNaN(slid) ? startSpeed : slid;
    }

    private static void apply(float speed) {
        Object component = gesture.get();
        if (component == null) return;
        try {
            Applier applier = applierForTests;
            if (applier != null) applier.apply(component, speed);
            else applyNative(component, speed);
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not play the held video at " + speed + "x", ex);
            return;
        }
        slidSpeed = speed;
        Bubble shown = bubble.get();
        if (shown != null) shown.setSpeed(speed, true);
    }

    /** Stops following the finger for this hold; a speed already slid to stays for the lock. */
    private static void end() {
        holding = false;
        dismiss();
    }

    private static void show(float speed) {
        Activity activity = Utils.getActivity();
        if (activity == null || activity.isFinishing()) return;
        ViewGroup content = activity.findViewById(android.R.id.content);
        if (!(content instanceof FrameLayout)) return;
        Bubble view = new Bubble(activity);
        view.setSpeed(speed, false);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.CENTER_HORIZONTAL);
        params.topMargin = Math.round(content.getHeight() * 0.14f);
        content.addView(view, params);
        bubble = new WeakReference<>(view);
    }

    /** Takes the bubble down, wherever it is. */
    static void dismiss() {
        Bubble shown = bubble.get();
        bubble.clear();
        if (shown == null) return;
        ViewGroup parent = (ViewGroup) shown.getParent();
        if (parent != null) parent.removeView(shown);
    }

    /** The bubble on screen, for tests. */
    static View bubble() {
        return bubble.get();
    }

    /** The speed in large type over a row of dots, one per step, the current one lit. */
    static final class Bubble extends View {
        private final float density;
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint text = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint dot = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF bounds = new RectF();
        private final int steps;
        private float speed = Float.NaN;
        private String label = "";

        Bubble(Context context) {
            super(context);
            density = context.getResources().getDisplayMetrics().density;
            steps = Math.round((PlaybackSpeedPatch.MAX_SPEED - PlaybackSpeedPatch.MIN_SPEED)
                    / PlaybackSpeedPatch.LIVE_STEP) + 1;
            fill.setColor(0xB3000000);
            text.setColor(0xFFFFFFFF);
            text.setTextAlign(Paint.Align.CENTER);
            text.setTextSize(22 * density);
            text.setTypeface(Typeface.DEFAULT_BOLD);
            setClickable(false);
            setFocusable(false);
            setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        }

        void setSpeed(float speed, boolean tick) {
            if (Float.compare(speed, this.speed) == 0) return;
            this.speed = speed;
            label = PlaybackSpeedPatch.speedLabel(speed) + "x";
            setContentDescription(label);
            if (tick) performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
            invalidate();
        }

        String label() {
            return label;
        }

        @Override
        protected void onMeasure(int widthSpec, int heightSpec) {
            setMeasuredDimension(Math.round((steps * 12 + 28) * density), Math.round(66 * density));
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float radius = 16 * density;
            bounds.set(0, 0, getWidth(), getHeight());
            canvas.drawRoundRect(bounds, radius, radius, fill);
            canvas.drawText(label, getWidth() / 2f, 32 * density, text);
            float left = 14 * density + 6 * density;
            float y = 50 * density;
            int lit = Math.round((speed - PlaybackSpeedPatch.MIN_SPEED) / PlaybackSpeedPatch.LIVE_STEP);
            for (int i = 0; i < steps; i++) {
                dot.setColor(i == lit ? 0xFFFFFFFF : 0x66FFFFFF);
                canvas.drawCircle(left + i * 12 * density, y, (i == lit ? 4 : 2.5f) * density, dot);
            }
        }

        @Override
        public void onWindowFocusChanged(boolean hasWindowFocus) {
            super.onWindowFocusChanged(hasWindowFocus);
            if (!hasWindowFocus && bubble.get() == this) end();
        }

        @Override
        protected void onDetachedFromWindow() {
            super.onDetachedFromWindow();
            if (bubble.get() == this) {
                bubble.clear();
                holding = false;
            }
        }
    }
}
