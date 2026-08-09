/*
 * Copyright (C) 2026 anddea
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Original author(s):
 * - Jav1x (https://github.com/Jav1x)
 *
 * Ported to morphe-patches: https://github.com/MorpheApp/morphe-patches
 * Modified by: Jav1x (https://github.com/Jav1x)
 *
 * Licensed under the GNU General Public License v3.0.
 *
 * ------------------------------------------------------------------------
 * GPLv3 Section 7 – Attribution Notice
 * ------------------------------------------------------------------------
 *
 * This file contains substantial original work by the author(s) listed above.
 *
 * In accordance with Section 7 of the GNU General Public License v3.0,
 * the following additional terms apply to this file:
 *
 * 1. Attribution (Section 7(b)): This specific copyright notice and the
 *    list of original authors above must be preserved in any copy or
 *    derivative work. You may add your own copyright notice below it,
 *    but you may not remove the original one.
 *
 * 2. Origin (Section 7(c)): Modified versions must be clearly marked as
 *    such (e.g., by adding a "Modified by" line or a new copyright notice).
 *    They must not be misrepresented as the original work.
 *
 * ------------------------------------------------------------------------
 * Version Control Acknowledgement (Non-binding Request)
 * ------------------------------------------------------------------------
 *
 * While not a legal requirement of the GPLv3, the original author(s)
 * respectfully request that ports or substantial modifications retain
 * historical authorship credit in version control systems (e.g., Git),
 * listing original author(s) appropriately and modifiers as committers
 * or co-authors.
 */


package app.morphe.extension.youtube.videoplayer;

import static app.morphe.extension.shared.StringRef.str;
import static app.morphe.extension.youtube.patches.LegacyPlayerControlsPatch.RESTORE_OLD_PLAYER_BUTTONS;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.youtube.addon.AddOnApi;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.youtube.patches.yandexvot.YandexVoiceOverTranslationPatch;
import app.morphe.extension.youtube.patches.yandexvot.YandexVoiceOverTranslationBottomSheet;
import app.morphe.extension.youtube.patches.yandexvot.YandexVotAddOn;
import app.morphe.extension.youtube.settings.YandexVotSettings;

@SuppressWarnings("unused")
public final class YandexVotButton {
    private static final long DETERMINATE_FRAME_DELAY_MS = 250;
    private static final long INDETERMINATE_FRAME_DELAY_MS = 50;
    private static final int ERROR_COLOR = 0xFFFF3B30;

    private static final Runnable STATE_REFRESH_CALLBACK =
            YandexVotButton::refreshActivatedState;
    private static final Runnable PROGRESS_TICK =
            YandexVotButton::refreshActivatedState;

    @Nullable
    private static WeakReference<YandexCountdownButton> overlayButtonRef;


    @Nullable
    private static LegacyPlayerControlButton legacy;

    public static void initializeButton(View controlsView) {
        try {
            if (RESTORE_OLD_PLAYER_BUTTONS || !YandexVotSettings.YANDEX_VOT_ENABLED.get()) return;
            YandexVoiceOverTranslationPatch.addOnTranslationStateChangeCallback(STATE_REFRESH_CALLBACK);
            YandexCountdownButton button = PlayerOverlayButton.addButton(
                    controlsView,
                    new YandexCountdownButton(controlsView.getContext()),
                    "morphe_yt_yandex_vot_bold",
                    view -> {
                        YandexVoiceOverTranslationPatch.toggleTranslation();
                        refreshActivatedState();
                    },
                    view -> {
                        YandexVoiceOverTranslationBottomSheet.show(view.getContext());
                        return true;
                    });
            overlayButtonRef = button != null ? new WeakReference<>(button) : null;
            if (button != null) {
                button.post(STATE_REFRESH_CALLBACK);
            }
            refreshActivatedState();
        } catch (Exception ex) {
            Logger.printException(() -> "YandexVotButton initializeButton failure", ex);
        }
    }

