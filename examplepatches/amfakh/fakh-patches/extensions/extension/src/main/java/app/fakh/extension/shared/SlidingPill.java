package app.fakh.extension.shared;

import android.animation.ValueAnimator;
import android.view.animation.DecelerateInterpolator;

/**
 * The position of the pill behind the selected tab of a {@link GlassCapsule} bar along the bar, across a bottom bar
 * or down a side rail, which slides to a new tab instead of jumping. The app tells it where the selected tab is; {@link GlassCapsule.Layout#pill} asks where the
 * pill is right now.
 */
public final class SlidingPill {
    private static final long DURATION_MS = 260;

    private final Runnable redraw;
    private float fromStart;
    private float fromEnd;
    private float toStart;
    private float toEnd;
    private float progress = 1;
    private ValueAnimator slide;

    /** @param redraw called on every frame of a slide, to repaint the bar */
    public SlidingPill(Runnable redraw) {
        this.redraw = redraw;
    }

    /** Moves the pill to the tab spanning {@code start} to {@code end}: it jumps the first time and slides after. */
    public void select(float start, float end) {
        if (start == toStart && end == toEnd) return;
        boolean moving = has();
        fromStart = start();
        fromEnd = end();
        toStart = start;
        toEnd = end;
        if (slide != null) slide.cancel();
        if (moving) {
            progress = 0;
            slide = ValueAnimator.ofFloat(0, 1).setDuration(DURATION_MS);
            slide.setInterpolator(new DecelerateInterpolator());
            slide.addUpdateListener(a -> {
                progress = (float) a.getAnimatedValue();
                redraw.run();
            });
            slide.start();
        } else {
            progress = 1;
            redraw.run();
        }
    }

    /** Whether a tab has been selected yet. */
    public boolean has() {
        return toEnd > toStart;
    }

    /** The leading edge of the pill now: left on a bottom bar, top on a rail. */
    public float start() {
        return progress >= 1 ? toStart : fromStart + (toStart - fromStart) * progress;
    }

    /** The trailing edge of the pill now. */
    public float end() {
        return progress >= 1 ? toEnd : fromEnd + (toEnd - fromEnd) * progress;
    }
}
