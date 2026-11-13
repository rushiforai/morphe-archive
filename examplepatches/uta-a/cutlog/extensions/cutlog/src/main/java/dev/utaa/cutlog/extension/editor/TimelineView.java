package dev.utaa.cutlog.extension.editor;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.text.TextUtils;
import android.text.TextPaint;
import android.view.MotionEvent;
import android.view.View;
import java.util.ArrayList;
import java.util.List;

/**
 * 編集画面のタイムライン。上の段に動画のサムネイル、その下に文字・スタンプの表示区間を 1 行ずつ並べ、
 * 再生位置を縦線で示す。何も無い所や動画の段をドラッグすると再生位置が動き、要素の行をタップすると選ぶ。
 */
@SuppressLint("ViewConstructor")
final class TimelineView extends View {
    interface Listener {
        void onScrubStart();

        void onScrub(long positionMs);

        void onScrubEnd();

        void onLayerTapped(Layer layer);

        /** 要素の表示区間を変えている。positionMs は動かしている端（区間ごとなら始まり）の時刻。 */
        void onLayerRangeChanged(Layer layer, long positionMs);

        /** 表示区間の変更を終えた。 */
        void onLayerRangeEnd();
    }

    /** 表示区間の最短の長さ。 */
    static final long MIN_RANGE_MS = 200;

    enum Drag {
        START,
        END,
        MOVE,
    }

    private final EditSpec spec;
    private final Listener listener;
    private final float inset;
    private final float videoHeight;
    private final float rowHeight;
    private final float gap;
    private final float radius;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint bitmapPaint = new Paint(Paint.FILTER_BITMAP_FLAG);
    private final TextPaint labelPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();
    private final Rect src = new Rect();
    private final Path clip = new Path();
    private List<Bitmap> thumbnails = new ArrayList<>();
    private long durationMs = 1;
    private long positionMs;
    private Layer selected;
    private boolean scrubbing;
    /** 表示区間を変えている要素と、触れたときの指の位置・区間。 */
    private Layer rangeLayer;
    private Drag drag;
    private boolean rangeDragging;
    private float downX;
    private long downStartMs;
    private long downEndMs;
    private final float handle;
    private final int touchSlop;

    TimelineView(Context context, EditSpec spec, Listener listener) {
        super(context);
        this.spec = spec;
        this.listener = listener;
        inset = Ui.dp(context, 16);
        videoHeight = Ui.dp(context, 44);
        rowHeight = Ui.dp(context, 28);
        gap = Ui.dp(context, 6);
        radius = Ui.dp(context, 8);
        labelPaint.setColor(Ui.TEXT_PRIMARY);
        labelPaint.setTextSize(Ui.dp(context, 12));
        handle = Ui.dp(context, 14);
        touchSlop = android.view.ViewConfiguration.get(context).getScaledTouchSlop();
    }

    void setDurationMs(long durationMs) {
        this.durationMs = Math.max(1, durationMs);
        invalidate();
    }

    void setPositionMs(long positionMs) {
        if (!scrubbing && positionMs != this.positionMs) {
            this.positionMs = positionMs;
            invalidate();
        }
    }

    void setSelected(Layer layer) {
        selected = layer;
        invalidate();
    }

    void setThumbnails(List<Bitmap> thumbnails) {
        this.thumbnails = thumbnails;
        invalidate();
    }

    /** 要素の数が変わったら呼ぶ。高さが変わる。 */
    void layersChanged() {
        requestLayout();
        invalidate();
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int rows = spec.layers.size();
        int height = Math.round(gap + videoHeight + rows * (gap + rowHeight) + gap);
        setMeasuredDimension(MeasureSpec.getSize(widthMeasureSpec), height);
    }

    private float trackWidth() {
        return getWidth() - inset * 2;
    }

    private float xOf(long ms) {
        return inset + trackWidth() * Math.max(0, Math.min(ms, durationMs)) / durationMs;
    }

    private long msOf(float x) {
        float ratio = (x - inset) / trackWidth();
        return Math.round(Math.max(0f, Math.min(1f, ratio)) * durationMs);
    }

