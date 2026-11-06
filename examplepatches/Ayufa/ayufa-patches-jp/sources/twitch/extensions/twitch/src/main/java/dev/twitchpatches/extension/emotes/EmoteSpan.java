package dev.twitchpatches.extension.emotes;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.text.style.ReplacementSpan;
import android.widget.TextView;
import java.lang.ref.WeakReference;

final class EmoteSpan extends ReplacementSpan implements Drawable.Callback {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static int activeAnimations;
    private final WeakReference<TextView> view;
    private final Drawable drawable;
    private final int height;
    private final int width;
    private final int anchorWidth;
    private boolean running;

    EmoteSpan(TextView view, Drawable drawable, int anchorWidth) {
        this.view = new WeakReference<>(view);
        this.drawable = drawable;
        this.anchorWidth = anchorWidth;
        height = Math.max(1, Math.min(128, Math.round(view.getTextSize() * 1.35f)));
        width = Math.max(1, Math.min(height * 4, Math.round(height * (float) Math.max(1, drawable.getIntrinsicWidth()) / Math.max(1, drawable.getIntrinsicHeight()))));
        drawable.setBounds(0, 0, width, height);
        drawable.setCallback(this);
    }

    @Override public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt metrics) {
        if (metrics != null) {
            Paint.FontMetricsInt original = paint.getFontMetricsInt();
            int center = (original.ascent + original.descent) / 2;
            metrics.ascent = Math.min(original.ascent, center - height / 2);
            metrics.descent = Math.max(original.descent, center + (height + 1) / 2);
            metrics.top = Math.min(original.top, metrics.ascent);
            metrics.bottom = Math.max(original.bottom, metrics.descent);
        }
        return anchorWidth > 0 ? 0 : width;
    }

    @Override public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom, Paint paint) {
        Paint.FontMetricsInt metrics = paint.getFontMetricsInt();
        float left = anchorWidth > 0 ? x - anchorWidth + (anchorWidth - width) / 2f : x;
        int saved = canvas.save();
        canvas.translate(left, y + (metrics.ascent + metrics.descent - height) / 2f);
        drawable.draw(canvas);
        canvas.restoreToCount(saved);
    }

    void start() {
        TextView target = view.get();
        if (!running && drawable instanceof Animatable && activeAnimations < 16 && target != null && target.isAttachedToWindow() && target.isShown()) {
            running = true;
            activeAnimations++;
            ((Animatable) drawable).start();
        }
    }

    void stop() {
        if (running) { ((Animatable) drawable).stop(); running = false; activeAnimations--; }
        MAIN.removeCallbacksAndMessages(this);
    }

    void close() { stop(); drawable.setCallback(null); }

    @Override public void invalidateDrawable(Drawable source) {
        TextView target = view.get();
        if (target != null && target.isAttachedToWindow() && target.isShown()) target.invalidate();
        else stop();
    }

    @Override public void scheduleDrawable(Drawable source, Runnable task, long when) {
        if (running) MAIN.postAtTime(task, this, when);
    }

    @Override public void unscheduleDrawable(Drawable source, Runnable task) { MAIN.removeCallbacks(task, this); }
}
