/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.OvalShape;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowInsets;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ToggleButton;

import androidx.annotation.Nullable;

import java.util.Locale;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * The call screen's record button (#39): a round button right under Telegram's minimize arrow
 * that records the call on screen, or stops recording it when Record calls is on, for that call
 * only (see {@link CallRecorder#choose}). It copies the arrow's fade and visibility, so it hides
 * with the rest of the call screen's controls and is gone once the call ends.
 *
 * <p>While the call records, the button shows how long the recording is so far, and a pause
 * button beside it leaves out what's said until it's tapped again, keeping one file (#72).
 */
public final class CallRecordButton {
    private CallRecordButton() {}

    static final String FAMILY = CallRecorder.FAMILY;
    static final int RECORDING = 0xFFFF3B30;
    private static final int SIZE_DP = 56;

    /** Called with the call screen's view right before Telegram puts it in the call window. */
    public static void attach(@Nullable View screen) {
        HookStatus.invoked(FAMILY);
        try {
            if (!(screen instanceof FrameLayout) || !on() || find((ViewGroup) screen) != null) return;
            FrameLayout frame = (FrameLayout) screen;
            ImageView back = minimize(frame);
            int size = back != null ? back.getLayoutParams().width : dp(frame.getContext(), SIZE_DP);
            frame.addView(new Dot(frame.getContext(), back), new FrameLayout.LayoutParams(size, size, Gravity.TOP | Gravity.LEFT));
            frame.addView(new Pause(frame.getContext(), back), new FrameLayout.LayoutParams(size, size, Gravity.TOP | Gravity.LEFT));
            HookStatus.counted(FAMILY, back != null ? "call record button shown" : "call record button shown, no minimize arrow");
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "call record button", failure);
        }
    }

    /** The record button already on [screen], if it has one. */
    @Nullable
    static View find(ViewGroup screen) {
        for (int i = 0; i < screen.getChildCount(); i++) {
            if (screen.getChildAt(i) instanceof Dot) return screen.getChildAt(i);
        }
        return null;
    }

    /** The pause button beside the record button on [screen], if it has one. */
    @Nullable
    static View findPause(ViewGroup screen) {
        for (int i = 0; i < screen.getChildCount(); i++) {
            if (screen.getChildAt(i) instanceof Pause) return screen.getChildAt(i);
        }
        return null;
    }

    /** Telegram's minimize arrow: the call screen's one square image pinned to its top left corner. */
    @Nullable
    static ImageView minimize(FrameLayout screen) {
        ImageView found = null;
        for (int i = 0; i < screen.getChildCount(); i++) {
            View child = screen.getChildAt(i);
            if (!(child instanceof ImageView) || !(child.getLayoutParams() instanceof FrameLayout.LayoutParams)) continue;
            FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) child.getLayoutParams();
            if (params.gravity != (Gravity.TOP | Gravity.LEFT) || params.width <= 0 || params.width != params.height) continue;
            if (found != null) return null;
            found = (ImageView) child;
        }
        return found;
    }

    static boolean on() {
        try {
            return Utils.settingsReady() && Settings.RECORD_CALL_BUTTON.get();
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "record button switch read", failure);
            return false;
        }
    }

    /** Taps the button on the call screen, as if the user had: answers whether the call now records. */
    static boolean tap() {
        if (!on()) return false;
        boolean record = !CallRecorder.recordingThisCall();
        CallRecorder.choose(record);
        HookStatus.counted(FAMILY, record ? "call record button turned on" : "call record button turned off");
        Utils.showToastShort(record ? L10n.t("Recording this call") : L10n.t("Recording stopped"));
        return record;
    }

    /** Taps the pause button, as if the user had: answers whether the recording is now paused. */
    static boolean tapPause() {
        if (!on() || !CallRecorder.recordingThisCall()) return false;
        boolean pause = !CallRecorder.paused();
        CallRecorder.pause(pause);
        HookStatus.counted(FAMILY, pause ? "call recording paused" : "call recording resumed");
        Utils.showToastShort(pause ? L10n.t("Recording paused") : L10n.t("Recording resumed"));
        return pause;
    }

    /** The recording's length as the button shows it: "0:42", "12:05", or "1:02:09" past an hour. */
    static String timer(long ms) {
        long seconds = Math.max(0, ms) / 1000;
        long hours = seconds / 3600;
        if (hours > 0) return String.format(Locale.US, "%d:%02d:%02d", hours, seconds / 60 % 60, seconds % 60);
        return String.format(Locale.US, "%d:%02d", seconds / 60, seconds % 60);
    }

    private static int dp(Context context, float value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    /** A white ring with a dot inside, the dot red while the call records and the recording's length under it. */
    static final class Dot extends View {
        private final Paint ring = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint time = new Paint(Paint.ANTI_ALIAS_FLAG);
        /** Redraws the length twice a second while the call records. */
        private final Runnable tick = new Runnable() {
            @Override public void run() {
                refresh();
                if (recording) postDelayed(this, 500);
            }
        };
        private String shown = "";
        @Nullable private final View back;
        private final ViewTreeObserver.OnPreDrawListener follow = () -> {
            follow();
            return true;
        };
        private boolean recording;

        Dot(Context context, @Nullable View back) {
            super(context);
            this.back = back;
            ring.setStyle(Paint.Style.STROKE);
            ring.setStrokeWidth(dp(context, 2));
            ring.setColor(Color.WHITE);
            time.setColor(Color.WHITE);
            time.setTextAlign(Paint.Align.CENTER);
            time.setTextSize(11 * context.getResources().getDisplayMetrics().scaledDensity);
            setBackground(new RippleDrawable(ColorStateList.valueOf(0x4DFFFFFF), null, new ShapeDrawable(new OvalShape())));
            setContentDescription(L10n.t(context, "Record call"));
            setOnClickListener(clicked -> {
                try {
                    tap();
                    refresh();
                } catch (Throwable failure) {
                    HookStatus.threw(FAMILY, "call record button tap", failure);
                }
            });
            refresh();
        }

        boolean recording() {
            return recording;
        }

        /** The length the button shows, empty while the call doesn't record. */
        String shownTime() {
            return shown;
        }

        @Override
        protected void onAttachedToWindow() {
            super.onAttachedToWindow();
            getViewTreeObserver().addOnPreDrawListener(follow);
        }

        @Override
        protected void onDetachedFromWindow() {
            getViewTreeObserver().removeOnPreDrawListener(follow);
            removeCallbacks(tick);
            super.onDetachedFromWindow();
        }

        /** Before each frame: sit under the arrow, fade and hide with it, and show this call's state. */
        void follow() {
            try {
                if (back != null) {
                    setTranslationX(back.getLeft() - getLeft());
                    setTranslationY(back.getBottom() - getTop());
                    setAlpha(back.getAlpha());
                } else {
                    WindowInsets insets = getRootWindowInsets();
                    setTranslationY(insets != null ? insets.getSystemWindowInsetTop() : 0);
                }
                int shown = !on() ? GONE : back != null ? back.getVisibility() : VISIBLE;
                if (getVisibility() != shown) setVisibility(shown);
                refresh();
            } catch (Throwable failure) {
                HookStatus.threw(FAMILY, "call record button follow", failure);
            }
        }

        void refresh() {
            boolean now = CallRecorder.recordingThisCall();
            String length = now ? timer(CallRecorder.recordedMs()) : "";
            if (now == recording && length.equals(shown)) return;
            boolean started = now && !recording;
            recording = now;
            shown = length;
            if (started) {
                removeCallbacks(tick);
                postDelayed(tick, 500);
            }
            invalidate();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            float x = getWidth() / 2f;
            float y = getHeight() / 2f;
            canvas.drawCircle(x, y, dp(getContext(), 10), ring);
            fill.setColor(recording ? RECORDING : Color.WHITE);
            canvas.drawCircle(x, y, dp(getContext(), recording ? 6 : 4), fill);
            if (!shown.isEmpty()) canvas.drawText(shown, x, y + dp(getContext(), 10) - time.ascent() + dp(getContext(), 2), time);
        }

        @Override
        public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
            super.onInitializeAccessibilityNodeInfo(info);
            info.setClassName(ToggleButton.class.getName());
            info.setCheckable(true);
            info.setChecked(recording);
        }
    }

    /** Beside the record button while the call records: two bars to pause, a triangle to resume. */
    static final class Pause extends View {
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path triangle = new Path();
        @Nullable private final View back;
        private final ViewTreeObserver.OnPreDrawListener follow = () -> {
            follow();
            return true;
        };
        private boolean paused;

        Pause(Context context, @Nullable View back) {
            super(context);
            this.back = back;
            fill.setColor(Color.WHITE);
            setBackground(new RippleDrawable(ColorStateList.valueOf(0x4DFFFFFF), null, new ShapeDrawable(new OvalShape())));
            setVisibility(GONE);
            setOnClickListener(clicked -> {
                try {
                    tapPause();
                    follow();
                } catch (Throwable failure) {
                    HookStatus.threw(FAMILY, "call recording pause tap", failure);
                }
            });
            label();
        }

        boolean paused() {
            return paused;
        }

        @Override
        protected void onAttachedToWindow() {
            super.onAttachedToWindow();
            getViewTreeObserver().addOnPreDrawListener(follow);
        }

        @Override
        protected void onDetachedFromWindow() {
            getViewTreeObserver().removeOnPreDrawListener(follow);
            super.onDetachedFromWindow();
        }

        /** Before each frame: sit right of the record button, and show only while the call records. */
        void follow() {
            try {
                int width = getLayoutParams() != null ? getLayoutParams().width : getWidth();
                if (back != null) {
                    setTranslationX(back.getLeft() + width - getLeft());
                    setTranslationY(back.getBottom() - getTop());
                    setAlpha(back.getAlpha());
                } else {
                    WindowInsets insets = getRootWindowInsets();
                    setTranslationX(width);
                    setTranslationY(insets != null ? insets.getSystemWindowInsetTop() : 0);
                }
                boolean wanted = on() && CallRecorder.recordingThisCall();
                int shown = !wanted ? GONE : back != null ? back.getVisibility() : VISIBLE;
                if (getVisibility() != shown) setVisibility(shown);
                boolean now = wanted && CallRecorder.paused();
                if (now != paused) {
                    paused = now;
                    label();
                    invalidate();
                }
            } catch (Throwable failure) {
                HookStatus.threw(FAMILY, "call recording pause follow", failure);
            }
        }

        private void label() {
            setContentDescription(paused ? L10n.t(getContext(), "Resume recording") : L10n.t(getContext(), "Pause recording"));
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            float x = getWidth() / 2f;
            float y = getHeight() / 2f;
            float half = dp(getContext(), 7);
            if (paused) {
                triangle.reset();
                triangle.moveTo(x - half * 0.7f, y - half);
                triangle.lineTo(x + half, y);
                triangle.lineTo(x - half * 0.7f, y + half);
                triangle.close();
                canvas.drawPath(triangle, fill);
            } else {
                float bar = dp(getContext(), 3);
                canvas.drawRect(x - half * 0.6f - bar / 2, y - half, x - half * 0.6f + bar / 2, y + half, fill);
                canvas.drawRect(x + half * 0.6f - bar / 2, y - half, x + half * 0.6f + bar / 2, y + half, fill);
            }
        }
    }
}