    private float rowTop(int index) {
        return gap + videoHeight + gap + index * (rowHeight + gap);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        drawVideo(canvas);
        for (int i = 0; i < spec.layers.size(); i++) {
            drawLayer(canvas, spec.layers.get(i), rowTop(i));
        }
        drawPlayhead(canvas);
    }

    private void drawVideo(Canvas canvas) {
        rect.set(inset, gap, inset + trackWidth(), gap + videoHeight);
        canvas.save();
        clip.reset();
        clip.addRoundRect(rect, radius, radius, Path.Direction.CW);
        canvas.clipPath(clip);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(Ui.SURFACE_RAISED);
        canvas.drawRect(rect, paint);
        int count = thumbnails.size();
        if (count > 0) {
            float tileWidth = rect.width() / count;
            RectF tile = new RectF();
            for (int i = 0; i < count; i++) {
                Bitmap bitmap = thumbnails.get(i);
                tile.set(rect.left + tileWidth * i, rect.top, rect.left + tileWidth * (i + 1), rect.bottom);
                centerCrop(bitmap, tile.width() / tile.height());
                canvas.drawBitmap(bitmap, src, tile, bitmapPaint);
            }
        }
        canvas.restore();
    }

    /** 縦横比 aspect の枠に合わせて、bitmap の中央を切り出す範囲を src に入れる。 */
    private void centerCrop(Bitmap bitmap, float aspect) {
        int w = bitmap.getWidth();
        int h = bitmap.getHeight();
        if (w / (float) h > aspect) {
            int cropped = Math.round(h * aspect);
            src.set((w - cropped) / 2, 0, (w + cropped) / 2, h);
        } else {
            int cropped = Math.round(w / aspect);
            src.set(0, (h - cropped) / 2, w, (h + cropped) / 2);
        }
    }

    private void drawLayer(Canvas canvas, Layer layer, float top) {
        rect.set(xOf(layer.startMs), top, xOf(layer.endMs(durationMs)), top + rowHeight);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(Ui.SURFACE_RAISED);
        canvas.drawRoundRect(rect, radius, radius, paint);
        float padding = Ui.dp(getContext(), 8);
        if (layer == selected) {
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(Ui.dp(getContext(), 2));
            paint.setColor(Ui.ACCENT);
            canvas.drawRoundRect(rect, radius, radius, paint);
            // 両端のつまみ。ここをドラッグして区間を伸び縮みさせる。
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(Color.WHITE);
            float knob = Ui.dp(getContext(), 2);
            float inset = Ui.dp(getContext(), 6);
            float left = rect.left + Ui.dp(getContext(), 5);
            float right = rect.right - Ui.dp(getContext(), 5);
            canvas.drawRoundRect(left - knob, rect.top + inset, left + knob, rect.bottom - inset, knob, knob, paint);
            canvas.drawRoundRect(right - knob, rect.top + inset, right + knob, rect.bottom - inset, knob, knob, paint);
            padding = Ui.dp(getContext(), 12);
        }
        CharSequence label = TextUtils.ellipsize(
                layer.label(), labelPaint, Math.max(0, rect.width() - padding * 2), TextUtils.TruncateAt.END);
        float baseline = rect.centerY() - (labelPaint.ascent() + labelPaint.descent()) / 2f;
        canvas.drawText(label, 0, label.length(), rect.left + padding, baseline, labelPaint);
    }

    private void drawPlayhead(Canvas canvas) {
        float x = xOf(positionMs);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(Color.WHITE);
        float half = Ui.dp(getContext(), 1);
        canvas.drawRect(x - half, 0, x + half, getHeight(), paint);
        canvas.drawCircle(x, gap / 2f + half, Ui.dp(getContext(), 4), paint);
    }

