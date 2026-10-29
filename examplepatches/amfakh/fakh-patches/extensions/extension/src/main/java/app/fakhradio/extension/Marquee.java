package app.fakhradio.extension;

import android.os.SystemClock;
import android.view.View;

/**
 * Scrolls a single line of text sideways in a loop when it is wider than its view, on a clock of its own: the text
 * runs out to the left with its start following after a gap, and rests at the start for a moment each round. The framework's
 * marquee restarts whenever its view is laid out again, which the player does every second while it plays, so the
 * text never got anywhere. This one only starts over when the text changes.
 */
final class Marquee {
    private static final long PAUSE_AT_START_MS = 1500;
    private static final float SPEED_DP_PER_SECOND = 40f;
    private static final long IDLE_CHECK_MS = 300;

    private final MarqueeLabel view;
    private long startedAt = SystemClock.uptimeMillis();
    private boolean running;
    private int generation;

    private Marquee(MarqueeLabel view) {
        this.view = view;
    }

    /** Makes [view] one line that scrolls when it is too long, and returns the marquee to restart on new text. */
    static Marquee attach(MarqueeLabel view) {
        view.setSingleLine(true);
        view.setEllipsize(null);
        view.setHorizontallyScrolling(true);
        Marquee marquee = new Marquee(view);
        view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View v) {
                marquee.start();
            }

            @Override
            public void onViewDetachedFromWindow(View v) {
                marquee.stop();
            }
        });
        if (view.isAttachedToWindow()) {
            marquee.start();
        }
        return marquee;
    }

    /** Scrolls from the start again, after the text has changed. */
    void restart() {
        startedAt = SystemClock.uptimeMillis();
        view.setMarqueeX(0);
    }

    private void start() {
        if (!running) {
            running = true;
            schedule(0);
        }
    }

    private void stop() {
        running = false;
        generation++;
        view.setMarqueeX(0);
    }

    /** Queues the next step. Steps from before a stop carry an old generation and end there, so two never run at once. */
    private void schedule(long delayMs) {
        int current = ++generation;
        Runnable step = () -> step(current);
        if (delayMs == 0) {
            view.postOnAnimation(step);
        } else {
            view.postDelayed(step, delayMs);
        }
    }

    private void step(int expected) {
        if (!running || expected != generation) {
            return;
        }
        int available = view.getWidth() - view.getTotalPaddingLeft() - view.getTotalPaddingRight();
        if (view.getLayout() == null || available <= 0) {
            // Mid-relayout: the player lays this view out again every second. Keep the scroll where it is; resetting it
            // here is what made the title flash back to its start for one frame.
            schedule(0);
            return;
        }
        float overflow = view.getLayout().getLineWidth(0) - available;
        if (overflow <= 0) {
            if (view.getScrollX() != 0) {
                view.setMarqueeX(0);
            }
            schedule(IDLE_CHECK_MS);
            return;
        }
        float pixelsPerSecond = SPEED_DP_PER_SECOND * view.getResources().getDisplayMetrics().density;
        float loop = view.getLayout().getLineWidth(0) + view.loopGap();
        long travelMs = (long) (loop / pixelsPerSecond * 1000f);
        long phase = (SystemClock.uptimeMillis() - startedAt) % (PAUSE_AT_START_MS + travelMs);
        float x = phase < PAUSE_AT_START_MS ? 0 : (phase - PAUSE_AT_START_MS) / 1000f * pixelsPerSecond;
        view.setMarqueeX(Math.round(x));
        schedule(0);
    }
}
