package dev.jason.gboardpatches.extension.spacebarlogo;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ComposeShader;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.RectF;
import android.graphics.Shader;
import android.view.MotionEvent;
import android.view.View;
import android.util.Log;

final class GboardSpacebarLogoColorPickerView extends View {
    private static final String TAG = "GboardPatches";
    interface Listener {
        void onColorChanged(int color);
    }

    private static final int[] HUE_COLORS = {
            Color.RED, Color.YELLOW, Color.GREEN, Color.CYAN,
            Color.BLUE, Color.MAGENTA, Color.RED
    };
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint indicatorPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF plane = new RectF();
    private final RectF hue = new RectF();
    private final float density;
    private final float[] hsv = {210f, 0.72f, 0.96f};
    private Listener listener;
    private boolean draggingHue;
    private boolean draggingPlane;

    GboardSpacebarLogoColorPickerView(Context context) {
        super(context);
        density = context.getResources().getDisplayMetrics().density;
        setClickable(true);
        setFocusable(true);
        setMinimumHeight(dp(248));
    }

    void setColor(int color) {
        Color.colorToHSV(color, hsv);
        invalidate();
    }

    int getColor() {
        return Color.HSVToColor(hsv);
    }

    void setListener(Listener listener) {
        this.listener = listener;
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        setMeasuredDimension(resolveSize(dp(320), widthMeasureSpec),
                resolveSize(dp(248), heightMeasureSpec));
    }

    @Override
    protected void onSizeChanged(int width, int height, int oldWidth, int oldHeight) {
        float inset = dp(4);
        float hueHeight = dp(48);
        float gap = dp(16);
        plane.set(inset, inset, width - inset,
                Math.max(inset, height - inset - hueHeight - gap));
        hue.set(inset, plane.bottom + gap, width - inset, height - inset);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        try {
            int hueColor = Color.HSVToColor(new float[] {hsv[0], 1f, 1f});
            Shader saturation = new LinearGradient(plane.left, plane.top, plane.right, plane.top,
                    Color.WHITE, hueColor, Shader.TileMode.CLAMP);
            Shader value = new LinearGradient(plane.left, plane.top, plane.left, plane.bottom,
                    Color.WHITE, Color.BLACK, Shader.TileMode.CLAMP);
            paint.setShader(new ComposeShader(saturation, value, PorterDuff.Mode.MULTIPLY));
            canvas.drawRoundRect(plane, dp(12), dp(12), paint);
            paint.setShader(new LinearGradient(hue.left, hue.top, hue.right, hue.top,
                    HUE_COLORS, null, Shader.TileMode.CLAMP));
            canvas.drawRoundRect(hue, dp(12), dp(12), paint);
            paint.setShader(null);
            drawIndicator(canvas, plane.left + hsv[1] * plane.width(),
                    plane.top + (1f - hsv[2]) * plane.height(), dp(10));
            drawIndicator(canvas, hue.left + (hsv[0] / 360f) * hue.width(),
                    hue.centerY(), dp(11));
        } catch (Throwable throwable) {
            paint.setShader(null);
            logWarningSafely("Failed to draw color picker", throwable);
        }
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        try {
            if (!isEnabled()) return false;
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    draggingHue = hue.contains(event.getX(), event.getY());
                    draggingPlane = plane.contains(event.getX(), event.getY());
                    if (!draggingHue && !draggingPlane) return false;
                    getParent().requestDisallowInterceptTouchEvent(true);
                    update(event);
                    return true;
                case MotionEvent.ACTION_MOVE:
                    update(event);
                    return true;
                case MotionEvent.ACTION_UP:
                    update(event);
                    getParent().requestDisallowInterceptTouchEvent(false);
                    performClick();
                    return true;
                case MotionEvent.ACTION_CANCEL:
                    getParent().requestDisallowInterceptTouchEvent(false);
                    return true;
                default:
                    return super.onTouchEvent(event);
            }
        } catch (Throwable throwable) {
            logWarningSafely("Failed to handle color picker touch", throwable);
            return false;
        }
    }

    @Override
    public boolean performClick() {
        super.performClick();
        return true;
    }

    private void update(MotionEvent event) {
        if (draggingHue) {
            hsv[0] = clamp((event.getX() - hue.left) / hue.width()) * 360f;
        } else if (draggingPlane) {
            hsv[1] = clamp((event.getX() - plane.left) / plane.width());
            hsv[2] = 1f - clamp((event.getY() - plane.top) / plane.height());
        }
        invalidate();
        if (listener != null) {
            try {
                listener.onColorChanged(getColor());
            } catch (Throwable throwable) {
                logWarningSafely("Failed to notify color picker listener", throwable);
            }
        }
    }

    private void drawIndicator(Canvas canvas, float x, float y, float radius) {
        indicatorPaint.setStyle(Paint.Style.STROKE);
        indicatorPaint.setStrokeWidth(dp(4));
        indicatorPaint.setColor(Color.BLACK);
        canvas.drawCircle(x, y, radius, indicatorPaint);
        indicatorPaint.setStrokeWidth(dp(2));
        indicatorPaint.setColor(Color.WHITE);
        canvas.drawCircle(x, y, radius, indicatorPaint);
    }

    private float clamp(float value) {
        return Math.max(0f, Math.min(1f, value));
    }

    private int dp(int value) {
        return Math.round(value * density);
    }

    private static void logWarningSafely(String message, Throwable throwable) {
        try {
            Log.w(TAG, message, throwable);
        } catch (Throwable ignored) {
            // Custom view callbacks must not affect the settings host.
        }
    }
}
