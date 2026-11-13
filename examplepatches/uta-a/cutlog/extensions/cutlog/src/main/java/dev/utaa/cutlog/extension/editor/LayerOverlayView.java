package dev.utaa.cutlog.extension.editor;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.MotionEvent;
import android.view.View;

/**
 * プレビューに重ねる文字・スタンプの層。タップで選び、1 本指のドラッグで動かし、2 本指で拡大・回転する。
 * 再生位置を {@link #setTimeMs} で受け取り、時刻で変わる見た目も描く。
 */
@SuppressLint("ViewConstructor")
final class LayerOverlayView extends View {
    interface Listener {
        /** 要素をタップした（null なら何もない所をタップした）。 */
        void onLayerTapped(Layer layer);

        /** 要素の位置・大きさ・角度を指で変えた。 */
        void onLayerTransformed(Layer layer);
    }

    static final float MIN_SIZE = 0.03f;
    static final float MAX_SIZE = 0.40f;

    private final EditSpec spec;
    private final Listener listener;
    private final LayerPainter painter = new LayerPainter();
    private final FramePainter framePainter = new FramePainter();
    private final Paint selectionPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private Layer selected;
    private Layer dragging;
    private long timeMs;
    private float lastX;
    private float lastY;
    /** 2 本指の操作の始まりの、指の間の距離・角度と、要素の大きさ・角度。 */
    private float startSpan;
    private float startAngle;
    private float startSize;
    private float startRotation;

    LayerOverlayView(Context context, EditSpec spec, Listener listener) {
        super(context);
        this.spec = spec;
        this.listener = listener;
        selectionPaint.setStyle(Paint.Style.STROKE);
        selectionPaint.setStrokeWidth(3f);
        selectionPaint.setColor(Color.argb(200, 255, 255, 255));
    }

    void setSelected(Layer layer) {
        selected = layer;
        invalidate();
    }

    /** 再生位置。時刻で見た目が変わる要素があるときだけ描き直す。 */
    void setTimeMs(long timeMs) {
        if (timeMs == this.timeMs) {
            return;
        }
        this.timeMs = timeMs;
        if (spec.frame.animated) {
            invalidate();
            return;
        }
        for (Layer layer : spec.layers) {
            if (layer.isAnimated()) {
                invalidate();
                return;
            }
        }
    }

    @Override
    protected void onDraw(Canvas canvas) {
        int width = getWidth();
        int height = getHeight();
        framePainter.draw(canvas, width, height, spec.frame, timeMs);
        painter.draw(canvas, width, height, spec.layers, timeMs, spec.durationMs);
        if (selected != null && spec.layers.contains(selected)) {
            RectF bounds = painter.bounds(width, height, selected);
            bounds.inset(-12f, -8f);
            canvas.save();
            canvas.rotate(selected.rotation, selected.x * width, selected.y * height);
            canvas.drawRoundRect(bounds, 12f, 12f, selectionPaint);
            canvas.restore();
        }
    }

    @SuppressLint("ClickableViewAccessibility")
    @Override
    public boolean onTouchEvent(MotionEvent event) {
        int width = getWidth();
        int height = getHeight();
        if (width == 0 || height == 0) {
            return false;
        }
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                dragging = hit(event.getX(), event.getY(), width, height);
                lastX = event.getX();
                lastY = event.getY();
                listener.onLayerTapped(dragging);
                return true;
            case MotionEvent.ACTION_POINTER_DOWN:
                // 2 本目の指。1 本目で掴んでいなければ、選んでいる要素を対象にする。
                if (dragging == null) {
                    dragging = selected;
                }
                if (dragging != null && event.getPointerCount() >= 2) {
                    startSpan = span(event);
                    startAngle = angle(event);
                    startSize = dragging.size;
                    startRotation = dragging.rotation;
                    getParent().requestDisallowInterceptTouchEvent(true);
                }
                return true;
            case MotionEvent.ACTION_MOVE:
                if (dragging == null) {
                    return true;
                }
                if (event.getPointerCount() >= 2 && startSpan > 0f) {
                    float scale = span(event) / startSpan;
                    dragging.size = Math.max(MIN_SIZE, Math.min(MAX_SIZE, startSize * scale));
                    dragging.rotation = normalizeDegrees(startRotation + angle(event) - startAngle);
                } else {
                    dragging.x = clamp(dragging.x + (event.getX() - lastX) / width);
                    dragging.y = clamp(dragging.y + (event.getY() - lastY) / height);
                    lastX = event.getX();
                    lastY = event.getY();
                }
                invalidate();
                listener.onLayerTransformed(dragging);
                return true;
            case MotionEvent.ACTION_POINTER_UP: {
                // 残った指でドラッグを続けられるよう、基準の位置を残った指に移す。
                startSpan = 0f;
                int remaining = event.getActionIndex() == 0 ? 1 : 0;
                lastX = event.getX(remaining);
                lastY = event.getY(remaining);
                return true;
            }
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                dragging = null;
                startSpan = 0f;
                return true;
            default:
                return true;
        }
    }

    private static float span(MotionEvent event) {
        return (float) Math.hypot(event.getX(1) - event.getX(0), event.getY(1) - event.getY(0));
    }

    private static float angle(MotionEvent event) {
        return (float) Math.toDegrees(Math.atan2(event.getY(1) - event.getY(0), event.getX(1) - event.getX(0)));
    }

    /** -180〜180 度に収める。 */
    static float normalizeDegrees(float degrees) {
        float normalized = degrees % 360f;
        if (normalized > 180f) {
            normalized -= 360f;
        } else if (normalized <= -180f) {
            normalized += 360f;
        }
        return normalized;
    }

    /** 手前の要素から順に、回転を戻した座標で当たり判定する。 */
    private Layer hit(float touchX, float touchY, int width, int height) {
        for (int i = spec.layers.size() - 1; i >= 0; i--) {
            Layer layer = spec.layers.get(i);
            float cx = layer.x * width;
            float cy = layer.y * height;
            double radians = Math.toRadians(-layer.rotation);
            float dx = touchX - cx;
            float dy = touchY - cy;
            float localX = cx + (float) (dx * Math.cos(radians) - dy * Math.sin(radians));
            float localY = cy + (float) (dx * Math.sin(radians) + dy * Math.cos(radians));
            RectF bounds = painter.bounds(width, height, layer);
            bounds.inset(-24f, -24f);
            if (bounds.contains(localX, localY)) {
                return layer;
            }
        }
        return null;
    }

    private static float clamp(float value) {
        return Math.max(0f, Math.min(1f, value));
    }
}
