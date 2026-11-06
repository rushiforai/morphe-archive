package dev.twitchpatches.extension.emotes;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.text.style.ReplacementSpan;

final class ComposeEmoteSpan extends ReplacementSpan implements Drawable.Callback {
    private static final long IDLE_MILLIS = 2000;
    private final Drawable drawable;
    private int height;
    private int width;
    private Bitmap frame;
    private Canvas frameCanvas;
    private long lastDraw;
    private boolean running;

    ComposeEmoteSpan(Drawable drawable) {
        this.drawable = drawable;
        drawable.setCallback(this);
    }

    @Override public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt metrics) {
        measure(paint);
        if (metrics != null) {
            Paint.FontMetricsInt original = paint.getFontMetricsInt();
            int center = (original.ascent + original.descent) / 2;
            metrics.ascent = Math.min(original.ascent, center - height / 2);
            metrics.descent = Math.max(original.descent, center + (height + 1) / 2);
            metrics.top = Math.min(original.top, metrics.ascent);
            metrics.bottom = Math.max(original.bottom, metrics.descent);
        }
        return width;
    }

    @Override public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom, Paint paint) {
        measure(paint);
        Paint.FontMetricsInt metrics = paint.getFontMetricsInt();
        int saved = canvas.save();
        canvas.translate(x, y + (metrics.ascent + metrics.descent - height) / 2f);
        if (drawable instanceof Animatable) drawFrame(canvas);
        else drawable.draw(canvas);
        canvas.restoreToCount(saved);
    }

    // Compose passes a wrapper Canvas, and an animated image draws to the wrapper's own empty native canvas.
    private void drawFrame(Canvas canvas) {
        ComposeEmoteDraft.observeFrames();
        lastDraw = SystemClock.uptimeMillis();
        if (!running) {
            running = true;
            ((Animatable) drawable).start();
        }
        if (frame == null) {
            frame = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
            frameCanvas = new Canvas(frame);
        }
        frame.eraseColor(0);
        drawable.draw(frameCanvas);
        canvas.drawBitmap(frame, 0, 0, null);
    }

    private void measure(Paint paint) {
        if (height > 0) return;
        height = Math.max(1, Math.min(128, Math.round(paint.getTextSize() * 1.35f)));
        float ratio = (float) Math.max(1, drawable.getIntrinsicWidth()) / Math.max(1, drawable.getIntrinsicHeight());
        width = Math.max(1, Math.min(height * 4, Math.round(height * ratio)));
        drawable.setBounds(0, 0, width, height);
    }

    void stop() {
        if (running) ((Animatable) drawable).stop();
        running = false;
    }

    @Override public void invalidateDrawable(Drawable source) {
        if (SystemClock.uptimeMillis() - lastDraw > IDLE_MILLIS) stop();
        else ComposeEmoteDraft.frameChanged();
    }

    @Override public void scheduleDrawable(Drawable source, Runnable task, long when) { }
    @Override public void unscheduleDrawable(Drawable source, Runnable task) { }
}
