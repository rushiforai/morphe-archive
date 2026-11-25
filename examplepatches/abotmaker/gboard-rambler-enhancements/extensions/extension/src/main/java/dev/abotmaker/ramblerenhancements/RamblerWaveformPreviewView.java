package dev.abotmaker.ramblerenhancements;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.os.Build;
import android.os.SystemClock;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;

/**
 * Live animated Hex waveform preview strip embedded inside settings and picker dialogs.
 */
final class RamblerWaveformPreviewView extends View {
    private static final String TAG = "RamblerWaveform";

    private final HexDotScopeSimulation dotScopeSimulation = new HexDotScopeSimulation();
    private final HexDotScopeRenderer dotScopeRenderer = new HexDotScopeRenderer();
    private final HexAndroidWaveSimulation androidWaveSimulation = new HexAndroidWaveSimulation();
    private final HexAndroidWaveRenderer androidWaveRenderer = new HexAndroidWaveRenderer();
    private final Paint cardPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint borderPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint stockBarPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Rect drawBounds = new Rect();
    private final RectF cardRect = new RectF();
    private final float density;

    private RamblerWaveformSettings.SettingsSnapshot snapshot =
            RamblerWaveformSettings.defaultSnapshot();
    private HexDotScopeSimulation.Stage previewStage = HexDotScopeSimulation.Stage.RECORDING;
    private long lastNanos = 0L;
    private float demoTime = 0.0f;
    private boolean animating = false;

    private final Runnable frameTicker = new Runnable() {
        @Override
        public void run() {
            if (!animating || !isAttachedToWindow()) {
                return;
            }
            invalidate();
            postOnAnimation(this);
        }
    };

    RamblerWaveformPreviewView(Context context) {
        super(context);
        this.density = context.getResources().getDisplayMetrics().density;
        cardPaint.setStyle(Paint.Style.FILL);
        borderPaint.setStyle(Paint.Style.STROKE);
        borderPaint.setStrokeWidth(Math.max(1.0f, density));
        stockBarPaint.setStyle(Paint.Style.FILL);
        setMinimumHeight(dp(56));
    }

