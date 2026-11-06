package dev.twitchpatches.extension.emotes;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.Paint;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

final class AnimatedEmoteImage implements Drawable.Callback {
    private final Drawable image;
    private final Animatable animation;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final List<WeakReference<Instance>> instances = new ArrayList<>();

    AnimatedEmoteImage(Drawable image) {
        this.image = image;
        animation = (Animatable) image;
        image.setBounds(0, 0, image.getIntrinsicWidth(), image.getIntrinsicHeight());
        image.setCallback(this);
    }

    Drawable newDrawable() { return new Instance(); }

    private void update() {
        instances.removeIf(reference -> {
            Instance instance = reference.get();
            return instance == null || !instance.running;
        });
        if (instances.isEmpty()) {
            animation.stop();
            handler.removeCallbacksAndMessages(this);
        } else if (!animation.isRunning()) animation.start();
    }

    @Override public void invalidateDrawable(Drawable who) {
        update();
        for (WeakReference<Instance> reference : new ArrayList<>(instances)) {
            Instance instance = reference.get();
            if (instance != null) instance.invalidateSelf();
        }
    }

    @Override public void scheduleDrawable(Drawable who, Runnable task, long when) {
        handler.postAtTime(task, this, when);
    }

    @Override public void unscheduleDrawable(Drawable who, Runnable task) { handler.removeCallbacks(task, this); }

    // Each span owns its bounds and callback; matching emotes share one decoded animation.
    private final class Instance extends Drawable implements Animatable {
        private boolean running;
        private final Paint paint = new Paint();

        @Override public void draw(Canvas canvas) {
            int save = canvas.save();
            canvas.translate(getBounds().left, getBounds().top);
            canvas.scale((float) getBounds().width() / getIntrinsicWidth(), (float) getBounds().height() / getIntrinsicHeight());
            if (paint.getAlpha() != 255 || paint.getColorFilter() != null) {
                canvas.saveLayer(0, 0, getIntrinsicWidth(), getIntrinsicHeight(), paint);
            }
            image.draw(canvas);
            canvas.restoreToCount(save);
        }

        @Override public void start() {
            if (running) return;
            running = true;
            instances.add(new WeakReference<>(this));
            update();
            invalidateSelf();
        }

        @Override public void stop() { running = false; update(); }
        @Override public boolean isRunning() { return running; }
        @Override public int getIntrinsicWidth() { return image.getIntrinsicWidth(); }
        @Override public int getIntrinsicHeight() { return image.getIntrinsicHeight(); }
        @Override public void setAlpha(int value) { paint.setAlpha(value); invalidateSelf(); }
        @Override public void setColorFilter(ColorFilter value) { paint.setColorFilter(value); invalidateSelf(); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
