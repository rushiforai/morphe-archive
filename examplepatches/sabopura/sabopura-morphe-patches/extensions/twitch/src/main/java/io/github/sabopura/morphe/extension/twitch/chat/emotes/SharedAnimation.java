package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.view.View;

import java.util.HashSet;
import java.util.Set;

/**
 * One animated image shared by every chat row that shows it. {@code AnimatedImageDrawable} has no
 * constant state, so rows cannot each get a copy; this keeps one per URL, runs it only while a
 * row showing it is attached, and passes each new frame on to those rows. Rows are held only
 * between attach and detach, and {@link #detach} is always called, so nothing is retained.
 * Called on the main thread except the constructor.
 */
final class SharedAnimation implements Drawable.Callback {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    final Drawable drawable;
    private final Set<View> views = new HashSet<>();

    SharedAnimation(Drawable drawable) {
        this.drawable = drawable;
        drawable.setBounds(0, 0, Math.max(1, drawable.getIntrinsicWidth()), Math.max(1, drawable.getIntrinsicHeight()));
        drawable.setCallback(this);
    }

    void attach(View view) {
        if (views.add(view) && views.size() == 1) ((Animatable) drawable).start();
    }

    void detach(View view) {
        if (views.remove(view) && views.isEmpty()) ((Animatable) drawable).stop();
    }

    @Override
    public void invalidateDrawable(Drawable who) {
        for (View view : views) view.invalidate();
    }

    @Override
    public void scheduleDrawable(Drawable who, Runnable what, long when) {
        MAIN.postAtTime(what, who, when);
    }

    @Override
    public void unscheduleDrawable(Drawable who, Runnable what) {
        MAIN.removeCallbacks(what, who);
    }
}