    void setPreviewState(
            RamblerWaveformSettings.SettingsSnapshot nextSnapshot,
            HexDotScopeSimulation.Stage stage) {
        boolean processingModeChanged = false;
        if (nextSnapshot != null) {
            processingModeChanged = nextSnapshot.getProcessingMode()
                    != this.snapshot.getProcessingMode();
            this.snapshot = nextSnapshot;
            dotScopeSimulation.setProcessingMode(nextSnapshot.getProcessingMode());
            dotScopeSimulation.setVoiceResponse(nextSnapshot.getVoiceResponse());
        }
        if (stage != null) {
            this.previewStage = stage;
        }
        if (processingModeChanged && this.previewStage == HexDotScopeSimulation.Stage.PROCESSING) {
            dotScopeSimulation.resetForNewSession(false);
            dotScopeSimulation.primeVisibleForHandoff();
        }
        invalidate();
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        setMeasuredDimension(
                resolveSize(dp(300), widthMeasureSpec),
                resolveSize(dp(56), heightMeasureSpec));
    }

    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (w > 8 && h > 8) {
            dotScopeSimulation.configureForBounds(w, h, density, snapshot.getDotSpacingDp());
        }
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        animating = true;
        lastNanos = SystemClock.elapsedRealtimeNanos();
        postOnAnimation(frameTicker);
    }

    @Override
    protected void onDetachedFromWindow() {
        animating = false;
        removeCallbacks(frameTicker);
        super.onDetachedFromWindow();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        try {
            int w = getWidth();
            int h = getHeight();
            if (w <= 8 || h <= 8) {
                return;
            }
            boolean isDark = isDarkMode(getContext());
            float cornerPx = dp(16);

            cardRect.set(0.0f, 0.0f, w, h);
            cardPaint.setColor(isDark ? Color.parseColor("#FF111216") : Color.parseColor("#FFF4F2EE"));
            canvas.drawRoundRect(cardRect, cornerPx, cornerPx, cardPaint);

            borderPaint.setColor(isDark ? Color.parseColor("#1FFFFFFF") : Color.parseColor("#1A0F172A"));
            canvas.drawRoundRect(cardRect, cornerPx, cornerPx, borderPaint);

            long now = SystemClock.elapsedRealtimeNanos();
            float dt = lastNanos == 0L
                    ? (1.0f / 60.0f)
                    : Math.min(0.05f, Math.max(0.0f, (now - lastNanos) * 1e-9f));
            lastNanos = now;
            demoTime += dt;

            int accent = resolveThemeAccent(getContext());

            if (snapshot.isStock() && previewStage == HexDotScopeSimulation.Stage.RECORDING) {
                drawStockLightBarPreview(canvas, w, h, cornerPx, accent);
                return;
            }

            drawBounds.set(0, 0, w, h);

            if (snapshot.isAndroidWaveListening()
                    && previewStage == HexDotScopeSimulation.Stage.RECORDING) {
                float demoLevel = HexDotScopeSimulation.demoLevel(demoTime);
                androidWaveSimulation.advance(dt, demoLevel, snapshot.getVoiceResponse(), false);
                androidWaveRenderer.draw(
                        canvas,
                        drawBounds,
                        density,
                        cornerPx,
                        12.0f,
                        12.0f,
                        22.0f,
                        isDark,
                        accent,
                        snapshot,
                        androidWaveSimulation,
                        1.0f);
                return;
            }

            dotScopeSimulation.configureForBounds(w, h, density, snapshot.getDotSpacingDp());
            dotScopeSimulation.setProcessingMode(snapshot.getProcessingMode());
            dotScopeSimulation.setVoiceResponse(snapshot.getVoiceResponse());
            float loudness = previewStage == HexDotScopeSimulation.Stage.RECORDING
                    ? HexDotScopeSimulation.demoLoudness(demoTime)
                    : -80.0f;
            dotScopeSimulation.advance(dt, previewStage, true, loudness, false);

            dotScopeRenderer.draw(
                    canvas,
                    drawBounds,
                    density,
                    cornerPx,
                    12.0f,
                    12.0f,
                    22.0f,
                    isDark,
                    accent,
                    snapshot,
                    dotScopeSimulation,
                    1.0f);
        } catch (Throwable throwable) {
            logWarningSafely("Failed to draw waveform preview", throwable);
        }
    }

    private void drawStockLightBarPreview(
            Canvas canvas, int w, int h, float cornerPx, int accent) {
        float pulse = 0.55f + 0.45f * HexDotScopeSimulation.demoLevel(demoTime);
        float barHeight = h * (0.28f + 0.22f * pulse);
        int edgeColor = Color.argb(0, Color.red(accent), Color.green(accent), Color.blue(accent));
        int midColor = Color.argb(
                Math.round(165 * pulse), Color.red(accent), Color.green(accent), Color.blue(accent));
        stockBarPaint.setShader(new LinearGradient(
                0.0f, h - barHeight, 0.0f, h,
                edgeColor, midColor, Shader.TileMode.CLAMP));
        cardRect.set(0.0f, h - barHeight, w, h);
        canvas.drawRoundRect(cardRect, cornerPx, cornerPx, stockBarPaint);
        stockBarPaint.setShader(null);
    }

    private int dp(int value) {
        return Math.round(value * density);
    }

    private static boolean isDarkMode(Context context) {
        return (context.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }

    private static int resolveThemeAccent(Context context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            try {
                return context.getColor(android.R.color.system_accent1_500);
            } catch (Throwable ignored) {
                // Fall through to theme attribute lookup.
            }
        }
        try {
            TypedValue out = new TypedValue();
            if (context.getTheme().resolveAttribute(android.R.attr.colorAccent, out, true)) {
                return out.data;
            }
        } catch (Throwable ignored) {
            // Fall back to default accent blue.
        }
        return Color.parseColor("#4285F4");
    }

    private static void logWarningSafely(String message, Throwable throwable) {
        try {
            Log.w(TAG, message, throwable);
        } catch (Throwable ignored) {
            // Fail closed.
        }
    }
}