    /** Called by the add-on legacy player controls listener. */
    public static void initializeLegacyButton(View controlsView) {
        try {
            if (!RESTORE_OLD_PLAYER_BUTTONS) return;

            YandexVoiceOverTranslationPatch.addOnTranslationStateChangeCallback(STATE_REFRESH_CALLBACK);

            // Uses one of the add-on button slots of the legacy player controls, since an add-on
            // bundle cannot add its own view to the controls layout. The slot is a plain button,
            // so the old player layout shows the icon without the countdown indicator.
            legacy = AddOnApi.createLegacyButton(
                    YandexVotAddOn.ADD_ON_ID,
                    controlsView,
                    "morphe_yt_yandex_vot",
                    YandexVotSettings.YANDEX_VOT_ENABLED,
                    view -> {
                        YandexVoiceOverTranslationPatch.toggleTranslation();
                        refreshActivatedState();
                    },
                    view -> {
                        YandexVoiceOverTranslationBottomSheet.show(view.getContext());
                        return true;
                    });

            refreshActivatedState();
        } catch (Exception ex) {
            Logger.printException(() -> "YandexVotButton initializeLegacyButton failure", ex);
        }
    }

    private static void refreshActivatedState() {
        Utils.verifyOnMainThread();
        try {
            boolean active = YandexVoiceOverTranslationPatch.isTranslationActive();
            int alpha = active ? 255 : 128;
            updateButton(overlayButtonRef, alpha);
            LegacyPlayerControlButton leg = legacy;
            if (leg != null) {
                leg.setImageAlpha(alpha);
            }
        } catch (Exception ex) {
            Logger.printException(() -> "refreshActivatedState failure", ex);
        }
    }

    private static void updateButton(
            @Nullable WeakReference<YandexCountdownButton> ref,
            int alpha
    ) {
        YandexCountdownButton button = ref != null ? ref.get() : null;
        if (button == null) return;

        button.removeCallbacks(PROGRESS_TICK);

        boolean waiting = YandexVoiceOverTranslationPatch.translationStarting;
        boolean error = YandexVoiceOverTranslationPatch.isTranslationErrorVisible();
        int seconds = YandexVoiceOverTranslationPatch.getWaitingTimeSeconds();
        float progress = YandexVoiceOverTranslationPatch.getWaitingProgressFraction();
        String timerPosition = YandexVotSettings.YANDEX_VOT_TIMER_POSITION.get();
        boolean showTimer = waiting && !"hidden".equals(timerPosition);

        button.updateCountdown(
                waiting,
                error,
                showTimer,
                "below".equals(timerPosition),
                YandexVotSettings.YANDEX_VOT_PROGRESS_RING_ENABLED.get(),
                YandexVotSettings.YANDEX_VOT_PROGRESS_RING_COLOR.get(),
                YandexVotSettings.YANDEX_VOT_PROGRESS_RING_THICKNESS.get(),
                seconds,
                progress,
                alpha
        );

        if (waiting || error) {
            boolean indeterminate = error || seconds <= 0 || progress < 0.0f;
            button.postDelayed(
                    PROGRESS_TICK,
                    indeterminate
                            ? INDETERMINATE_FRAME_DELAY_MS
                            : DETERMINATE_FRAME_DELAY_MS
            );
        }
    }


    public static final class YandexCountdownButton extends ImageView {
        private final Paint ringPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint textPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint textBackgroundPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF ringBounds = new RectF();
        private final RectF textBackgroundBounds = new RectF();
        private final RectF buttonCircleBounds = new RectF();
        private final Outline backgroundOutline = new Outline();
        private final Rect backgroundOutlineRect = new Rect();
        private final float density;

        private boolean waiting;
        private boolean error;
        private boolean showTimer;
        private boolean timerBelow;
        private boolean showRing;
        private int ringColor = 0xFFFFC107;
        private float ringThicknessPx;
        private int remainingSeconds = -1;
        private float progress = -1.0f;
        private int iconAlpha = 128;

        public YandexCountdownButton(Context context) {
            this(context, null);
        }

