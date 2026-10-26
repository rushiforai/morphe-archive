/*
 * Copyright 2026 pixkk
 */
package app.pixkk.extension.feed;

import android.animation.ValueAnimator;
import android.view.View;
import android.view.animation.LinearInterpolator;
import android.widget.TextView;

import java.util.Map;
import java.util.WeakHashMap;

import app.pixkk.extension.core.Logger;
import app.pixkk.extension.core.Reflect;
import app.pixkk.extension.core.Settings;

/**
 * Scrolls the sound name along its row when it is wider than the row, the way the old feed did,
 * instead of ending it in dots.
 *
 * The name is a text view TikTok keeps to one line and ends with dots. It is let run on as one
 * line, and slid along by scrolling the view itself, so that the speed is the one set in the
 * settings: the platform's own marquee has a fixed speed. The name goes round without stopping:
 * it is written twice with a gap between, and one slide covers exactly one name and the gap,
 * after which the second copy sits where the first one began.
 *
 * Ids are 47.5.3's: {@code id/ppw}, the title of the music row.
 */
public final class SoundNameScroll {
    private static final int TITLE_ID = 0x7f0a5474;
    /** What separates the end of the name from its next start. */
    private static final String GAP = "   ";
    /** Layout is not there yet when a bind has only just set the text, so a start waits for it. */
    private static final int LAYOUT_RETRIES = 10;

    /** The scroll running on each title, so the next start can end it. */
    private static final Map<View, Run> running = new WeakHashMap<>();

    private SoundNameScroll() {
    }

    /**
     * Called as TikTok writes the music row's title.
     *
     * @param assem the music component, which hands out its container view
     */
    public static void titleChanged(Object assem) {
        try {
            if (!Settings.SOUND_NAME_SCROLL.get()) return;
            Object container = Reflect.invoke(assem, "getContainerView");
            if (!(container instanceof View)) return;
            View title = ((View) container).findViewById(TITLE_ID);
            // The write has not finished when this is called, so the start is queued behind it.
            if (title instanceof TextView) title.post(() -> start((TextView) title));
        } catch (Exception ex) {
            Logger.printException(() -> "Could not scroll the sound name", ex);
        }
    }

    /** Starts the scroll on a title whose text is already written; ends any scroll it had. */
    public static void start(TextView title) {
        if (title == null || !Settings.SOUND_NAME_SCROLL.get()) return;
        stop(title);
        // Left to wrap or end in dots, the text would never be wider than the view.
        title.setSingleLine(true);
        title.setEllipsize(null);
        title.setHorizontallyScrolling(true);
        Run run = new Run(title);
        running.put(title, run);
        title.addOnAttachStateChangeListener(run);
        run.begin(LAYOUT_RETRIES);
    }

    private static void stop(TextView title) {
        Run old = running.remove(title);
        if (old != null) old.end();
    }

    /** One scroll, which goes round until the title is bound again or leaves the screen. */
    private static final class Run implements View.OnAttachStateChangeListener {
        private final TextView title;
        private ValueAnimator slide;
        private CharSequence name;
        private CharSequence doubled;
        private boolean ended;

        Run(TextView title) {
            this.title = title;
        }

        void begin(int retries) {
            if (ended) return;
            if (title.getWidth() == 0) {
                if (retries > 0) title.postDelayed(() -> begin(retries - 1), 100);
                return;
            }
            name = title.getText();
            title.scrollTo(0, 0);
            if (name == null || name.length() == 0) return;
            int room = title.getWidth() - title.getTotalPaddingLeft() - title.getTotalPaddingRight();
            if (title.getPaint().measureText(name.toString()) <= room) return;

            doubled = name + GAP + name;
            title.setText(doubled);
            float period = title.getPaint().measureText((name + GAP).toString());
            float density = title.getResources().getDisplayMetrics().density;
            float pixelsPerSecond = Math.max(1, Settings.SOUND_NAME_SCROLL_SPEED.get()) * density;
            slide = ValueAnimator.ofFloat(0, period);
            slide.setInterpolator(new LinearInterpolator());
            slide.setDuration((long) (period / pixelsPerSecond * 1000));
            slide.setRepeatCount(ValueAnimator.INFINITE);
            slide.addUpdateListener(animation -> title.scrollTo((int) (float) animation.getAnimatedValue(), 0));
            slide.start();
        }

        void end() {
            ended = true;
            title.removeOnAttachStateChangeListener(this);
            if (slide != null) slide.cancel();
            // The name goes back as it was, unless a bind has written another since.
            if (doubled != null && doubled.toString().contentEquals(title.getText())) title.setText(name);
            title.scrollTo(0, 0);
        }

        @Override
        public void onViewAttachedToWindow(View view) {
        }

        @Override
        public void onViewDetachedFromWindow(View view) {
            // A recycled row binds again, which starts a scroll of its own.
            stop(title);
        }
    }
}