    @SuppressLint("ClickableViewAccessibility")
    @Override
    public boolean onTouchEvent(MotionEvent event) {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN: {
                Layer hit = layerAt(event.getX(), event.getY());
                if (hit != null) {
                    rangeLayer = hit;
                    drag = dragAt(hit, event.getX());
                    rangeDragging = false;
                    downX = event.getX();
                    downStartMs = hit.startMs;
                    downEndMs = hit.endMs(durationMs);
                    listener.onLayerTapped(hit);
                    return true;
                }
                scrubbing = true;
                getParent().requestDisallowInterceptTouchEvent(true);
                listener.onScrubStart();
                scrubTo(event.getX());
                return true;
            }
            case MotionEvent.ACTION_MOVE:
                if (scrubbing) {
                    scrubTo(event.getX());
                } else if (rangeLayer != null) {
                    float dx = event.getX() - downX;
                    if (!rangeDragging && Math.abs(dx) > touchSlop) {
                        rangeDragging = true;
                        getParent().requestDisallowInterceptTouchEvent(true);
                    }
                    if (rangeDragging) {
                        dragRange(dx);
                    }
                }
                return true;
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                if (scrubbing) {
                    scrubbing = false;
                    listener.onScrubEnd();
                }
                if (rangeDragging) {
                    listener.onLayerRangeEnd();
                }
                rangeLayer = null;
                rangeDragging = false;
                return true;
            default:
                return true;
        }
    }

    private void scrubTo(float x) {
        positionMs = msOf(x);
        invalidate();
        listener.onScrub(positionMs);
    }

    private void dragRange(float dx) {
        long deltaMs = Math.round(dx / trackWidth() * durationMs);
        long[] range = movedRange(drag, downStartMs, downEndMs, deltaMs, durationMs);
        rangeLayer.startMs = range[0];
        // 動画の最後まで伸ばしたら「最後まで」に戻す（撮影の長さが少し変わっても最後まで出す）。
        rangeLayer.endMs = range[1] >= durationMs ? Layer.UNTIL_END : range[1];
        positionMs = drag == Drag.END ? Math.max(range[0], range[1] - 1) : range[0];
        invalidate();
        listener.onLayerRangeChanged(rangeLayer, positionMs);
    }

    /**
     * 触れた位置から、端を動かすか区間ごと動かすかを決める。区間が短くて両端のつまみが重なるときは
     * 近い方の端を動かす。
     */
    private Drag dragAt(Layer layer, float x) {
        float left = xOf(layer.startMs);
        float right = xOf(layer.endMs(durationMs));
        float toLeft = Math.abs(x - left);
        float toRight = Math.abs(x - right);
        if (Math.min(toLeft, toRight) > handle) {
            return Drag.MOVE;
        }
        return toLeft <= toRight ? Drag.START : Drag.END;
    }

    /**
     * 区間を deltaMs だけ動かした結果の {start, end}。端を動かすときは最短 {@link #MIN_RANGE_MS} を残し、
     * 区間ごと動かすときは長さを保ったまま 0〜durationMs に収める。
     */
    static long[] movedRange(Drag drag, long startMs, long endMs, long deltaMs, long durationMs) {
        switch (drag) {
            case START: {
                long start = clamp(startMs + deltaMs, 0, Math.max(0, endMs - MIN_RANGE_MS));
                return new long[] {start, endMs};
            }
            case END: {
                long end = clamp(endMs + deltaMs, Math.min(durationMs, startMs + MIN_RANGE_MS), durationMs);
                return new long[] {startMs, end};
            }
            default: {
                long length = endMs - startMs;
                long start = clamp(startMs + deltaMs, 0, Math.max(0, durationMs - length));
                return new long[] {start, start + length};
            }
        }
    }

    private static long clamp(long value, long min, long max) {
        return Math.max(min, Math.min(max, value));
    }

    /** 行の上の要素。バーの外側でも、つまみの幅までは当たりにする。 */
    private Layer layerAt(float x, float y) {
        for (int i = 0; i < spec.layers.size(); i++) {
            float top = rowTop(i);
            if (y < top || y > top + rowHeight) {
                continue;
            }
            Layer layer = spec.layers.get(i);
            if (x >= xOf(layer.startMs) - handle && x <= xOf(layer.endMs(durationMs)) + handle) {
                return layer;
            }
        }
        return null;
    }
}