        public YandexCountdownButton(Context context, @Nullable AttributeSet attrs) {
            super(context, attrs);
            density = getResources().getDisplayMetrics().density;
            ringPaint.setStyle(Paint.Style.STROKE);
            ringPaint.setStrokeCap(Paint.Cap.ROUND);

            textPaint.setColor(Color.WHITE);
            textPaint.setTextAlign(Paint.Align.CENTER);
            textPaint.setTypeface(Typeface.create("sans-serif-condensed", Typeface.BOLD));

            textBackgroundPaint.setColor(0xB3000000);
            textBackgroundPaint.setStyle(Paint.Style.FILL);
        }

        void updateCountdown(
                boolean waiting,
                boolean error,
                boolean showTimer,
                boolean timerBelow,
                boolean showRing,
                String configuredColor,
                int configuredThicknessDp,
                int remainingSeconds,
                float progress,
                int iconAlpha
        ) {
            this.waiting = waiting;
            this.error = error;
            this.showTimer = showTimer;
            this.timerBelow = timerBelow;
            this.showRing = showRing;
            this.ringColor = parseColor(configuredColor);
            this.ringThicknessPx = Math.max(1.0f, configuredThicknessDp * density);
            this.remainingSeconds = remainingSeconds;
            this.progress = progress;
            this.iconAlpha = Math.max(0, Math.min(255, iconAlpha));
            setImageAlpha(this.iconAlpha);
            invalidate();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            final boolean timerReplacesIcon = waiting && showTimer && !timerBelow;
            if (!timerReplacesIcon) {
                // The native ImageView always owns icon placement. Timer and
                // stroke settings must never move or resize the actual button.
                super.onDraw(canvas);
            }

            if (!waiting && !error) {
                return;
            }

            updateGeometry();

            if ((showRing && waiting) || error) {
                drawRing(canvas);
            }
            if (showTimer && waiting) {
                drawTimer(canvas);
            }
        }

        private void updateGeometry() {
            updateButtonCircleBounds();

            float centerX = buttonCircleBounds.centerX();
            float centerY = buttonCircleBounds.centerY();
            float buttonRadius = Math.min(
                    buttonCircleBounds.width(),
                    buttonCircleBounds.height()
            ) / 2.0f;

            // Anchor the inner edge of the progress stroke to the actual
            // YouTube background circle. Changing stroke width therefore grows
            // outwards and never changes the circle it surrounds.
            float centerLineRadius = buttonRadius
                    + 0.5f * density
                    + ringThicknessPx / 2.0f;

            // Keep antialiasing pixels inside the host view even if a YouTube
            // layout places the background very close to one of its edges.
            float maximumRadius = Math.min(
                    Math.min(centerX, getWidth() - centerX),
                    Math.min(centerY, getHeight() - centerY)
            ) - ringThicknessPx / 2.0f - 0.5f * density;
            centerLineRadius = Math.max(
                    0.5f,
                    Math.min(centerLineRadius, maximumRadius)
            );
            setCenteredSquare(
                    ringBounds,
                    centerX,
                    centerY,
                    centerLineRadius * 2.0f
            );
        }

        private void updateButtonCircleBounds() {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                Drawable background = getBackground();
                if (background != null) {
                    backgroundOutline.setEmpty();
                    background.getOutline(backgroundOutline);
                    backgroundOutlineRect.setEmpty();
                    if (backgroundOutline.getRect(backgroundOutlineRect)
                            && !backgroundOutlineRect.isEmpty()
                            && isUsableCircleBounds(backgroundOutlineRect)) {
                        buttonCircleBounds.set(backgroundOutlineRect);
                        return;
                    }
                }
            }

            // Compatibility fallback. This resource is the size of YouTube's
            // visible overlay action button, while the ImageView itself can
            // include a larger transparent touch target.
            float viewSize = Math.min(getWidth(), getHeight());
            float buttonSize = PlayerOverlayButton.BUTTON_WIDTH > 0
                    ? Math.min(viewSize, PlayerOverlayButton.BUTTON_WIDTH)
                    : viewSize;
            setCenteredSquare(
                    buttonCircleBounds,
                    getWidth() / 2.0f,
                    getHeight() / 2.0f,
                    Math.max(1.0f, buttonSize)
            );
        }

        private boolean isUsableCircleBounds(Rect bounds) {
            float width = bounds.width();
            float height = bounds.height();
            if (width <= 0.0f || height <= 0.0f) return false;

            float largerSide = Math.max(width, height);
            return Math.abs(width - height) <= largerSide * 0.15f
                    && bounds.left >= 0
                    && bounds.top >= 0
                    && bounds.right <= getWidth()
                    && bounds.bottom <= getHeight();
        }

        private static void setCenteredSquare(
                RectF target,
                float centerX,
                float centerY,
                float side
        ) {
            float half = side / 2.0f;
            target.set(centerX - half, centerY - half, centerX + half, centerY + half);
        }

        private void drawRing(Canvas canvas) {
            ringPaint.setStrokeWidth(ringThicknessPx);

            if (error) {
                float pulse = (float) ((Math.sin(SystemClock.uptimeMillis() / 90.0) + 1.0) / 2.0);
                ringPaint.setColor(withAlpha(ERROR_COLOR, Math.round(120 + pulse * 135)));
                float start = (SystemClock.uptimeMillis() / 3.0f) % 360.0f - 90.0f;
                canvas.drawArc(ringBounds, start, 115.0f, false, ringPaint);
                return;
            }

            ringPaint.setColor(withAlpha(ringColor, 48));
            canvas.drawArc(ringBounds, -90.0f, 360.0f, false, ringPaint);

            ringPaint.setColor(ringColor);
            if (remainingSeconds > 0 && progress >= 0.0f) {
                canvas.drawArc(
                        ringBounds,
                        -90.0f,
                        360.0f * Math.max(0.0f, Math.min(1.0f, progress)),
                        false,
                        ringPaint
                );
            } else {
                float start = (SystemClock.uptimeMillis() / 3.0f) % 360.0f - 90.0f;
                canvas.drawArc(ringBounds, start, 100.0f, false, ringPaint);
            }
        }

        private void drawTimer(Canvas canvas) {
            String text = formatTimerText(remainingSeconds);
            float size = ringBounds.width() + ringThicknessPx;
            float textSize = size * (timerBelow ? 0.135f : 0.19f);
            textPaint.setTextSize(Math.max((timerBelow ? 5.0f : 7.0f) * density, textSize));

            Paint.FontMetrics metrics = textPaint.getFontMetrics();
            float centerX = ringBounds.centerX();
            float textHalfHeight = (metrics.descent - metrics.ascent) / 2.0f;
            float desiredBelowCenter = ringBounds.bottom
                    + ringThicknessPx / 2.0f;
            float maximumCenter = getHeight() - textHalfHeight - 0.5f * density;
            float centerY = timerBelow
                    ? Math.min(desiredBelowCenter, maximumCenter)
                    : ringBounds.centerY();
            float baseline = centerY - (metrics.ascent + metrics.descent) / 2.0f;
            float textWidth = textPaint.measureText(text);
            float horizontalPadding = (timerBelow ? 1.25f : 2.25f) * density;
            float verticalPadding = (timerBelow ? 0.2f : 0.75f) * density;

            textBackgroundBounds.set(
                    centerX - textWidth / 2.0f - horizontalPadding,
                    baseline + metrics.ascent - verticalPadding,
                    centerX + textWidth / 2.0f + horizontalPadding,
                    baseline + metrics.descent + verticalPadding
            );
            float radius = textBackgroundBounds.height() / 2.0f;
            canvas.drawRoundRect(textBackgroundBounds, radius, radius, textBackgroundPaint);
            canvas.drawText(text, centerX, baseline, textPaint);
        }

        private static String formatTimerText(int seconds) {
            if (seconds <= 0) return "\u2026";
            if (seconds >= 60) {
                int minutes = (seconds + 59) / 60;
                return str("morphe_yandex_vot_time_min", minutes);
            }
            return str("morphe_yandex_vot_time_sec", seconds);
        }

        private static int parseColor(String value) {
            try {
                return Color.parseColor(value);
            } catch (Exception ignored) {
                return 0xFFFFC107;
            }
        }

        private static int withAlpha(int color, int alpha) {
            return (color & 0x00FFFFFF) | (Math.max(0, Math.min(255, alpha)) << 24);
        }

    }
}
